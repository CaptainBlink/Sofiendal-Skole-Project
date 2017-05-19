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
    partial void InsertClass(Class instance);
    partial void UpdateClass(Class instance);
    partial void DeleteClass(Class instance);
    partial void InsertSchedule(Schedule instance);
    partial void UpdateSchedule(Schedule instance);
    partial void DeleteSchedule(Schedule instance);
    partial void InsertUserData(UserData instance);
    partial void UpdateUserData(UserData instance);
    partial void DeleteUserData(UserData instance);
    partial void InsertUser(User instance);
    partial void UpdateUser(User instance);
    partial void DeleteUser(User instance);
    partial void InsertHomework(Homework instance);
    partial void UpdateHomework(Homework instance);
    partial void DeleteHomework(Homework instance);
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
		
		public System.Data.Linq.Table<Class> Classes
		{
			get
			{
				return this.GetTable<Class>();
			}
		}
		
		public System.Data.Linq.Table<Schedule> Schedules
		{
			get
			{
				return this.GetTable<Schedule>();
			}
		}
		
		public System.Data.Linq.Table<UserData> UserDatas
		{
			get
			{
				return this.GetTable<UserData>();
			}
		}
		
		public System.Data.Linq.Table<User> Users
		{
			get
			{
				return this.GetTable<User>();
			}
		}
		
		public System.Data.Linq.Table<Homework> Homeworks
		{
			get
			{
				return this.GetTable<Homework>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Class")]
	public partial class Class : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Name;
		
		private EntitySet<Schedule> _Schedules;
		
		private EntitySet<User> _Users;
		
		private EntitySet<Homework> _Homeworks;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    #endregion
		
		public Class()
		{
			this._Schedules = new EntitySet<Schedule>(new Action<Schedule>(this.attach_Schedules), new Action<Schedule>(this.detach_Schedules));
			this._Users = new EntitySet<User>(new Action<User>(this.attach_Users), new Action<User>(this.detach_Users));
			this._Homeworks = new EntitySet<Homework>(new Action<Homework>(this.attach_Homeworks), new Action<Homework>(this.detach_Homeworks));
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
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Class_Schedule", Storage="_Schedules", ThisKey="ID", OtherKey="Class")]
		public EntitySet<Schedule> Schedules
		{
			get
			{
				return this._Schedules;
			}
			set
			{
				this._Schedules.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Class_User", Storage="_Users", ThisKey="ID", OtherKey="Class")]
		public EntitySet<User> Users
		{
			get
			{
				return this._Users;
			}
			set
			{
				this._Users.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Class_Homework", Storage="_Homeworks", ThisKey="ID", OtherKey="Class")]
		public EntitySet<Homework> Homeworks
		{
			get
			{
				return this._Homeworks;
			}
			set
			{
				this._Homeworks.Assign(value);
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
		
		private void attach_Schedules(Schedule entity)
		{
			this.SendPropertyChanging();
			entity.Class1 = this;
		}
		
		private void detach_Schedules(Schedule entity)
		{
			this.SendPropertyChanging();
			entity.Class1 = null;
		}
		
		private void attach_Users(User entity)
		{
			this.SendPropertyChanging();
			entity.Class1 = this;
		}
		
		private void detach_Users(User entity)
		{
			this.SendPropertyChanging();
			entity.Class1 = null;
		}
		
		private void attach_Homeworks(Homework entity)
		{
			this.SendPropertyChanging();
			entity.Class1 = this;
		}
		
		private void detach_Homeworks(Homework entity)
		{
			this.SendPropertyChanging();
			entity.Class1 = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Schedule")]
	public partial class Schedule : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private System.Nullable<int> _Class;
		
		private string _Monday;
		
		private string _Tuesday;
		
		private string _Wednesday;
		
		private string _Thursday;
		
		private string _Friday;
		
		private EntityRef<Class> _Class1;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnClassChanging(System.Nullable<int> value);
    partial void OnClassChanged();
    partial void OnMondayChanging(string value);
    partial void OnMondayChanged();
    partial void OnTuesdayChanging(string value);
    partial void OnTuesdayChanged();
    partial void OnWednesdayChanging(string value);
    partial void OnWednesdayChanged();
    partial void OnThursdayChanging(string value);
    partial void OnThursdayChanged();
    partial void OnFridayChanging(string value);
    partial void OnFridayChanged();
    #endregion
		
		public Schedule()
		{
			this._Class1 = default(EntityRef<Class>);
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="Int")]
		public System.Nullable<int> Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					if (this._Class1.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnClassChanging(value);
					this.SendPropertyChanging();
					this._Class = value;
					this.SendPropertyChanged("Class");
					this.OnClassChanged();
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
					this.OnMondayChanging(value);
					this.SendPropertyChanging();
					this._Monday = value;
					this.SendPropertyChanged("Monday");
					this.OnMondayChanged();
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
					this.OnTuesdayChanging(value);
					this.SendPropertyChanging();
					this._Tuesday = value;
					this.SendPropertyChanged("Tuesday");
					this.OnTuesdayChanged();
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
					this.OnWednesdayChanging(value);
					this.SendPropertyChanging();
					this._Wednesday = value;
					this.SendPropertyChanged("Wednesday");
					this.OnWednesdayChanged();
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
					this.OnThursdayChanging(value);
					this.SendPropertyChanging();
					this._Thursday = value;
					this.SendPropertyChanged("Thursday");
					this.OnThursdayChanged();
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
					this.OnFridayChanging(value);
					this.SendPropertyChanging();
					this._Friday = value;
					this.SendPropertyChanged("Friday");
					this.OnFridayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Class_Schedule", Storage="_Class1", ThisKey="Class", OtherKey="ID", IsForeignKey=true)]
		public Class Class1
		{
			get
			{
				return this._Class1.Entity;
			}
			set
			{
				Class previousValue = this._Class1.Entity;
				if (((previousValue != value) 
							|| (this._Class1.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Class1.Entity = null;
						previousValue.Schedules.Remove(this);
					}
					this._Class1.Entity = value;
					if ((value != null))
					{
						value.Schedules.Add(this);
						this._Class = value.ID;
					}
					else
					{
						this._Class = default(Nullable<int>);
					}
					this.SendPropertyChanged("Class1");
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Users")]
	public partial class User : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Name;
		
		private string _Token;
		
		private int _Class;
		
		private System.Nullable<bool> _Mandatory;
		
		private System.Nullable<bool> _Type;
		
		private string _Picture;
		
		private System.Nullable<bool> _Active;
		
		private EntitySet<UserData> _UserDatas;
		
		private EntityRef<Class> _Class1;
		
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
    partial void OnClassChanging(int value);
    partial void OnClassChanged();
    partial void OnMandatoryChanging(System.Nullable<bool> value);
    partial void OnMandatoryChanged();
    partial void OnTypeChanging(System.Nullable<bool> value);
    partial void OnTypeChanged();
    partial void OnPictureChanging(string value);
    partial void OnPictureChanged();
    partial void OnActiveChanging(System.Nullable<bool> value);
    partial void OnActiveChanged();
    #endregion
		
		public User()
		{
			this._UserDatas = new EntitySet<UserData>(new Action<UserData>(this.attach_UserDatas), new Action<UserData>(this.detach_UserDatas));
			this._Class1 = default(EntityRef<Class>);
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="Int NOT NULL")]
		public int Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					if (this._Class1.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Active", DbType="Bit")]
		public System.Nullable<bool> Active
		{
			get
			{
				return this._Active;
			}
			set
			{
				if ((this._Active != value))
				{
					this.OnActiveChanging(value);
					this.SendPropertyChanging();
					this._Active = value;
					this.SendPropertyChanged("Active");
					this.OnActiveChanged();
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
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Class_User", Storage="_Class1", ThisKey="Class", OtherKey="ID", IsForeignKey=true)]
		public Class Class1
		{
			get
			{
				return this._Class1.Entity;
			}
			set
			{
				Class previousValue = this._Class1.Entity;
				if (((previousValue != value) 
							|| (this._Class1.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Class1.Entity = null;
						previousValue.Users.Remove(this);
					}
					this._Class1.Entity = value;
					if ((value != null))
					{
						value.Users.Add(this);
						this._Class = value.ID;
					}
					else
					{
						this._Class = default(int);
					}
					this.SendPropertyChanged("Class1");
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
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Homework")]
	public partial class Homework : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Homework1;
		
		private System.Nullable<int> _Class;
		
		private string _Subject;
		
		private System.Nullable<System.DateTime> _Date;
		
		private EntityRef<Class> _Class1;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnHomework1Changing(string value);
    partial void OnHomework1Changed();
    partial void OnClassChanging(System.Nullable<int> value);
    partial void OnClassChanged();
    partial void OnSubjectChanging(string value);
    partial void OnSubjectChanged();
    partial void OnDateChanging(System.Nullable<System.DateTime> value);
    partial void OnDateChanged();
    #endregion
		
		public Homework()
		{
			this._Class1 = default(EntityRef<Class>);
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
					this.OnHomework1Changing(value);
					this.SendPropertyChanging();
					this._Homework1 = value;
					this.SendPropertyChanged("Homework1");
					this.OnHomework1Changed();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Class", DbType="Int")]
		public System.Nullable<int> Class
		{
			get
			{
				return this._Class;
			}
			set
			{
				if ((this._Class != value))
				{
					if (this._Class1.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
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
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Date", DbType="Date")]
		public System.Nullable<System.DateTime> Date
		{
			get
			{
				return this._Date;
			}
			set
			{
				if ((this._Date != value))
				{
					this.OnDateChanging(value);
					this.SendPropertyChanging();
					this._Date = value;
					this.SendPropertyChanged("Date");
					this.OnDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Class_Homework", Storage="_Class1", ThisKey="Class", OtherKey="ID", IsForeignKey=true)]
		public Class Class1
		{
			get
			{
				return this._Class1.Entity;
			}
			set
			{
				Class previousValue = this._Class1.Entity;
				if (((previousValue != value) 
							|| (this._Class1.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Class1.Entity = null;
						previousValue.Homeworks.Remove(this);
					}
					this._Class1.Entity = value;
					if ((value != null))
					{
						value.Homeworks.Add(this);
						this._Class = value.ID;
					}
					else
					{
						this._Class = default(Nullable<int>);
					}
					this.SendPropertyChanged("Class1");
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
}
#pragma warning restore 1591
