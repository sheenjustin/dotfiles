
require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"c"
		, "lua"
		, "vim"
		, "vimdoc"
		, "query"
		, "bash"
		, "css"
		, "dockerfile"
		, "html"
		, "markdown"
		, "markdown_inline"
		, "javascript"
		, "json"
		, "python"
		, "sql"
		, "xml"
		, "yaml"
	}
	, highlight = {
		enable = true
		,disable = {"dockerfile"} -- there's an issue with dockerfile highlighting, will remove when fixed
	}
}
