# frozen_string_literal: true

def first_deposit
  subject.add_date('10-01-2012')
  subject.deposit(1000)
end

def second_deposit
  subject.add_date('13-01-2012')
  subject.deposit(2000)
end

def withdrawal
  subject.add_date('14-01-2012')
  subject.withdraw(500)
end
