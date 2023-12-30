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
      student_id : 's1',
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
      student_id : 's2',
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
      student_id : 's3',
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
  
db.Student_Account.insertMany([
    {
        "STUDENT_ACCOUNT_ID": "s1",
        "TOTAL_FEE": 8000,
        "REMAINING_FEE": 5000,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:18:13.953Z",
        "PAID_AMOUNT": 3000
      },
      {
        "STUDENT_ACCOUNT_ID": "s2",
        "TOTAL_FEE": 8000,
        "REMAINING_FEE": 3000,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:18:57.018Z",
        "PAID_AMOUNT": 5000
      },
      {
        "STUDENT_ACCOUNT_ID": "s3",
        "TOTAL_FEE": 8000,
        "REMAINING_FEE": 6000,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:19:37.804Z",
        "PAID_AMOUNT": 2000
      }
]);
  
db.createCollection("Teacher");
db.createCollection("Teacher_Account");


// Insert into Teacher collection in MongoDB

db.Teacher.insertMany([
    { 
      teacher_id : 't1',
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
      teacher_id : 't2',
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
      teacher_id : 't3',
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
      teacher_id : 't4',
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

  
 
db.Teacher_Account.insertMany([
    {
        "TEACHER_ACCOUNT_ID": "t1",
        "TOTAL_SALARY": 2000,
        "REMAINING_SALARY": 1300,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:47:34.259Z",
        "SALARY_TAKEN": 700
      },
      {
        "TEACHER_ACCOUNT_ID": "t2",
        "TOTAL_SALARY": 3000,
        "REMAINING_SALARY": 2500,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:47:34.266Z",
        "SALARY_TAKEN": 500
      },
      {
        "TEACHER_ACCOUNT_ID": "t3",
        "TOTAL_SALARY": 1500,
        "REMAINING_SALARY": 900,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:47:34.271Z",
        "SALARY_TAKEN": 600
      },
      {
        "TEACHER_ACCOUNT_ID": "t4",
        "TOTAL_SALARY": 1600,
        "REMAINING_SALARY": 700,
        "LAST_TRANSACTION_DATE": "2023-12-30T04:47:34.275Z",
        "SALARY_TAKEN": 900
      }

])



db.createCollection("Staff");
db.createCollection("Staff_Account");

// Insert into Staff collection in MongoDB


db.Staff.insertMany([
    { 
    staff_id:'st1',
    staff_name: 'Shuba Tamang', 
    gender:"Female",
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

    { staff_id:'st2',
      staff_name: 'Sita Poudel',
      gender:"Female",
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
    { staff_id:'st3',
      staff_name: 'Binita Kc', 
      gender:"Female",
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
    {
    staff_id:'st4' ,
    staff_name: 'Rita Magar', 
    gender:"Female",
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
    },
    {
        staff_id: "st5",
        staff_name: "Ravi Magar",
        gender: "Male",
        staff_role: "Driver",
        staff_address: "Pokhara",
        contact_number:[
            {
                contact1:98465987665415
            },
            {
                contact2:984561556415
    
            }

        ],
        join_date: ISODate('2022-06-14T12:30:00.000Z')
    },
    {
        staff_id        : "st6",
        staff_name      : "Kopila Magar",
        gender          : "Female",
        staff_role      : "Cleaning",
        staff_address   : "Birgunj",
        contact_number  : [
            {
                contact1:98461651
            },
            {
                contact2:98456545
    
            }

        ],
        join_date       : ISODate('2022-06-17T12:30:00.000Z')
    },
    {
        staff_id      : "st7",
        staff_name    : "Shiva Puri",
        gender        : "Male",
        staff_role    : "Lab Assistance",
        staff_address : "Sagarmatha",
        contact_number: [
            {
                contact1:98466215448
            },
            {
                contact2:9845654118
    
            }

        ],
        join_date     : ISODate('2022-06-20T12:30:00.000Z')
    },
    {
        staff_id       : "st8",
        staff_name     : "Salin Thakuri",
        gender         : "Male",
        staff_role     : "Data Administrator",
        staff_addres   : "Kathmandu",
        contact_number :  [
            {
                contact1:984659448
            },
            {
                contact2:9845655215
    
            }

        ],
        join_date      : ISODate('2022-06-26T12:30:00.000Z')
    },
    {
        staff_id       : "st9",
        staff_name     : "Kabita Luitel",
        gender         : "Female",
        staff_role     : "Cleaning",
        staff_address  : "Pokhara",
        contact_number :  [
            {
                contact1:984659854588
            },
            {
                contact2:984565521551
    
            }

        ],
        join_date      : ISODate('2022-06-27T12:30:00.000Z')
    },
  ]);
 
  db.Staff_Account.insertMany([
    {
        "STAFF_ACCOUNT_ID": "st5",
        "TOTAL_SALARY": 800,
        "REMAINING_SALARY": 650,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.777Z'),
        "SALARY_TAKEN": 150
    },
    {
        "STAFF_ACCOUNT_ID": "st6",
        "TOTAL_SALARY": 900,
        "REMAINING_SALARY": 740,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.784Z'),
        "SALARY_TAKEN": 160
    },
    {
        "STAFF_ACCOUNT_ID": "st7",
        "TOTAL_SALARY": 1000,
        "REMAINING_SALARY": 950,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.791Z'),
        "SALARY_TAKEN": 50
    },
    {
        "STAFF_ACCOUNT_ID": "st8",
        "TOTAL_SALARY": 700,
        "REMAINING_SALARY": 0,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.795Z'),
        "SALARY_TAKEN": 700
    },
    {
        "STAFF_ACCOUNT_ID": "st9",
        "TOTAL_SALARY": 700,
        "REMAINING_SALARY": 700,
        "LAST_TRANSACTION_DATE": null,
        "SALARY_TAKEN": 0
    },
    {
        "STAFF_ACCOUNT_ID": "st1",
        "TOTAL_SALARY": 800,
        "REMAINING_SALARY": 600,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.754Z'),
        "SALARY_TAKEN": 200
    },
    {
        "STAFF_ACCOUNT_ID": "st2",
        "TOTAL_SALARY": 900,
        "REMAINING_SALARY": 300,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.761Z'),
        "SALARY_TAKEN": 600
    },
    {
        "STAFF_ACCOUNT_ID": "st3",
        "TOTAL_SALARY": 1000,
        "REMAINING_SALARY": 500,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.766Z'),
        "SALARY_TAKEN": 500
    },
    {
        "STAFF_ACCOUNT_ID": "st4",
        "TOTAL_SALARY": 700,
        "REMAINING_SALARY": 400,
        "LAST_TRANSACTION_DATE": ISODate('2023-12-30T10:26:44.773Z'),
        "SALARY_TAKEN": 300
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
db.Sport_Items__Issued_and_Return_Item.insertMany([
    {
        "ISSUDER_ID": "s1",
        "ISSED_ITEM": "Football",
        "ISSED_QUANTITY": 3,
        "ISSUED_DATE": "2022-09-01T12:00:00.000Z",
        "RETURN_DATE": "2022-10-01T12:00:00.000Z",
        "DAYS_ISSUED": 30,
        "RETURN_STATTUS": "YES",
        "FINE_AMOUNT": 100
      },
      {
        "ISSUDER_ID": "s2",
        "ISSED_ITEM": "TT",
        "ISSED_QUANTITY": 3,
        "ISSUED_DATE": "2022-09-01T12:00:00.000Z",
        "RETURN_DATE": null,
        "DAYS_ISSUED": null,
        "RETURN_STATTUS": null,
        "FINE_AMOUNT": null
      }

])


// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------Q.N-1 JOIN-------------------------------------------------------------------
db.Student.aggregate([
    {
        $lookup:{
            from:'Student_Account',
            localField:'student_id',
            foreignField:'STUDENT_ACCOUNT_ID',
            as:'stu'
        }
    },
    {
        $lookup:{
            from:'Sport_Items__Issued_and_Return_Item',
            localField:'student_id',
            foreignField:'ISSUDER_ID',
            as:'stusp'
        }
    },
    {
        $match:{
            'stu.REMAINING_FEE' :{$gt:3000},
            'stusp.FINE_AMOUNT' :{$gt:50}
        }
    },
    {
        $project:{
            "student_id":1,
            "student_name":1,
            "student_department":1,
            "student_current_semester":1,
            "student_address":1,
            "student_contact_number":1,
            "stu.REMAINING_FEE":1,
            "stusp.ISSED_ITEM": 1,
            "stusp.ISSED_QUANTITY": 1,
            "stusp.FINE_AMOUNT": 1

            


        }
    }
    
]);
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------QN.2-UNION-----------------------------------------------------------------------
db.Teacher.aggregate([
    {
        $lookup:{
            from:"Teacher_Account",
            localField:"teacher_id",
            foreignField:"TEACHER_ACCOUNT_ID",
            as:"teta"
        }

    },
    {
        $match:{
            "teta.REMAINING_SALARY" :{$gt:700}
        }
    },
    {
        $project:{
            "teacher_id":1,
            "teacher_name":1,
            "teacher_address":1,
            "contact_number":1,
            "teta.REMAINING_SALARY":1
    
    
        }
    
    },
    {
        $unionWith:{
            coll:"Staff",
            pipeline:[
                {
                    $lookup:{
                        from:"Staff_Account",
                        localField:"staff_id",
                        foreignField:"STAFF_ACCOUNT_ID",
                        as:"stac"
                    }
                },
                {
                    $match:{
                        "stac.REMAINING_SALARY":{$gt:500}

                    }
                },

                {
                    $project:{
                        "staff_id":1,
                        "staff_name":1,
                        "staff_address":1,
                        "contact_number":1,
                        "stac.REMAINING_SALARY":1
                        


                    }
                }
            ]
        }
    }
])
// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------NESTED QUERY----------------------------------------------------------------------------------------------------------
db.Student.aggregate([
    {
        $lookup:{
            from:"Sport_Items__Issued_and_Return_Item",
            localField:"student_id",
            foreignField:"ISSUDER_ID",
            as:"stusport"
        }
    },
    {
        $match:{
            "stusport.FINE_AMOUNT":{$gte:50}
        }
    },
    {
        $project:{
            student_id:1,
            student_name:1,
            student_department:1,
            student_current_semester:1,
            student_address:1,
            student_contact_number:1


        }
    }
])



// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
var query ={
    $expr:{
        $and:[
            {
                $lte :["$join_date",{$subtract:[new Date(),{$multiply:[365,24,60,60,1000]}]}]
            },
            {
                $lt :["$join_date",new Date()]
            }
        ]
    }
};

var projection ={
    teacher_id:1,
    teacher_name:1,
    teacher_address:1,
    contact_number:1

}

var result = db.Teacher.find(query,projection);
result.forEach(function (doc) {
    printjson(doc);
});
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------OLAP FEATURE CUBE----------------------------------------------------------------------------
db.Staff.aggregate([
    {
      $lookup: {
        from: "Staff_Account",
        localField: "staff_id",
        foreignField: "STAFF_ACCOUNT_ID",
        as: "staffAccount"
      }
    },
    {
      $unwind: "$staffAccount" 
    },
    {
      $group: {
        _id: "$gender",
        Total_Salary_Sum: { $sum: "$staffAccount.TOTAL_SALARY" }
      }
    },
    {
      $project: {
        gender: "$_id",
        Total_Salary_Sum: 1,
        _id: 0
      }
    }
  ]);
  