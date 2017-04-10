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
  template  = DocgenIoClient::TemplateRender.new
  template.texfile = "contents <% field_name %> of a tex file "
  template.save

  template_render =  DocgenIoClient::TemplateRender.new
  template_render.field_values = [{field_name: "asdfasdfasdfadsf", conditional: false}]
  template_render.save

  template_render.pdf # contains the url of current pdf 
  template_render.pdf_object # contains current pdf
  template_render.tex # contains the url of  current tex file
  template_render.tex_object # contains current tex file after templating

  template_render.log # contains current log file of latex generation url
  template_render.log_object # contains current tex file after templating


  # returns the generated PDF
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicholasjstock/docgen_io_client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
