# filter_my_feed

This is a simple sinatra app fetching the user timeline of a specific user. It prints out the list of tweets filtered by a search term and ordered by user followers number.


# Configuration

- `bundle install`
- Rename the `.env.example` file into `.env` and replace the content by the credentials of a Twitter user.
- Run `ruby my_app.rb`

# Tests

- Run `rake`

You have to make sure that your `.env` file is well set before running the test suite.

