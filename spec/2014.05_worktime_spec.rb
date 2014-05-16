require 'ostruct'
require 'date'
require 'yaml'
require 'pp'

class Rt

  attr_accessor :number, :name, :augeo, :time_limit, :elapsed

  # TODO - add notes, like in PT

  def initialize(number, name, augeo, time_limit = 0, elapsed = 0)
    @number = number
    @name = name
    @augeo = augeo
    @time_limit = time_limit
    @elapsed = elapsed
  end

  def inspect
    instance_variables.inject([
                                  "\n#TestClass",
                                  "\tObject_i = #{object_id}",
                                  "\tInstance variables:"
                              ]) do |result, item|
      result << "\t\t#{item} = #{instance_variable_get(item)}"
      result
    end.join("\n")
  end
end

def to_working_days(hours = 0.0, minutes = 0.0)
  hours/8.0 + minutes/480.0
end

def to_date(month, day)
  Date.new(2014, month, day)
end


log = Hash.new { |h, k| h[k] = Hash.new { |ih, ik| ih[ik] = 0 } }


accounts = {}
accounts[:a_7922_hf_3] = '7922: HF Support (3rd lvl)'
accounts[:a_7922_baur] = '7922:STAR Support durch HF (3rd lvl)'
accounts[:a_7871_jenkins] = '7871: QF Jenkins'
accounts[:a_7871_qf_mandanten] = '7871: QF Mandantenuebergerifende Anforderungen HF'
accounts[:a_7905_3039] = '7905- RT3039 (5 PT)'


map_jobba = Rt.new 2911, 'map_jobba extension', :a_7922_hf_3
meetings = Rt.new 0000, 'Meetins, Buchungen, Kleinigkeiten', :a_7871_qf_mandanten
wfd_outlet_mails = Rt.new 3097, ' fehlerhafte Fehlermails für Wolford-Outlet-Bestände', :a_7922_hf_3
dp_invoice_test = Rt.new 3144, 'DP1_CheckInvoiceCreation.test_1AK_wrap_of_CHT_GB_with_plugs', :a_7871_jenkins
soap_tester_semaphore = Rt.new 3152, 'Transtor: Paraleller Prozess amos_shared_soap_tester_batch', :a_7922_hf_3
map_jobba_log = Rt.new 3159, 'map_jobba ueberschwemmt amos.log', :a_7922_hf_3
rom_load_bin_info = Rt.new 3163, 'amos_order_rom_load_bin_info', :a_7922_hf_3
map_jobba_baur = Rt.new 3175, 'map_jobba beendet sich nicht, wenn LV läuft (COMMON11)', :a_7922_hf_3
yapital = Rt.new 3039, 'map_jobba beendet sich nicht, wenn LV läuft (COMMON11)', :a_7905_3039
order_import_logs = Rt.new 3085, 'starlight Errorlog ohne Fehler, obwohl in amos.err mit Fehlercode "E" gemeldet
wird', :a_7922_baur
jenkins = Rt.new 0000, 'all the jenkins tests', :a_7871_jenkins

puts "your rt as yaml : #{map_jobba.to_yaml}"
#puts "your rt as json : #{map_jobba.to_json}"
puts "your rt with p: "
p map_jobba
puts "your rt with pp: "
pp map_jobba


puts '--------------------------------------------------'

# --- kw 19
log[to_date(5, 5)][soap_tester_semaphore] = to_working_days(8, 25)


log[to_date(5, 6)][map_jobba] = to_working_days(1, 05)
log[to_date(5, 6)][soap_tester_semaphore] = to_working_days(2, 0)
log[to_date(5, 6)][dp_invoice_test] = to_working_days(4, 15)

log[to_date(5, 7)][map_jobba] = to_working_days(1, 35)
log[to_date(5, 7)][wfd_outlet_mails] = to_working_days(1, 30)
log[to_date(5, 7)][dp_invoice_test] = to_working_days(4, 20)

log[to_date(5, 8)][map_jobba] = to_working_days(1, 0)
log[to_date(5, 8)][dp_invoice_test] = to_working_days(1, 0)
log[to_date(5, 8)][map_jobba_log] = to_working_days(2, 0)
log[to_date(5, 8)][meetings] = to_working_days(1, 30)
log[to_date(5, 8)][wfd_outlet_mails] = to_working_days(0, 30)


log[to_date(5, 9)][rom_load_bin_info] = to_working_days(4, 5)
log[to_date(5, 9)][soap_tester_semaphore] = to_working_days(1, 25)

# --- kw 20
log[to_date(5, 12)][map_jobba_baur] = to_working_days(0, 45) # analyse - behebt sich von selbst
log[to_date(5, 12)][order_import_logs] = to_working_days(1, 0)
log[to_date(5, 12)][wfd_outlet_mails] = to_working_days(3, 0)

#multiple small tasks, not only soap_tester
log[to_date(5, 12)][soap_tester_semaphore] = to_working_days(3, 55) # merging & rolling out 3152, 3163, 2911 -> common_03

log[to_date(5, 13)][jenkins] = to_working_days(2, 55)
log[to_date(5, 13)][order_import_logs] = to_working_days(0, 45)
log[to_date(5, 13)][wfd_outlet_mails] = to_working_days(3, 35)

log[to_date(5, 14)][map_jobba] = to_working_days(3, 5)
log[to_date(5, 14)][jenkins] = to_working_days(5, 30)

log[to_date(5, 15)][jenkins] = to_working_days(1, 20)
log[to_date(5, 15)][meetings] = to_working_days(1, 45) # mandantenrouting, Buchung
log[to_date(5, 15)][yapital] = to_working_days(5, 30)

log[to_date(5, 16)][meetings] = to_working_days(1,00) # umzug
log[to_date(5, 16)][yapital] = to_working_days(8, 15)

#print all
log.keys.sort.each { |day|
  puts "-------------------"
  puts "#{day}, #{day.strftime('%A')}"

  log[day].each { |project, worked|
    puts "#{accounts[project.augeo]}, #{project.number}: #{worked}"
  }

  grouped = log[day].inject(Hash.new(0)) { |res, entry|
    res[entry[0].augeo] += entry[1]
    res
  }

  puts "total:"
  grouped.each { |augeo, worked| puts "#{accounts[augeo]}: #{worked}" }
}





