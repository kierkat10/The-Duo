SMODS.Atlas {
	key = "joker",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholder",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "book",
	name = "Book",
	config = { extra = { odds = 3, Xmult_mod = 0.5, odds_mod = 1, Xmult = 1 } },
	rarity = 3,
	atlas =  "duo_placeholder",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 4, y = 0 },
	cost = 8,
	loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME and (G.GAME.probabilities.normal * 2) or 2, card.ability.extra.odds, card.ability.extra.Xmult_mod, card.ability.extra.odds_mod, card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				Xmult = card.ability.extra.Xmult
			}
		end
        if (context.end_of_round and not context.individual and not context.repetition) or context.forcetrigger then
            if pseudorandom("theduo_book") < (G.GAME.probabilities.normal * 2) / card.ability.extra.odds then
                card.ability.extra.odds = card.ability.extra.odds + card.ability.extra.odds_mod
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            end
		end
	end
}