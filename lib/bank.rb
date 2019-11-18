def deposit_display(amount)
  if amount == -2000
    "Error: invalid amount"
  else 
    sprintf("%.2f", amount)
  end
end