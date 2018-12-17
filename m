Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYyBP-0003QO-UF
	for mharc-qemu-riscv@gnu.org; Mon, 17 Dec 2018 14:04:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8826e7969=Alistair.Francis@wdc.com>)
	id 1gYyBN-0003OA-E0
	for qemu-riscv@nongnu.org; Mon, 17 Dec 2018 14:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8826e7969=Alistair.Francis@wdc.com>)
	id 1gYyBK-0000r5-OU
	for qemu-riscv@nongnu.org; Mon, 17 Dec 2018 14:04:01 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:55116)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8826e7969=Alistair.Francis@wdc.com>)
	id 1gYyBK-0000q4-FW
	for qemu-riscv@nongnu.org; Mon, 17 Dec 2018 14:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545073439; x=1576609439;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=Z6gdA7s1O1n8De88XZZ+gNBI7rwzjHsrj6cKEk4WLVY=;
	b=Nc86MPyC38ojeyN1Ro22V64P7AymUX3Yz6gvqooiI3JtnFKPJst5J2Vr
	8Kd7OFsf7TaUOjL5oaLCc8+cTqFgwS5MW/gQqblnFCxVyl/yRSzm9xYLO
	DvAYG3Ef126OH95AcdMYIZCkl+kHs29eK6uwvicAYE/nlSmJunQU0P9/D
	TqBZs75hHKuLfuGZ9ES2rMG3AGCSq496GqPGG3smv5QpyYbzKfqn2MPqL
	0uNDVgJ73XN7dqCkUdHYRkJeGuLrbcHxhLJMrYe+hc3tGJogsCxV4yPo8
	tD3RdkDz7Vax5SbKYHJ4FhrShk+nQRTwL+iIimgVKKkM1v9lnbTPUaJ2t Q==;
X-IronPort-AV: E=Sophos;i="5.56,366,1539619200"; d="scan'208";a="96788400"
Received: from mail-co1nam03lp2056.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.56])
	by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2018 03:03:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Z6gdA7s1O1n8De88XZZ+gNBI7rwzjHsrj6cKEk4WLVY=;
	b=NiJsTSoWfqUwvt0iMlkcFm7e2X+Xfq9cjw25AHUJ00eaWb1++TT1gtM3AaJlg70P93M+vAel8KGz4cphNZDrkyZror63yG+qpRy8sBbcpkZvu8I3Ok+eRyNHW2IiKKxlkN70rWpQmAawP0N8kZmpUATtPeGimKfjQEKBm/1a/1c=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0320.namprd04.prod.outlook.com (10.169.202.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.22; Mon, 17 Dec 2018 19:03:55 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.021;
	Mon, 17 Dec 2018 19:03:55 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "sorear2@gmail.com" <sorear2@gmail.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "mjc@sifive.com" <mjc@sifive.com>
Thread-Topic: [PATCH v2 2/4] RISC-V: refactor initrd loading
Thread-Index: AQHUlZTiqXZZk7Yfr0GX2XjgUV5S+qWDS1gA
Date: Mon, 17 Dec 2018 19:03:55 +0000
Message-ID: <e3e1198e1fe67a9398a86a21b7c874ced143d605.camel@wdc.com>
References: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
	<1545001947-29444-3-git-send-email-sorear2@gmail.com>
In-Reply-To: <1545001947-29444-3-git-send-email-sorear2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0320;
	6:+O/PJTGvZqmf8sUpZDBgO62ZuVe78lSMXa8UsIGQ5CXIGdEYuYlmTPuctJ+SQGgjND6jVcp5+REz/OM9kA2nptuP1ypusQOevLsn/sPmz+opl5Vrr1/KGQw5dio0pcFDKNx4OfohK20QuE+FzQbrW3ypZkJmdkLL9aDoZJh5xOZCA/FXbYJD7q3d86hmcTP5Rgd775lvmUsSfUFHpftzGN+9DfUiWgF9lyvvHlcFGZ+TMtzbGfnlOpiON0EXLu0nWybE3iHfvg+Abck9Etlew3krflt3Plyi5DEKUTAS3MZoOepDXyIDsVU8L7HVfkPjmKKI5oQ9fI7z5IcGBXZAPUykwRBMXCZib2d5tklCZNE2e2wzlq9+TiwdcF276QOqc9NLVJ2GZUdhpGoRNGtKknu2WoyUZX96DwY6jDvz1K807uRnBO0Waq14Rg13bEM8fus0FFVPfONfhuw50syJJQ==;
	5:pOaHtKESz17i7gLiNp9h/y8eJTsh+K3TGC3ko1IWGGxp3KGu0JXw0JkRCxN4Tk0vZ1VM5Yng4eASfPvIBTF+fLCj5785E2KcUmSDZOhO6EhgimDJZLLw/Z10qedJxpsY1DjTUO4mDq7fNjt3kyXmFXuizFEuChz6ejkw/Wixg+U=;
	7:DXr2jZgXL3BtEmZpXsE/AzlkOHXZJN4vs8iHmpp5L+ydvf33QUF3QxkjvKfvIIBab1Aml3VSzM2PB+2KbGhS9v9BnmD2BC04jEYoH0gjniFKiAET1mYMJZ/lAAgMG63hGrIAESUC3zR1Nug613lg0A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d756dec6-da7f-4370-0ff1-08d664526491
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0320; 
x-ms-traffictypediagnostic: MWHPR04MB0320:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB03200985B3BD9A3550B7F52990BC0@MWHPR04MB0320.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0320; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0320; 
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(396003)(136003)(366004)(346002)(199004)(189003)(478600001)(2906002)(6116002)(3846002)(14454004)(6512007)(4001150100001)(68736007)(11346002)(476003)(2616005)(6486002)(6246003)(53936002)(72206003)(25786009)(7736002)(4326008)(39060400002)(446003)(486006)(256004)(86362001)(97736004)(2501003)(36756003)(118296001)(66066001)(6436002)(105586002)(106356001)(316002)(6506007)(102836004)(110136005)(81166006)(26005)(71190400001)(71200400001)(186003)(76176011)(81156014)(5660300001)(229853002)(8676002)(8936002)(305945005)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0320;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: JQhBkRrZJE71dPLjJZZUtuT+oYz3o/mxAF3YAYnyrmP4pe2RDJ7OH5Caq/vjHLaf+i7HzPP8qhZhgp/c/HzMe1zoxQYu8lVOnvq6x7SEYibHTEwwDv07sU9ewkNjKeS0ohtNGR0toBatgCT2rA1k3FqKN56ijhX5TcDsQx1u/CWgWohCFGo3SmKYZFTfcUrsfEPbA5IFcwO+0UlST/yYcJsVyDKF9yN34gwSOQKhqgkt/jkWenC7d47jKWNkLf+OtsEVNOlUnu+FrJAMLmfAaSYlsKKeAvT1Y/mDN13juF6CIh9kVrMdU0QGIYI3DPaE
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD9F2B7A389B604BA7DA71555C6C6252@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d756dec6-da7f-4370-0ff1-08d664526491
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 19:03:55.5527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0320
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: Re: [Qemu-riscv] [PATCH v2 2/4] RISC-V: refactor initrd loading
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
X-List-Received-Date: Mon, 17 Dec 2018 19:04:02 -0000

T24gU3VuLCAyMDE4LTEyLTE2IGF0IDE4OjEyIC0wNTAwLCBTdGVmYW4gTydSZWFyIHdyb3RlOg0K
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIENsYXJrIDxtamNAc2lmaXZlLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogU3RlZmFuIE8nUmVhciA8c29yZWFyMkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgaHcv
cmlzY3YvYm9vdC5jIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0NCj4gLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L2Jvb3QuYyBiL2h3L3Jpc2N2
L2Jvb3QuYw0KPiBpbmRleCAxZTRkMDE3Li41NGUzMTM5IDEwMDY0NA0KPiAtLS0gYS9ody9yaXNj
di9ib290LmMNCj4gKysrIGIvaHcvcmlzY3YvYm9vdC5jDQo+IEBAIC0yNSw2ICsyNSwxMyBAQA0K
PiAgI2luY2x1ZGUgImVsZi5oIg0KPiAgI2luY2x1ZGUgImh3L3Jpc2N2L2Jvb3QuaCINCj4gIA0K
PiArI2RlZmluZSBSSVNDVl9CT09UX0RFQlVHIDANCj4gKw0KPiArI2RlZmluZSBib290X2RlYnVn
KGZzLCAuLi4pIFwNCj4gKyAgICBpZiAoUklTQ1ZfQk9PVF9ERUJVRykgeyBcDQo+ICsgICAgICAg
IGZwcmludGYoc3RkZXJyLCAiYm9vdDogJXM6ICJmcywgX19mdW5jX18sICMjX19WQV9BUkdTX18p
OyBcDQoNClRoaXMgc2hvdWxkIGJlIHVzaW5nIHFlbXVfbG9nKCkgaW5zdGVhZCBvZiBmcHJpbnRm
KCkuDQoNCj4gKyAgICB9DQo+ICsNCj4gIHN0YXRpYyB1aW50NjRfdCBsb2FkX2tlcm5lbChjb25z
dCBjaGFyICprZXJuZWxfZmlsZW5hbWUpDQo+ICB7DQo+ICAgICAgdWludDY0X3Qga2VybmVsX2Vu
dHJ5LCBrZXJuZWxfaGlnaDsNCj4gQEAgLTM4LDEwICs0NSwxMCBAQCBzdGF0aWMgdWludDY0X3Qg
bG9hZF9rZXJuZWwoY29uc3QgY2hhcg0KPiAqa2VybmVsX2ZpbGVuYW1lKQ0KPiAgICAgIHJldHVy
biBrZXJuZWxfZW50cnk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBod2FkZHIgbG9hZF9pbml0cmQo
Y29uc3QgY2hhciAqZmlsZW5hbWUsIHVpbnQ2NF90IG1lbV9zaXplLA0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50NjRfdCBrZXJuZWxfZW50cnksIGh3YWRkciAqc3RhcnQpDQo+ICtz
dGF0aWMgdm9pZCByaXNjdl9sb2FkX2luaXRyZChjb25zdCBjaGFyICpmaWxlbmFtZSwgdWludDY0
X3QNCj4gbWVtX3NpemUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIg
ZmlybXdhcmVfZW50cnksIHZvaWQgKmZkdCkNCj4gIHsNCj4gLSAgICBpbnQgc2l6ZTsNCj4gKyAg
ICB1aW50NjRfdCBzdGFydCwgc2l6ZTsNCg0Kc3RhcnQgd2lsbCBoYXZlIHRvIGRlcGVuZCBvbiB0
aGUgYml0bGVuZ3RoIG9mIHRoZSB0YXJnZXQuDQoNCkFsaXN0YWlyDQoNCj4gIA0KPiAgICAgIC8q
IFdlIHdhbnQgdG8gcHV0IHRoZSBpbml0cmQgZmFyIGVub3VnaCBpbnRvIFJBTSB0aGF0IHdoZW4g
dGhlDQo+ICAgICAgICoga2VybmVsIGlzIHVuY29tcHJlc3NlZCBpdCB3aWxsIG5vdCBjbG9iYmVy
IHRoZSBpbml0cmQuDQo+IEhvd2V2ZXINCj4gQEAgLTUzLDMzICs2MCw0MiBAQCBzdGF0aWMgaHdh
ZGRyIGxvYWRfaW5pdHJkKGNvbnN0IGNoYXIgKmZpbGVuYW1lLA0KPiB1aW50NjRfdCBtZW1fc2l6
ZSwNCj4gICAgICAgKiBoYWxmd2F5IGludG8gUkFNLCBhbmQgZm9yIGJvYXJkcyB3aXRoIDI1Nk1C
IG9mIFJBTSBvciBtb3JlIHdlDQo+IHB1dA0KPiAgICAgICAqIHRoZSBpbml0cmQgYXQgMTI4TUIu
DQo+ICAgICAgICovDQo+IC0gICAgKnN0YXJ0ID0ga2VybmVsX2VudHJ5ICsgTUlOKG1lbV9zaXpl
IC8gMiwgMTI4ICogTWlCKTsNCj4gKyAgICBzdGFydCA9IGZpcm13YXJlX2VudHJ5ICsgTUlOKG1l
bV9zaXplIC8gMiwgMTI4ICogTWlCKTsNCj4gIA0KPiAtICAgIHNpemUgPSBsb2FkX3JhbWRpc2so
ZmlsZW5hbWUsICpzdGFydCwgbWVtX3NpemUgLSAqc3RhcnQpOw0KPiArICAgIHNpemUgPSBsb2Fk
X3JhbWRpc2soZmlsZW5hbWUsIHN0YXJ0LCBtZW1fc2l6ZSAtIHN0YXJ0KTsNCj4gICAgICBpZiAo
c2l6ZSA9PSAtMSkgew0KPiAtICAgICAgICBzaXplID0gbG9hZF9pbWFnZV90YXJncGh5cyhmaWxl
bmFtZSwgKnN0YXJ0LCBtZW1fc2l6ZSAtDQo+ICpzdGFydCk7DQo+ICsgICAgICAgIHNpemUgPSBs
b2FkX2ltYWdlX3RhcmdwaHlzKGZpbGVuYW1lLCBzdGFydCwgbWVtX3NpemUgLQ0KPiBzdGFydCk7
DQo+ICAgICAgICAgIGlmIChzaXplID09IC0xKSB7DQo+ICAgICAgICAgICAgICBlcnJvcl9yZXBv
cnQoImNvdWxkIG5vdCBsb2FkIHJhbWRpc2sgJyVzJyIsIGZpbGVuYW1lKTsNCj4gICAgICAgICAg
ICAgIGV4aXQoMSk7DQo+ICAgICAgICAgIH0NCj4gICAgICB9DQo+IC0gICAgcmV0dXJuICpzdGFy
dCArIHNpemU7DQo+ICsNCj4gKyAgICBib290X2RlYnVnKCJzdGFydD0weCIgVEFSR0VUX0ZNVF9w
bHggIiBlbmQ9MHgiIFRBUkdFVF9GTVRfcGx4DQo+ICJcbiIsDQo+ICsgICAgICAgICAgICAgICBz
dGFydCwgc3RhcnQgKyBzaXplKTsNCj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogcGFzcyBpbml0
cmQgbG9hZCBhZGRyZXNzIHZpYSBkZXZpY2UtdHJlZSB0byBrZXJuZWwNCj4gKyAgICAgKg0KPiAr
ICAgICAqIGxpbnV4LWtlcm5lbCByZWFkcyB0aGUgaW5pdHJkIGFkZHJlc3MgZnJvbSBkZXZpY2Ut
dHJlZQ0KPiArICAgICAqLw0KPiArICAgIGlmIChmZHQpIHsNCj4gKyAgICAgICAgcWVtdV9mZHRf
c2V0cHJvcF9jZWxscyhmZHQsICIvY2hvc2VuIiwgImxpbnV4LGluaXRyZC1lbmQiLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzdGFydCArIHNpemUpID4+IDMyLCBzdGFydCAr
IHNpemUpOw0KPiArICAgICAgICBxZW11X2ZkdF9zZXRwcm9wX2NlbGxzKGZkdCwgIi9jaG9zZW4i
LCAibGludXgsaW5pdHJkLXN0YXJ0IiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGFydCA+PiAzMiwgc3RhcnQpOw0KPiArICAgIH0NCj4gIH0NCj4gIA0KPiAgdm9pZCByaXNj
dl9sb2FkX2Zpcm13YXJlX2tlcm5lbF9pbml0cmQoTWFjaGluZVN0YXRlICptYWNoaW5lLCB2b2lk
DQo+ICpmZHQpDQo+ICB7DQo+ICAgICAgaWYgKG1hY2hpbmUtPmtlcm5lbF9maWxlbmFtZSkgew0K
PiAtICAgICAgICB1aW50NjRfdCBrZXJuZWxfZW50cnkgPSBsb2FkX2tlcm5lbChtYWNoaW5lLQ0K
PiA+a2VybmVsX2ZpbGVuYW1lKTsNCj4gKyAgICAgICAgdWludDY0X3QgZmlybXdhcmVfZW50cnkg
PSBsb2FkX2tlcm5lbChtYWNoaW5lLQ0KPiA+a2VybmVsX2ZpbGVuYW1lKTsNCj4gIA0KPiAgICAg
ICAgICBpZiAobWFjaGluZS0+aW5pdHJkX2ZpbGVuYW1lKSB7DQo+IC0gICAgICAgICAgICBod2Fk
ZHIgc3RhcnQ7DQo+IC0gICAgICAgICAgICBod2FkZHIgZW5kID0gbG9hZF9pbml0cmQobWFjaGlu
ZS0+aW5pdHJkX2ZpbGVuYW1lLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1hY2hpbmUtPnJhbV9zaXplLA0KPiBrZXJuZWxfZW50cnksDQo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJnN0YXJ0KTsNCj4gLSAgICAgICAgICAgIHFlbXVfZmR0
X3NldHByb3BfY2VsbChmZHQsICIvY2hvc2VuIiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibGludXgsaW5pdHJkLXN0YXJ0Iiwgc3RhcnQpOw0KPiAtICAgICAgICAgICAg
cWVtdV9mZHRfc2V0cHJvcF9jZWxsKGZkdCwgIi9jaG9zZW4iLCAibGludXgsaW5pdHJkLQ0KPiBl
bmQiLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZCk7DQo+ICsgICAg
ICAgICAgICAvKiBsb2FkIHNlcGFyYXRlIGluaXRyZCAqLw0KPiArICAgICAgICAgICAgcmlzY3Zf
bG9hZF9pbml0cmQobWFjaGluZS0+aW5pdHJkX2ZpbGVuYW1lLCBtYWNoaW5lLQ0KPiA+cmFtX3Np
emUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaXJtd2FyZV9lbnRyeSwgZmR0
KTsNCj4gICAgICAgICAgfQ0KPiAgICAgIH0NCj4gIH0NCg==

