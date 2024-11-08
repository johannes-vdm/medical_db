## Medication Plan:

### Endpoint:
```json
POST patient={patientId}/medicationPlanId={medicationPlanId}

{
  "medication": "",
  "dosage": "",
  "instructions": "",
  "scheduleTimes": ["15:00:00", "17:00:00"],
  "endsAt": {
    "date": "2024-11-10",
    "indefinite": false
  }
}
```

# Backend endsAt Handler:
Check if any medication plans have ended before providing to the endpoint by checking the endsAt date or indefinite. indefinite should be false as default.
  
# Endpoints:
GET `/patient={patientId}/medicationPlan/Date={dateOfShowcase}`

Example Output:
```json
[
  {
    "scheduleTime": "6:00:00",
    "administeredBy": {
      "id": "...",
      // ...
    },
    "medication": {
      "name": "",
      "dosage": ""
    }
  },
  {
    "scheduleTime": "6:00:00",
    "administeredBy": {
      "id": "...",
      // ...
    },
    "medication": {
      "name": "",
      "dosage": ""
    }
  },
  // ...
]
```


GET `/patient={patientId}/medicationPlan/Date={dateOfShowcase}`:

example output: 

```json
[
  {
    "medicationId",
    "scheduleTimes",
    "dosage",
    "description",
    "administered": true/false
  },
  ...
]
```

## DB

```mermaid
erDiagram

     "dbo.patient_table" {
        id int
        first_name varchar(255)
        last_name varchar(255)
        bed_number int
    }

     "dbo.user_table" {
        id int
        first_name varchar(255)
        last_name varchar(255)
        role varchar(255)
    }

     "dbo.medication_table" {
        id int
        name varchar(255)
    }

     "dbo.medication_schedule_table" {
        id int
        patient_id int
        medication_id int
        dosage varchar(255)
        instructions varchar(255)
        starts_at date
        ends_at date
        alternative nvarchar(-1)
    }

     "dbo.medication_schedule_times_table" {
        id int
        medication_schedule_id int
        time time
    }

     "dbo.medication_administration" {
        id int
        administered_date_time datetime
        medication_schedule_times_id int
        administered_by_user_id int
    }

 "dbo.medication_schedule_table" ||--o{ "dbo.patient_table" : "id"
"dbo.medication_schedule_table" ||--o{ "dbo.medication_table" : "id"
"dbo.medication_schedule_table" ||--o{ "dbo.medication_schedule_times_table" : "medication_schedule_id"
"dbo.medication_administration" ||--o{ "dbo.medication_schedule_times_table" : "id"
"dbo.medication_administration" ||--o{ "dbo.user_table" : "id"

```

```sql
SELECT TOP (1000) [id]
      ,[first_name]
      ,[last_name]
      ,[role]
  FROM [MedicationDB].[dbo].[user_table]
```


(2 rows affected)



Total execution time: 00:00:00.003





<table><tr><th>id</th><th>first_name</th><th>last_name</th><th>role</th></tr><tr><td>1</td><td>Admin</td><td>Admin</td><td>Administrator</td></tr><tr><td>2</td><td>Annelie</td><td>Smith</td><td>Nurse</td></tr></table>




```sql
SELECT TOP (1000) [id]
      ,[first_name]
      ,[last_name]
      ,[bed_number]
  FROM [MedicationDB].[dbo].[patient_table]
```


(2 rows affected)



Total execution time: 00:00:00.004





<table><tr><th>id</th><th>first_name</th><th>last_name</th><th>bed_number</th></tr><tr><td>1</td><td>John</td><td>Doe</td><td>101</td></tr><tr><td>2</td><td>Jane</td><td>Smith</td><td>102</td></tr></table>




```sql
SELECT TOP (1000) [id]
      ,[name]
  FROM [MedicationDB].[dbo].[medication_table]
```


(2 rows affected)



Total execution time: 00:00:00.005





<table><tr><th>id</th><th>name</th></tr><tr><td>1</td><td>Medication A</td></tr><tr><td>2</td><td>Medication B</td></tr></table>




```sql
SELECT TOP (1000) [id]
      ,[patient_id]
      ,[medication_id]
      ,[dosage]
      ,[instructions]
      ,[starts_at]
      ,[ends_at]
      ,[alternative]
  FROM [MedicationDB].[dbo].[medication_schedule_table]
```


(2 rows affected)



Total execution time: 00:00:00.007





<table><tr><th>id</th><th>patient_id</th><th>medication_id</th><th>dosage</th><th>instructions</th><th>starts_at</th><th>ends_at</th><th>alternative</th></tr><tr><td>1</td><td>1</td><td>1</td><td>10mg</td><td>Take with water</td><td>2023-01-01</td><td>2024-11-10</td><td>NULL</td></tr><tr><td>2</td><td>2</td><td>2</td><td>5mg</td><td>Take before meals</td><td>2023-01-01</td><td>2024-12-15</td><td>{&quot;alternative_info&quot;: &quot;Some alternative information&quot;}</td></tr></table>




```sql
SELECT TOP (1000) [id]
      ,[medication_schedule_id]
      ,[time]
  FROM [MedicationDB].[dbo].[medication_schedule_times_table]
```


(3 rows affected)



Total execution time: 00:00:00.004





<table><tr><th>id</th><th>medication_schedule_id</th><th>time</th></tr><tr><td>1</td><td>1</td><td>08:00:00</td></tr><tr><td>2</td><td>1</td><td>12:00:00</td></tr><tr><td>3</td><td>2</td><td>09:30:00</td></tr></table>




```sql
SELECT TOP (1000) [id]
      ,[administered_date_time]
      ,[medication_schedule_times_id]
      ,[administered_by_user_id]
  FROM [MedicationDB].[dbo].[medication_administration_table]
```


(2 rows affected)



Total execution time: 00:00:00.005





<table><tr><th>id</th><th>administered_date_time</th><th>medication_schedule_times_id</th><th>administered_by_user_id</th></tr><tr><td>1</td><td>2024-11-10 08:30:00.000</td><td>1</td><td>2</td></tr><tr><td>2</td><td>2024-12-15 10:00:00.000</td><td>3</td><td>1</td></tr></table>




```sql
-- GET /patient={patientId}/medicationPlan/Date={dateOfShowcase}:

USE MedicationDB;
SELECT
  pt.id AS patient_id,
  st.starts_at AS schedule_start_date,
  --   pt.first_name AS patient_first_name,
  --   pt.last_name AS patient_last_name,
  --   st.id AS schedule_id,
  st.ends_at AS schedule_end_date,
  st.dosage AS medication_dosage,
  st.instructions AS instructions,
  mstt.time AS schedule_time,
  ma.administered_by_user_id,
  mt.name AS medication_name

FROM
  patient_table pt
  INNER JOIN medication_schedule_table st ON pt.id = st.patient_id
  INNER JOIN medication_schedule_times_table mstt ON st.id = mstt.medication_schedule_id
  LEFT JOIN medication_administration_table ma ON mstt.id = ma.medication_schedule_times_id
  INNER JOIN medication_table mt ON st.medication_id = mt.id
WHERE
  pt.id = 1
  AND (
    ('2023-01-01' BETWEEN st.starts_at AND st.ends_at)
    OR ('2023-01-01' >= st.starts_at AND st.ends_at IS NULL)
  );

```


(2 rows affected)



Total execution time: 00:00:00.008





<table><tr><th>patient_id</th><th>schedule_start_date</th><th>schedule_end_date</th><th>medication_dosage</th><th>instructions</th><th>schedule_time</th><th>administered_by_user_id</th><th>medication_name</th></tr><tr><td>1</td><td>2023-01-01</td><td>2024-11-10</td><td>10mg</td><td>Take with water</td><td>08:00:00</td><td>2</td><td>Medication A</td></tr><tr><td>1</td><td>2023-01-01</td><td>2024-11-10</td><td>10mg</td><td>Take with water</td><td>12:00:00</td><td>NULL</td><td>Medication A</td></tr></table>


