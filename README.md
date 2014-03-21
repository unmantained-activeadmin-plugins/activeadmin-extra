# Active Admin Extra

## Description

Extra candies for your ActiveAdmin apps.

## Installation

Add `activeadmin-extra` to your Gemfile:

```ruby
   gem 'activeadmin-extra', github: 'stefanoverna/activeadmin-extra'
```

Replace active_admin stylesheets and javascripts with:

```sass
   @import "active_admin/extra/base"
```

```coffee
   #= require active_admin/extra
```


## Custom inputs usage

Spice up your admin forms with these brand new inputs:

### Title

String field with a larger font.

```ruby
   ActiveAdmin.register Page do

     form do |f|
       f.input :name, :as => :title
     end

   end
```


### Chosen

The infamous jquery combobox. To use add to your Gemfile:

```ruby
   gem 'chosen-rails', group: :assets
```

and then in your assets:

```coffee
   #= require chosen-jquery
```

```sass
   @import "chosen"
```

Usage:

```ruby
   ActiveAdmin.register Product do

     form do |f|
       f.input :material, as: :chosen, create_option: true
     end

   end
```

For the create_option alternative use [koenpunt's fork](https://github.com/koenpunt/chosen).


### Measure

Number with unit of measure symbol

```ruby
   ActiveAdmin.register Product do

     form do |f|
       f.input :price, :as => :measure, :symbol => '€'
     end

   end
```


### Numbers set

A row of numeric inputs side by side. Basic usage:

```ruby
   ActiveAdmin.register Box do

     form do |f|
       f.input :height, :as => :numbers_set # default displays a height_min and a height_max field
     end

   end
```

Multiple options:

```ruby
   ActiveAdmin.register Box do

     form do |f|
       f.input :height, :as => :numbers_set, :numbers_set => [:mm, :in, :ft]
     end

   end
```

### Google Map Address

A simple way to find latitude and longitude values trhough a google map. Basic usage:

Requires the following in config/initializers/active_admin.rb

```ruby
  ActiveAdmin.application.register_javascript "https://maps.googleapis.com/maps/api/js?sensor=false"
```

Add address (or any other name), latitude end longitude string column to your model via migration

```ruby
  def change
    add_column :apartments, :address, :string
    add_column :apartments, :latitude, :string
    add_column :apartments, :longitude, :string
  end
```

Configure your active admin model file

```ruby
  /app/admin/apartement.rb

  form do |f|
    f.inputs :logistic do
      f.input :address, as: :map_address
    end
  end
```

## Copyright

Copyright (c) 2012 Stefano Verna, Cantiere Creativo
See the file LICENSE.txt for details.
