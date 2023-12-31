local utils = {}

utils.runner = {
    c = function()
        return "clang -o a.exe " .. vim.fn.expand("%") .. " && ./a.exe"
    end,
    cpp = function()
        return "clang++ -std=c++11 -o a.exe " .. vim.fn.expand("%") .. " && ./a.exe"
    end,
    python = function()
        return "python " .. vim.fn.expand("%")
    end,
    tcl = function()
        return "tclsh " .. vim.fn.expand("%")
    end,
    rust = function()
        return "cargo run"
    end,
    sh = function()
        return "bash " .. vim.fn.expand("%")
    end,
}

function utils.async_run_code()
    local script_ext = nil
    local script_runner = ""
    local run_scripts = {}
    if vim.fn.has("linux") then
        script_ext = "sh"
        script_runner = "bash "
    elseif vim.fn.has("windows") then
        script_ext = "ps1"
        script_runner = ".\\"
    end
    if script_ext ~= nil then
        local function is_run_script(path)
            return string.match(path, "nvim_run_?.*%." .. script_ext)
        end
        if vim.fn.isdirectory(".nvim") ~= 0 then
            for file in vim.fs.dir(".nvim") do
                if is_run_script(file) then
                    table.insert(run_scripts, ".nvim/" .. file)
                end
            end
        end
        for file in vim.fs.dir(vim.fn.getcwd()) do
            if is_run_script(file) then
                table.insert(run_scripts, file)
            end
        end
    end
    if #run_scripts > 0 then
        if #run_scripts == 1 then
            require("toggleterm").exec(script_runner .. run_scripts[1] .. " " .. vim.fn.expand("%:t"))
        else
            vim.ui.select(run_scripts, {
                prompt = "Choose run script",
                format_item = function(item)
                    local name = string.match(item, "nvim_run_?(.*)%." .. script_ext)
                    if #name == 0 then
                        return "Default"
                    end
                    return name
                end,
            }, function(choice)
                if choice == nil then
                    vim.notify("Abort run")
                    return
                end
                require("toggleterm").exec(script_runner .. choice .. " " .. vim.fn.expand("%:p"))
            end)
        end
    elseif utils.runner[vim.bo.filetype] ~= nil then
        require("toggleterm").exec(utils.runner[vim.bo.filetype]())
    else
        vim.notify("No nvim_run script and no default runner", vim.log.levels.ERROR)
    end
end

function utils.call_graph(func_name, caller_level, callee_level)
    io.popen(string.format("cd ~/repos/script/utils/;python cgraph.py %s %d %d", func_name, caller_level, callee_level))
end

vim.api.nvim_create_user_command("CallGraph", function()
    pcall(function()
        utils.call_graph(vim.fn.expand("<cword>"), 3, 3)
    end)
end, {})

return utils
