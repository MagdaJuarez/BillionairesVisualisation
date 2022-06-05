
## **Data explanation**
<p>
The billionaires dataset [1] comprises a list of World’s billionaires. A data frame with 2615 rows over three years 1996, 2001 and 2014 on average of 829 number of billionaires, on 22 numerical and categorical variables.

* According to Whitcom [2], this list was built off the Forbes World’s Billionaires list from 1996-2014 and then scholars at Peterson Institute for International Economics have added a couple dozen more variables about each billionaire. Also, as reported by CORGIS [3], this dataset was stored to be used and picked up for introductory computing students. The variables’ names and descriptions are shown in [1, Tab. I] and the data sample is depicted in Table II.
* It belongs to the CORGIS Dataset project and has GNU General Public Licence v2.0 [4]. Therefore, this license grants the permissions to update, distribute and use the dataset as long as the user acknowledges license and copyright. It doesn’t contain sensitive data so values are not encrypted.
* It’s stored in a single csv file inside the github repository and it doesn’t use any compression.
* It represents encouraging data because anyone could see how billionaires were making money along these three years through performing important roles in decision making in their companies.
* It was created on May 17th, 2016 and it’s not live data.
* A sample of 6 lines of the billionaires dataset is shown in Tables II. This sample include correctly formatted values and also examples of missing values and errors. It shows these values and how the data
was stored.
</p>

<center>
Table I. TABLE SHOWS VARIABLES' KEYS AND COMMENTS FOR BILLIONAIRES DATASET

*#* | *Variable name* | *Description* | *Type* | *Example* | *Category* | *Quantity* | *Range*
--------|--------|------|--------|------|--------|--------|------
[,1] | Name | The name of the bil- lionaire. | String | Warren Buffett | Nominal |  | Defined finite list
[,2] | rank | The rank of this billionaire compared to the rest of the billionaires reported on. A lower rank means they make more money. | Integer | 2 |  | Continuous | From 1 to 1565
[,3] | year | The year that data about this billionaire was collected. | Integer | 2001 | | Discrete | Defined finite list
[,4] | company. founded | The year that the company was founded. | Integer | 1962 |  | Discrete | Finite range
[,5] | company. name | The name of the company. |  Nominal |  | Defined finite list
[,6] | company. relationship | The billionaire’s relationship to the company. | String | founder | Nominal |  | Defined finite list
[,7] | company. sector | The sector of the business, or what segment of the economy they fit into. | String | Finance | Nominal |  | Defined finite list
[,8] | company. type | The type of business for this company. | String | new | Nominal |  | Defined finite list 
[,9] | demographics. age | The current age of the billionaire. Ages that are represented as -1 stand for ages that were not available in the data that was collected. | Integer | 70 |  | Continuous | 12 to 98
[,10] | demographics. gender | A string representing their gender. | String | male | Nominal |  | 12 to 98
[,11] | location. citizenship | The name of the country that this billionaire has citizenship with.  | String | United States | Nominal |  | Defined finite list
[,12] | location. country code | The 3-letter country code of the country where this billionaire has citizenship. | String | USA | Nominal |  | Defined finite list
[,13] | location. gdp | The ”Gross Domestic Product” of the country where the billion- aire has citizenship. This is one of the primary indicators used to gauge the health of a country’s economy. It represents the total dollar value of all goods and services produced over a spe- cific time period; you can think of it as the size of the economy. | Integer | 10,600,000, 000,000.00 |  | Continuous | Infinite(exact)
[,14] | location. region | The region of the world where this billionaire lives. | String | Noth America | Nominal |  | Defined short list
[,15] | wealth. type | The type of billionaire that they are. | String | founder non-finance | Nominal |  | Defined short list
[,16] | wealth. worth in billions | The number of billion of dollars that this billionaire is worth. | Float | 32.3 |  | Continuous | Infinite
[,17] | wealth. how.category | A category representing where their money came from.| String | Traded sector | Nominal |  | Defined short list
[,18] | wealth. how.from emerging | Whether the money came from emerging markets. | Boolean | TRUE | Ordinal |  | Finite short range
[,19] | wealth. how.industry | The specific industry this billionaire profitted from. | String | Consumer | Nominal |  | Defined finite list
[,20] | wealth. how.inherited | The way that this money was inherited (or not inherited). Inheritance can come from a spouse, the father, or from multiple generations within a family (either 3, 4, or 5+). | String | Non-inherited | Ordinal |  | Finite short range
[,21] | wealth. how.was founder | Whether the billionaire was the founder of their company. | Boolean | TRUE | Ordinal | | Finite short range
[,22] | wealth. how.was political | Whether the money came from politics. | Boolean | TRUE | Ordinal |  | Finite short range

Table II. TABLE SHOWS 6 ROWS AND FIRST 5 COLUMNS OF BILLIONAIRES DATASET

*name* | *rank* | *year* | *company. founded* | *company. name* | *company. relationship* | *company. sector* | *company. type* | *demographics. age* | *demographics. gender* | *location. citizenship* | *location country.code* | *location. gdp* | *location.region* | *wealth.type* | *wealth.worth in billion* | *wealth.how.category* | *wealth.how. from emerging* | *wealth.how. industry* | *wealth.how. inherited* | *wealth.how.was founder* | *wealth.how.was political*
--------|--------|------|--------|--------|------|--------|--------|------|--------|--------|------|--------|--------|------|--------|--------|------|--------|--------|------|--------
Leonardo Del Vecchio | 153 | 1996 | 1961 | Luxottica | founder | glasses| new | 60 | male | Italy | ITA | 1.31 E+12 🔶 | Europe | founder non-finance | 2.3 | Traded Sectors | TRUE | Consumer | not inherited | TRUE | TRUE
Elon Mush | 158 | 2014 | 1999 | Paypa, SpaceX, Tesla Motors | investor/founder | technology | new | 42 | male | United States | USA | 0 ❌ | North America | founder non-finance  | 8.4 | Traded Sectors | TRUE | Consumer | not inherited | TRUE | TRUE
Funke Family | 174 | 1996 | 0 | ❓ | ❓ | ❓ | ❓ | 0 ❌ |  | Germany | DEU | 2.5 E+12 🔶 | Europe |  | 2.1 | Non-Traded Sectors | TRUE | Media | not inherited | TRUE | TRUE
Jeffrey Bezos | 234 | 2001 | 1994 | Amazon | founder | technology | new | 37 | male | United States | USA | 1.06 E+13 🔶 | North America | founder non-finance | 2 | Non-Traded Sectors | TRUE | Retail, Restaurant | not inherited | TRUE | TRUE
Robert Naify | 234 | 2001 | 1912 |  | relation | movie theatres | new | 79 | male | United States | USA | 1.06 E+13 🔶 | North America | inherited | 2 | 0 ❌ | TRUE | 0 | father | TRUE | TRUE
 Kunio Busujima | 249 | 1996 | 1950 | Sankyo | found | pachinko gaming machines | new | -42 ❌ | male | Japan | JPN | 4.71 E+12 🔶 | East Asia | founder non-finance | 1.6 | Non-Traded Sectors | TRUE | Retail, Restaurant | not inherited | TRUE | TRUE
</center>

❌ Represents wrong values
<br>❓ Represents missing values
<br>🔶 Values of GDP use scientific notation since they are very large
numbers.

## **Data composition**
<p>
We could see some important features about dataset composition as follows:
Billionaires dataset comprises some data types of variables as seen in [1, Tab. II]. Some formats for numerical values use scientific notation since they are large numbers as shown in Table II.

* Examples, types and variables of this dataset are shown in [1, Tab. II].
* It includes raw data and neither function nor algorithm was used to store the data.
* As reported by Whitcom [2], it’s compiled from some databases and then it was added some variables.
* Decimal places for float values are suitable for wealth worth since the values use billions scale and are easy to read.
* It has some wrong values, uncertain and missing values as seen in [1,Table II]. For instance, wrong values in demographics age are represented as 0 or negative values. Missing values are represented by blanks like some company name values. Also, uncertain values are marked with a question symbol.
* Its last version is 2.0.0.
</p>