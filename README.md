# VsAccessControl

Simple Access Control for Rails. When User want to call the action, it will exec the allow_access proc in the class to make sure that user have the right authorization. 

## Installation

Add this line to your application's Gemfile:

    gem 'vs_access_control'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vs_access_control

## Usage

in controllers like `posts_controller`

```
class PostsController < ApplicationController

  include VsAccessControl
  
  allow_access :create do
    user_signed_in? && current_user.admin 
  end
  
  def create
    #your codes here
  end
end

```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/vs_access_control/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
