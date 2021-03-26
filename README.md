# VideoUploadField

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/video_upload_field`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'video_upload_field', github: 'ian-wang0403/video_upload_field', branch: 'master' 
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install video_upload_field

## Usage

Generate assets files for direct uploads:
    ```
    $ rails generate upload_assets_generator:install
    ```
```
  create  app/javascript/controllers/direct_uploader_controller.js
  create  app/javascript/packs/custom_uploader.js
  create  app/javascript/packs/direct_uploads.js
  create  app/assets/stylesheets/components/direct_uploads.sass
```
add 
```javascript
import { direct_upload } from "packs/direct_uploads"
``` 
to `app/javascript/packs/application.js`

add
```javascript
direct_upload.init()
```
to `app/javascript/packs/application.js`

add
```css
@import 'stylesheets/components/direct_uploads'
```
to `app/javascript/packs/style.sass`

example: 

```ruby
= f.input :photo, as: :direct_upload, label: false, direct_upload: true
```

```ruby
= f.input :photo, as: :direct_upload, label: false, direct_upload: false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/video_upload_field. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the VideoUploadField project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/video_upload_field/blob/master/CODE_OF_CONDUCT.md).
