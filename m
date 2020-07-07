Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jspJY-0000cn-Dj
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jul 2020 11:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=45021e509=Alistair.Francis@wdc.com>)
 id 1jspJV-0000cT-T6
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 11:15:18 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:63422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=45021e509=Alistair.Francis@wdc.com>)
 id 1jspJS-0005NY-Ab
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2020 11:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594134914; x=1625670914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Prj/WkKnpqaJzPZ2DGINjUGT9mBqCSWZGpby81Jbskg=;
 b=Ath6t+V3++ipTrWz7xeMJYu+/UnJZDADNn6ood7LI/BkGmzrYB3uFun9
 mmSYZpFRBYfY2oNKQwVgkcRNW3MaZ29UlfEMi/e3rxSkuW/xK5fw8tCq3
 aJEUD8/91VL9SJThbw9JuyddPmMSwMOQXFDPDabwhCMsEgY7BAPvoiOot
 735Fjly6VuD+OE7eQNxds+ClJJ+dA68BIlCWnNSoRnetHKQMpsmxnzb00
 wqeq2n/F19Dyd2kr+mu4sKi8od4Z/wTg/RyD5/yF8tT33sQzL+lkkRUV5
 rQ/9/bvTVQ2jss2ltjabCUgpBl72SK23ARrXvdtqbuWVXgo+U7P3S6GN2 g==;
IronPort-SDR: 5k/t+toHjRILvqJEzCBen8gJ9MSVoFgmS3nh4YLdsYej4DbRlVFIwGiNrNPZi+Wk2dfviEz+UL
 kZ7HVXKmFTKRayH0EV7Qbw0dLRSPIeDmSY1sojEaG5luvOBuad0hPvTXfSS3DxJfO96slb4FhP
 d/W2joW6hjgB5bIaGxJGEykjaQq7DYaChzdxh3L19EJFpoyaVZbVhJC4iOSYXwt3SK9son0Mm4
 L3EkgmKOXFG7uu2+vy7XTGK8AU/F9g33BOb+h8+SUN2UFsJO3i5nwm7iYiwlCuKDo5SRTpyVfT
 3nQ=
X-IronPort-AV: E=Sophos;i="5.75,324,1589212800"; d="scan'208";a="141834360"
Received: from mail-sn1nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.53])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 23:15:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0c7hU8K4mfZRGENmAHPYmEa9IOqUdvtsKRAUqV1jSRigEV9vjXaY2rdYozm0TrPwJKz/XZlZWInl4aDjd5935U3+QS6Wss21pKj8CyxGrxb/RNf3QJAWt9pjX/0RkR0JTE8FUN1L+JpRWfgJ19wvV/I6VvJfSpGninRRa47fx2TarKyA4rnGF5CM0I909eFLwGTo6UcdG9s7moTAWyc0kMYZIvlj4MYgg9Wjkl2RLhze0S6OvFlN1yzTFy/7iBU/gD8x1dQUNVKiIHMm0A2dPC6gaEU+BsDS/KyX1eyosFUxQ+PU3ok+dFzUAUFF1v0CA5dnXeQJit057SHnctaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Prj/WkKnpqaJzPZ2DGINjUGT9mBqCSWZGpby81Jbskg=;
 b=TUbIHOTeTREeY0eX2WKH99/tBZWGVpP+2n9ynC2NTJHBq36wlN6kXUyf6sXTk9zOzoeD5w+mq9YygCA1T1PpVHYkvuNZRfIAAkVCtFARKFLGNAAMwbQ+vf3OYlqIwgaGvph0iIQA+QklYWWrlMEPtWQH89zVB91xnrBqlUhAl9RLaqbXOGYxb5SeiEKbtrPgsIRRY03rH6iQ4d9W0wtmTiGLGQLnR7PiwldYK91z7riWOuKnBE8B0Ynj1iLoQ5gVlXrigTCz6JpHAsMqLOMJpgXnVPZVBiOdG/epdgP/BJdWSWg60yAXDZgZrXVgcMAFhjVBvYn7F1lSSfdgN+Qwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Prj/WkKnpqaJzPZ2DGINjUGT9mBqCSWZGpby81Jbskg=;
 b=Pi46UGDRzDeTCvmXCL9S6HVQjWtYqIF8fmLo+A2SUErfRuYBnwQwe3icIw1zEVOGOOZ6UtIT03S/dSbT/e7C4zVJCBeD+1to03qF3qsoGu08PTCYRUoOwSoG17qCXZZhPDj7w9hBbO/vMqtH+mNetrB7P62HH13vBk0zfOt9N1I=
Received: from BY5PR04MB6882.namprd04.prod.outlook.com (2603:10b6:a03:21b::19)
 by BYAPR04MB3992.namprd04.prod.outlook.com (2603:10b6:a02:b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 15:15:07 +0000
Received: from BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::5d51:59b1:8272:23fa]) by BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::5d51:59b1:8272:23fa%7]) with mapi id 15.20.3174.020; Tue, 7 Jul 2020
 15:15:07 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "lazyparser@gmail.com" <lazyparser@gmail.com>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20`
 operand.
Thread-Topic: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20`
 operand.
Thread-Index: AQHWVEbhZgUZkUgc706ySpmNsknT0qj8N54A
Date: Tue, 7 Jul 2020 15:15:07 +0000
Message-ID: <cda6e3acd4e462cfc0cfcfe81ac3132e3447e6ef.camel@wdc.com>
References: <20200707100930.4041-1-lazyparser@gmail.com>
In-Reply-To: <20200707100930.4041-1-lazyparser@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2601:646:8e00:37b2:f615:7f83:6835:448a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eac885e9-83f2-49e3-d4f8-08d8228888af
x-ms-traffictypediagnostic: BYAPR04MB3992:
x-microsoft-antispam-prvs: <BYAPR04MB399266470D7A11C9FEDE329890660@BYAPR04MB3992.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8swKjRfx+Xj/WpA248akgfToNa624iDUg1CUaNAJzg9HBmNaI2G1LMq/fqX7I+6CegkZnZAI6fEC2lXwmVHro/WgJN9zA6kQTkqwfhYmFeR/CwOJ3xx47xppFyAgZmEMkg/KOhj4+jrz3OU8c4fKXeHPBOmce9taDN865MaX0Rd42bwOJq0EP2wvrjF8eWLzpbpICfz3Qh4EHLn3CrCz6Vzrg9N4buwMUTqnWKc0ObFoQ6Bd59tcS+3z37YavQq1lPmGTVMrya30LBBuKPggux6ej+IUP29b5G0MoAVh+2l+Vv8Ws9JWg9OcJxTD0Ay9amcqz0KOlgy6NdW4Esc2WoV9krVeOOmM2yQDINxKPVnzx0HCMbjsTeybiDwtRRVvMSPtXwZd0MfUuL5iIRBU6LoXFe3CF2chnYQSOGM01+EHS/Q5ZQTT/aSEWbaZcM50RXa7okN9jpUNa0m98Fyyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6882.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(2616005)(2906002)(71200400001)(4326008)(6486002)(83380400001)(186003)(966005)(36756003)(66446008)(66476007)(4744005)(110136005)(76116006)(86362001)(66946007)(6512007)(6506007)(8936002)(64756008)(66556008)(8676002)(498600001)(5660300002)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: iDJJA7mQaMSABBAvRYb0d+h9SXKJ4OL2RudGBgWxcM+c5Jh9DR2aIGI8DS8BM/eRIILwf2J5ZAi+p58URwDxNZgZBgythz/AbueRnlZBvCHXjErmwkUhqcjSQnxv4RlmOP9BelJI5gaLasPiX7Zi/+uzxBJUr1npc4hEWI3x/fYV//0LDmy315awwxHMbvrs0Wbw1d4a+q72RGeo18NXMPPfzBqYMgtyQ0kqF6nb5XpaJMxhRKkJ7C9i7oqpM6j4KsaQeny/XJ595So0HKRf3oOUo8tE40OzO9z36c3mT5jQeV623KACTxB9Y7nJPBW2I+py6AIljVnlpurCUY2raKj56/qGoYi9Gqzms1uRrFb5ammgdBXNJQ1TjRC+jy04AqsWSanME1szK6Pr1Rex3cme002D/Qq8Qn4pQZ3KdJhLXfGTUWV6fknFr20XEDhwI1d8jMRORDcpo5hkyeZnGzr9FyIVqC+bzza7kzrcrbCPXfjlJ3eoZAS2J7g/iC7aZ3/hTVWsfJ8DIZNbR8752eDq2R4yrhgOzGoKiI/YuLJWWMjWf0ua/0dg4lXJycVe
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F983C0645D71B4F8EF179CAC19DB967@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6882.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac885e9-83f2-49e3-d4f8-08d8228888af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 15:15:07.4895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JE4Crbco2PZInXrMw/gOQKNzcy1YDOc5tPqdCDvJ6dRJL2JypEWg4QtXqmDmOD0PIone6k2qeZju2Vt7c6Ncz0HQqpwNEsDGw1ZB8picDYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3992
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=45021e509=Alistair.Francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 11:15:09
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jul 2020 15:15:18 -0000

T24gVHVlLCAyMDIwLTA3LTA3IGF0IDE4OjA5ICswODAwLCBsYXp5cGFyc2VyQGdtYWlsLmNvbSB3
cm90ZToNCj4gRnJvbTogV2VpIFd1IDxsYXp5cGFyc2VyQGdtYWlsLmNvbT4NCj4gDQo+IGBpbW0y
MGAgb3BlcmFuZCB0eXBlIGlzIHVzZWQgaW4gTFVJL0FVSVBDIGFuZCBvdGhlciBpbnN0cnVjdGlv
bnMuDQo+IFRoZSB2YWx1ZSBzaG91bGQgbm90IGJlIGxlZnQgc2hpZnRlZCAxMmJpdHMgZm9yIGRp
c2Fzc2VtYmx5IG91dHB1dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBXdSA8bGF6eXBhcnNl
ckBnbWFpbC5jb20+DQoNCkhlbGxvLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KQ2FuIHlv
dSBwbGVhc2Ugc2VuZCBpdCBhZ2FpbiBhbmQgbWFrZSBzdXJlIHlvdSBDQyB0aGUgUUVNVSBtYWls
aW5nDQpsaXN0PyBodHRwczovL2xpc3RzLm5vbmdudS5vcmcvbWFpbG1hbi9saXN0aW5mby9xZW11
LWRldmVsDQoNCkFsaXN0YWlyDQoNCj4gLS0tDQo+ICBkaXNhcy9yaXNjdi5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZGlzYXMvcmlzY3YuYyBiL2Rpc2FzL3Jpc2N2LmMNCj4gaW5kZXggMjc4ZDliZTky
NC4uYTJiNjQ3MmJkOCAxMDA2NDQNCj4gLS0tIGEvZGlzYXMvcmlzY3YuYw0KPiArKysgYi9kaXNh
cy9yaXNjdi5jDQo+IEBAIC0yMDgzLDcgKzIwODMsNyBAQCBzdGF0aWMgaW50MzJfdCBvcGVyYW5k
X2ltbTEyKHJ2X2luc3QgaW5zdCkNCj4gIA0KPiAgc3RhdGljIGludDMyX3Qgb3BlcmFuZF9pbW0y
MChydl9pbnN0IGluc3QpDQo+ICB7DQo+IC0gICAgcmV0dXJuICgoKGludDY0X3QpaW5zdCA8PCAz
MikgPj4gNDQpIDw8IDEyOw0KPiArICAgIHJldHVybiAoKGludDY0X3QpaW5zdCA8PCAzMikgPj4g
NDQ7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQzMl90IG9wZXJhbmRfamltbTIwKHJ2X2luc3Qg
aW5zdCkNCg==

