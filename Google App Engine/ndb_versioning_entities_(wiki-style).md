# Features and characteristics of the NDB datastore that are relevant
“Although the Address instances are defined using the same syntax as for model classes, they are not full-fledged entities. They don't have their own keys in the Datastore. They cannot be retrieved independently of the Contact entity to which they belong. An application can, however, query for the values of their individual fields”
https://cloud.google.com/appengine/docs/python/ndb/entity-property-reference#structured

"A StructuredProperty with a nested property (whether or not it is structured) supports **only a single layer** of repeated properties. The StructuredProperty can be repeated, or the nested property can be repeated, **but not both**. A work-around is to use LocalStructuredProperty, which does not have this constraint (but does not allow queries on its property values)."

# Requirements
- Each version of the entity is saved
- It should be possible to do a query against the current version only
- It should be possible to do a query against all previous versions (probably and admin/editor query)
- Easy to delete all versions
- Entities must be able to contain StructuredProperties

# Possible solutions

## Option 1
http://stackoverflow.com/questions/6240225/how-to-keep-version-history-of-datastore-entities-in-appengine

Each entity has a unique key. All edits are the same entity type, but have the original entry’s key as ancestor.

The most recent edit is accessed by sorting by the timestamp of the edit.

### Code
```python
class WikiPage(ndb.Model):
    title = ndb.StringProperty(required = True)
    text = ndb.TextProperty(required = True)
    datetime = ndb.DateTimeProperty(auto_add_now = True)

class Page(webapp2.RequestHandler):
    def get(self, path):
        # create the page key from the page id (in this case, the get request path)
        page_key = ndb.Key('WikiPage', path)

        # query for edited versions
        wikipage_edited = WikiPage.query(ancestor=page_key).order(-WikiPage.datetime).get()

        # check if wikipage have edited versions
        if wikipage_edited:
            wikipage = wikipage_edited

        # if not, get the original version
        else:
            wikipage = page_key.get()

        # some custom function to render the wikipage
        self.render(wikipage)

    def post(self):
        # you can pass some parameter that indicates the page_id being edited
        page_id = self.request.get('page_id')

        # check if page_id was sent
        if page_id:
            wikipage = WikiPage(parent = ndb.Key('WikiPage', page_id), 
                                title = self.request.get('new_title'), 
                                text = self.request.get('new_text'))

        # if page_id wasn't sent, it assumes that a new page is being created
        else:
            # some custom function that create a page id in the way you want
            page_id = self.create_a_page_id()
            wikipage = WikiPage(id = page_id, 
                                title = self.request.get('title'), 
                                text = self.request.get('text'))
        wikipage.put()
```


### Advantages
- Only one entity type

### Disadvantages
- Getting the current version of a record by its key requires a query, rather than ```key.get()``` (or more likely ```ndb.Key(urlsafe=urlpart).get()```)
- Marking the entity as deleted requires deleting all children

## Option 1b

Each entity has a unique key. All edits are the same entity, but have the original entry’s key as ancestor. Most recent edit has the flag ‘current_version’ as True, to allow querying just current versions.

### Code

```python
class WikiPage(ndb.Model):
    title = ndb.StringProperty(required = True)
    text = ndb.TextProperty(required = True)
    datetime = ndb.DateTimeProperty(auto_add_now = True)
    topic = ndb.StringProperty(required = True)
    current_version = ndb.BooleanProperty(required = True)

	@ndb.transactional
    @classmethod
    def create_new_version(ancestor_key, new_version):
        previous_version = cls.query(ancestor=ancestor_key, current_version=True).get()
        previous_version.current_version = False
		prevous_version.put()
        new_version.put()

class PageQuery(webapp2.RequestHandler):
	def get(self, topic):
    	pages = WikiPage.query(topic = topic, current_version=True).fetch()
        # prepare and show list of pages that are of a particular topic
        # ...

class Page(webapp2.RequestHandler):
    def get(self, path):
        # create the page key from the page id (in this case, the get request path)
        page_key = ndb.Key('WikiPage', path)

        # query for edited versions
        wikipage_edited = WikiPage.query(ancestor=page_key, current_version=True).get()

        # check if wikipage have edited versions
        if wikipage_edited:
            wikipage = wikipage_edited

        # if not, get the original version
        else:
            wikipage = page_key.get()

        # some custom function to render the wikipage
        self.render(wikipage)

    def post(self):
        # you can pass some parameter that indicates the page_id being edited
        page_id = self.request.get('page_id')

        # check if page_id was sent
        if page_id:
            wikipage = WikiPage(parent = ndb.Key('WikiPage', page_id), 
                                title = self.request.get('new_title'), 
                                text = self.request.get('new_text'))

        # if page_id wasn't sent, it assumes that a new page is being created
        else:
            # some custom function that create a page id in the way you want
            page_id = self.create_a_page_id()
            wikipage = WikiPage(id = page_id, 
                                title = self.request.get('title'), 
                                text = self.request.get('text'))
        wikipage.put()
```

### Advantages


### Disadvantages
- Changing which entity is current requires a transactions, as the information is held in two places (i.e. the previously current entity, and the new current entity)


## Option 2
Two separate entity types, parent and child. The parent entity type contains a repeated StructuredProperty of the child entity types.

### Advantages
- Entities can easily be marked as deleted at the top level

### Disadvantages
Querying is a little harder as you’re querying into the StructuredProperty, but it’s not impossible
## Option 3
Two separate entity types, parent and child. The parent entity type contains all of the same fields as the child entity type, as well as a repeated StructuredPropertly of the child entity type.

The StructuredProperty of the child entities contain all of the prior versions.

### Advantages
- Edits are transactional (single put operation)
- Backups are hidden out of the way in the StructuredProperty for the majority of the time, which meets the general requirements
- Easy to query on the parent entity

### Disadvantages
- Duplication of the model definition (although I guess you could use inheritance?)






    @classmethod
    def new_entity_from_dict(cls, dict):
        missing_properties = []
        invalid_properties = []
        error = False
        
        newentity = cls()
        
        for cls_property in cls._properties:
            #logging.info(cls_property)
            #logging.info(cls._properties[cls_property]._required)
            if cls_property in dict and dict[cls_property] != '':
                try:
                    if isinstance(cls._properties[cls_property], ndb.DateProperty):
                        dict[cls_property] = datetime.datetime.strptime(dict[cls_property], '%d/%m/%Y')
                    
                    
                    setattr(newentity, cls_property, dict[cls_property])
                except datastore_errors.BadValueError as e:
                    invalid_properties.append(cls_property)
                    error = True
                except Exception as e:
                    logging.info(e)
                    invalid_properties.append(cls_property)
                    error = True
                    
            else:
                if cls._properties[cls_property]._required:
                    missing_properties.append(cls_property)
                    error = True

        return error, newentity, missing_properties, invalid_properties


    @classmethod
    def update_entity_from_dict(cls, key, dict):
        missing_properties = []
        invalid_properties = []
        error = False
        
        existing_entity = key.get()
        existing_entity_backup = existing_entity.to_dict()
        existing_entity_backup['key'] = key.urlsafe()
        
        for cls_property in cls._properties:
            logging.info(cls_property)
            logging.info(cls._properties[cls_property]._required)
            if cls_property in dict and dict[cls_property] != '':
                try:
                    setattr(existing_entity, cls_property, dict[cls_property])
                except datastore_errors.BadValueError as e:
                    invalid_properties.append(cls_property)
                    error = True
                except Exception as e:
                    logging.info(e)
                    error = True
                    
            else:
                if cls._properties[cls_property]._required:
                    missing_properties.append(cls_property)
                    error = True

        existing_entity.versions.append(json.dumps(existing_entity_backup))

        return error, newentity, missing_properties, invalid_properties