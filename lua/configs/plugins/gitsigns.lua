local present, gitsigns = pcall(require, "gitsigns")

if not present then
    print "no gitsigns"
    return
end

gitsigns.setup()
