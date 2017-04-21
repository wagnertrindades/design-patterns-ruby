require_relative '../cash_machine_services/itau'
require_relative '../cash_machine_services/bradesco'

class CashMachineServiceFactory

  def self.for(bank)

    if bank.is_a? Itau
      return ItauBankService.new
    elsif bank.is_a? Bradesco
      return BradescoBankService.new
    end

  end

end
