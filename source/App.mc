using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class App extends App.AppBase {

    function initialize() {
        App.AppBase.initialize();
    }

    // Liefert den initialen View (unsere WatchFaceView)
    function getInitialView() {
        return [ new WatchFaceView() ];
    }
}
