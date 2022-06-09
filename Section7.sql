DATABASE CHESS;

CREATE SET TABLE CHESS.Products(
    Prod_ID SMALLINT PRIMARY KEY NOT NULL,
    Prod_desc VARCHAR(50),
    Price DECIMAL(8, 2) COMPRESS(0, 1.00),
    Discount_ind CHAR(1),
    Expire_dt DATE FORMAT 'YYYY-MM-DD',
    Entry_ts TIMESTAMP(6)
    );

-- insert manually 
INSERT INTO "CHESS"."Products"  
    ("PROD_ID", "PROD_DESC", "PRICE", "DISCOUNT_IND", "EXPIRE_DT", "ENTRY_TS")  
    VALUES(1,'Honey',9.99,'Y','2025-06-30','2021-01-17 18:00:00.000000') ;

INSERT INTO "CHESS"."Products"  
    ("PROD_ID", "PROD_DESC", "PRICE", "DISCOUNT_IND", "EXPIRE_DT", "ENTRY_TS")  
    VALUES(2,'Bicycle',399.998,'Y','2099-01-01',NULL) ;

INSERT INTO "CHESS"."Products"  
    VALUES(3,'Tomato paste',2.49,'y','2022-01-01',NULL) ;

INSERT INTO "CHESS"."Products"  
    ("PROD_ID", "PROD_DESC", "PRICE", "DISCOUNT_IND", "EXPIRE_DT")  
    VALUES(4,'Shampoo',6.00,,'2028-01-01') ;

INSERT INTO "CHESS"."Products"  
    VALUES(5,'Tomato paste',2.49,,CURRENT_DATE,CAST('01/15/2022' AS TIMESTAMP(6) FORMAT 'MM/DD/YYYY')) ;

SELECT *
    FROM chess.products
    ORDER BY prod_id ASC;
    
CREATE SET TABLE CHESS.Products_copy(
    Prod_ID SMALLINT PRIMARY KEY NOT NULL,
    Prod_desc VARCHAR(50),
    Price DECIMAL(8, 2) COMPRESS(0, 1.00),
    Discount_ind CHAR(1),
    Expire_dt DATE FORMAT 'YYYY-MM-DD',
    Entry_ts TIMESTAMP(6)
    );

-- insert from another table 
INSERT INTO CHESS.Products_copy
    SELECT *
        FROM chess.products;

UPDATE chess.Products_copy
    SET price = price * 2
    WHERE prod_id = 5;
        
DELETE
    FROM chess.Products_copy
    WHERE prod_id = 5;

ALTER TABLE CHESS.Products_copy
    ADD new_column INT;

ALTER TABLE CHESS.Products_copy
    RENAME new_column TO new_new_column;    
    
ALTER TABLE CHESS.Products_copy
    DROP new_new_column;    
    
SELECT *
    FROM chess.products_copy
    ORDER BY prod_id ASC;

-- Players Table Fast Load 
SELECT *
    FROM chess.players;
    
-- Countries Table manually insert (DML)
INSERT INTO CHESS.Countries VALUES ('AFG', 'Afghanistan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('ALA', 'Åland Islands', 'Europe');
INSERT INTO CHESS.Countries VALUES ('ALB', 'Albania', 'Europe');
INSERT INTO CHESS.Countries VALUES ('DZA', 'Algeria', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ASM', 'American Samoa', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('AND', 'Andorra', 'Europe');
INSERT INTO CHESS.Countries VALUES ('AGO', 'Angola', 'Africa');
INSERT INTO CHESS.Countries VALUES ('AIA', 'Anguilla', 'Americas');
INSERT INTO CHESS.Countries VALUES ('ATG', 'Antigua and Barbuda', 'Americas');
INSERT INTO CHESS.Countries VALUES ('ARG', 'Argentina', 'Americas');
INSERT INTO CHESS.Countries VALUES ('ARM', 'Armenia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('ABW', 'Aruba', 'Americas');
INSERT INTO CHESS.Countries VALUES ('AUS', 'Australia', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('AUT', 'Austria', 'Europe');
INSERT INTO CHESS.Countries VALUES ('AZE', 'Azerbaijan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('BHS', 'Bahamas', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BHR', 'Bahrain', 'Asia');
INSERT INTO CHESS.Countries VALUES ('BGD', 'Bangladesh', 'Asia');
INSERT INTO CHESS.Countries VALUES ('BRB', 'Barbados', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BLR', 'Belarus', 'Europe');
INSERT INTO CHESS.Countries VALUES ('BEL', 'Belgium', 'Europe');
INSERT INTO CHESS.Countries VALUES ('BLZ', 'Belize', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BEN', 'Benin', 'Africa');
INSERT INTO CHESS.Countries VALUES ('BMU', 'Bermuda', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BTN', 'Bhutan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('BOL', 'Bolivia (Plurinational State of)', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BES', 'Bonaire, Sint Eustatius and Saba', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BIH', 'Bosnia and Herzegovina', 'Europe');
INSERT INTO CHESS.Countries VALUES ('BWA', 'Botswana', 'Africa');
INSERT INTO CHESS.Countries VALUES ('BVT', 'Bouvet Island', 'Americas');
INSERT INTO CHESS.Countries VALUES ('BRA', 'Brazil', 'Americas');
INSERT INTO CHESS.Countries VALUES ('IOT', 'British Indian Ocean Territory', 'Africa');
INSERT INTO CHESS.Countries VALUES ('BRN', 'Brunei Darussalam', 'Asia');
INSERT INTO CHESS.Countries VALUES ('BUL', 'Bulgaria', 'Europe');
INSERT INTO CHESS.Countries VALUES ('BFA', 'Burkina Faso', 'Africa');
INSERT INTO CHESS.Countries VALUES ('BDI', 'Burundi', 'Africa');
INSERT INTO CHESS.Countries VALUES ('CPV', 'Cabo Verde', 'Africa');
INSERT INTO CHESS.Countries VALUES ('KHM', 'Cambodia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('CMR', 'Cameroon', 'Africa');
INSERT INTO CHESS.Countries VALUES ('CAN', 'Canada', 'Americas');
INSERT INTO CHESS.Countries VALUES ('CYM', 'Cayman Islands', 'Americas');
INSERT INTO CHESS.Countries VALUES ('CAF', 'Central African Republic', 'Africa');
INSERT INTO CHESS.Countries VALUES ('TCD', 'Chad', 'Africa');
INSERT INTO CHESS.Countries VALUES ('CHL', 'Chile', 'Americas');
INSERT INTO CHESS.Countries VALUES ('CHN', 'China', 'Asia');
INSERT INTO CHESS.Countries VALUES ('CXR', 'Christmas Island', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('CCK', 'Cocos (Keeling) Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('COL', 'Colombia', 'Americas');
INSERT INTO CHESS.Countries VALUES ('COM', 'Comoros', 'Africa');
INSERT INTO CHESS.Countries VALUES ('COG', 'Congo', 'Africa');
INSERT INTO CHESS.Countries VALUES ('COD', 'Congo, Democratic Republic of the', 'Africa');
INSERT INTO CHESS.Countries VALUES ('COK', 'Cook Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('CRI', 'Costa Rica', 'Americas');
INSERT INTO CHESS.Countries VALUES ('CIV', 'Côte d`Ivoire', 'Africa');
INSERT INTO CHESS.Countries VALUES ('CRO', 'Croatia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('CUB', 'Cuba', 'Americas');
INSERT INTO CHESS.Countries VALUES ('CUW', 'Curaçao', 'Americas');
INSERT INTO CHESS.Countries VALUES ('CYP', 'Cyprus', 'Asia');
INSERT INTO CHESS.Countries VALUES ('CZE', 'Czechia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('DEN', 'Denmark', 'Europe');
INSERT INTO CHESS.Countries VALUES ('DJI', 'Djibouti', 'Africa');
INSERT INTO CHESS.Countries VALUES ('DMA', 'Dominica', 'Americas');
INSERT INTO CHESS.Countries VALUES ('DOM', 'Dominican Republic', 'Americas');
INSERT INTO CHESS.Countries VALUES ('ECU', 'Ecuador', 'Americas');
INSERT INTO CHESS.Countries VALUES ('EGY', 'Egypt', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ENG', 'England', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SLV', 'El Salvador', 'Americas');
INSERT INTO CHESS.Countries VALUES ('GNQ', 'Equatorial Guinea', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ERI', 'Eritrea', 'Africa');
INSERT INTO CHESS.Countries VALUES ('EST', 'Estonia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SWZ', 'Eswatini', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ETH', 'Ethiopia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('FLK', 'Falkland Islands (Malvinas)', 'Americas');
INSERT INTO CHESS.Countries VALUES ('FRO', 'Faroe Islands', 'Europe');
INSERT INTO CHESS.Countries VALUES ('FJI', 'Fiji', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('FIN', 'Finland', 'Europe');
INSERT INTO CHESS.Countries VALUES ('FRA', 'France', 'Europe');
INSERT INTO CHESS.Countries VALUES ('GUF', 'French Guiana', 'Americas');
INSERT INTO CHESS.Countries VALUES ('PYF', 'French Polynesia', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('ATF', 'French Southern Territories', 'Africa');
INSERT INTO CHESS.Countries VALUES ('GAB', 'Gabon', 'Africa');
INSERT INTO CHESS.Countries VALUES ('GMB', 'Gambia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('GEO', 'Georgia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('GER', 'Germany', 'Europe');
INSERT INTO CHESS.Countries VALUES ('GHA', 'Ghana', 'Africa');
INSERT INTO CHESS.Countries VALUES ('GIB', 'Gibraltar', 'Europe');
INSERT INTO CHESS.Countries VALUES ('GRE', 'Greece', 'Europe');
INSERT INTO CHESS.Countries VALUES ('GRL', 'Greenland', 'Americas');
INSERT INTO CHESS.Countries VALUES ('GRD', 'Grenada', 'Americas');
INSERT INTO CHESS.Countries VALUES ('GLP', 'Guadeloupe', 'Americas');
INSERT INTO CHESS.Countries VALUES ('GUM', 'Guam', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('GTM', 'Guatemala', 'Americas');
INSERT INTO CHESS.Countries VALUES ('GGY', 'Guernsey', 'Europe');
INSERT INTO CHESS.Countries VALUES ('GIN', 'Guinea', 'Africa');
INSERT INTO CHESS.Countries VALUES ('GNB', 'Guinea-Bissau', 'Africa');
INSERT INTO CHESS.Countries VALUES ('GUY', 'Guyana', 'Americas');
INSERT INTO CHESS.Countries VALUES ('HTI', 'Haiti', 'Americas');
INSERT INTO CHESS.Countries VALUES ('HMD', 'Heard Island and McDonald Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('VAT', 'Holy See', 'Europe');
INSERT INTO CHESS.Countries VALUES ('HND', 'Honduras', 'Americas');
INSERT INTO CHESS.Countries VALUES ('HKG', 'Hong Kong', 'Asia');
INSERT INTO CHESS.Countries VALUES ('HUN', 'Hungary', 'Europe');
INSERT INTO CHESS.Countries VALUES ('ISL', 'Iceland', 'Europe');
INSERT INTO CHESS.Countries VALUES ('IND', 'India', 'Asia');
INSERT INTO CHESS.Countries VALUES ('IDN', 'Indonesia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('IRI', 'Iran', 'Asia');
INSERT INTO CHESS.Countries VALUES ('IRQ', 'Iraq', 'Asia');
INSERT INTO CHESS.Countries VALUES ('IRL', 'Ireland', 'Europe');
INSERT INTO CHESS.Countries VALUES ('IMN', 'Isle of Man', 'Europe');
INSERT INTO CHESS.Countries VALUES ('ISR', 'Israel', 'Asia');
INSERT INTO CHESS.Countries VALUES ('ITA', 'Italy', 'Europe');
INSERT INTO CHESS.Countries VALUES ('JAM', 'Jamaica', 'Americas');
INSERT INTO CHESS.Countries VALUES ('JPN', 'Japan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('JEY', 'Jersey', 'Europe');
INSERT INTO CHESS.Countries VALUES ('JOR', 'Jordan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('KAZ', 'Kazakhstan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('KEN', 'Kenya', 'Africa');
INSERT INTO CHESS.Countries VALUES ('KIR', 'Kiribati', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('PRK', 'Korea (Democratic People`s Republic of)', 'Asia');
INSERT INTO CHESS.Countries VALUES ('KOR', 'Korea, Republic of', 'Asia');
INSERT INTO CHESS.Countries VALUES ('KWT', 'Kuwait', 'Asia');
INSERT INTO CHESS.Countries VALUES ('KGZ', 'Kyrgyzstan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('LAO', 'Lao People`s Democratic Republic', 'Asia');
INSERT INTO CHESS.Countries VALUES ('LAT', 'Latvia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('LBN', 'Lebanon', 'Asia');
INSERT INTO CHESS.Countries VALUES ('LSO', 'Lesotho', 'Africa');
INSERT INTO CHESS.Countries VALUES ('LBR', 'Liberia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('LBY', 'Libya', 'Africa');
INSERT INTO CHESS.Countries VALUES ('LIE', 'Liechtenstein', 'Europe');
INSERT INTO CHESS.Countries VALUES ('LTU', 'Lithuania', 'Europe');
INSERT INTO CHESS.Countries VALUES ('LUX', 'Luxembourg', 'Europe');
INSERT INTO CHESS.Countries VALUES ('MAC', 'Macao', 'Asia');
INSERT INTO CHESS.Countries VALUES ('MDG', 'Madagascar', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MWI', 'Malawi', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MYS', 'Malaysia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('MDV', 'Maldives', 'Asia');
INSERT INTO CHESS.Countries VALUES ('MLI', 'Mali', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MLT', 'Malta', 'Europe');
INSERT INTO CHESS.Countries VALUES ('MHL', 'Marshall Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('MTQ', 'Martinique', 'Americas');
INSERT INTO CHESS.Countries VALUES ('MRT', 'Mauritania', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MUS', 'Mauritius', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MYT', 'Mayotte', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MEX', 'Mexico', 'Americas');
INSERT INTO CHESS.Countries VALUES ('FSM', 'Micronesia (Federated States of)', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('MDA', 'Moldova, Republic of', 'Europe');
INSERT INTO CHESS.Countries VALUES ('MCO', 'Monaco', 'Europe');
INSERT INTO CHESS.Countries VALUES ('MNG', 'Mongolia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('MNE', 'Montenegro', 'Europe');
INSERT INTO CHESS.Countries VALUES ('MSR', 'Montserrat', 'Americas');
INSERT INTO CHESS.Countries VALUES ('MAR', 'Morocco', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MOZ', 'Mozambique', 'Africa');
INSERT INTO CHESS.Countries VALUES ('MMR', 'Myanmar', 'Asia');
INSERT INTO CHESS.Countries VALUES ('NAM', 'Namibia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('NRU', 'Nauru', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('NPL', 'Nepal', 'Asia');
INSERT INTO CHESS.Countries VALUES ('NED', 'Netherlands', 'Europe');
INSERT INTO CHESS.Countries VALUES ('NCL', 'New Caledonia', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('NZL', 'New Zealand', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('NIC', 'Nicaragua', 'Americas');
INSERT INTO CHESS.Countries VALUES ('NER', 'Niger', 'Africa');
INSERT INTO CHESS.Countries VALUES ('NGA', 'Nigeria', 'Africa');
INSERT INTO CHESS.Countries VALUES ('NIU', 'Niue', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('NFK', 'Norfolk Island', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('MKD', 'North Macedonia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('MNP', 'Northern Mariana Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('NOR', 'Norway', 'Europe');
INSERT INTO CHESS.Countries VALUES ('OMN', 'Oman', 'Asia');
INSERT INTO CHESS.Countries VALUES ('PAK', 'Pakistan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('PLW', 'Palau', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('PSE', 'Palestine, State of', 'Asia');
INSERT INTO CHESS.Countries VALUES ('PAN', 'Panama', 'Americas');
INSERT INTO CHESS.Countries VALUES ('PNG', 'Papua New Guinea', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('PRY', 'Paraguay', 'Americas');
INSERT INTO CHESS.Countries VALUES ('PER', 'Peru', 'Americas');
INSERT INTO CHESS.Countries VALUES ('PHL', 'Philippines', 'Asia');
INSERT INTO CHESS.Countries VALUES ('PCN', 'Pitcairn', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('POL', 'Poland', 'Europe');
INSERT INTO CHESS.Countries VALUES ('PRT', 'Portugal', 'Europe');
INSERT INTO CHESS.Countries VALUES ('PRI', 'Puerto Rico', 'Americas');
INSERT INTO CHESS.Countries VALUES ('QAT', 'Qatar', 'Asia');
INSERT INTO CHESS.Countries VALUES ('REU', 'Réunion', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ROU', 'Romania', 'Europe');
INSERT INTO CHESS.Countries VALUES ('RUS', 'Russian Federation', 'Europe');
INSERT INTO CHESS.Countries VALUES ('RWA', 'Rwanda', 'Africa');
INSERT INTO CHESS.Countries VALUES ('BLM', 'Saint Barthélemy', 'Americas');
INSERT INTO CHESS.Countries VALUES ('SHN', 'Saint Helena, Ascension and Tristan da Cunha', 'Africa');
INSERT INTO CHESS.Countries VALUES ('KNA', 'Saint Kitts and Nevis', 'Americas');
INSERT INTO CHESS.Countries VALUES ('LCA', 'Saint Lucia', 'Americas');
INSERT INTO CHESS.Countries VALUES ('MAF', 'Saint Martin (French part)', 'Americas');
INSERT INTO CHESS.Countries VALUES ('SPM', 'Saint Pierre and Miquelon', 'Americas');
INSERT INTO CHESS.Countries VALUES ('VCT', 'Saint Vincent and the Grenadines', 'Americas');
INSERT INTO CHESS.Countries VALUES ('WSM', 'Samoa', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('SMR', 'San Marino', 'Europe');
INSERT INTO CHESS.Countries VALUES ('STP', 'Sao Tome and Principe', 'Africa');
INSERT INTO CHESS.Countries VALUES ('SAU', 'Saudi Arabia', 'Asia');
INSERT INTO CHESS.Countries VALUES ('SEN', 'Senegal', 'Africa');
INSERT INTO CHESS.Countries VALUES ('SRB', 'Serbia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SYC', 'Seychelles', 'Africa');
INSERT INTO CHESS.Countries VALUES ('SLE', 'Sierra Leone', 'Africa');
INSERT INTO CHESS.Countries VALUES ('SGP', 'Singapore', 'Asia');
INSERT INTO CHESS.Countries VALUES ('SXM', 'Sint Maarten (Dutch part)', 'Americas');
INSERT INTO CHESS.Countries VALUES ('SLO', 'Slovakia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SVN', 'Slovenia', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SLB', 'Solomon Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('SOM', 'Somalia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ZAF', 'South Africa', 'Africa');
INSERT INTO CHESS.Countries VALUES ('SGS', 'South Georgia and the South Sandwich Islands', 'Americas');
INSERT INTO CHESS.Countries VALUES ('SSD', 'South Sudan', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ESP', 'Spain', 'Europe');
INSERT INTO CHESS.Countries VALUES ('LKA', 'Sri Lanka', 'Asia');
INSERT INTO CHESS.Countries VALUES ('SDN', 'Sudan', 'Africa');
INSERT INTO CHESS.Countries VALUES ('SUR', 'Suriname', 'Americas');
INSERT INTO CHESS.Countries VALUES ('SJM', 'Svalbard and Jan Mayen', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SWE', 'Sweden', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SUI', 'Switzerland', 'Europe');
INSERT INTO CHESS.Countries VALUES ('SYR', 'Syrian Arab Republic', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TWN', 'Taiwan, Province of China', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TJK', 'Tajikistan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TZA', 'Tanzania, United Republic of', 'Africa');
INSERT INTO CHESS.Countries VALUES ('THA', 'Thailand', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TLS', 'Timor-Leste', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TGO', 'Togo', 'Africa');
INSERT INTO CHESS.Countries VALUES ('TKL', 'Tokelau', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('TON', 'Tonga', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('TTO', 'Trinidad and Tobago', 'Americas');
INSERT INTO CHESS.Countries VALUES ('TUN', 'Tunisia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('TUR', 'Turkey', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TKM', 'Turkmenistan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('TCA', 'Turks and Caicos Islands', 'Americas');
INSERT INTO CHESS.Countries VALUES ('TUV', 'Tuvalu', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('UGA', 'Uganda', 'Africa');
INSERT INTO CHESS.Countries VALUES ('UKR', 'Ukraine', 'Europe');
INSERT INTO CHESS.Countries VALUES ('ARE', 'United Arab Emirates', 'Asia');
INSERT INTO CHESS.Countries VALUES ('USA', 'United States of America', 'Americas');
INSERT INTO CHESS.Countries VALUES ('UMI', 'United States Minor Outlying Islands', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('URY', 'Uruguay', 'Americas');
INSERT INTO CHESS.Countries VALUES ('UZB', 'Uzbekistan', 'Asia');
INSERT INTO CHESS.Countries VALUES ('VUT', 'Vanuatu', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('VNM', 'Viet Nam', 'Asia');
INSERT INTO CHESS.Countries VALUES ('WLF', 'Wallis and Futuna', 'Oceania');
INSERT INTO CHESS.Countries VALUES ('ESH', 'Western Sahara', 'Africa');
INSERT INTO CHESS.Countries VALUES ('YEM', 'Yemen', 'Asia');
INSERT INTO CHESS.Countries VALUES ('ZMB', 'Zambia', 'Africa');
INSERT INTO CHESS.Countries VALUES ('ZWE', 'Zimbabwe', 'Africa');

SELECT *
    FROM chess.countries;
 
-- Games Table Fast Load 
SELECT *
    FROM chess.games;
    
-- SELECT Statement,
SELECT DISTINCT 
    First_Name,
    Last_Name,
    Birth_Year,
    country AS nation,
    "title" -- " " means attribute, ' ' means literal string in Teradata
    ,
    'title',
    Rating
    FROM chess.players
    WHERE LOWER( First_Name) LIKE '%g%'
        AND  Birth_Year > 1950
        AND  Last_Name LIKE SOME ('%z%', '%h%') -- some == any
        
        AND  Last_Name (NOT CASESPECIFIC) LIKE '%a%' -- not case sensitive
    
    ORDER BY Rating DESC,
        1 ASC
    SAMPLE 100
     -- sample
    ;
   
-- TOP WITH TIES
SELECT 
    TOP 20 WITH TIES 
    *
    FROM chess.players
    ORDER BY rating DESC;
    
-- SAMPLE RANDOMIZED ALLOCATION
SELECT *
    FROM chess.players AS c
    SAMPLE RANDOMIZED ALLOCATION 10;
    
-- INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN, CROSS JOIN
-- GROUP BY
-- RANK(), DENSE_RANK(), ROW_NUMBER()
SELECT 
    first_name,
    last_name,
    rating,
    country,
    DENSE_RANK() OVER (PARTITION BY country
    ORDER BY rating DESC) AS drank
    FROM chess.players
    QUALIFY drank = 1; -- QUALIFY
    
-- UNION ALL, UNION
    SELECT *
        FROM chess.players
    UNION ALL
    SELECT *
        FROM chess.players
    UNION
    SELECT *
        FROM chess.players;

-- INTERSECT, EXCEPT (MINUS)
    SELECT *
        FROM chess.players
    INTERSECT
    SELECT *
        FROM chess.players;
 
    SELECT *
        FROM chess.players
    MINUS
    SELECT *
        FROM chess.players;
       
-- TYPE, ||, CONCAT, SUBSTRING, LTRIM, RTRIM, TRIM, LOWER, UPPER, LEFT, RIGHT    
SELECT TYPE(FIDE_ID),
    TYPE(First_Name),
    TYPE(Last_Name),
    TYPE(Rating),
    TRIM(First_Name) || ' ' || Last_Name AS full_name,
    CONCAT(LTRIM(First_Name), ' ', RTRIM(Last_Name)) AS full_name,
    SUBSTRING(Last_Name, 1, 2)
    FROM chess.players;
  
-- INDEX, POSITION, LENGTH, OTRANSLATE, OREPLACE
SELECT 
    First_Name,
    Last_Name,
    LENGTH(Last_Name) AS len,
    INDEX(First_Name, 'a') AS "index",
    POSITION('a' IN First_Name) AS "POSITION",
    OTRANSLATE(First_Name, 'a', 'x') AS OTRANSLATE_first_name,
    OREPLACE(First_Name, 'a', 'x') AS Oreplace_first_name
    FROM chess.players;
    
-- CASE WHEN END
-- COALESCE, return the first non_null value
SELECT 
    COALESCE(1, NULL),
    COALESCE(NULL, 1),
    COALESCE(NULL, NULL),
    COALESCE(NULL, NULL, NULL, 'key');
    
-- Returns a null value if the two expressions are equal
SELECT NULLIF(4,4) AS Same,
    NULLIF(5,7) AS Different;
    
-- CAST, TO_CHAR, TO_NUMBER, TO_DATE
SELECT
    CAST('1500' AS INT),
    CAST('1500' AS DEC(6, 2)),
    CAST('0001' AS INT),
    CAST('2022-10-01' AS DATE),
    CAST('10/01/2022' AS DATE FORMAT 'MM/DD/YYYY'),
    CAST('10 01 2022' AS DATE FORMAT 'MMBDDBYYYY'); -- B means blank

SELECT 
    CURRENT_DATE,
    CURRENT_TIME,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP(4); 

-- DATE, CAST is more applicable
SELECT *
    FROM chess.games
    WHERE game_date = CAST('2020-01-11' AS DATE FORMAT 'YYYY-MM-DD')
        AND  game_date = CAST('01 11 2020' AS DATE FORMAT 'MMBDDBYYYY') -- B means blank
        
        AND  game_date = TO_DATE('2020-01-11');

SELECT *
    FROM chess.games
    WHERE game_date = '2020-01-11';

SELECT 
    (CURRENT_DATE - CAST('1995-04-23' AS DATE)) / 365.25 AS age;

-- CURRENT_DATE = CURRENT_DATE()
SELECT CURRENT_DATE + INTERVAL '1' DAY,
    CURRENT_DATE + INTERVAL '1' DAY + INTERVAL '2' MONTH + INTERVAL '3' YEAR;
    
SELECT CURRENT_DATE,
    CURRENT_DATE + INTERVAL '6-06' YEAR TO MONTH;
    
SELECT 
    EXTRACT(YEAR
    FROM CURRENT_DATE),
        EXTRACT(MONTH
    FROM CURRENT_DATE),
        EXTRACT(DAY
    FROM CURRENT_DATE);
    
-- TIME
SELECT CURRENT_TIME,
EventTime,
CAST(EventTime AS DATE),
CAST(EventTime AS TIME),
EXTRACT(HOUR FROM CURRENT_TIME),
EventTime + INTERVAL '2' HOUR + INTERVAL '3' MINUTE + INTERVAL '10' SECOND
FROM DBC.QryLogEvents;
    
-- CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP;
    


    
    