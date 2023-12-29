// use CollegeDataBase
// switch to CollegeDataBase
db.College_Info.drop()
db.Student.drop()
db.Student_Account.drop()
db.Teacher.drop()
db.Teacher_Account.drop()
db.Staff.drop()
db.Staff_Account.drop()
db.Sport_Items.drop()
db.Books_Items.drop()
db.Sport_Items__Issued_and_Return_Item.drop();


db.College_Info.insertOne(
    {
    college_Name :'Sagarmatha College of Science and Technology',
    post_code : 5256,
    address : 'Sanepa',
    contact : [
        {
            contact1:15156498
        },
        {
            contact2:151515412
        }
    ]
});

db.createCollection("Student");
db.createCollection("Student_Account")

// Insert into Student collection in MongoDB
db.Student.insertMany([
    {
      student_name: 'Ram Poudel',
      student_department: 'IT',
      student_current_semester: '3rd',
      student_address: 'Kathmandu',
      student_contact_number: [
        {
            contact:9845697859
        },
        {
            contact:9846456456
        }
      ]
    },
    {
      student_name: 'Prem kc',
      student_department: 'Engineering',
      student_current_semester: '2nd',
      student_address: 'Bhatapur',
      student_contact_number: [
        {
            contact:984569459723
        },
        {
            contact:9845694597141

        }
      ]
    },
    {
      student_name: 'Pratiba Magar',
      student_department: 'IT',
      student_current_semester: '3rd',
      student_address: 'Biratnagar',
      student_contact_number: [
        {
            contact:9845697547
        },
        {
            contact:9845697547
        }
      ]
    }
  ]);
  
db.createCollection("Teacher");
db.createCollection("Teacher_Account");


// Insert into Teacher collection in MongoDB
db.Teacher.insertMany([
    {
      teacher_name: 'Bikas Dhakal',
      teacher_address: 'Kathmandu',
      contact_number: [
        {
            contact1:9845678945
        },
        {
            contact2:9845678945

        }
      ],
      join_date: ISODate('2022-01-15T14:30:00.000Z')
    },
    {
      teacher_name: 'Mina Kumari',
      teacher_address: 'Patan',
      contact_number: 9845678874[
        {
            contact1:9845678874
        },
        {
            contact2:98456785615

        }
      ],
      join_date: ISODate('2022-02-15T02:30:00.000Z')
    },
    {
      teacher_name: 'Ram K.c',
      teacher_address: 'Baglung',
      contact_number: 9845678569[
        {
            contact1:9845678569
        },
        {
            contact2:9845678566

        }
      ],
      join_date: ISODate('2022-03-30T01:25:00.000Z')
    },
    {
      teacher_name: 'Sita Pradhan',
      teacher_address: 'Kathmandu',
      contact_number: 9845678666[
        {
            contact1:9845678666
        },
        {
            contact2:98456151545

        }
      ],
      join_date: ISODate('2022-03-31T01:03:00.000Z')
    }
  ]);
  
db.createCollection("Staff");
db.createCollection("Staff_Account");

// Insert into Staff collection in MongoDB
db.Staff.insertMany([
    { staff_name: 'Shuba Tamang', 
    staff_role: 'Cleaning',
     staff_address: 'Kathmandu', 
     contact_number: [
        {
            contact1:98465987623
        },
        {
            contact2:98456151454

        }
      ],
     join_date: new Date('2022-01-15T14:30:00')
     },

    { staff_name: 'Sita Poudel',
      staff_role: 'Cooking',
      staff_address: 'Sagarmatha',
      contact_number:[
        {
            contact1:98465987625
        },
        {
            contact2:9845615444

        }
      ], 
      join_date: new Date('2022-01-16T10:30:00') 
    },
    { staff_name: 'Binita Kc', 
      staff_role: 'Helper',
      staff_address: 'Hetauda',
      contact_number:[
        {
            contact1:98465987627
        },
        {
            contact2:9845611215

        }
      ],
      join_date: new Date('2022-05-15T11:30:00') 
    },
    { staff_name: 'Rita Magar', 
    staff_role: 'Cleaning', 
    staff_address: 'Pokhara', 
    contact_number: [
        {
            contact1:98465987648
        },
        {
            contact2:98456155545

        }
      ],
    join_date: new Date('2022-06-15T12:30:00')
    }
  ]);
  



db.createCollection("Sport_Items");
db.createCollection("Books_Items");




db.Sport_Items.insertMany([
    { Item_Name: 'Football',
     Quantity: 5 
    },
    { Item_Name: 'Basketball',
     Quantity: 5 
    },
    { Item_Name: 'TT', 
    Quantity: 20 
    },
    { Item_Name: 'CricketSet',
     Quantity: 2 
    }
  ]);

  db.Books_Items.insertMany([
    { Item_Name: 'C++',
     Quantity: 50
     },
    { Item_Name: 'DSA',
     Quantity: 50 
    },
    { Item_Name: 'Python',
     Quantity:50 
    },
    { Item_Name: 'Calculas',
     Quantity: 50
     }
  ]);

db.createCollection("Sport_Items__Issued_and_Return_Item")