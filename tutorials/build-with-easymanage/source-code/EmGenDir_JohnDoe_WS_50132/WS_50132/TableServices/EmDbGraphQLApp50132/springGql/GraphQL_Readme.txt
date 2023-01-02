
---------------------------
GraphQL Project
---------------------------

---------------------------
Spring for GraphQL Documentation
https://docs.spring.io/spring-graphql/docs/current/reference/html/

Requirements:
Spring for GraphQL requires the following as a baseline:
JDK8
Spring Framework 5.3
GraphQL Java 18
Spring Data 2021.1.0 or later for QueryDSL or Query by Example
---------------------------

---------------------------
Graphql Client Usage Guide
---------------------------

---------------------------
Use graphiql browser based query 
http://127.0.0.1:9080/graphiql?path=/graphql

View Schema
http://127.0.0.1:9080/graphql/schema
---------------------------

---------------------------
Graphql Client - Make API calls
Tool: 
graphiql or
Postman or similar
---------------------------
Send Request:
[POST] http://127.0.0.1:9080/graphql
Body
GraphQL RadioButton
- send query or mutation

---------------------------
For Secure Endpoints like Mutations Update and Delete:
Authorization 
Basic Auth : Set User / Password
(As Per Users Defined in SpringSecurityConfigBasicAuth.java file)
---------------------------

---------------------------
Root Level Dummy declarations, return null
---------------------------
query {
    _empty 
}
---------------------------
mutation {
    _empty 
}
---------------------------


Please refer to table-level client calling information 
in respective folders
e.g. <tableName>TblRec_ClientInfo.txt

---------------------------
Date Time Formats
---------------------------
For GraphQL we use custom scalars defined in EmCalendar to handle Date Time Formats
DateTime Format is: DateFormat + " " + TimeFormat
e.g. "yyyy-MM-dd HH:mm"

You can change the formats in file src/EmParam.java.
---------------------------

-----------------------------------------------------------------------------------------------------------------
Using <Tbl>SelectWhere with Argument searchBy, sortBy and pagination
-----------------------------------------------------------------------------------------------------------------
* Note: If using Sort, All the data is sorted first (matching searchBy) and then page+size picked up
* Order of processing:
1) searchBy criteria applied
2) sorting appplied
3) then page fetched as per size
-----------------------------------------------------------------------------------------------------------------
* Example: searchBy string: " invQty > 100 and invLocation = 'USA' and invDate = '2022-10-20 14:20' and invCost isNotNull 0  " 
* Example: searchBy string: " invQty < 1000 and invLocation = 'USA' and invDate isNotNull ''  " 
* Note: 
- Db will evaluate 'AND' with higher precedence than 'OR'. And within multiple 'AND' or 'OR' operators, it will evaluates from left to right.
- Brackets () are not supported.
- Supplying Value
  - For String or DateTime types the value should be surrounded by quotes ' or " . Boolean also can. 
  - Numeric Float can contain decimal . or comma ,
- When using operators isNull and isNotNull, you must supply dummy value placeholder, as per column data type numeric or char, e.g. 0 or '' 

--------------------------------------------------------------------------
- Data Type wise Search Operators supported and usage examples:

  - For Numeric Types Long, Float and DateTime types : 
    = eq != ne gt > goe >= lt < loe <= isNull isNotNull 

	e.g. 'qty = 50' , 'qty != 40', 'qty goe 60', 'qty isNull 0', 'qty isNotNull 0'


  - For String: 
    = eq equals != ne notEquals gt > lt < like notLike contains isNull isNotNull
	
	e.q.  "name = 'John Doe'", "status != 'Complete'", "name > 'a'" , "name notLike 'John'", "desc contains 'Blue'", "status isNull 0",  "status isNotNull 0", 
	
    For String IgnoreCase operators: 
	equalsIgnoreCase notEqualsIgnoreCase likeIgnoreCase containsIgnoreCase

	e.q. "status equalsIgnoreCase 'complete'", "status notEqualsIgnoreCase 'complete'", "name likeIgnoreCase 'john'", "desc containsIgnoreCase 'blue'" 
	
  - For Boolean: 
    = isNull isNotNull
	e.g. 'hasDiscount = true' , 'hasDiscount = false' , 'hasDiscount isNull 0', 'hasDiscount isNotNull 0'
	Note: Use = with [true|false] values only

--------------------------------------------------------------------------

  Future Support Planned:
  - For String: in notIn 
-----------------------------------------------------------------------------------------------------------------
* Example: sortBy string: 
" invQty desc , invMinQty desc " 
"  productCategory asc productId desc    "
"  productCategory productId desc    "
* Note: 
- Use one or more Sort By directives, Separated by comma (,) or space
- property names [asc|desc]
- sort direction asc is default and hence can be ommitted
-----------------------------------------------------------------------------------------------------------------
