# Afya Bora

A Flutter project to allow members have control over their own medical data. Once a user gets diagnosed the details of the diagnosis are recorded and the doctor confirms them before they are available for the user to view. The API to enable this app to function is found [here](https://github.com/MillerAdulu/afyabora)

## Getting Started

1. Clone this project on a computer with flutter installed
2. Build and you are good to go


## Confirming diagnoses

`lib/utils/api.dart`
```
return _netUtil.post(addDiagnosisUrl, body: {
  ...

  'doctorNationalId': '8888888'   // After adding a doctor to your database, replace this with their national id.

  ...

});

```