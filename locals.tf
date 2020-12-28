#create a locals variable to use, used the lower function to lowercase the user_id
locals {
  aws_account = "${data.aws_caller_identity.current.account_id}-${lower(data.aws_caller_identity.current.user_id)}"
}

#create a local to use in a for_each loop
locals {
  buckets = {
    bucket1 = "team-bucket1"
    bucket2 = "team-bucket2"
    bucket3 = "team-bucket3"
  }
}

#using simple data types
locals {
  myString  = "Testing a String"
  myNumber  = 20
  myBoolean = true

  myList = [
    "test string",
    7,
    "nine"
  ]

  myMap = {
    1 = "Jones"
    2 = "Jackson"
    3 = "Hernandez"
  }

  #using complex data types
  person1 = {
    name = "John Jones"
    phone = {
      mobile = "123-456-7890",
      office = "098-765-4321"
    },
    active = true
    age    = 50
  }

  person2 = {
    name = "Jerry Jones"
    phone = {
      mobile = "123-456-2222",
      office = "098-765-3333"
    },
    active = false
    age    = 80
  }

  minimum_number_of_buckets = 5
  number_of_buckets         = var.bucket_count > 0 ? var.bucket_count : local.minimum_number_of_buckets 

}