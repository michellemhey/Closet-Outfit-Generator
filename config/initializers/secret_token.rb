# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

 if Rails.env.development? || Rails.env.test?
   RubyClosetIi::Application.config.secret_token = '304b994761fe66d962e74c17b69e1139371903fd81b3f09ed728289b90f92c24279d7839339bb05d572c0e25db3fc9f4b208faa5aa52453ba41598637994c550'
 else
   RubyClosetIi::Application.config.secret_token = ENV['SECRET_TOKEN']
 end

