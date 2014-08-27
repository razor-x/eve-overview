require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'yaml'

build = '_overviews'

task default: :build
task build: [:reset_build_directory, :compile_overviews]

task :reset_build_directory do
  FileUtils.remove_entry_secure build if Dir.exist? build
  FileUtils.mkdir_p build
end

task :compile_overviews do
  Dir['overviews/*.yml'].each do |overview|
    name = File.basename(overview, File.extname(overview))
    compile_overview(
      name, File.join(build, "#{name}.yaml"),
      ActiveSupport::HashWithIndifferentAccess.new(YAML.load_file(overview))
    )
  end
end

def compile_overview(name, path, overview)
  overview_hash = {}
  overview.each do |k, v|
    opts = YAML.load_file(File.join(k.pluralize, "#{v}.yml"))
    if k.to_sym == :tabs
      overview_hash.merge! format_tabs(opts)
    else
      overview_hash.merge! opts
    end
  end

  presets = []
  Dir['presets/*.yml'].each do |preset|
    presets << format_preset(load_preset(preset))
  end
  overview_hash.merge! 'presets' => presets

  File.open(path, 'w') { |f| f.write overview_hash.to_yaml }
end

def format_tabs(tabs)
  tab_array = []
  tabs.each_with_index do |v, i|
    v = ActiveSupport::HashWithIndifferentAccess.new v
    tab = [i, [
      ['name', format_tab_name(v)],
      ['overview', format_preset_name(load_preset_by_name(v[:overview]))],
      ['bracket', format_preset_name(load_preset_by_name(v[:bracket]))]
    ]]
    tab_array << tab
  end

  {'tabSetup' => tab_array}
end

def load_preset_by_name(preset)
  ActiveSupport::HashWithIndifferentAccess.new(
    YAML.load_file File.join('presets', "#{preset}.yml")
  )
end

def load_preset(preset)
  ActiveSupport::HashWithIndifferentAccess.new(
    YAML.load_file preset
  )
end

def format_preset(preset)
  [ format_preset_name(preset), [
    ['filteredStates', merge_arrays_from('states', preset[:states])],
    ['groups', merge_arrays_from('groups', preset[:groups])]
  ]]
end

def format_preset_name(preset)
  "#{preset[:symbol]} " + '-' * preset[:level] + " #{preset[:name]}"
end

def format_tab_name(tab)
  "<color=0x#{tab[:color]}>   #{tab[:name]}   </color>"
end

def merge_arrays_from(type, names)
  array = []
  names.each do |name|
    array << YAML.load_file(File.join(type, "#{name}.yml"))
  end
  array.flatten.uniq
end
