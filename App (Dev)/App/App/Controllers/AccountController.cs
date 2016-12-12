﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using App.Models;
using System.Web.Routing;

namespace App.Controllers
{
    public class AccountController : Controller
    {
        AccountManager manager = new AccountManager();

        public ActionResult Index()
        {
            // working
            // must go to home index
            return RedirectToAction("Index", "Home");
        }

        public ActionResult login()
        {
            return View();
        }

        public ActionResult register()
        {
            return View();
        }

        public ActionResult regerror()
        {
            return View();
        }

        public ActionResult error()
        {
            return View();
        }

        [HttpPost]
        public ActionResult verify(string email, string password)
        {
            ViewBag.String = "email: " + email + " password: " + password;
            

            var acc = manager.getAccount(email, password);

            // Means acc does not exist 
            if (acc == null)
            {
                return RedirectToAction("error", "Account");
            }
            else
            {
                Session["user"] = acc;
                return RedirectToAction("order", "Transaction");

            }
        }

        [HttpPost]
        public ActionResult save(string email, string altEmail, string password, 
            string lastName, string firstName, string middleName, string gender, string birthday, string citizenship, string birthPlace,
            string street, string city, string address, string country, string zipCode, string phoneNumber, string altPhoneNumber,
            string highSchool, string degreeLevel, string idNumber, string college, string degreeProgram, string gradRadio,
            string monthGraduate, string yearGraduate, string yrLvl, string lastTerm, string lastTermStart, string lastTermEnd,
            string admissionRadio, string admissionYear, string lastSchool, string campusAttended)
        {
            /*
             Note: phonenumber for account is also phone number in mailing
             gradRadio = yes or no
             yrLvl = 1 to 8
             lastTerm = 1, 2,3
             */

            int errorCtr = 0;

            Account acc = new Account();
            MailingInformation mail = new MailingInformation();
            Degree deg = new Degree();

            if (!(email == ""))
            {
                acc.email = email;
            }
            else
            {
                errorCtr++;
                ViewBag.emailError = "Please enter your email address";
            }

            acc.alternateEmail = altEmail;

            if (!(password == ""))
            {
                acc.password = password;
            }
            else
            {
                errorCtr++;
                ViewBag.passwordError = "Please enter your password";
            }

            if (!(idNumber == ""))
            {
                acc.idNumber = idNumber;
            }

            if(!(lastName == ""))
            {
                acc.lastName = lastName;
            } else
            {
                errorCtr++;
                ViewBag.lastNameError = "Please enter your last name";
            }
            
            if(!(firstName == ""))
            {
                acc.firstName = firstName;
            } else
            {
                errorCtr++;
                ViewBag.firstNameError = "Please enter your first name";
            }
            
            if(!(middleName == ""))
            {
                acc.middleName = middleName;
            } else
            {
                errorCtr++;
                ViewBag.middleNameError = "Please enter your middle name";
            }

            if (!(gender == ""))
            {
                if (gender == "Male")
                    acc.gender = 'M';
                else acc.gender = 'F';
            } else
            {
                errorCtr++;
                ViewBag.genderError = "Please select your gender";
            }

            if(!(birthday == ""))
            {
                string year = birthday[0] + "" + birthday[1] + "" + birthday[2] + "" + birthday[3] + "";
                string month = birthday[5] + "" + birthday[6] + "";
                string day = birthday[8] + "" + birthday[9] + "";

                acc.birthYear = Int32.Parse(year);
                acc.birthMonth = Int32.Parse(month);
                acc.birthDay = Int32.Parse(day);
            } else
            {
                errorCtr++;
                ViewBag.birthdayError = "Please select your birthday";
            }

            if (!(citizenship == ""))
            {
                acc.citizenship = citizenship;
            } else
            {
                errorCtr++;
                ViewBag.citizenshipError = "Please select your citizenship";
            }

            if (!(birthPlace == ""))
            {
                acc.placeOfBirth = birthPlace;
            } else
            {
                errorCtr++;
                ViewBag.birthPlaceError = "Please enter your birthplace";
            }
            
            if (!(address == ""))
            {
                acc.currentAddress = address;
            } else
            {
                errorCtr++;
                ViewBag.addressError = "Please enter your address";
            }
            
            if (!(phoneNumber == ""))
            {
                acc.phoneNo = phoneNumber;
            } else
            {
                errorCtr++;
                ViewBag.phoneNumError = "Please enter your phone number";
            }

            acc.alternatePhoneNo = altPhoneNumber;    
            
            if (errorCtr == 0)
            {
                acc = manager.saveAccount(acc);
                Session["user"] = acc;
                Session["mail"] = mail;
                Session["degg"] = deg;
                return RedirectToAction("Order", "Transaction"); // go to next step
            } else
            {
                return View("register", acc);
            }
        }
    }
}