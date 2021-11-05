/**
 * ILearn Chinese
 * by Pierre CANGEMI
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import { SafeAreaView, ScrollView, StatusBar, StyleSheet, Text, useColorScheme, View } from 'react-native';
import Cards from './Components/Cards/Cards';

const App = () => {
	const isDarkMode = useColorScheme() === 'dark';

	return (
		<SafeAreaView style={{ flex: 1, backgroundColor: isDarkMode ? '#0c2461' : '#6a89cc' }}>
			<StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
			<View
				style={{
					flex: 1,
					backgroundColor: isDarkMode ? '#0c2461' : '#6a89cc'
				}}
			>
				<Cards />
			</View>
		</SafeAreaView>
	);
};

const styles = StyleSheet.create({});

export default App;
