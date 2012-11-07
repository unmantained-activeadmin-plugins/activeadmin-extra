# Active Admin Gallery

## Description

With activeadmin-gallery, you are able to DRY up your models and freely associate images and galleries to your models.

## Installation

Add `activeadmin-gallery` to your Gemfile:

```ruby
   gem 'activeadmin-gallery', github: 'stefanoverna/activeadmin-gallery'
```

Run the generator that will create the images table, and migrate.

```
> rake activeadmin_gallery:install:migrations
> rake db:migrate
```

## Gallery usage

Suppose you want a Page model with an image gallery. In `app/models/page.rb`:

```ruby
class Page < ActiveRecord::Base
  has_many_images :album_images
end
```

No migrations, no models. That's all you need.

In your ActiveAdmin config file:

```ruby
ActiveAdmin.register Page do

  form do |f|
    # ...
    f.inputs :gallery do
      f.has_many_images :album_images
    end
    # ...
  end

end
```

## Single image usage

Suppose you want a Page model with a single image. Edit `app/models/page.rb`

```ruby
class Page < ActiveRecord::Base
  has_image :featured_image
end
```

No migrations, no models. That's all you need.
In your ActiveAdmin config file:

```ruby
ActiveAdmin.register Page do

  form do |f|
    # ...
    f.inputs :image do
      f.has_image :featured_image
    end
    # ...
  end

end
```

## Copyright

Copyright (c) 2012 Stefano Verna, Cantiere Creativo
See the file LICENSE.txt for details.
