LAZY_PLUGIN_SPEC = {}

function load_plugin(plugin)
  table.insert(LAZY_PLUGIN_SPEC, { import = plugin })
end
