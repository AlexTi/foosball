# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Foosball::Application.config.secret_key_base = ENV['secret_key_base'] || '9c94d1594ec4a3fc628bb9db51d16caf9aa2407152b145acc28020be8c2d7cb997e61144b3abcffd50d0f1bc9913a3cb9150901cd48dffd90f27c8a384cda35a'
