/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var RootReact = require('./RootReact');

var {
  AppRegistry,
  StyleSheet,
  Text,
  NavigatorIOS, 
  View,
} = React;

var testReactNative = React.createClass({
  render: function() {
    // debugger;
    return (

      <NavigatorIOS
        style = {styles.navigator}
        initialRoute = {{
          title: 'react ~',
          component: RootReact,
        }}/>
      // <View style={styles.container}>
      //   <Text style={styles.welcome}>
      //     又回来了
      //   </Text>
      // </View>
    );
  }
});

var styles = StyleSheet.create({

  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  navigator: {

    flex: 1,
    backgroundColor: '#099fde'
  },
});

AppRegistry.registerComponent('testReactNative', () => testReactNative);
