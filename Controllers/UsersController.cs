﻿using System;
using Facebook;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StudentPlanner.Models;
using Microsoft.AspNet.Identity;

namespace StudentPlanner.Controllers
{
    public class UsersController : Controller
    {
        private Entities db = new Entities();

        // GET: AspNetUsers
        public ActionResult Index()
        {
            return View(db.AspNetUsers.ToList());
        }

        // GET: AspNetUsers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            var userId = User.Identity.GetUserId();
            setFacebookItems(userId);
            return View(aspNetUser);
        }

        // GET: AspNetUsers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AspNetUsers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] AspNetUser aspNetUser)
        {
            if (ModelState.IsValid)
            {
                db.AspNetUsers.Add(aspNetUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var userId = User.Identity.GetUserId();
            setFacebookItems(userId);
            return View(aspNetUser);
        }

        // GET: AspNetUsers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: AspNetUsers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] AspNetUser aspNetUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aspNetUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aspNetUser);
        }

        // GET: AspNetUsers/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: AspNetUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            db.AspNetUsers.Remove(aspNetUser);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private void setFacebookItems(string userId)
        {

            //Lets try and get that FB photo!
            try
            {

                //select the users provider key
                string fbProviderKey = (from login in db.AspNetUserLogins
                                        where login.UserId == userId
                                        && login.LoginProvider == "Facebook"
                                        select login.ProviderKey).FirstOrDefault();

                var userRecord = (from user in db.AspNetUsers
                                  where userId == user.Id
                                  select user).FirstOrDefault();

                if (fbProviderKey != null)
                {
                    //setup facebook connection
                    var accessToken = "cc9712bfbbfba998db06ef3f693c26ad";
                    var client = new FacebookClient(accessToken);

                    //Get the users facebook info and photo
                    //dynamic me = client.Get(fbProviderKey);
                    //ViewBag.FacebookClient = me;
                    var profilePictureString = "https://graph.facebook.com/" + fbProviderKey + "/picture?type=large";

                    userRecord.ProfilePicture = profilePictureString;
                    db.SaveChanges();


                }
                else
                {
                    var profilePictureString = "/Content/images/profilePictures/default.jpg";
                    userRecord.ProfilePicture = profilePictureString;
                    db.SaveChanges();
                }

            }

            finally
            {
            }

        }

        private string setProfilePicture(string userId)
        {

            try
            {

                //select the users provider key
                string fbProviderKey = (from login in db.AspNetUserLogins
                                        where login.UserId == userId
                                        && login.LoginProvider == "Facebook"
                                        select login.ProviderKey).FirstOrDefault();

                if (fbProviderKey != null)
                {
                    //setup facebook connection
                    var accessToken = "f0a8c2cd46408aa8f65a58c4db910505";
                    var client = new FacebookClient(accessToken);

                    //Get the users facebook info and photo
                    //dynamic me = client.Get(fbProviderKey);
                    //ViewBag.FacebookClient = me;
                    return "https://graph.facebook.com/" + fbProviderKey + "/picture?type=small";
                }
                else
                {
                    return "/Content/images/profilePictures/default.jpg";
                }

            }

            finally
            {
            }

        }
    }
}
