# Since configuration is shared in umbrella projects, this file
# should only configure the :makerion_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :makerion, printer_driver: Moddity.FakeDriver

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :makerion_web, MakerionWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "./assets/node_modules/parcel-bundler/bin/cli.js",
      "watch",
      "./assets/js/app.js",
      "--out-dir",
      "priv/static/js"
    ]
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :makerion_web, MakerionWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/makerion_web/views/.*(ex)$},
      ~r{lib/makerion_web/templates/.*(eex)$}
    ]
  ]
