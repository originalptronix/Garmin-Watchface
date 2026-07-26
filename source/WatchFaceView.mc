using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Lang as Lang;

class WatchFaceView extends Ui.WatchFace {

    function initialize() {
        Ui.WatchFace.initialize();
    }

    // Layout setzen – referenziert unser resources/layouts/layout.xml
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Wird regelmäßig aufgerufen, um das Display zu aktualisieren
    function onUpdate(dc) {
        // Bildschirm löschen
        dc.clear();

        var width  = dc.getWidth();
        var height = dc.getHeight();

        var clockTime = Sys.getClockTime();
        var now       = Time.now();
        var dateInfo  = Calendar.info(now, Time.FORMAT_SHORT);

        // Zeit als HH:MM
        var timeStr = Lang.format("$1$:$2$", [
            clockTime.hour,
            clockTime.min.format("%02d")
        ]);

        // Datum, z.B. "Mon 29"
        var dateStr = Lang.format("$1$ $2$", [
            dateInfo.day_of_week,
            dateInfo.day
        ]);

        // Hintergrund schwarz
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.fillRectangle(0, 0, width, height);

        // Zeit in der Mitte
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.drawText(
            width / 2,
            height / 2 - 10,
            Gfx.FONT_LARGE,
            timeStr,
            Gfx.TEXT_JUSTIFY_CENTER
        );

        // Datum etwas darunter
        dc.setColor(Gfx.COLOR_GRAY, Gfx.COLOR_BLACK);
        dc.drawText(
            width / 2,
            height / 2 + 20,
            Gfx.FONT_SMALL,
            dateStr,
            Gfx.TEXT_JUSTIFY_CENTER
        );
    }

    // Optional: für Sekundentakt o.ä. – hier einfach auf onUpdate delegieren
    function onPartialUpdate(dc) {
        onUpdate(dc);
    }
}
