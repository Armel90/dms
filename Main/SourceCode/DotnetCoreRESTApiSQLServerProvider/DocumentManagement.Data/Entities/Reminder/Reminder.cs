﻿using DocumentManagement.Data.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace DocumentManagement.Data
{
    public class Reminder : BaseEntity
    {
        public Guid Id { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public Frequency? Frequency { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public DayOfWeek? DayOfWeek { get; set; }
        public bool IsRepeated { get; set; }
        public bool IsEmailNotification { get; set; }
        public Guid? DocumentId { get; set; }
        [ForeignKey("DocumentId")]
        public Document Document { get; set; }
        public ICollection<ReminderNotification> ReminderNotifications { get; set; }
        public ICollection<ReminderUser> ReminderUsers { get; set; }
        public ICollection<HalfYearlyReminder> HalfYearlyReminders { get; set; }
        public ICollection<QuarterlyReminder> QuarterlyReminders { get; set; }
        public ICollection<DailyReminder> DailyReminders { get; set; }
    }
}
