using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StudentPlanner.Models;

namespace StudentPlanner.Controllers
{
    public class HomeworkController : Controller
    {
        private Entities db = new Entities();

        // GET: Homework
        public ActionResult Index()
        {
            var homeworks = db.Homeworks.Include(h => h.Cour);
            return View(homeworks.ToList());
        }

        // GET: Homework/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Homework homework = db.Homeworks.Find(id);
            if (homework == null)
            {
                return HttpNotFound();
            }
            return View(homework);
        }

        // GET: Homework/Create
        public ActionResult Create()
        {
            ViewBag.CoursId = new SelectList(db.Courses, "Id", "CourseName");
            return View();
        }

        // POST: Homework/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,HomeworkName,Description,DueDate,CoursId")] Homework homework)
        {
            if (ModelState.IsValid)
            {
                db.Homeworks.Add(homework);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CoursId = new SelectList(db.Courses, "Id", "CourseName", homework.CoursId);
            return View(homework);
        }

        // GET: Homework/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Homework homework = db.Homeworks.Find(id);
            if (homework == null)
            {
                return HttpNotFound();
            }
            ViewBag.CoursId = new SelectList(db.Courses, "Id", "CourseName", homework.CoursId);
            return View(homework);
        }

        // POST: Homework/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,HomeworkName,Description,DueDate,CoursId")] Homework homework)
        {
            if (ModelState.IsValid)
            {
                db.Entry(homework).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CoursId = new SelectList(db.Courses, "Id", "CourseName", homework.CoursId);
            return View(homework);
        }

        // GET: Homework/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Homework homework = db.Homeworks.Find(id);
            if (homework == null)
            {
                return HttpNotFound();
            }
            return View(homework);
        }

        // POST: Homework/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Homework homework = db.Homeworks.Find(id);
            db.Homeworks.Remove(homework);
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
    }
}
