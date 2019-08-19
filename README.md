# Database documentation generator

[![License](https://img.shields.io/github/license/pongee/database-to-documentation)](https://github.com/pongee/database-to-documentation/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/pongee/database-to-documentation.svg?branch=master)](https://travis-ci.org/pongee/database-to-documentation)

## Project goal
The aim of this project is to generate database documentation from sql schema.

## Supported databases
- MySQL
- MariaDB

## Supported Output formats
- Plantuml diagram
- Json

## Installation
```bash
$ composer require pongee/database-to-documentation
or add it the your composer.json and make a composer update pongee/database-to-documentation.
```
## Usage
### In console
#### Json export

```bash
$  php71 ./database-to-documentation mysql:json ./my_mysql_schema_export.sql
```

#### Plantuml export
```bash
$  php71 ./database-to-documentation mysql:plantuml ./my_mysql_schema_export.sql
```
Example output:
![Example output](img/example_plantuml1.png?raw=true "Schema")

### PHP
```php
<?php declare(strict_types=1);

use Pongee\DatabaseToDocumentation\DataObject\Sql\Database\Connection\ConnectionCollection;
use Pongee\DatabaseToDocumentation\Export\Json;
use Pongee\DatabaseToDocumentation\Parser\MysqlParser;

include './vendor/autoload.php';

$sqlSchema = '
  CREATE TABLE IF NOT EXISTS `foo` (
    `id` INT(10) UNSIGNED NOT NULL COMMENT "The id"
   ) ENGINE=innodb DEFAULT CHARSET=utf8;
';

$mysqlParser                = new MysqlParser();
$jsonExport                 = new Json(); // or use new Plantuml(file_get_contents(__DIR__ . '/src/Template/Plantuml/v1.twig'));
$forcedConnectionCollection = new ConnectionCollection();

$schema = $mysqlParser->run($sqlSchema, $forcedConnectionCollection);

print $jsonExport->export($schema);
```

<details>
  <summary>This will generate:</summary>
  <div>
    <pre>
{
    "tables": {
        "foo": {
            "columns": [
                {
                    "name": "id",
                    "type": "INT",
                    "typeParameters": [
                        "10"
                    ],
                    "otherParameters": "UNSIGNED NOT NULL",
                    "comment": "The id"
                }
            ],
            "indexs": {
                "simple": [],
                "spatial": [],
                "fulltext": [],
                "unique": []
            },
            "primaryKey": []
        }
    },
    "connections": []
}
    <pre>
   <div>
</details>
