﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Skole_Project.DataBase
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="pwe0916_1028717")]
	public partial class DataClasses1DataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertUserData(UserData instance);
    partial void UpdateUserData(UserData instance);
    partial void DeleteUserData(UserData instance);
    partial void InsertScheduleTest(ScheduleTest instance);
    partial void UpdateScheduleTest(ScheduleTest instance);
    partial void DeleteScheduleTest(ScheduleTest instance);
    partial void InsertUser(User instance);
    partial void UpdateUser(User instance);
    partial void DeleteUser(User instance);
    #endregion
		
		public DataClasses1DataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["pwe0916_1028717ConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClasses1DataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<UserData> UserDatas
		{
			get
			{
				return this.GetTable<UserData>();
			}
		}
		
		public System.Data.Linq.Table<Schedule> Schedules
		{
			get
			{
				return this.GetTable<Schedule>();
			}
		}
		
		public System.Data.Linq.Table<Homework> Homeworks
		{
			get
			{
				return this.GetTable<Homework>();
			}
		}
		
		public System.Data.Linq.Table<ScheduleTest> ScheduleTests
		{
			get
			{
				return this.GetTable<ScheduleTest>();
			}
		}
		
		public System.Data.Linq.Table<User> Users
		{
			get
			{
				return this.GetTable<User>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.UserData")]
	public partial class UserData : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private int _UserID;
		
		private System.Nullable<System.DateTime> _Login;
		
		private System.Nullable<System.DateTime> _Logout;
		
		private string _Homework;
		
		private EntityRef<User> _User;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnUserIDChanging(int value);
    partial void OnUserIDChanged();
    partial void OnLoginChanging(System.Nullable<System.DateTime> value);
    partial void OnLoginChanged();
    partial void OnLogoutChanging(System.Nullable<System.DateTime> value);
    partial void OnLogoutChanged();
    partial void OnHomeworkChanging(string value);
    partial void OnHomeworkChanged();
    #endregion
		
		public UserData()
		{
			this._User = default(EntityRef<User>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserID", DbType="Int NOT NULL")]
		public int UserID
		{
			get
			{
				return this._UserID;
			}
			set
			{
				if ((this._UserID != value))
				{
					if (this._User.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnUserIDChanging(value);
					this.SendPropertyChanging();
					this._UserID = value;
					this.SendPropertyChanged("UserID");
					this.OnUserIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Login", DbType="DateTime2")]
		public System.Nullable<System.DateTime> Login
		{
			get
			{
				return this._Login;
			}
			set
			{
				if ((this._Login != value))
				{
					this.OnLoginChanging(value);
					this.SendPropertyChanging();
					this._Login = value;
					this.SendPropertyChanged("Login");
					this.OnLoginChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Logout", DbType="DateTime2")]
		public System.Nullable<System.DateTime> Logout
		{
			get
			{
				return this._Logout;
			}
			set
			{
				if ((this._Logout != value))
				{
					this.OnLogoutChanging(value);
					this.SendPropertyChanging();
					this._Logout = value;
					this.SendPropertyChanged("Logout");
					this.OnLogoutChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Homework", DbType="VarChar(50)")]
		public string Homework
		{
			get
			{
				return this._Homework;
			}
			set
			{
				if ((this._Homework != value))
				{
					this.OnHomeworkChanging(value);
					this.SendPropertyChanging();
					this._Homework = value;
					this.SendPropertyChanged("Homework");
					this.OnHomeworkChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_UserData", Storage="_User", ThisKey="UserID", OtherKey="ID", IsForeignKey=true)]
		public User User
		{
			get
			{
				return this._User.Entity;
			}
			set
			{
				User previousValue = this._User.Entity;
				if (((previousValue != value) 
							|| (this._User.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._User.Entity = null;
						previousValue.UserDatas.Remove(this);
					}
					this._User.Entity = value;
					if ((value != null))
					{
						value.UserDatas.Add(this);
						this._UserID = value.ID;
					}
					else
					{
						this._UserID = default(int);
					}
					this.SendPropertyChanged("User");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Schedule")]
	public partial class Schedule
	{
		
		private int _ID;
		
		private string _Class;
		
		private string _Monday;
		
		private string _Tuesday;
		
		private string _Wednesday;
		
		private string _Thursday;
		
		private string _Friday;
		
		public Schedule()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this._ID = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="VarChar(50)")]
		public string Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					this._Class = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Monday", DbType="VarChar(50)")]
		public string Monday
		{
			get
			{
				return this._Monday;
			}
			set
			{
				if ((this._Monday != value))
				{
					this._Monday = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Tuesday", DbType="VarChar(50)")]
		public string Tuesday
		{
			get
			{
				return this._Tuesday;
			}
			set
			{
				if ((this._Tuesday != value))
				{
					this._Tuesday = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Wednesday", DbType="VarChar(50)")]
		public string Wednesday
		{
			get
			{
				return this._Wednesday;
			}
			set
			{
				if ((this._Wednesday != value))
				{
					this._Wednesday = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Thursday", DbType="VarChar(50)")]
		public string Thursday
		{
			get
			{
				return this._Thursday;
			}
			set
			{
				if ((this._Thursday != value))
				{
					this._Thursday = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Friday", DbType="VarChar(50)")]
		public string Friday
		{
			get
			{
				return this._Friday;
			}
			set
			{
				if ((this._Friday != value))
				{
					this._Friday = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Homework")]
	public partial class Homework
	{
		
		private int _ID;
		
		private string _Homework1;
		
		private string _Class;
		
		private string _Subject;
		
		public Homework()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this._ID = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="Homework", Storage="_Homework1", DbType="VarChar(MAX)")]
		public string Homework1
		{
			get
			{
				return this._Homework1;
			}
			set
			{
				if ((this._Homework1 != value))
				{
					this._Homework1 = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="VarChar(50)")]
		public string Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					this._Class = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Subject", DbType="VarChar(50)")]
		public string Subject
		{
			get
			{
				return this._Subject;
			}
			set
			{
				if ((this._Subject != value))
				{
					this._Subject = value;
				}
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.ScheduleTest")]
	public partial class ScheduleTest : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Day;
		
		private string _Time;
		
		private string _Class;
		
		private string _Subject;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnDayChanging(string value);
    partial void OnDayChanged();
    partial void OnTimeChanging(string value);
    partial void OnTimeChanged();
    partial void OnClassChanging(string value);
    partial void OnClassChanged();
    partial void OnSubjectChanging(string value);
    partial void OnSubjectChanged();
    #endregion
		
		public ScheduleTest()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Day", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Day
		{
			get
			{
				return this._Day;
			}
			set
			{
				if ((this._Day != value))
				{
					this.OnDayChanging(value);
					this.SendPropertyChanging();
					this._Day = value;
					this.SendPropertyChanged("Day");
					this.OnDayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Time", DbType="VarChar(50)")]
		public string Time
		{
			get
			{
				return this._Time;
			}
			set
			{
				if ((this._Time != value))
				{
					this.OnTimeChanging(value);
					this.SendPropertyChanging();
					this._Time = value;
					this.SendPropertyChanged("Time");
					this.OnTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="VarChar(50)")]
		public string Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					this.OnClassChanging(value);
					this.SendPropertyChanging();
					this._Class = value;
					this.SendPropertyChanged("Class");
					this.OnClassChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Subject", DbType="VarChar(50)")]
		public string Subject
		{
			get
			{
				return this._Subject;
			}
			set
			{
				if ((this._Subject != value))
				{
					this.OnSubjectChanging(value);
					this.SendPropertyChanging();
					this._Subject = value;
					this.SendPropertyChanged("Subject");
					this.OnSubjectChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Users")]
	public partial class User : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Name;
		
		private string _Token;
		
		private string _Class;
		
		private System.Nullable<bool> _Mandatory;
		
		private System.Nullable<bool> _Type;
		
		private string _Picture;
		
		private EntitySet<UserData> _UserDatas;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnTokenChanging(string value);
    partial void OnTokenChanged();
    partial void OnClassChanging(string value);
    partial void OnClassChanged();
    partial void OnMandatoryChanging(System.Nullable<bool> value);
    partial void OnMandatoryChanged();
    partial void OnTypeChanging(System.Nullable<bool> value);
    partial void OnTypeChanged();
    partial void OnPictureChanging(string value);
    partial void OnPictureChanged();
    #endregion
		
		public User()
		{
			this._UserDatas = new EntitySet<UserData>(new Action<UserData>(this.attach_UserDatas), new Action<UserData>(this.detach_UserDatas));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Token", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
		public string Token
		{
			get
			{
				return this._Token;
			}
			set
			{
				if ((this._Token != value))
				{
					this.OnTokenChanging(value);
					this.SendPropertyChanging();
					this._Token = value;
					this.SendPropertyChanged("Token");
					this.OnTokenChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					this.OnClassChanging(value);
					this.SendPropertyChanging();
					this._Class = value;
					this.SendPropertyChanged("Class");
					this.OnClassChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Mandatory", DbType="Bit")]
		public System.Nullable<bool> Mandatory
		{
			get
			{
				return this._Mandatory;
			}
			set
			{
				if ((this._Mandatory != value))
				{
					this.OnMandatoryChanging(value);
					this.SendPropertyChanging();
					this._Mandatory = value;
					this.SendPropertyChanged("Mandatory");
					this.OnMandatoryChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Type", DbType="Bit")]
		public System.Nullable<bool> Type
		{
			get
			{
				return this._Type;
			}
			set
			{
				if ((this._Type != value))
				{
					this.OnTypeChanging(value);
					this.SendPropertyChanging();
					this._Type = value;
					this.SendPropertyChanged("Type");
					this.OnTypeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Picture", DbType="VarChar(MAX)")]
		public string Picture
		{
			get
			{
				return this._Picture;
			}
			set
			{
				if ((this._Picture != value))
				{
					this.OnPictureChanging(value);
					this.SendPropertyChanging();
					this._Picture = value;
					this.SendPropertyChanged("Picture");
					this.OnPictureChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="User_UserData", Storage="_UserDatas", ThisKey="ID", OtherKey="UserID")]
		public EntitySet<UserData> UserDatas
		{
			get
			{
				return this._UserDatas;
			}
			set
			{
				this._UserDatas.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_UserDatas(UserData entity)
		{
			this.SendPropertyChanging();
			entity.User = this;
		}
		
		private void detach_UserDatas(UserData entity)
		{
			this.SendPropertyChanging();
			entity.User = null;
		}
	}
}
#pragma warning restore 1591
