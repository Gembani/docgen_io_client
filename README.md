# DocgenIoClient

A client for consuming `api.docgen.io` check out the API documentation here `api.docgen.io/docs`



## Installation (Not published yet)

Add this line to your application's Gemfile:

```ruby
gem 'docgen_io_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docgen_io_client

The gem expects an environment variable called `DOCGEN_API_KEY` with the api_key

## Usage

```ruby
  document = DocgenIoClient::Document.new
  document.texfile = "contents <% field_name %> of a tex file"
  document.save

  render =  DocgenIoClient::Render.new
  render.field_values = [{name: "field_name", value:"asdfasdfasdfadsf"}]
  render.save

  compile =  DocgenIoClient::Compile.new
  compile.render = render
  compile.save
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholasjstock/docgen_io_client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
