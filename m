Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqABI-0002vm-2k
	for mharc-qemu-riscv@gnu.org; Fri, 18 Dec 2020 02:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61438633b=Atish.Patra@wdc.com>)
 id 1kqABG-0002vX-JY; Fri, 18 Dec 2020 02:28:02 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:55441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61438633b=Atish.Patra@wdc.com>)
 id 1kqABC-0005Lv-SV; Fri, 18 Dec 2020 02:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608276479; x=1639812479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QxVBU8V67yQZHK3zFvOFvYg8wjR2G4OCrKFSEmnDm1Y=;
 b=YZuc7F381ZSK5BSeWtVD7zSMQV5FEvBvvplQ/ZbzNyqnKsSQl9owcENA
 YELiATCqTtSPyE5l7fRX/WXPT8ryP4dIquIlGo86K4hFFyC1JFnv9nmO0
 5FarwFaPDq8V5JIwf/n7W105IzG1/5VcUBR3auKwJAV3q76gwvuFyMODG
 e5a5ni5HoP0jipZXHmMUWtiC7015pZYa97I+40QhnuGowlwFN5Dj3GBlx
 BRf6tFSdwhPb5LMUQtR5Ucl+m/C33FTSrduZgycAzC6GLCVeCXnc8p6Mk
 yeMfbueTD0uReDFBfj1/VUDGHghQ5bGT1aPscZ0Bu5ecYf0fl2jfZExDc w==;
IronPort-SDR: JHJ0g2d1WTyG3iesTleVJpFUvAsHW9SM4j/6ZVUmAELIsly5vzoJTYvmYmI8kiLkUIIWEjYSXU
 dAz7gSUnfmuQA+kM0xZq6Ez+SxzlkvMNwAykidNoyLt3UIvDD91pKjS9vbYAGZjpkj59fAvVpl
 qlzo/cUuBJSF+iXRSV4W1vfgiyuMwjIN//YfpHTPk6vc8mjOIuA9BFh/U+3RDn98VKORvRmgMI
 2lzuH0A5vjT0rja/Ln0H0kmz9+5pfxJIrCipZ2UZBwxXZXvpZ11rIyW7vsqB7hCg82DiW77auj
 hz8=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="156663596"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 15:27:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0RYeKmJRk56MIidSkfXemVM33Srq0J//OqsixMFGMc0n77bHFJI4APB/H1pwUkgOahJ7vUF0YiFT53gCGK8oHDK4cY1Gzo7DrWwyafXKODZd0eL7OBVZyyErHROUlbYmk/tQhtlCkrmYKHNZxP35WyDIv9Hec6B3xAu2vhrcF5wv+mIogcV65hp/cWXjI/ySfXXUOmW3fJRxwFx3GNJeW73sFMok8f3/7eBorvAC2NffDc4Hld/ZPy5fGuQAufaWJPxyLcw+NS7rHAzogRfXrYGEcJzqcoz2XTuwAB6TsWGZEqEIJdVD7benAHK6Il1Bdwa1u6sarAT88w5g+SfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxVBU8V67yQZHK3zFvOFvYg8wjR2G4OCrKFSEmnDm1Y=;
 b=h5b3REmxBJrJXVVjfLRHvv2J+I/IhrXo7y60L00NrplPO+tcl/9D1ZDNpCkLhYldTsKpLnWRqUw/oP/BKBCN60rZYi3OElvBH2DYyCoQ5hPlywTLtf+6Y9YHj9pny+MuTyTcGgeBha1ZMnxGQSqqTfjptGVhYP9S3YzQpKERNkJ3HKqnvH5dqoDvROraS20KGdqiK4meJh1ApZpK5DkldYUzCzlM9lxeL92cxITxIjVp16zzEKcsBa/WNSYvcTM1xDk+guk/NaZ2GXPlBdaYJE1wqle3KG0XUF2eXE6ZKGvcgLbSpwzggQi9zNl2FJeS60pwmtZzfTz7m/9zhD5hGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxVBU8V67yQZHK3zFvOFvYg8wjR2G4OCrKFSEmnDm1Y=;
 b=GhlxC22odA5xD0lQUYWKLP7RnV2l6BXVtS1pMmHJNBV5HI35+/6PVO4Ys0CbEG76zJsRfWAG31bS3JlSTp6+y8VC67CaCOvICV4lroqy0V/zlkR07x4pBabTyI4bQbJcz4kJwPL5wpKftRBVyQ5dGsKmVozd4RWGc4i8EIl4q6k=
Received: from CH2PR04MB6725.namprd04.prod.outlook.com (2603:10b6:610:94::15)
 by CH2PR04MB6537.namprd04.prod.outlook.com (2603:10b6:610:6a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 07:27:52 +0000
Received: from CH2PR04MB6725.namprd04.prod.outlook.com
 ([fe80::4c5d:5587:1083:f869]) by CH2PR04MB6725.namprd04.prod.outlook.com
 ([fe80::4c5d:5587:1083:f869%3]) with mapi id 15.20.3654.018; Fri, 18 Dec 2020
 07:27:52 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: Anup Patel <Anup.Patel@wdc.com>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, Alistair Francis
 <Alistair.Francis@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "sagark@eecs.berkeley.edu"
 <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Topic: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
Thread-Index: AQHW1L5ec6Y+NBO69E2DOYgTLRiUVan8c1OAgAABxYA=
Date: Fri, 18 Dec 2020 07:27:52 +0000
Message-ID: <4f09804c0e35a45fcf3fa78b3f3ed55276d6e10f.camel@wdc.com>
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
In-Reply-To: <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f564f66d-1250-4eee-231c-08d8a3266e0c
x-ms-traffictypediagnostic: CH2PR04MB6537:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB6537C1FCADD45339B8CFF261FAC30@CH2PR04MB6537.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ptamfhEoNy5ncW8bsuSlU+C9+smFzcORwLb2PuCYPVTUoBfC4U8qjo7uAfSiRF9FBjTEMokv5zGN7N05f9tEj2o7HzeMSUha6mwMoMwWnIM6mYjglnIIyS5CopJZQ7sNN0Mp4Gyoam7jJgme9cmUHy5gljs+XpN5ozgzxNv3tAL7QhKdJFL+5coat/0Z+EMSyHnj+j+CQ9hes70SvC34rQg1d8gF6oKdkfF5UwwH2TJt3qauSmsXVJ4j1GNhqHAJ/0sSoNN7Y6kKfz+zsY7mDbHJAOLylFmyOBQ/s34jhritQpFJJac8f2gJ2bHXNWYbO4cbeBDy0WAeRyCTOYTV69LRMDXKYbg1IqX6FkBpHjuec7FZFBOnmyP19d8Jb7s1Hrb5T2uDOjatJu3TITg/ZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6725.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(966005)(54906003)(76116006)(316002)(6506007)(8936002)(71200400001)(186003)(2616005)(6916009)(8676002)(2906002)(66946007)(86362001)(91956017)(36756003)(4326008)(83380400001)(478600001)(5660300002)(66446008)(53546011)(6486002)(64756008)(6512007)(26005)(4001150100001)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SHJJT0lBTi96eXl2WjJMbUFDY29GV0R0azlhRDI4cS9uL2J6VjJBb3l3bTBE?=
 =?utf-8?B?a3dqS1NiV3VLYi9Mclpkei9SYXd5eWVVV2gvTDNzY3hpZ1ZRbjRMeEo3bFN4?=
 =?utf-8?B?SXQ5RFhUZTBmam41RjQ3b1dkM3EvWitoRDBaRXUzVTdjQklwZll3SGdyMGdE?=
 =?utf-8?B?MW9HaU9GTWZlejdvV3ZPZzFsTDRrTG0zb2tPM05XeFVwclRVVjY1N2ErMjM4?=
 =?utf-8?B?MUV6WTZMQU93dWFtSlVmQms5UUErTGsyeGE4TnpjY3Zxa1JSYmZkVlRKQktG?=
 =?utf-8?B?SGxYcUNWN1R0VDNUZFYvL0FDa3plbEFFanpjd2p0YVArN1I4Y1J3M00yNGNY?=
 =?utf-8?B?TWsrV0pGN29kQnZYUmQyQnM1VEJJMDFKWGlLd2VQWm14aGhzazdHZURJaVZV?=
 =?utf-8?B?Z1hsVnVHZUsreGhwc1RUYXRZMXArZk9yalQ0TXIvMnRvZUFzcS9NRGpBV3Q0?=
 =?utf-8?B?K3FXMmhzL0pMUHFEMFIzdWg2emtHcWNUYUNhLzdzZENuaFAwZXRwOFVJNXlC?=
 =?utf-8?B?TUxpeUFlSnlFZ3EvNUhYM3hyUlp4R1hONTBMYUY2THhHclduVTFWV2VySktz?=
 =?utf-8?B?OXozRFpBSVFNaUpucGtVY3FhS01HV244QmN0VEdldmpkRlVTZ3V3RzhwRklC?=
 =?utf-8?B?Nmw2YUZhOXVZY00yaEVRaHUvWWxXN0Fxc1h2cWVWQ0Z5bkVxK2tLSjNGZmgv?=
 =?utf-8?B?SHJpVEdIZHRxb2ZMSmRiN01nK3F3VUN5eHlkcDZseDZ0STBwVzdwQlJHbUIy?=
 =?utf-8?B?V3hWZ1RMNFAra3ZCNE0wcG4xSS94NkxxN2o2KytaS3ZDUmdJWTFiK0RGdVBT?=
 =?utf-8?B?STRBdEF1dnVIMVJxV3g1S1FSdGJGTEJaYUVXOGVPNUlvOGNmLzZzN1ZJQ1Rh?=
 =?utf-8?B?bFdCcCtNUFJNTFR0RnQySm5UWm4xRVhkNVBOZ1gya0tLNFh1dGtWV3JUU0ZO?=
 =?utf-8?B?elF5RDVHUVlPS21oejBVNDV4bzN4cHhheXplOFNDN25NaVU5a3dpZnY2Zkcr?=
 =?utf-8?B?dWQ0MnMvQklmd213em9CakljRkVJY0MvSmYra1BvWnVMK1dqWUFUOVp3WXBD?=
 =?utf-8?B?aUNhSTNCdnVXZk1KcnUyT01ENlFWdDB5SFRRMGhMNHB0Tzc3NDNKNUxXUVdh?=
 =?utf-8?B?MTFURzJKeGhoOVc2WWVaYVhna3VMdjdycW5qUk5mZjdnazc2bGltZjgrTjM0?=
 =?utf-8?B?aHVHWFRHUnlxY3dTa1JrUUVvSEU3ai9JVzZKeldoQndXL2N3bDh6MUFJdGVY?=
 =?utf-8?B?RXI1a0ZRU1FsMXRodHVaZ1hyUWlncjg4YkFBZ1dXUU1tckduUnJyT3ZrM0FC?=
 =?utf-8?Q?trtvLW6FxktY1spT4P1K4NtYJKSuMRtHio?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5E748B5062D9D4DA4D8B52E0F5E09D6@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6725.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f564f66d-1250-4eee-231c-08d8a3266e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2020 07:27:52.2154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBzxvS7c9/MPzP9pt8A+80VJhGmtTAM6imjiKAzIyGpS2FVRJvQasPKUOwRxbsnJMZnm8JdR/vjc+z/vVT7o1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6537
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61438633b=Atish.Patra@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Dec 2020 07:28:02 -0000

T24gRnJpLCAyMDIwLTEyLTE4IGF0IDE1OjIxICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gSGkg
QXRpc2gsDQo+IA0KPiBPbiBGcmksIERlYyAxOCwgMjAyMCBhdCA1OjQ4IEFNIEF0aXNoIFBhdHJh
IDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBDdXJyZW50bHksIHdl
IHBsYWNlIHRoZSBEVEIgYXQgMk1CIGZyb20gNEdCIG9yIGVuZCBvZiBEUkFNIHdoaWNoDQo+ID4g
ZXZlciBpcw0KPiA+IGxlc3Nlci4gSG93ZXZlciwgTGludXgga2VybmVsIGNhbiBhZGRyZXNzIG9u
bHkgMUdCIG9mIG1lbW9yeSBmb3INCj4gPiBSVjMyLg0KPiA+IFRodXMsIGl0IGNhbiBub3QgbWFw
IGFueXRoaW5nIGJleW9uZCAzR0IgKGFzc3VtaW5nIDJHQiBpcyB0aGUNCj4gPiBzdGFydGluZyBh
ZGRyZXNzKS4NCj4gPiBBcyBhIHJlc3VsdCwgaXQgY2FuIG5vdCBwcm9jZXNzIERUIGFuZCBwYW5p
YyBpZiBvcGVuc2JpIGR5bmFtaWMNCj4gPiBmaXJtd2FyZQ0KPiA+IGlzIHVzZWQuDQo+ID4gDQo+
ID4gRml4IHRoaXMgYnkgcGxhY2luZyB0aGUgRFRCIGF0IDJNQiBmcm9tIDNHQiBvciBlbmQgb2Yg
RFJBTQ0KPiA+IHdoaWNoZXZlciBpcyBsb3dlci4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGh3L3Jpc2N2
L2Jvb3QuYyB8IDQgKystLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPiANCj4gDQo+IFdpdGggdGhpcyBwYXRjaCwgMzItYml0IHNpZml2
ZV91IHN0aWxsIGRvZXMgbm90IGJvb3Qga2VybmVsIHdpdGggdGhlDQo+IGZvbGxvd2luZyBwYXRj
aCBhcHBsaWVkIG9uIDUuMTA6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1yaXNjdi9wYXRjaC8yMDIwMTIxNzA3NDg1NS4xOTQ4NzQzLTEtYXRpc2gucGF0cmFA
d2RjLmNvbS8NCj4gDQo+IENvbW1hbmQgSSB1c2VkOg0KPiAkIHFlbXUtc3lzdGVtLXJpc2N2MzIg
LW5vZ3JhcGhpYyAtTSBzaWZpdmVfdSAtbSAxRyAtc21wIDUgLWtlcm5lbA0KPiBhcmNoL3Jpc2N2
L2Jvb3QvSW1hZ2UNCj4gDQo+IDMyLWJpdCB2aXJ0IGNhbm5vdCBib290IHRoZSBzYW1lIGtlcm5l
bCBpbWFnZSB3aXRoIG1lbW9yeSBzZXQgdG8gMkcNCj4gZWl0aGVyOg0KPiAkIHFlbXUtc3lzdGVt
LXJpc2N2MzIgLW5vZ3JhcGhpYyAtTSB2aXJ0IC1tIDJHIC1zbXAgNCAta2VybmVsDQo+IGFyY2gv
cmlzY3YvYm9vdC9JbWFnZQ0KPiANCg0KSGkgQmluLA0KQXMgbWVudGlvbmVkIGluIHRoZSBlbWFp
bCBvbiB0aGUgbGludXggbWFpbGluZyBsaXN0LCB0aGlzIHBhdGNoIG9ubHkNCnNvbHZlcyAyR0Ig
cHJvYmxlbS4gc2lmaXZlX3UgcHJvYmxlbSBpcyBzb2x2ZWQgYnkgQWxpc3RhaXIncyBwYXRjaFsx
XS4NCg0KSGUgaXMgcGxhbm5pbmcgdG8gc2VuZCB0aGUgUFIgc29vbi4gVGhlIGlzc3VlIHdpdGgg
c2lmaXZlX3UgYm9vdCB3YXMgaXQNCndhcyBmYWlsaW5nIHRoZSAzMiBiaXQgdGVzdCBlYXJsaWVy
IHJlc3VsdGluZyBhIDJNQiBhbGlnbmVkIGFkZHJlc3MNCmluc3RlYWQgb2YgNE1CLg0KDQpbMV0g
aHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNzY3
ODg2Lmh0bWwNCg0KPiBSZWdhcmRzLA0KPiBCaW4NCg0KLS0gDQpSZWdhcmRzLA0KQXRpc2gNCg==

