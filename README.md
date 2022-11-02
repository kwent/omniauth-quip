# OmniAuth Quip OAuth2 Strategy

Strategy to authenticate with Quip via OAuth2 in OmniAuth.

Get your API key at: https://help.salesforce.com/s/articleView?id=sf.anywhere_new_api_key.htm&type=5

Note the Client ID and the Client Secret.

For more details, read the Atlassian Quip docs about OAuth 2.0 (3LO): https://quip.com/dev/automation/documentation/current#tag/Authentication

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-quip'
```

Then `bundle install`.

## Quip API Setup

* Go to 'https://help.salesforce.com/s/articleView?id=sf.anywhere_new_api_key.htm&type=5'
* Create a new app.
* Note the Client ID and Secret values in the App Details section.
* Under APIs and Features, add the "Authorization code grants" feature.
  Configure the feature with your callback URL (something like
  http://localhost:3000/auth/quip/callback).
* Under APIs and Features, add the "Quip platform REST API" API.

## Usage

Here's an example for adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :quip, ENV['QUIP_CLIENT_ID'], ENV['QUIP_CLIENT_SECRET'],
    scope: "USER_READ USER_WRITE USER_MANAGE"
end
```

You can now access the OmniAuth Quip OAuth2 URL: `/auth/quip`

NOTE: While developing your application, if you change the scope in the
initializer you will need to restart your app server.

## Auth Hash

Here's an example of an authentication hash available in the callback by
accessing `request.env['omniauth.auth']`:

After authing a user, when you make API calls over time, you should follow the
[Quip OAuth 2.0 docs](https://developer.atlassian.com/cloud/confluence/oauth-2-authorization-code-grants-3lo-for-apps/)
and continue to check the `accessible-resources` endpoint to ensure your app
continues to have access to the sites you expect.

```ruby
{
 "provider"=>"quip",
 "uid"=>"1db0a817f4ad35e04d96efe06991a234238e8fa19417d39de073b6a0aa7fab677",
 "info"=>{},
 "credentials"=>
  {"token"=>"REDACTED",
   "refresh_token"=>"REDACTED",
   "expires_at"=>1670017351,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>{},
   "me"=>
    {"name"=>"John Doe",
     "emails"=>["john@acme.com"],
     "id"=>"JJCAEArdcbn",
     "created_usec"=>1665786610244999,
     "is_robot"=>false,
     "affinity"=>0.0,
     "desktop_folder_id"=>"AUMAOAfZCvN",
     "archive_folder_id"=>"AUMAOAOFsOu",
     "starred_folder_id"=>"AUMAOAd8R4l",
     "private_folder_id"=>"AUMAOA2dCE2",
     "shared_folder_ids"=>[],
     "group_folder_ids"=>["bNNAOAEh3Ui"],
     "disabled"=>false,
     "profile_picture_url"=>"https://quip-cdn.com/4OOk3BA2e412gU9Q6v3RDgDxA",
     "subdomain"=>"acme",
     "url"=>"https://acme.quip.com"}}
}
```

## License

Copyright (c) 2022 by Quentin Rousseau

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
