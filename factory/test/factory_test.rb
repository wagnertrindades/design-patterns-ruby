require_relative 'test_helper'
require_relative '../lib/cash_machine_service'
require_relative '../lib/itau'
require_relative '../lib/bradesco'
require_relative '../lib/exceptions/forbidden_access'

describe CashMachineServiceFactory do
  let(:itau) { Itau.new "Saque" }
  let(:bradesco) { Bradesco.new "Saque" }

  it "allow withdraw cash with itau" do
    service = CashMachineServiceFactory.for itau
    service.withdraw_cash(itau, 500).must_equal "R$ 500.0 withdrawn with success!"
  end

  it "allow withdraw cash with bradesco" do
    service = CashMachineServiceFactory.for bradesco
    -> { service.withdraw_cash bradesco, 500 }.must_raise ForbiddenAccessError
  end
end
