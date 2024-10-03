/* Copyright 2024 rirusha
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-only
 */

[GtkTemplate (ui = "/space/rirusha/PresApp/ui/main-window.ui")]
public sealed class PresApp.MainWindow: Adw.ApplicationWindow {

    [GtkChild]
    private Gtk.Label label;
    [GtkChild]
    private Gtk.Button next_button;
    [GtkChild]
    private Gtk.Button previous_button;

    uint slide_num = 0;
    string[] slides = {
        "Что такое GIR?",
        "Что такое Vala?",
        "Да-да, это пришлось бы писать руками…",
        "Особенности Vala",
        "Совместимость Vala с C, VAPI",
        "Что я могу написать на Vala?",
        "Проекты на Vala",
        "И даже эта презентация частично на Vala"
    };

    const ActionEntry[] ACTION_ENTRIES = {
        { "about", on_about_action },
    };

    public MainWindow (PresApp.Application app) {
        Object (application: app);
    }

    construct {
        add_action_entries (ACTION_ENTRIES, this);

        label.set_markup ("<span font=\"36\"><b>Какой язык может выбрать разработчик?</b></span>");

        next_button.clicked.connect (on_next_button_clicked);
        previous_button.clicked.connect (on_previous_button_clicked);
    }

    void on_previous_button_clicked () {
        slide_num--;

        if (slide_num < 0) {
            slide_num = slides.length - 1;
        };

        previous_button.visible = slide_num > 0;

        label.set_markup ("<span font=\"36\"><b>%s</b></span>".printf (slides[slide_num]));
    }

    void on_next_button_clicked () {
        slide_num++;

        if (slide_num >= slides.length) {
            slide_num = 0;
        };

        previous_button.visible = slide_num > 0;

        label.set_markup ("<span font=\"36\"><b>%s</b></span>".printf (slides[slide_num]));
    }

    void on_about_action () {
        var about = new Adw.AboutDialog () {
            application_name = "Pres App",
            application_icon = Config.APP_ID,
            developer_name = "rirusha",
            version = Config.VERSION,
            // Translators: NAME <EMAIL.COM> /n NAME <EMAIL.COM>
            translator_credits = _("translator-credits"),
            license_type = Gtk.License.GPL_3_0,
            copyright = "© 2024 rirusha",
            release_notes_version = Config.VERSION
        };

        about.present (this);
    }
}
