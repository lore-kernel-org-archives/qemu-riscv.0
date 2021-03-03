Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHaCB-0008Aw-BX
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 17:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lHZy5-0001Qc-P3; Wed, 03 Mar 2021 17:27:45 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:56529)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lHZy2-0005C0-Uf; Wed, 03 Mar 2021 17:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614810462; x=1646346462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DiVczmKLkykOVrpHcge5RstZNqJ1giKL/94Y1eL6qaA=;
 b=afTnqs4EQxa5ExRnguKt+AgR+BFLEF/0D3w5IMNhPdd5a8IMhAeZV8kI
 KPfXrpLJphiSqPyCkfdih3yT9HQz4x5MOvGNbSHG3xgSZgSMtw6tKGGmK
 LsLkwJpsqfsPU8Rnqgk4wSlbLJmps+5d516moOXOVFXaspfssT9X+mFrf s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Mar 2021 14:27:36 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Mar 2021 14:27:34 -0800
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 14:27:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Mar 2021 14:27:34 -0800
Received: from DM6PR02MB4891.namprd02.prod.outlook.com (2603:10b6:5:10::32) by
 DM6PR02MB4315.namprd02.prod.outlook.com (2603:10b6:5:1e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.28; Wed, 3 Mar 2021 22:27:29 +0000
Received: from DM6PR02MB4891.namprd02.prod.outlook.com
 ([fe80::8cc9:ddb:d3e6:6b3b]) by DM6PR02MB4891.namprd02.prod.outlook.com
 ([fe80::8cc9:ddb:d3e6:6b3b%7]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 22:27:28 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Claudio Fontana <cfontana@suse.de>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laurent Vivier
 <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael Rolnik" <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Michael Walle
 <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>, Marek
 Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>, "Sagar
 Karandikar" <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, David Hildenbrand <david@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov
 <jcmvbkbc@gmail.com>, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Subject: RE: [PATCH v4 16/28] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to
 target/cpu.c
Thread-Topic: [PATCH v4 16/28] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to
 target/cpu.c
Thread-Index: AQHXEHcAaaxkI/b2bUqkGuMEx2zW06py1vYA
Date: Wed, 3 Mar 2021 22:27:28 +0000
Message-ID: <DM6PR02MB48910574F7ECDCFD9FF8334BDE989@DM6PR02MB4891.namprd02.prod.outlook.com>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-17-f4bug@amsat.org>
In-Reply-To: <20210303214708.1727801-17-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1eb2d556-f72b-4c45-1d07-08d8de938797
x-ms-traffictypediagnostic: DM6PR02MB4315:
x-microsoft-antispam-prvs: <DM6PR02MB4315DC32632C05B231E29B24DE989@DM6PR02MB4315.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Xe6/8qEfJX4sSi+grbmmYuyg16ji6RAEOBKiqXLV9g/lkGMfaTVQdJ8qPihHWhMbBv+TJB386fkzR7psWvNw8sELI/a4pwhPvzmJsr8j+Kaw8AguCR/bVlVQXxUnFM5w9s+K+VQ/Xq9AqbJI/2vmjWQpTMFw28t6pq542E9sL0hRYdgZSVXjRJqUFJxQmg2ZJJ3IZVK3jqGotQra+1wNZ35yIktBbBQkD1uwdoIwHsYVhpJXpfK7BsqiIJj1m0/+kfF/FBXithd6Jn+SCoIVA0StlEfsJ9CK4SuIgRg9pdYoCWj1SmX6eZ8OxqhJ6hxd1ZlTIT9AwSABu5LY0BPsTyW1zR765IgLfzqB6lgPegdpV0lfEUnEVJyMXusO685n60z0uMdspG1V6kAP8J1OpuwOWBTvx1zvUZLORXR5aJ3xlOC6Tg2qgvyocNv20PW1c0nrvd3Y8usrnJKI0eD8D3G39XC+M1WnXGkIj8CHO9WVSzqBRKLhzY3Wc6DmR67JPOdk5u3ERCG2QIFfFtN+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4891.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(7416002)(186003)(54906003)(86362001)(478600001)(76116006)(8936002)(316002)(2906002)(7696005)(33656002)(9686003)(7406005)(26005)(53546011)(6506007)(110136005)(55016002)(8676002)(66556008)(66946007)(83380400001)(64756008)(4326008)(66476007)(52536014)(66446008)(5660300002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YUsvUllsdnB1SkdzTWhaUWtudDNRWXB1ZFhqR1NqQkRRNHgraFFsUmxJMHdI?=
 =?utf-8?B?NisvZVJLci8yenlzMnhKVDh6ak9SSlM2dmpFWmxCTGViNE1NSHliS0hHNmda?=
 =?utf-8?B?S3kwZUc3NHg2c0l2My9xUXNBNlk0NmY4RHVLZlJLQlluVEpHNHNoOTVlYzBC?=
 =?utf-8?B?SlU0dW41RE1FdFI0TlJOZTlWYU1vdjk3ZjFsL2dQbkxvb3N2c3ZZdlkrWUtX?=
 =?utf-8?B?RVI5a1JHdlZ4clhuQ1BVeTZYNlUrVHNkTFNFQUtML2xWSTlHOS9pSE5UOS93?=
 =?utf-8?B?dnlrZWdWMFFwWFpBREN3bzRGYXlhbFNqUVhYZ0NRa1pVUjdEODJSV0NJSyt5?=
 =?utf-8?B?MHlNNnM2VUEwbm1WN0hRMFRndGNYV1RqaXFTaTFpdUttdGs3aUgyQnFLbHVx?=
 =?utf-8?B?ODJhNWZSOW5ybUtzbVZTRXo3MEJVVUFzSkdMOVRCSGhYbEpEOVRCOGNQUk5F?=
 =?utf-8?B?K2tqdWxXU3dpRmxSTjZpZ2VHb1BFSzhkZHVpQ1kweGdmWnVHNWVSSW5DTVVj?=
 =?utf-8?B?L0tidnozSkVZc0F2N3NLY3h5eHk3RmRMajlwYmIvU3hPSG5xVWFrYXZ5OWxD?=
 =?utf-8?B?dTluaGZrSVE2OGZsakhNakJoSHNLSE1PNXRKdTBnNVlhNXJuMk9Cc0NlaENH?=
 =?utf-8?B?WGxEMUVZTW9EWGJHSFFLOGE1djBZcGhSNFNZaWdRMVdUNkIvR1VoN2JjRUxF?=
 =?utf-8?B?WUNqOTYyWEpYNGtpa09yTmRjYkR4K1luc3pVV2NYNlg4ZWxmQXdRZzhYbjBH?=
 =?utf-8?B?R1pQZnNmQ3hURCtpa05XaFp5TlJCN0wrWDRIMFFRak9aZ2tPZzdBVGJBSjJq?=
 =?utf-8?B?eHpmNzYvOW8zbmk4UzRvd1JvcjRIdVo5Y3lzZXpWaXNtSHJONjAvMTFMM2RD?=
 =?utf-8?B?bGUxeG01SS9QSFJjMi9ubUc1UVUxQ2Q3bEtZLzJJTGpxeUY1K2UrS25kdlE5?=
 =?utf-8?B?bFpnRlFUZEo3THVZdER2cG4rQUtWaU8rZVJiVXJuOFYvaDBaUVp6WG8zcVNG?=
 =?utf-8?B?S0c0cThoMERTVDNpd3lnRFVNK0F3L1c0eDhFYlp4WjJuUDU2ZG5ZRkJBMjJS?=
 =?utf-8?B?OXhEdFZKYmVncXRVNkh0UDhmMmlxUlRNZm5vbUtkdHdBM0dYT2FXTFNDeWpw?=
 =?utf-8?B?ZXlTdWFKWU8xSGxGQi9wNHN6dzJSU2dWZ2g0dlh4eFlxTHZGa2MyNkhVZzBi?=
 =?utf-8?B?UUpHb1pwRFBnYWdaMnRsdmZNRG53bkNyVnZUOGRWY2ZRQ1NjbmxEbnJyaDZH?=
 =?utf-8?B?S2MwTmh4dmF0TGRObWszZlNKVjY0bWI1cnM4bGhzNXgyWUp6YzVXMTdnalNn?=
 =?utf-8?B?dHA1K3J3eWlDdFlyNWFCWitXTUE4STBMQm9oV0VicmUvU1lIcjlXdkF2MFJN?=
 =?utf-8?B?d2N1bkVFSXRnRUV4Y25DVnRSRjk5aXRuT0lpZXpmb0MwY2dyWEhqVHFvYksy?=
 =?utf-8?B?eWdXdDZyL3VZaHI3M1hzZU44L2Z3UEx0TFpURDRNUy9yMGhEU3c4K2Y5SW5m?=
 =?utf-8?B?Umc3T0NmTXRGNUJnVjk3SjFVK1ZORFluUzBCQWVsWEQyOFRDUm1tMytMamNZ?=
 =?utf-8?B?MG1lME5TbDFjZjU4dExnL1dyRisxUXlITHFrWGhpVXRPQlZTTTBtc084TkxU?=
 =?utf-8?B?VTM3OWQ2QWwrVHQ4T05aUzZSK0tDWmtxVWdRRGRSa04xYWloakk3eTJjeFJ0?=
 =?utf-8?B?YWtKYzdWQlN1eW4zcVNiTW1zM0k0Z0NyVzRqbGNYQy9vVFVENGIrczNVTkdI?=
 =?utf-8?Q?C7LEzXD4CaH7YIa0AjMmASS4liBiy7151Z1hztC?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfKKic2g1wWMJGw3YnoTv2zVNfgKxakYi5+sMADuKewtdA9SOQTI0MlaZEdcqrB82lrd30j/jXBD3B3CKyuYaIPyZ3zrAqBCput9Q6xMUDJEPG7BnpKGz169tZ/V8/QL72nZEeVdZUNsSB+37ukjlj3SIFcGHR3/5vWir3W6Wah59vrw729RSOdejnh/RCcnAIRL7eeOF2REgYYLQeCDC4ucGld4l239C4cMmji5qUFJQqaIHkHss12WQEowHvB11HUTBQp8TC351gzPhIrleUL96MzEelCndK5859dXg9W3xdTPafB6EzBvygiSeONG21K7u1jW6kMUpTM0ItdUPw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj6m/ykdtetR6yODypcaJJsBmFXhrDFy9dQ4xbXMIrQ=;
 b=N84Tk1Uq/wygKjopFFKcZmLsb7AoiiDFjJ9k/Im8xLY74U3CDgf7ss6VFMVwjYKzgbXcyHObONmsvO57yLoDQkgpHowYmlBUchuism5/iCVdqN9kbbvydnu3t03RDSLfrjIe73CZzwafANuUvCd4gFQRlza0dpWm2/KjUTCu9GIp1wcLx4YFV48ZkUl33Ue/HqwDu87TvNhnBAhDwOT1mfJZBXAuxYLOv+kS3iUTancRH9MpN9OnScaYY0YXnHqWUOWUsIewA0qRI5xnjZ9W59uP3rL74NG51KEvAJtzVWQziO+0RYkq1f0sdm8bYNKJGBDSJy9ONG2OZc6OGH8yhg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: DM6PR02MB4891.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 1eb2d556-f72b-4c45-1d07-08d8de938797
x-ms-exchange-crosstenant-originalarrivaltime: 03 Mar 2021 22:27:28.7022 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: bSc2/hR/rvmhUr6Ez9mX+4uFqOFpFcD4ztQ7H8jpZbQCggV7SUfgwVLx+23HtpU0IcRROBAMpHoUwA4uhqjUfA==
x-ms-exchange-transport-crosstenantheadersstamped: DM6PR02MB4315
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Mar 2021 17:42:16 -0500
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
X-List-Received-Date: Wed, 03 Mar 2021 22:27:49 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAzLCAy
MDIxIDM6NDcgUE0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogQ2xhdWRpbyBG
b250YW5hIDxjZm9udGFuYUBzdXNlLmRlPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgUGV0ZXINCj4g
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJv
bnppbmlAcmVkaGF0LmNvbT47IFJpY2hhcmQgSGVuZGVyc29uDQo+IDxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPjsgcWVtdS1zMzkweEBub25nbnUub3JnOyBUaG9tYXMgSHV0aA0KPiA8dGh1
dGhAcmVkaGF0LmNvbT47IHFlbXUtcHBjQG5vbmdudS5vcmc7IExhdXJlbnQgVml2aWVyDQo+IDxs
YXVyZW50QHZpdmllci5ldT47IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPjsgQWxl
eCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsgUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz47DQo+IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVk
aGF0LmNvbT47IE1hcmNlbCBBcGZlbGJhdW0NCj4gPG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29t
PjsgTWljaGFlbCBSb2xuaWsgPG1yb2xuaWtAZ21haWwuY29tPjsNCj4gU2FyYWggSGFycmlzIDxT
LkUuSGFycmlzQGtlbnQuYWMudWs+OyBFZGdhciBFLiBJZ2xlc2lhcw0KPiA8ZWRnYXIuaWdsZXNp
YXNAZ21haWwuY29tPjsgVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsNCj4g
TWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz47IEF1cmVsaWVuIEphcm5vIDxhdXJlbGll
bkBhdXJlbDMyLm5ldD47DQo+IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT47
IEFsZWtzYW5kYXIgUmlrYWxvDQo+IDxhbGVrc2FuZGFyLnJpa2Fsb0BzeXJtaWEuY29tPjsgQW50
aG9ueSBHcmVlbg0KPiA8Z3JlZW5AbW94aWVsb2dpYy5jb20+OyBDaHJpcyBXdWxmZiA8Y3J3dWxm
ZkBnbWFpbC5jb20+OyBNYXJlayBWYXN1dA0KPiA8bWFyZXhAZGVueC5kZT47IFN0YWZmb3JkIEhv
cm5lIDxzaG9ybmVAZ21haWwuY29tPjsgRGF2aWQgR2lic29uDQo+IDxkYXZpZEBnaWJzb24uZHJv
cGJlYXIuaWQuYXU+OyBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPjsgUGFsbWVyDQo+IERhYmJl
bHQgPHBhbG1lckBkYWJiZWx0LmNvbT47IEFsaXN0YWlyIEZyYW5jaXMNCj4gPEFsaXN0YWlyLkZy
YW5jaXNAd2RjLmNvbT47IFNhZ2FyIEthcmFuZGlrYXIgPHNhZ2Fya0BlZWNzLmJlcmtlbGV5LmVk
dT47DQo+IEJhc3RpYW4gS29wcGVsbWFubiA8a2Jhc3RpYW5AbWFpbC51bmktcGFkZXJib3JuLmRl
PjsgWW9zaGlub3JpIFNhdG8NCj4gPHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwPjsgRGF2aWQg
SGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ow0KPiBNYXJrIENhdmUtQXlsYW5kIDxtYXJr
LmNhdmUtYXlsYW5kQGlsYW5kZS5jby51az47IEFydHlvbSBUYXJhc2Vua28NCj4gPGF0YXI0cWVt
dUBnbWFpbC5jb20+OyBHdWFuIFh1ZXRhbyA8Z3h0QG1wcmMucGt1LmVkdS5jbj47IE1heA0KPiBG
aWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPjsgb3BlbiBsaXN0OlJJU0MtViBUQ0cgQ1BVcyA8
cWVtdS0NCj4gcmlzY3ZAbm9uZ251Lm9yZz4NCj4gU3ViamVjdDogW1BBVENIIHY0IDE2LzI4XSBj
cHU6IFJlc3RyaWN0ICJody9jb3JlL3N5c2VtdS1jcHUtb3BzLmgiIHRvDQo+IHRhcmdldC9jcHUu
Yw0KPg0KPiBTb21laG93IHNpbWlsYXIgdG8gY29tbWl0IDc4MjcxNjg0NzE5ICgiY3B1OiB0Y2df
b3BzOiBtb3ZlIHRvDQo+IHRjZy1jcHUtb3BzLmgsIGtlZXAgYSBwb2ludGVyIGluIENQVUNsYXNz
Iik6DQo+DQo+IFdlIGNhbm5vdCBpbiBwcmluY2lwbGUgbWFrZSB0aGUgU3lzRW11IE9wZXJhdGlv
bnMgZmllbGQgZGVmaW5pdGlvbnMNCj4gY29uZGl0aW9uYWwgb24gQ09ORklHX1NPRlRNTVUgaW4g
Y29kZSB0aGF0IGlzIGluY2x1ZGVkIGJ5IGJvdGgNCj4gY29tbW9uX3NzIGFuZCBzcGVjaWZpY19z
cyBtb2R1bGVzLg0KPg0KPiBUaGVyZWZvcmUsIHdoYXQgd2UgY2FuIGRvIHNhZmVseSB0byByZXN0
cmljdCB0aGUgU3lzRW11IGZpZWxkcyB0bw0KPiBzeXN0ZW0gZW11bGF0aW9uIGJ1aWxkcywgaXMg
dG8gbW92ZSBhbGwgc3lzZW11IG9wZXJhdGlvbnMgaW50byBhDQo+IHNlcGFyYXRlIGhlYWRlciBm
aWxlLCB3aGljaCBpcyBvbmx5IGluY2x1ZGVkIGJ5IHN5c3RlbS1zcGVjaWZpYyBjb2RlLg0KPg0K
PiBUaGlzIGxlYXZlcyBqdXN0IGEgTlVMTCBwb2ludGVyIGluIHRoZSBjcHUuaCBmb3IgdGhlIHVz
ZXItbW9kZSBidWlsZHMuDQo+DQo+IEluc3BpcmVkLWJ5OiBDbGF1ZGlvIEZvbnRhbmEgPGNmb250
YW5hQHN1c2UuZGU+DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxm
NGJ1Z0BhbXNhdC5vcmc+DQo+IC0tLQ0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vY3B1
LmggYi90YXJnZXQvaGV4YWdvbi9jcHUuaA0KPiBpbmRleCBlMDRlYWM1OTFjOC4uMmE4NzhlNzdm
MDggMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2NwdS5oDQo+ICsrKyBiL3RhcmdldC9o
ZXhhZ29uL2NwdS5oDQo+IEBAIC0yNiw2ICsyNiw5IEBAIHR5cGVkZWYgc3RydWN0IENQVUhleGFn
b25TdGF0ZSBDUFVIZXhhZ29uU3RhdGU7DQo+ICAjaW5jbHVkZSAicWVtdS1jb21tb24uaCINCj4g
ICNpbmNsdWRlICJleGVjL2NwdS1kZWZzLmgiDQo+ICAjaW5jbHVkZSAiaGV4X3JlZ3MuaCINCj4g
KyNpZm5kZWYgQ09ORklHX1VTRVJfT05MWQ0KPiArI2luY2x1ZGUgImh3L2NvcmUvc3lzZW11LWNw
dS1vcHMuaCINCj4gKyNlbmRpZg0KDQpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1w
c29uQHF1aWNpbmMuY29tPg0KDQo=

