using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Labtracker.Models
{
    public class SampleContext : DbContext
    {
        public SampleContext() : base("name=Labtracker")
        {
        }

        public DbSet<Resistance> Resistances { get; set; }
        public DbSet<Process> Processes { get; set; }
        public DbSet<Result> Results { get; set; }
        public DbSet<Status> Statuses { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Sample> Samples { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Dst> Dsts { get; set; }
        public DbSet<Growth> Growths { get; set; }
        public DbSet<Dnaextract> Dnaextracts { get; set; }
        public DbSet<LibraryPrep> LibraryPreps { get; set; }
        public DbSet<HeatKill> HeatKills { get; set; }

        public DbSet<Store> Stores { get; set; }
        public DbSet<Freezer> Freezers { get; set; }


    }
}