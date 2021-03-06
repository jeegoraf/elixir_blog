import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :elixir_blog, ElixirBlog.Repo,
  username: "egor",
  password: "egorafonin271299",
  hostname: "localhost",
  database: "elixir_blog_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_blog, ElixirBlogWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Jb36CmMZHljpK43zJkqVnIfCAV9N32Y5RNzGyWI1xxOvMD0ktQxcQM1x1g2CyVRF",
  server: false

# In test we don't send emails.
config :elixir_blog, ElixirBlog.Mailer, adapter: Swoosh.Adapters.Test

config :elixir_blog, ElixirBlog.Accounts.Guardian, 
  secret_key: "N2QVQc/Kinq+7Fp0XSgNYBD2klumW9xGJ2HOjdlg30yzxCBUci13q8K43yRYRiS9"

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
