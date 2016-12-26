# NDB

## Getting single records
```python
entity = Model.query(put query here).fetch(1)[0]
entity_id = message.key.id()

entity = Model.query(put query here).get()
entity_id = message.key.id()
```
## Getting only keys (more efficient)

```python
entity_key = Model.query(put query here).fetch(1, keys_only=True)[0]
entity_id = entity_key.id()

entity_key = Model.query(put query here).get(keys_only=True)
entity_id = entity_key.id()
```