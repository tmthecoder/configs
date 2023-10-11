local previewers = require('telescope.previewers')
previewers.new_termopen_previewer {
    get_command = function(selection)
        return { 'glow', selection.value }
    end
}
