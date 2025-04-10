return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- ollama = {
      --   model = "codestral:22b",
      -- },
      ollama = {
        endpoint = "192.168.178.69:11434",
        model = "deepseek-r1:14b",
      },
      -- ollama_obelisk = {
      --   endpoint = "192.168.178.69:11434",
      --   model = "deepseek-r1:14b",
      -- },
      -- ollama_plinth = {
      --   endpoint = "localhost:11434",
      --   model = "deepseek-r1:14b",
      -- },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-latest",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
        -- disable_tools = true, -- disable tools!
      },
      file_selector = {
        --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
        provider = "fzf",
        -- Options override for custom providers
        provider_opts = {},
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
      -- ... Other dependencies
    },
    opts = {
      sources = {
        -- Add 'avante' to the list
        default = { "avante" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
        },
      },
    },
  },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   dependencies = {
  --     { "Saghen/blink.cmp" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  --   config = function()
  --     require("minuet").setup({
  --       -- lsp = {
  --       --   enabled_ft = { "lua", "javascript", "toml", "typescript", "vue" },
  --       --   -- Enables automatic completion triggering using `vim.lsp.completion.enable`
  --       --   enabled_auto_trigger_ft = { "lua", "javascript", "toml", "typescript", "vue" },
  --       -- },
  --       -- virtualtext = {
  --       --   auto_trigger_ft = { "lua", "python", "typescript", "vue" },
  --       --   keymap = {
  --       --     -- accept whole completion
  --       --     accept = "<A-A>",
  --       --     -- accept one line
  --       --     accept_line = "<A-a>",
  --       --     -- accept n lines (prompts for number)
  --       --     -- e.g. "A-z 2 CR" will accept 2 lines
  --       --     accept_n_lines = "<A-z>",
  --       --     -- Cycle to prev completion item, or manually invoke completion
  --       --     prev = "<A-[>",
  --       --     -- Cycle to next completion item, or manually invoke completion
  --       --     next = "<A-]>",
  --       --     dismiss = "<A-e>",
  --       --   },
  --       -- },
  --       blink = {
  --         enable_auto_complete = true,
  --       },
  --       -- provider = "openai_fim_compatible",
  --       -- n_completions = 1,
  --       -- context_window = 512,
  --       -- provider_options = {
  --       --   openai_fim_compatible = {
  --       --     api_key = "TERM",
  --       --     name = "Ollama",
  --       --     end_point = "http://localhost:11434/v1/completions",
  --       --     model = "deepseek-coder-v2:16b",
  --       --     optional = {
  --       --       max_tokens = 56,
  --       --       top_p = 0.9,
  --       --     },
  --       --   },
  --       -- },
  --       provider = "openai_fim_compatible",
  --       n_completions = 1, -- recommend for local model for resource saving
  --       -- I recommend beginning with a small context window size and incrementally
  --       -- expanding it, depending on your local computing power. A context window
  --       -- of 512, serves as an good starting point to estimate your computing
  --       -- power. Once you have a reliable estimate of your local computing power,
  --       -- you should adjust the context window to a larger value.
  --       context_window = 512,
  --       provider_options = {
  --         openai_fim_compatible = {
  --           api_key = "TERM",
  --           name = "Ollama",
  --           end_point = "http://localhost:11434/v1/completions",
  --           model = "qwen2.5-coder:7b",
  --           optional = {
  --             max_tokens = 56,
  --             top_p = 0.9,
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
