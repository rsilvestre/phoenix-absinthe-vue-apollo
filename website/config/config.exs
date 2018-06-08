# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :website,
  ecto_repos: [Website.Repo]

# Configures the endpoint
config :website, WebsiteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MV3FF9PZ21Z9aYBsQdBUREWhs72Y9t3NB7E+4pYBqJ4EKCBLA/QeDGviA9YN3a+Y",
  render_errors: [view: WebsiteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Website.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
