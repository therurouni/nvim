local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save file on Ctrl+S
keymap({ "i", "n", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" })

-- Select all
keymap("n", "<C-a>", "ggVG", opts)

-- Window management
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-----------------------------------------------------------------------
-- ToggleTerm Runner Helper
-----------------------------------------------------------------------
local function run_in_term(cmd)
  require("toggleterm.terminal").Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = false,
  }):toggle()
end

-----------------------------------------------------------------------
-- THE RUNNERS (Go, C++, Java, SFML)
-----------------------------------------------------------------------

-- 🐹 GO RUNNER (New)
keymap("n", "<leader>rg", function()
  local fp = vim.fn.expand("%:p")
  run_in_term("go run " .. fp)
end, { desc = "Run Go File" })

-- ❄️ C++ RUNNER
keymap("n", "<leader>rc", function()
  local fp = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r") .. ".out"
  run_in_term("g++ -std=c++17 " .. fp .. " -O2 -o " .. out .. " && " .. out)
end, { desc = "Run C++ File" })

-- ☕ JAVA RUNNER (JDK 22)
local JAVA_BIN = "/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home/bin"
keymap("n", "<leader>rj", function()
  local fp = vim.fn.expand("%:p")
  local cls = vim.fn.expand("%:t:r")
  run_in_term("cd " .. vim.fn.expand("%:p:h") .. " && " .. JAVA_BIN .. "/javac " .. fp .. " && " .. JAVA_BIN .. "/java " .. cls)
end, { desc = "Run Java File" })

-- 🎨 SFML RUNNER (For your 2D Raycaster)
keymap("n", "<leader>rs", function()
  local fp = vim.fn.expand("%:p")
  run_in_term("clang++ -std=c++17 " .. fp .. " -o sfml_app -lsfml-graphics -lsfml-window -lsfml-system && ./sfml_app")
end, { desc = "Run SFML App" })

-----------------------------------------------------------------------
-- TELESCOPE & COMPETITEST
-----------------------------------------------------------------------
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>rr", "<cmd>CompetiTest run<cr>")
