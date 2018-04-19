# OmniAuth Scalingo

This is the official OmniAuth strategy for authenticating to Scalingo. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret.

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :scalingo, ENV['SCALINGO_APP_ID'], ENV['SCALINGO_APP_SECRET']
end
```

## Scopes

Scalingo API lets you set scopes to provide granular access to different types of data and actions.

```ruby
use OmniAuth::Builder do
  provider :scalingo, ENV['SCALINGO_APP_ID'], ENV['SCALINGO_APP_SECRET'], scope: "scope1,scope2"
end
```
