use Mix.Config

import_config "#{Mix.env()}.exs"

# -------------------
#
# # ./config/dev.exs
#
# use Mix.Config
#
# config :importer, port: 4001
#
# -------------------
#
# # ./config/test.exs
#
# use Mix.Config
#
# config :importer, port: 4002
#
# -------------------
#
# # ./config/prod.exs
#
# use Mix.Config
#
# config :importer, port: 80
