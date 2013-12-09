class CardsController < ApplicationController
  def show
#  	@deck = Deck.find(params[:deck_id])
    @deck = find_deck # card is a nested resource so we need to grab the deck first.
  	@card = find_card(@deck)
  end

  def new
#   @deck = Deck.find(params[:deck_id])
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create
  	@deck = find_deck
  	@card = @deck.cards.new(params[:card])
  	@card.save
  	redirect_to @deck
  end

  def edit
  	@deck = find_deck
  	@card = find_card(@deck)
  end

  def update
  	@deck = find_deck
  	@card = @deck.cards.find(params[:id])
  	@card.update_attributes(params[:card])
  	redirect_to @deck
  end

  def destroy
  	@deck = find_deck
  	@card = find_card(@deck)
  	@card.destroy
  	redirect_to @deck
  end

  private

  def find_deck
    Deck.find(params[:deck_id])
  end

  def find_card deck
  	deck.cards.find(params[:id])
  end
     
end
