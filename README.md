# :closed_lock_with_key: Blazer with Devise and Google OAuth2 sign in
An example of how to use [ankane/blazer-docker](https://github.com/ankane/blazer-docker) with Devise and Google OAuth2 authentication.

## Setup
1. Create a new [OAuth 2.0 Client ID](https://console.cloud.google.com/apis/credentials):
    - Application type: Web application
    - Authorized JavaScript origins: `http://localhost` and `http://localhost:8080`
    - Authorized redirect URIs: `http://localhost:8080/users/auth/google_oauth2/callback`
1. Create a `.env` based on the `.env.example` and add your Google OAuth2 credentials.
1. Run `docker-compose up` and access at [http://localhost:8080](http://localhost:8080).

All routes are protected by Devise, so you'll need to sign in with Google to access Blazer.  Users that are already signed into their Google account will be automatically signed in to Blazer.

## Notes
To remove Google Sign-in and use server-side sign-in:

1. Add `gem "omniauth-rails_csrf_protection"` to the [`Gemfile`](./Gemfile).
1. Delete the [`config/initializers/omniauth.rb`](./config/initializers/omniauth.rb) file.
1. Add a sign-in button to [`app/views/devise/sessions/new.html.erb`](./app/views/devise/sessions/new.html.erb):

```ruby
<%= button_to "Sign in with Google", user_google_oauth2_omniauth_authorize_path, method: :post %>
```

## Credits
- [Google OAuth + Rails 5 using Devise and OmniAuth](https://medium.com/@adamlangsner/google-oauth-rails-5-using-devise-and-omniauth-1b7fa5f72c8e)
- [How to add Google Sign In (SSO) with Devise to a Ruby on Rails 7 App](https://medium.com/dev-genius/how-to-add-google-sign-in-sso-with-devise-to-a-ruby-on-rails-7-app-6d8c5ef7641b)

