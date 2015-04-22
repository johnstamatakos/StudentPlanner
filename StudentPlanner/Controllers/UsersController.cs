using System;
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
                    var profilePictureString = "/Content/img/default.jpeg";
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
                    return "/Content/img/default.jpeg";
                }

            }

            finally
            {
            }

        }

        public ActionResult getCourses(string id)
        {

            var userCourse = (from course in db.Courses
                              join user in db.AspNetUsers on course.UserId equals user.Id
                              where course.UserId == id
                              select user.Cours).FirstOrDefault();

            return PartialView("_coursePartial", userCourse);
        }

        public ActionResult getHomeworks(int id)
        {

            var homework = (from hw in db.Homeworks
                              join c in db.Courses on hw.CourseId equals c.Id
                              where hw.CourseId == id
                              select c.Homework).FirstOrDefault();

            var query = db.Courses.Select(c => new { c.Id, c.CourseName });
            ViewBag.Courses = new SelectList(query.AsEnumerable(), "Id", "CourseName");

            return PartialView("_homeworkPartial", homework);
        }

        public ActionResult getExams(int id)
        {

            var exams = (from e in db.Exams
                            join c in db.Courses on e.CourseId equals c.Id
                            where e.CourseId == id
                            select c.Exams).FirstOrDefault();

            var query = db.Courses.Select(c => new { c.Id, c.CourseName });
            ViewBag.Courses = new SelectList(query.AsEnumerable(), "Id", "CourseName");

            return PartialView("_examsPartial", exams);
        }

        public ActionResult getProjects(int id)
        {
            var projects = (from p in db.Projects
                         join c in db.Courses on p.CourseId equals c.Id
                         where p.CourseId == id
                         select c.Projects).FirstOrDefault();

            var query = db.Courses.Select(c => new { c.Id, c.CourseName });
            ViewBag.Courses = new SelectList(query.AsEnumerable(), "Id", "CourseName");

            return PartialView("_projectsPartial", projects);
        }

        public ActionResult getDailyHomeworks(DateTime d, int id)
        {
            var homework = (from hw in db.Homeworks
                            join c in db.Courses on hw.CourseId equals c.Id
                            where hw.CourseId == id && hw.DueDate == d
                            select hw);

            ViewBag.hwCount = homework.Count();

            var query = db.Courses.Select(c => new { c.Id, c.CourseName });
            ViewBag.Courses = new SelectList(query.AsEnumerable(), "Id", "CourseName");

            return PartialView("_hwDayPartial", homework);
        }
        public ActionResult getDailyExams(DateTime d, int id)
        {
            var exams = (from e in db.Exams
                         join c in db.Courses on e.CourseId equals c.Id
                         where e.CourseId == id && e.DueDate == d
                         select e);

            var query = db.Courses.Select(c => new { c.Id, c.CourseName });
            ViewBag.Courses = new SelectList(query.AsEnumerable(), "Id", "CourseName");

            return PartialView("_examsDayPartial", exams);
        }
        public ActionResult getDailyProjects(DateTime d, int id)
        {
            var projects = (from p in db.Projects
                            join c in db.Courses on p.CourseId equals c.Id
                            where p.CourseId == id && p.DueDate == d
                            select p);

            var query = db.Courses.Select(c => new { c.Id, c.CourseName });
            ViewBag.Courses = new SelectList(query.AsEnumerable(), "Id", "CourseName");

            return PartialView("_projectsDayPartial", projects);
        }

        public int getHwCount(DateTime d)
        {
            var homework = (from hw in db.Homeworks
                            join c in db.Courses on hw.CourseId equals c.Id
                            where hw.DueDate == d
                            select hw);
            var count = homework.Count();
            return count;
        }

        public int getExamCount(DateTime d)
        {
            var exams = (from e in db.Exams
                         join c in db.Courses on e.CourseId equals c.Id
                         where e.DueDate == d
                         select e);
            var count = exams.Count();
            return count;
        }

        public int getProjectCount(DateTime d)
        {
            var projects = (from p in db.Projects
                            join c in db.Courses on p.CourseId equals c.Id
                            where p.DueDate == d
                            select p);
            var count = projects.Count();
            return count;
        }
    }
}

