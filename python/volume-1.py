import random

class Card:
    """Represent a standard playing card"""
    
    def __init__(self, suit=0, rank=2):
        self.suit = suit
        self.rank = rank

    suit_names = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
    rank_names = [None, 'Ace', '2', '3', '4', '5', '6', '7', 
                  '8', '9', '10', 'Jack', 'Queen', 'King']
    
    def __str__(self) -> str:
        return '%s of %s' % (Card.rank_names[self.rank], 
                             Card.suit_names[self.suit])
    
    def __ht__(self, other):
        if self.suit > other.suit: return True
        if self.suit < other.suit: return False
        return self.rank > other.rank
    
    def __lt__(self, other):
        if self.suit < other.suit: return True
        if self.suit > other.suit: return False
        return self.rank < other.rank

# card1 = Card(2, 12)
# card2 = Card(1, 13)
# print(card1.__ht___(card2))

class Deck:
    """Represent a deck contains cards"""

    def __init__(self):
        self.cards = []
        for suit in range(4):
            for rank in range(1, 14):
                self.cards.append(Card(suit, rank))
                

    def __str__(self):
        print(len(self.cards))
        res = list(map(lambda x: str(x), self.cards))
        return '\n'.join(res)
    
    def pop_card(self, index):
        return self.cards.pop(index)
    
    def add_card(self, index):
        return self.cards.append(index)
    
    def shuffle(self):
        return random.shuffle(self.cards)
    
    def sort(self, reversed=False):
        for x in range(len(self.cards)):
            for y in range(x + 1, len(self.cards)):
                # ^ XOR
                if (self.cards[x] > self.cards[y]) ^ reversed:
                    # do_swap
                    self.cards[x], self.cards[y] = self.cards[y], self.cards[x]

deck = Deck()
# deck.shuffle()
# deck.sort(reversed=True)
for card in deck.cards:
    print(f'• {card}')