var React = require('react-native');

var {

	View,
	Text,
	StyleSheet,
} = React;

class RootReact extends React.Component {

	render() {

		return (

			<View style={styles.container}>
  	  	        <Text style={styles.welcome}>
       			   RootReact
      		    </Text>
   		    </View>
		);
	}
};

var styles = StyleSheet.create({
 	
 	container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#3b5998',
 	},
  	welcome: {
    fontSize: 45,
    textAlign: 'center',
    margin: 10,
    color: '#ffffff'
    },
});

module.exports = RootReact;