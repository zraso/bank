def first_deposit
  subject.deposit(1000)
  subject.add_date('10-01-2012')
  subject.confirm
end

def second_deposit
  subject.deposit(2000)
  subject.add_date('13-01-2012')
  subject.confirm
end

def withdrawal
  subject.withdraw(500)
  subject.add_date('14-01-2012')
  subject.confirm
end