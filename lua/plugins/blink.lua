return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      min_keyword_length = function(ctx)
        return ctx.trigger.kind == "manual" and 0 or 30
      end,
    },
  },
}
