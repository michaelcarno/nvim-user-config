return {{
 'windwp/nvim-autopairs',
 enabled=true,
    event = "InsertEnter",
    -- opts = function ()
    --   local map_cr = true
    --   local map_bs = true  -- map the <BS> key
    --   local map_c_h = true  -- Map the <C-h> key to delete a pair
    --   local map_c_w = true -- map <c-w> to delete a pair if possible
    --   
    -- end,
  config = function()
-- put this to setup function and press <a-e> to use fast_wrap
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
    -- check_ts = true,
    -- ts_config = {
    --     lua = {'string'},-- it will not add a pair on that treesitter node
    --     javascript = {'template_string'},
    --     java = false,-- don't check treesitter on java
    --  }
    -- change default fast_wrap
    map_c_w = true,
    check_ts = false,
    map_c_h = true,
           fast_wrap = {
               map = '<M-e>',
               chars = { '{', '[', '(', '"', "'" },
               pattern = [=[[%'%"%>%]%)%}%,]]=],
               end_key = '\'',
               -- check_ts= true,
               before_key = 'h',
               after_key = 'l',
               cursor_pos_before = true,
               keys = 'qwertyuiopzxcvbnmasdfghjkl',
               manual_position = false,
               highlight = 'Search',
               highlight_grey='Comment'
             },
})

local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'})),

  -- Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
  --       :use_regex(true),
        -- :set_end_pair_length(2),
})

local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
npairs.add_rules {
  -- Rule for a pair with left-side ' ' and right side ' '
  Rule(' ', ' ')
    -- Pair will only occur if the conditional function returns true
    :with_pair(function(opts)
      -- We are checking if we are inserting a space in (), [], or {}
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({
        brackets[1][1] .. brackets[1][2],
        brackets[2][1] .. brackets[2][2],
        brackets[3][1] .. brackets[3][2]
      }, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    -- We only want to delete the pair of spaces when the cursor is as such: ( | )
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({
        brackets[1][1] .. '  ' .. brackets[1][2],
        brackets[2][1] .. '  ' .. brackets[2][2],
        brackets[3][1] .. '  ' .. brackets[3][2]
      }, context)
    end)
}
-- For each pair of brackets we will add another rule
for _, bracket in pairs(brackets) do
  npairs.add_rules {
    -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
    Rule(bracket[1] .. ' ', ' ' .. bracket[2])
      :with_pair(cond.none())
      :with_move(function(opts) return opts.char == bracket[2] end)
      :with_del(cond.none())
      :use_key(bracket[2])
      -- Removes the trailing whitespace that can occur without this
      :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
  }
end
  end
},

  {
    "jiangmiao/auto-pairs",
    enabled=false,
    event="VeryLazy",
    config = function()

    end

  },


  {
    "windwp/nvim-ts-autotag",
    enabled=true,
    event="VeryLazy",
    config = function()
      require'nvim-treesitter.configs'.setup {
        autotag = {
        enable = true,
      }
    }
    end

  }

}
