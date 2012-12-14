# Active Admin Extra

## Description

Extra candies for your ActiveAdmin apps.

## Installation

Add `activeadmin-extra` to your Gemfile:

```ruby
   gem 'activeadmin-extra', github: 'stefanoverna/activeadmin-extra'
```

Import the stylesheets in your assets

```sass
   @import "active_admin/extra/base"
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

## Copyright

Copyright (c) 2012 Stefano Verna, Cantiere Creativo
See the file LICENSE.txt for details.
