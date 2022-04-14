local present, notify = pcall(requird, 'notify')

if not present then
    print 'no notify'
    return
end

vim.notify = notify
notify.setup()
