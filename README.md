# mixable
api for mixable android app for cocktail recipes 
# Example
```nim
import asyncdispatch, mixable, json, strutils

let data = waitFor search_req("wine")

let recipes = data["Recipe"]

for recipe in recipes:
  echo recipe["name"]
  echo recipe["cat"]
  echo recipe["glass"]
  echo recipe["ingreds"]
  echo "." .repeat(49)
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
