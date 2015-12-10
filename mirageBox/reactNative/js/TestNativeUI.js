var React = require('react-native');

var {

	StyleSheet,
	requireNativeComponent,
} = React;

var TestView = requireNativeComponent('TestView', TestNativeUI, null);

var TestNativeUI = React.createClass({

	render: function() {

		return <TestView style = {styles.container} />;
	},
});

var styles = StyleSheet.create({

  container: {
    flex: 1,
    width: 320,
    height: 100,
    // justifyContent: 'center',
    // alignItems: 'center',
    backgroundColor: '#3b5998',
  },
});

module.exports = TestNativeUI;