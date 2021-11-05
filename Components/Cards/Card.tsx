import React, { useRef } from 'react';
import { TouchableOpacity, View, Text } from 'react-native';
import CardFlip from 'react-native-card-flip';

const Card = ({ currentCard }) => {
	const cardRef = useRef(null);

	return (
		<CardFlip style={{ width: '80%', height: '50%', borderRadius: 25 }} ref={cardRef}>
			<TouchableOpacity
				activeOpacity={0.6}
				style={{
					backgroundColor: '#fff',
					flex: 1,
					borderRadius: 25,
					justifyContent: 'center',
					alignItems: 'center'
				}}
				onPress={() => cardRef.current.flip()}
			>
				<Text style={{ fontWeight: 'bold', fontSize: 100 }}>{currentCard.front.symbol}</Text>
			</TouchableOpacity>
			<TouchableOpacity
				activeOpacity={0.6}
				style={{
					backgroundColor: '#fff',
					flex: 1,
					borderRadius: 25,
					justifyContent: 'center',
					alignItems: 'center'
				}}
				onPress={() => cardRef.current.flip()}
			>
				<Text style={{ fontWeight: 'bold', fontSize: 50 }}>{currentCard.back.pinyin}</Text>
			</TouchableOpacity>
		</CardFlip>
	);
};

export default Card;
