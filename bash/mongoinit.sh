#!/bin/bash

#helm upgrade --install --atomic --timeout 40s --set image.tag=latest mongodb mongodb -f ./mongodb/values-dev.yaml

kubectl exec -it mongodb-0  -- mongo <<EOF

rs.initiate()

var cfg = rs.conf()

cfg.members[0].host="mongodb-0.mongodb:27017"

rs.reconfig(cfg)

rs.add("mongodb-1.mongodb:27017")

rs.status()

#########################################################################

db = db.getSiblingDB('admin');
db.createUser(
  {
    user: 'evse-admin',
    pwd: 'evse-admin-pwd',
    roles: [
      'read',
      'readWrite',
      'dbAdmin',
      'userAdmin',
      'clusterAdmin',
      'readAnyDatabase',
      'readWriteAnyDatabase',
      'userAdminAnyDatabase',
      'dbAdminAnyDatabase'
    ],
    passwordDigestor: "server"
  }
);

db = db.getSiblingDB('evse');
db.createUser(
  {
    user: 'evse-user',
    pwd: 'evse-user-pwd',
    roles: [
      'readWrite'
    ],
    passwordDigestor: "server"
  }
);


#######################################################################

db = db.getSiblingDB('evse');
db.getCollection('default.users').insert({
  _id: ObjectId(),
  email: 'super.admin@ev.com',
  address: {
    address1: null,
    address2: null,
    postalCode: null,
    city: null,
    department: null,
    region: null,
    country: null,
    coordinates: [
      0,
      0
    ]
  },
  costCenter: null,
  createdBy: null,
  createdOn: ISODate('2020-04-02T00:00:00.000+0000'),
  deleted: false,
  firstName: 'Super',
  iNumber: null,
  issuer: true,
  lastChangedBy: null,
  locale: 'en_US',
  mobile: null,
  name: 'ADMIN',
  notifications: {
    sendSessionStarted: true,
    sendOptimalChargeReached: true,
    sendEndOfCharge: true,
    sendEndOfSession: true,
    sendUserAccountStatusChanged: true,
    sendSessionNotStarted: true,
    sendCarSynchronizationFailed: true,
    sendUserAccountInactivity: true,
    sendPreparingSessionNotStarted: false,
    sendBillingSynchronizationFailed: false,
    sendNewRegisteredUser: false,
    sendUnknownUserBadged: false,
    sendChargingStationStatusError: false,
    sendChargingStationRegistered: false,
    sendOcpiPatchStatusError: false,
    sendOicpPatchStatusError: false,
    sendOfflineChargingStations: false
  },
  phone: null,
  password: '$2a$10$/c.TRisu3xPAGkgTL69b7uC4SGXqDIzFJuZgHOB1D.fvXf5h3WWwW',
  passwordBlockedUntil: null,
  passwordResetHash: null,
  passwordWrongNbrTrials: NumberInt(0),
  eulaAcceptedHash: 'c308ac57857ce483ef1bb50fe8c1bc2bc3b5fcf067114c8b4a3a7abf9896c45f',
  eulaAcceptedOn: ISODate('2020-04-02T00:00:00.000+0000'),
  eulaAcceptedVersion: 28,
  role: 'S',
  status: 'A',
  notificationsActive: true
});


######################################################################################################

db = db.getSiblingDB('evse');
db.getCollection('5c866e81a2d9593de43efdb4.users').insert({
  _id: ObjectId(),
  email: 'slf.admin@ev.com',
  address: {
    address1: null,
    address2: null,
    postalCode: null,
    city: null,
    department: null,
    region: null,
    country: null,
    coordinates: [
      0,
      0
    ]
  },
  costCenter: null,
  createdBy: null,
  createdOn: ISODate('2020-04-02T00:00:00.000+0000'),
  deleted: false,
  firstName: 'Slf',
  iNumber: null,
  issuer: true,
  lastChangedBy: null,
  locale: 'en_US',
  mobile: null,
  name: 'ADMIN',
  notifications: {
    sendSessionStarted: true,
    sendOptimalChargeReached: true,
    sendEndOfCharge: true,
    sendEndOfSession: true,
    sendUserAccountStatusChanged: true,
    sendSessionNotStarted: true,
    sendCarSynchronizationFailed: true,
    sendUserAccountInactivity: true,
    sendPreparingSessionNotStarted: false,
    sendBillingSynchronizationFailed: false,
    sendNewRegisteredUser: false,
    sendUnknownUserBadged: false,
    sendChargingStationStatusError: false,
    sendChargingStationRegistered: false,
    sendOcpiPatchStatusError: false,
    sendOicpPatchStatusError: false,
    sendOfflineChargingStations: false
  },
  phone: null,
  password: '$2a$10$hUuTADOXG4HSPaVk0JEUMeQF219jxWv5p4aazAtYI4C8sABjneUGK',
  passwordBlockedUntil: null,
  passwordResetHash: null,
  passwordWrongNbrTrials: NumberInt(0),
  eulaAcceptedHash: 'c308ac57857ce483ef1bb50fe8c1bc2bc3b5fcf067114c8b4a3a7abf9896c45f',
  eulaAcceptedOn: ISODate('2020-04-02T00:00:00.000+0000'),
  eulaAcceptedVersion: 28,
  role: 'A',
  status: 'A',
  notificationsActive: true
});



EOF
