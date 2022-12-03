if vim.g.nvim_jdtls then

  local jdtls = require "jdtls"
  -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
  local config = {
    cmd = { 'jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
      }
    },
  }


  config.on_attach = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto' })
    jdtls.add_commands()
  end

  jdtls.start_or_attach(config)

  vim.cmd [[
  command! -buffer JdtCompile lua require('jdtls').compile()
  command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
  command! -buffer JdtJol lua require('jdtls').jol()
  command! -buffer JdtBytecode lua require('jdtls').javap()
  command! -buffer JdtJshell lua require('jdtls').jshell()
  command! -buffer JdtSetupDapMainClassConfig lua require('jdtls.dap').setup_dap_main_class_configs()
]]

end
