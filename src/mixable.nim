import asyncdispatch, httpclient, json

const api = "https://apiv2.mixable.app"
var headers = newHttpHeaders({
  "Connection": "keep-alive", 
  "Host": "apiv2.mixable.app",
  "x-api-key":"cvszr682czbrwpMCR90WUERNMXRuzn7c2982nu0ru2389nryzZHD1BJDpz93zcrnp0ma48tv9n",
  "Content-Type": "application/json", 
  "accept": "application/json", 
  "user-agent": "okhttp/4.12.0"
})

proc get_topics*(page:int=1,order:string="published",direction:string="DESC"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/topics.json?page=" & $page & "&order=" & order & "&direction=" & direction)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_recipecategories*(page:int=1,order:string="name",direction:string="ASC"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/recipecategories.json?page=" & $page & "&order=" & order & "&direction=" & direction)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_ingredientcategories*(page:int=1,order:string="pos",direction:string="ASC"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/ingredientcategories.json?page=" & $page & "&order=" & order & "&direction=" & direction)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_tags*(page:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/tags.json?page=" & $page)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_ingredients*(page:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/ingredients.json?page=" & $page)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_recipes*(page: int = 1, id: int = 0): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    var link = api & "/recipes.json?page=" & $page
    if id != 0:
      link = link & "&id=" & $id
    
    let response = await client.get(link)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc search_req*(q:string,page:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/search.json?page=" & $page & "&q=" & q)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
