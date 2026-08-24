local autosave_group = vim.api.nvim_create_augroup("Autosave", { clear = true })

local function should_save(buf)
  return vim.bo[buf].modified
    and vim.bo[buf].modifiable
    and not vim.bo[buf].readonly
    and vim.bo[buf].buftype == ""
    and vim.api.nvim_buf_get_name(buf) ~= ""
end

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
  group = autosave_group,
  callback = function(event)
    if should_save(event.buf) then
      vim.api.nvim_buf_call(event.buf, function()
        vim.cmd("silent write")
      end)
    end
  end,
  desc = "Save modified file buffers when editing context changes",
})
