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

### Gained information

* ICO / Company number
* DIC / VAT number
* Company name
* Company state
* Addresses
* Legal form / Legal form ARES id
* Case reference (where company is registered)

## Usage

To get an ARES subjet/party by IČ:
```ruby
subject = RubyARES::Subject.get(27074358)
```
And then:
```ruby
subject => #<RubyARES::Subject:0x00000002502470 @ico=”27074358”, @ic=”27074358”, @dic=”CZ27074358”, @name=”Asseco Central Europe, a.s.”, @company=nil, @status=”Aktivní”, @addresses=[#<RubyARES::Address:0x000000025026f0 @id=”200015797”, @street=”Budějovická”, @postcode=”14000”, @city=”Praha”, @city_part=”Michle”, @house_number=”778”, @house_number_type=”1”, @orientational_number=”3a”>], @updated_at=nil, @legal_form=”Akciová společnost”, @legal_form_id=”121”, @case_reference=#<RubyARES::CaseReference:0x00000001e386f8 @place=”Městský soud v Praze”, @section=”B”, @insert=”8525”>>
subject.name => “Asseco Central Europe, a.s.”
subject.ic => “27074358”
subject.address => #<RubyARES::Address:0x000000025026f0 @id=”200015797”, @street=”Budějovická”, @postcode=”14000”, @city=”Praha”, @city_part=”Michle”, @house_number=”778”, @house_number_type=”1”, @orientational_number=”3a”>
subject.address.to_str => “Budějovická 3a/778\n14000 Praha\nMichle\n”
subject.case_reference => #<RubyARES::CaseReference:0x00000001e386f8 @place=”Městský soud v Praze”, @section=”B”, @insert=”8525”>
subject.case_reference.to_str => “Městský soud v Praze B 8525”
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
