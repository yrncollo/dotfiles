function ColorMe(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0,"Normal", {bg = "none"}) -- Setting background 
	vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
end
ColorMe()

