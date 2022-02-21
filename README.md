# Smart Pension take home test

This is an approach to create a parser for a file that is expected to have a N amount of lines, and each line would be composed as a page visited and user id.
The assumption is that the user id is not an IP number.

## Installation

run
```sh
$ bin/setup
```

This will install all dependencies of the project

## Analysing a file

```sh
$ rake server_parser:sorted_page_views  -- --file_name=webserver.log

$ rake server_parser:sorted_uniq_page_views  -- --file_name=webserver.log
```

The usage message in Rakefile will guide you in how to run the file analyser.

## Approach

Anything that we want to parse should extend `BaseParseable` and implement `parse`. Any parseable entity should receive their specific parsing rules.
The presenters are the classes that know how to manipulate the data and present it.
