# ruby-ares

Gem for accesing business information from ARES database.

ARES is the Czech business database maintained by Ministry of Finance of the Czech Republic.
This gem helps to retrieve data provided by this database. Currently ruby-ares supports only retrieval of basic information and addresses for business contacts by IČ (Czech business contact identification number).

## Installation and Requirements

Install the gem and require it:
```
$ gem install ruby-ares
```
```ruby
require 'ruby-ares'
```

This will need libxml2 (with header files) installed. On Fedora:

```
su -c 'yum install libxml2-devel'
```

## Usage

To get an ARES subjet/party by IČ:
```ruby
subject = RubyARES::Subject.get(74948440)
```
And then:
```ruby
subject => #<RubyARES::Subject:0x000000013ac2c0 @ico="74948440", @ic="74948440", @dic=nil, @name="Josef Stříbný", @company=nil, @status=nil, @addresses=[#<RubyARES::Address:0x000000013ac978 @id="406358731", @street="Nádražní", @postcode="74727", @city="Kobeřice", @city_part="Kobeřice", @house_number="721", @house_number_type="1", @orientational_number=nil>], @updated_at=nil, @legal_form="Fyzická osoba podnikající dle živnostenského zákona nezapsaná v obchodním rejstříku">
subject.name => Josef Stříbný
subject.ic => 74948440
subject.address => #<RubyARES::Address:0x007fc691a776a0 @id="406358731", @street="Nádražní", @postcode="74727", @city="Kobeřice", @city_part="Kobeřice", @house_number="721", @house_number_type="1", @orientational_number=nil>
```

### Exceptions

ruby-ares will raise either `RubyARES::Parser::ARESDatabaseError` or `RubyARES::Parser::ParseError` if the ARES database responds with an error or the XML doesn't contain the information you are looking for.

If the connection to the ARES database can't be established ruby-ares raises `RubyARES::HTTP::ConnectionError`.

## License

ruby-ares is written and maintained by [Josef Strzibny](http://strzibny.name).

See LICENSE file.

## Contributors

Contributions are welcome!

Here are the list of current contributors:

- Jindřich Skupa
