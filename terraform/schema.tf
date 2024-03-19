variable "schema_invoice" {
  default = <<EOF
[
  {"name": "Order_Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Date", "type": "STRING", "mode": "NULLABLE"}, 
  {"name": "Meal_Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company_Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Date_of_Meal", "type": "STRING", "mode": "NULLABLE"},  
  {"name": "Participants", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Meal_Price", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Type_of_Meal", "type": "STRING", "mode": "NULLABLE"}
]
EOF
}

variable "schema_orderleads" {
  default = <<EOF
[
  {"name": "Order_Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company_Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company_Name", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Date", "type": "STRING", "mode": "NULLABLE"}, 
  {"name": "Order_Value", "type": "FLOAT", "mode": "NULLABLE"},
  {"name": "Converted", "type": "INTEGER", "mode": "NULLABLE"} 
]
EOF
}

variable "schema_salesteam" {
  default = <<EOF
[
  {"name": "Sales_Rep", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Sales_Rep_Id", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company_Name", "type": "STRING", "mode": "NULLABLE"},
  {"name": "Company_Id", "type": "STRING", "mode": "NULLABLE"}
]
EOF
}
