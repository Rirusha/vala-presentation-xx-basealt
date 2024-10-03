vapi_sources = files(
  'config.vapi',
)

pres_app_sources = [
  vapi_sources,
  blueprints,
  resources
] + files(
  'main.vala',
  'application.vala',
  'main-window.vala',
)

pres_app_vala_args = [
  '--target-glib', '2.76',
  '--vapidir', meson.current_source_dir(),
  '--gresources', resource_files,
  '--gresourcesdir=data/'
]

pres_app_c_args = [
  '-include', 'config.h',
]

executable(
  'pres-app',
  pres_app_sources,
  include_directories: config_h_dir,
  vala_args: pres_app_vala_args,
  c_args: pres_app_c_args,
  dependencies: pres_app_dependencies,
  install: true,
)