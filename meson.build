project(
  'pres-app',
  ['c', 'vala'],
  version: '0.1.0',
  meson_version: '>= 0.62.0',
  license: 'GPL-3.0-or-later',
)

i18n = import('i18n')
gnome = import('gnome')

gtk = dependency('gtk4', version: '>= 4.14')
libadwaita = dependency('libadwaita-1', version: '>= 1.5')

app_id = 'space.rirusha.PresApp'

conf = configuration_data()
conf.set_quoted('APP_ID', app_id)
conf.set_quoted('G_LOG_DOMAIN', app_id)
conf.set_quoted('PACKAGE_NAME', meson.project_name())
conf.set_quoted('PACKAGE_VERSION', meson.project_version())
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf.set_quoted('DATADIR', join_paths(get_option('prefix'), get_option('datadir')))
conf.set_quoted('GNOMELOCALEDIR', join_paths(get_option('prefix'), get_option('localedir')))

subdir('data')

pres_app_dependencies = [
  gtk,
  libadwaita
]

configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

subdir('src')

gnome.post_install(
  gtk_update_icon_cache: true,
  update_desktop_database: true,
)
