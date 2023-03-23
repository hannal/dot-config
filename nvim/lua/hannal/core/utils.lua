function is_vscode()
  return vim.g.vscode
end

local fold_preview_status, fold_preview = pcall(require, "fold-preview")

function contextual_K()
  if not fold_preview_status or not fold_preview.show_preview() then
    vim.cmd([[Lspsaga hover_doc]])
  end
end
