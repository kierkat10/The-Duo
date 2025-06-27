local files = {
	"items/joker",
    "lib/pluralization"
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end