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
SMODS.Joker{
	key = "starflower",
    name = "Starflower",
    config = { extra = { odds = 5 } },
    pos = { x = 0, y = 0 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    atlas = "duo_joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and (G.GAME.probabilities.normal * 1) or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint) or context.forcetrigger then
            if context.other_card:is_suit("Diamonds") then
                if pseudorandom("theduo_starflower") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    SMODS.calculate_effect({func = function()local created_tarot = false
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            created_tarot = true
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local tarot_card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, nil, "theduo_starflower")
                                    tarot_card:add_to_deck()
                                    G.consumeables:emplace(tarot_card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_tarot then
                            card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, { message = "+1 Tarot", colour = G.C.PURPLE })
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}

SMODS.Joker{
	key = "bonsai_tree",
    name = "Bonsai Tree",
    config = { extra = { odds = 5 } },
    pos = { x = 1, y = 0 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    atlas = "duo_joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and (G.GAME.probabilities.normal * 1) or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint) or context.forcetrigger then
            if context.other_card:is_suit("Hearts") then
                if pseudorandom("theduo_bonsai_tree") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    SMODS.calculate_effect({func = function()local created_planet = false
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            created_planet = true
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local planet_card = create_card("Planet", G.consumeables, nil, nil, nil, nil, nil, "theduo_bonsai_tree")
                                    planet_card:add_to_deck()
                                    G.consumeables:emplace(planet_card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_planet then
                            card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, { message = "+1 Planet", colour = G.C.SECONDARY_SET.Planet })
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}

SMODS.Joker{
	key = "white_orchid",
    name = "White Orchid",
    config = { extra = { odds = 8 } },
    pos = { x = 2, y = 0 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    atlas = "duo_joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and (G.GAME.probabilities.normal * 1) or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint) or context.forcetrigger then
            if context.other_card:is_suit("Spades") then
                if pseudorandom("theduo_white_orchid") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    SMODS.calculate_effect({func = function()local created_spectral = false
                        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                            created_spectral = true
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local spectral_card = create_card("Spectral", G.consumeables, nil, nil, nil, nil, nil, "theduo_bonsai_tree")
                                    spectral_card:add_to_deck()
                                    G.consumeables:emplace(spectral_card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_spectral then
                            card_eval_status_text(context.blueprint_card or card, "extra", nil, nil, nil, { message = "+1 Spectral", colour = G.C.SECONDARY_SET.Spectral })
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}
SMODS.Joker{
	key = "topiary_tree",
    name = "Topiary Tree",
    config = { extra = { odds = 6 } },
    pos = { x = 3, y = 0 },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    atlas = "duo_joker",
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and (G.GAME.probabilities.normal * 1) or 1, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            if context.other_card:is_suit("Clubs") then
                if pseudorandom("theduo_topiary_tree") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    SMODS.calculate_effect({func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                local tag = Tag(selected_tag)
                                tag:set_ability()
                                add_tag(tag)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end
                        }))
                        return true
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, { message = "+1 Tag", colour = G.C.FILTER })
                end
            end
        end
    end
}