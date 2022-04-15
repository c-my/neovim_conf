local present, escape = pcall(require, 'better_escape')
if not present then
    print "no escape"
    return
end

escape.setup({
    mapping = { 'jk' },
})
