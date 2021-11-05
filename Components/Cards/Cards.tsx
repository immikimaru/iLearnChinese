import React, { useState } from 'react';
import { View } from 'react-native';
import { CardType } from '../../types/Card';

import Card from './Card';
import { TEST_CARD } from './test';

const Cards = () => {
	const [cards, setCards] = useState<CardType[]>([TEST_CARD]);
	const [currentCardIndex, setCurrentCardIndex] = useState(0);

	const currentCard = cards && cards.length > 0 ? cards[currentCardIndex] : null;

	return (
		<View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
			<Card currentCard={currentCard} />
		</View>
	);
};

export default Cards;
