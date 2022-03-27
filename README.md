# README

This application can be used to parse Outdoor.sy customer data files and output it into a readable format. The application expects data to be comma or pipe delimited and allows the user to provide an attribute to sort the data by.

There are two ways this application can be run:

1. As a rails web application 
  * To run:  `bin/rails s`

2. As a rake task
  * To run: `bundle exec rake customer:list[:path_to_file,:sort_by]`
