Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYy3Y-0004xa-Da
	for mharc-qemu-riscv@gnu.org; Mon, 17 Dec 2018 13:55:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8826e7969=Alistair.Francis@wdc.com>)
	id 1gYy3W-0004td-4m
	for qemu-riscv@nongnu.org; Mon, 17 Dec 2018 13:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8826e7969=Alistair.Francis@wdc.com>)
	id 1gYy3T-00009b-EY
	for qemu-riscv@nongnu.org; Mon, 17 Dec 2018 13:55:54 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8826e7969=Alistair.Francis@wdc.com>)
	id 1gYy3S-00007B-OP; Mon, 17 Dec 2018 13:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545072971; x=1576608971;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=in0pr7rvJRbmmGgHJZkHwQYDKAPlnTzY/PP2gfw+w+s=;
	b=edEojqcveNTZnGbz+x5hqTBBE9AspCxYeXNX+eRpavLvwGEnERZOI9/U
	82gqkSVCiCkZ5geHuMXKpbdosUWoXqrBOu/bilUESo/TzQbDbN4XwOYU0
	Mbrd+DQoTn1nvhnVXHf/VaZ0w205nZlMYSqPthjPqqib0VBb2qy5pLSNv
	Pcbv+75i/PsNsznryUWJqv95lFbOcCjrQqOnZ3uXBbre6lnjhz/39E2Na
	o79bi4/bFdnMqL9iFNHdL7pqR8UpvQ1ou4u6wWQQf6iKiALB0wljeThL9
	6ZFDtWShTUntPcMQS/uC25cfILIaTdvWhV6Bsu2q6yNeGFGkVJSas2Y58 g==;
X-IronPort-AV: E=Sophos;i="5.56,366,1539619200"; d="scan'208";a="194706726"
Received: from mail-bn3nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.57])
	by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2018 02:56:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=in0pr7rvJRbmmGgHJZkHwQYDKAPlnTzY/PP2gfw+w+s=;
	b=g96IBKKnRMST1S+rTJUUIKydOlf/hvrUlJXOBouVbhy2s2JdHj9X52KiMebCWNGprpvk4DVgDtwu1VUYsqp78hGdLfH82k5n8+0iQmH9mraAvxiDZ68qK5aQXxlH+pjzFCqY6WWYUAPE1wh80fptoSWPxxxVBU09Y1sXfHMx0is=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1070.namprd04.prod.outlook.com (10.174.250.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Mon, 17 Dec 2018 18:55:45 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.021;
	Mon, 17 Dec 2018 18:55:44 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "sorear2@gmail.com" <sorear2@gmail.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 0/4] Support separate -firmware and -kernel
Thread-Index: AQHUlZTcc8nIzEcli0avfNEMEsMrpqWDSRAA
Date: Mon, 17 Dec 2018 18:55:44 +0000
Message-ID: <85826d60ac4fd0430d39379c3eac714d48ddf903.camel@wdc.com>
References: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
In-Reply-To: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1070;
	6:hvWH3sgrLu69Kc5Ee9jb5QnjBtyNi/CP3UzR2TQGX4eLLx/208ENnFfGbo9cO6S54rJW+TZde0p3QixrdfPxRiEDowArTE51ifrx0A/HfxldBjAyUjbWwGtUbpuL/BkERhlVpLQjI168KdkU3NySx61fofk71TxAG2biJNT2nHumsJZlPqvq1BhSeAacg0ZaFix0ms8dm8OS4qDGkA+p6/uJNZhpdYl6fPOPkpXDa2H8lWWlqMy7CJMwBGuJ6ILT+C+Vw+mXdsZ7njbf4JYNEwuxxlSGvZPCd0ks0e707DLwIXkT33UywNIzAA8psksLak78w+Hvm3ChGavewTC41T4b2ItxXDy0M7maod7AWXefvV7rMpJkZOrJ4Uyi4YXX9KQU4kSZ6mG1vVjcuJWwJzcxMsWV9d/DBXn9tAU/hb28Q1YN4RpiY1UCA0xz8nymEyFKqCERLy5R7du/SbZhBA==;
	5:wocOhKedD3afkqTE7vP2jVNHEnikoAbEl7b5DFZwxlZBtC7P6djMAoJq/s5+yTicyGlebUBcvfIP/uIIfbn6TV7/7fF0trE+/zun7j1PT0llRkMPHpk5O+22PZXglxzXCnKzic1B3hp3YokkVPKCDE1sNsNz8pWLsRckCy9WbuM=;
	7:ymamC8pTLzenitmRy5Qe1sM2aDdHe5fre3ChF/IoT53QwYhhHD9q4Cx9Wfkyo8kf+zJL06I8Nt8AlpiIqVKs8LNspjSMu5r/Jx2lbKRkBKXKXq6ZUHCcBRizmrpeQkdDXANuL7RwPYJr2cQfwOHfYw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 395ee328-976f-40c2-56fe-08d664514013
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1070; 
x-ms-traffictypediagnostic: MWHPR04MB1070:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB107091300FC6AA743B2968B590BC0@MWHPR04MB1070.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231475)(944501520)(4982022)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1070; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1070; 
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(6486002)(81156014)(305945005)(68736007)(2906002)(81166006)(6436002)(71200400001)(8936002)(8676002)(118296001)(71190400001)(36756003)(7736002)(486006)(97736004)(4001150100001)(4326008)(106356001)(105586002)(229853002)(256004)(476003)(3846002)(6116002)(966005)(76176011)(6306002)(478600001)(6512007)(186003)(316002)(53936002)(26005)(2501003)(11346002)(86362001)(25786009)(2616005)(446003)(72206003)(99286004)(39060400002)(6246003)(110136005)(14454004)(102836004)(6506007)(5660300001)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1070;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 8FEmlNxl5lAstmQxvqrDMxXqt5TOnZ4y1qS/D64GAO4vgrem5jsdZgLbUo8WIxw2mrWwPjSr96pyGNVc/qwm8/06Xa5C8/FYr0wixsNBpEuwX0c9UIeVlwFlFuyntniMS5NV+jkX8FtCmas+ebsSBUS5rtndI6CQuOBE/RWeYv/imCK6ODJDpJdomRFBTlPJNcUX/tr32HVX/e1oO7IQYtblIpnb7JAwxJeyouGVxifTbfcWkdQIpIUf+5it4HHJNWWX8EZ84ZFZSjayJCBiWbVRK9AOpa6AEpse/NssQEZ1nw+0PgYxw0bjRNnMADpy
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAE45F86E0E04644B5E53CCE472D57B0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395ee328-976f-40c2-56fe-08d664514013
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 18:55:44.7349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1070
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: Re: [Qemu-riscv] [PATCH v2 0/4] Support separate -firmware and
 -kernel
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2018 18:55:55 -0000

T24gU3VuLCAyMDE4LTEyLTE2IGF0IDE4OjEyIC0wNTAwLCBTdGVmYW4gTydSZWFyIHdyb3RlOg0K
PiBUaGlzIHdhcyBwb3N0ZWQgaW4gTWF5WzBdIGJ5IE1pY2hhZWwgQ2xhcmsuICBJIGhhdmUgc3Bs
aXQgaXQgdXAgdG8NCj4gYWRkcmVzcyBlYXJsaWVyIHJldmlldyBmZWVkYmFjaywgYWxvbmcgd2l0
aCBvdGhlciBtaW5vciBjbGVhbnVwcy4NCj4gDQo+IFswXTogDQo+IGh0dHA6Ly9saXN0cy5ub25n
bnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMTgtMDUvbXNnMDUxMjEuaHRtbA0KDQpI
ZWxsbyBTdGVmYW4sDQoNClRoYW5rcyBmb3IgcGlja2luZyB0aGlzIHVwLiBJJ2xsIHJldmlldyB5
b3VyIHBhdGNoZXMgdG9kYXkuDQoNCkluIHRoZSBmdXR1cmUgY2FuIHlvdSBwbGVhc2UgZW5zdXJl
IHlvdSBDQyB0aGUgUUVNVSBtYWlsaW5nIGxpc3Qgb24gYW55DQpwYXRjaGVzIHN1Ym1pdHRlZDog
cWVtdS1kZXZlbEBub25nbnUub3JnDQoNCkFsaXN0YWlyDQoNCj4gDQo+IFN0ZWZhbiBPJ1JlYXIg
KDQpOg0KPiAgIFJJU0MtVjogTW92ZSBmaXJtd2FyZSBsb2FkaW5nIGxvZ2ljIHRvIGEgc2VwYXJh
dGUgZmlsZQ0KPiAgIFJJU0MtVjogcmVmYWN0b3IgaW5pdHJkIGxvYWRpbmcNCj4gICBSSVNDLVY6
IEhvbm9yIGVudHJ5IHBvaW50IGluIGxvYWRlZCBFTEYgZmlybXdhcmUNCj4gICBSSVNDLVY6IFN1
cHBvcnQgc2VwYXJhdGUgZmlybXdhcmUgYW5kIGtlcm5lbCBwYXlsb2FkDQo+IA0KPiAgaHcvcmlz
Y3YvTWFrZWZpbGUub2JqcyAgfCAgIDEgKw0KPiAgaHcvcmlzY3YvYm9vdC5jICAgICAgICAgfCAx
NzANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
ICBody9yaXNjdi92aXJ0LmMgICAgICAgICB8ICA2OSArKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
aW5jbHVkZS9ody9yaXNjdi9ib290LmggfCAgMjQgKysrKysrKw0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAyMDggaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgaHcvcmlzY3YvYm9vdC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9yaXNj
di9ib290LmgNCj4gDQo=

