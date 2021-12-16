Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxkBh-0007QM-4n
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 01:24:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9778c6138=Alistair.Francis@wdc.com>)
 id 1mxkBb-0007PK-CF
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 01:24:16 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9778c6138=Alistair.Francis@wdc.com>)
 id 1mxkBY-0001HO-GY
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 01:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639635851; x=1671171851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gWSpFakTb9wd+HPz+djjW5M7hh/TnzruIEtrfg+1gIo=;
 b=UGps6x/3I5uaFVuBf+08JfBqj4Ije2yjpkmrgr6jlpw18YADvgKtzjyE
 5zLDhChh5fgmHFCxkQT3YMmcYLPJXwV8dsvq/hN8KIIGWU9hCGXodGwl6
 aL/nImMxhAEsuFENuH5vSFs7VBiaD1odP0NPvZpqnbdWwtVQA+/k2kR+9
 5qf4R6xrEpxJaHYgb2qvHmCczeuIBe35oyqtmh/n801Gzxttxf/dhHbZ2
 oc9T3Y+/Xdcs050pzT5Ky+m9M25S8OOHKLU6LcnVhjAsZVGctn7Wh+y0v
 tCJovcua9rNFItI7tLYSLSAsO05yVdnYDPSWiRHHjbUcULh7dYz1VqRWJ g==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="188380605"
Received: from mail-bn1nam07lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 14:24:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzogLep3fnxv2IjzyG5QheTCWeOGHaJYLzvH1/IPwg/HXyT9aaXVf4P4DkS9mMhhJTVecMTSaItQtQRB69ydQ9unYhNbH0X3jUGcjfFeTJ0d7b1R2ltFBrRttm6KQF9IO+t/nwrhbBuHd8PyCU3GDSMmpuncF6YmRDns0rlnDyk5/B2v3AvBD5lERmFt7z4vzmqCzSfXYVPDG5A2ZMMkh1cjq93Tk5fayiyizLAH4oG8Y6GPRNquccjZRUqIK+pg5AUbzc/9sJbc/FQgLz62PIAVZ9jGZLYl0GRk4Xf7aXQ1VjvOk+a+ubDRbXFCANQyXQyzYOQ6GnroHyZ8JU/iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWSpFakTb9wd+HPz+djjW5M7hh/TnzruIEtrfg+1gIo=;
 b=FTXqWQXPYQ1d5kmsz6mnjd9CyMKqlv9UcVnPiCVlRS/R76bLY8qkiiQViIMrCu7pHf9AZgPhQafnLV0IsM0uoHqZ3mux8buljGdNxthc/C3fCMs6beSQ6UD2yNsPIQyfuZ0T7wGT7OxhPkXo1ILWmZiq6hsHlYrqUXVxpKXM+Q5RA+okwp3qJZcNm116Mov5KKF2Mu456m/c5+6ESdo1yFPV04LZRNXkAjYaKId9IPzcFlpwCW3WC69udAuxYD3pzD6R9g9toxKsFx29NxE4+USa/aYuLpd89H2W5q+CJ0NLvmkAXNulEoMK0E/nljsisIilvPdPEnTkySwPYzq75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWSpFakTb9wd+HPz+djjW5M7hh/TnzruIEtrfg+1gIo=;
 b=Zat/suU8A0CO7TZz8XaPkmhjL4TRPtIG6N8v2LZwpPtM56ZpF6rBFgJQGt9g3yiHr61Tl+0rbRmRxHpPq97U8qi8i7LQSh4XyNRSsCd3SMv/Gy3CQFf0YBRDxQcn8OQ/4CQfESuH1SzGUog2/Ms+kpJFwjP0Gi1Y8LNcAuAIcLw=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by SJ0PR04MB8245.namprd04.prod.outlook.com (2603:10b6:a03:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 06:24:08 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::ed1f:f226:90c0:eb0c]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::ed1f:f226:90c0:eb0c%4]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 06:24:07 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>, "raj.khem@gmail.com"
 <raj.khem@gmail.com>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>
Subject: Re: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
Thread-Topic: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
Thread-Index: AQHX8djeZNzWmoX1Ckmq5H6CTyzY/awz2NqAgADOgIA=
Date: Thu, 16 Dec 2021 06:24:07 +0000
Message-ID: <aa5be67a3b23b45254cebc90c28e3f5fc42e88c7.camel@wdc.com>
References: <mhng-65f14cf7-b8bd-4ee3-a4f8-5f288cab7c30@palmer-ri-x1c9>
In-Reply-To: <mhng-65f14cf7-b8bd-4ee3-a4f8-5f288cab7c30@palmer-ri-x1c9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (flatpak git) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff663154-48c2-43f0-8813-08d9c05caa81
x-ms-traffictypediagnostic: SJ0PR04MB8245:EE_
x-microsoft-antispam-prvs: <SJ0PR04MB8245E1A3C59D9DAC0928085B90779@SJ0PR04MB8245.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zPV+P766z+FsAwrkZIuzt3mxQK16e8163NQxCylv15I9hG9tEBgLEJ94mB8Ggo/NGLJZcGWw28ySmxqcR1GAnsbqzAcQlqIMUez43ZtxlUXemCYfPTrYRP0jtzRWTtVJZ/vPbBJMnE+eC+NqZGK6vs1UkBhMGfjmLStat/S2adY9ORoyurGSwFI5Ip+LP+2iCdgyEYyRO8+Vc+H7OAg1r0k/4sc5i84i3KwU3lFsWqwLxl10LdltmRbkBDd+Eda3qSVlqXiUv0r2Oiw56RclEAMCZF7ClkhdPsFvoZaZkncWRklNT5EmrkjCnczOqwIoEdJsAuzUwyLC0bHWqyfeQVew/aAbOf5u/84wwxCv6HATnuK6pqNPT6vePNhObQIqxHeq1OXdTRIQF6uG4uM51VAlowXDcgiPNvOtmcmcqgaQBLDOGvLBKNGKo0+uMEQP5bPplZp+bMCrpqdHG5hQJ/psMaJ5kMcyUQyhJhtU10LF/94tSq/QMVAhCyJVkp5Ywk/eDEvp0k2vjsBtb9X2rzVy+1RVEK4tjg7X0I4THScNpoduUtXkJwDEVpNce+6AzCGvvwCokhlO/FquwPdMmyj1upBEIlqmesLLcfxe3d2wlrOCR05U6zZgLlYGJz2qYk1+un7zGZO6hByfyM+R2mX7NZjei+KAf1hXmCPTXQk26jdqW9Vtz/2rbEVB1W9MOCBFeVspMe3wfi4MI60cwNDEz0vg51ZRJKCDsLn1pgQlBm3J9MwuGBykH+tZhXbQvZhH4Wu0BS4UB/pAtbc7d8kUNnpzUEg+hau9Te4wQcahErfFYikzvsmIMNDkE7AzHMglf5uKF/zdhhmqOEAnwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2616005)(66476007)(4326008)(316002)(82960400001)(91956017)(8936002)(66556008)(186003)(64756008)(38100700002)(36756003)(76116006)(26005)(66946007)(83380400001)(86362001)(110136005)(4001150100001)(8676002)(5660300002)(2906002)(66446008)(38070700005)(6512007)(6486002)(54906003)(966005)(71200400001)(6506007)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVdPK1pzNjR6SzdocG9abEFNSDAvMDU5NFRYci9LQXhRQ3NWL0p3d1dEd0VP?=
 =?utf-8?B?NmJvWTdVMGJEMTQ2Nm9yR20weWZ1elJLVWpZYVFETmZNNFFxaFNrbVYxR3Bw?=
 =?utf-8?B?ZDF1eG9kdEdvMU1helJZQUNxSGtBSFA1Y3V3SURMZm1jN25wVTdqQmVXK0dL?=
 =?utf-8?B?OW5UaCt1OU1DZk5EY2JUSElleHA1SU5RNWQ4N2xQLzJKdGZPaXZTSVJKMlIx?=
 =?utf-8?B?ODA3SkEyZnpjTFlRRzJLUUVCVzdOZXVEWmRWcFZzVFB1ZHEreGo2TkFuRi9x?=
 =?utf-8?B?R09ROW44eGphemdHWGtvRXlteG1LWGF2SmR3eHgrUklBTzl4MFUvUFJ5ZFJQ?=
 =?utf-8?B?MjkvcHptRkQyT25GQ2E1TElIbjNXbDBPVTEyclFwc3dWVkF1dVV6VC9VTVlR?=
 =?utf-8?B?dFJlYmJLRUlacnZjdVJWdUV4SHIzRWR5NzY0cExTOXM2OTVsSXBvanYrendi?=
 =?utf-8?B?OUVDTllmdFVFZjFqWm5qNytWczFsZ3BkRlI4dFBacUJLRTlXOSsvdisrTzZD?=
 =?utf-8?B?aE5NcTBFU0duOS9pd1duUXlxYnRORTA0cTZFWUJ4ZXZweGF2ZlhEeDlaNVo1?=
 =?utf-8?B?QjN2ejc5MlRVYTUvT1BObmsvWGxaRnUzWDdIVjlVcEhVcHRuUFE0NC90STdG?=
 =?utf-8?B?dVdiVHR3cVBEaEpCbmZvQWZRdTNxZUJWaXplNzB2YmtIZFI5MDA0ZTFCSG5Q?=
 =?utf-8?B?YjNFd3B3MkFuVUhaYnRCamU4bTlBOXpUd3BGQjRkNXVMVzZLY1QyUUJoSWRn?=
 =?utf-8?B?Y3YxWnIwRUdnYnBtQVNGdkJ6WFVuWFdSaVlPeTVmbFdWdWdzdEM1SVRFMlJP?=
 =?utf-8?B?WkRaZCtEK0k2Uzd4anRhcy9xT2pIOFNyUzYrZFIxMllsdnNuc3A4SkpaNTZs?=
 =?utf-8?B?UWgvc3BDQ1hiQVU0UldCeXZqKzljRXhwZmROUGkwNU5URFF3NWRGNDRlZmcw?=
 =?utf-8?B?MG16d3c5YVdBOTNxUjVUVVRCNTl6amNRUE84MktheTlncUZpVURGYlYyR1F6?=
 =?utf-8?B?TWRFMGlVcUNIV3RNQnBuc0JTUXpHVHIyTHJJRldzZUlBTjE4eDRVT1p3dFQ0?=
 =?utf-8?B?cm85RWFSZ1d4WHdGSWprSDhTTTdSZ0wxbXB1NEY4c2J0U3E1ZGppSzBhRlpB?=
 =?utf-8?B?NHhjOTFROHJIVFZTdHN5bW41TndVM3c3OUd3a09IY3hUdVZwMVk4ZjJ3V3RK?=
 =?utf-8?B?dURmdDlvTmZSbUNoVzJSL2JLOUtsRUhJcU00clRKQUgvdFJmUDluSXlpdGRr?=
 =?utf-8?B?NW52Z2gzRFc4RFV6RGN3V3dyaE1PYnhCaW9HeGlBVGplOU1acklQYUVWK0NC?=
 =?utf-8?B?dXhBT1pRYlVsTWZIaldkLzFaZW56bUdpa2E1eXlrUmFlZUZGaGRqbVNTMnZE?=
 =?utf-8?B?TkJDZFl4djVJbU1Rby9WWWZwVU5MRTJpMGZYMnFPWTZTUkM5dmZvRk0zUFNT?=
 =?utf-8?B?RnhxSDhtTkxwMW4ySUQ0ZzhjMHo0VHZvWElvdFpxZ0RPelVQZjdCTWV5TmFs?=
 =?utf-8?B?eWRkNjdvRWgzYXB3dTdxejIxMnVQTGkybGU4SDRGNWpReURMbi9IL2NDQm41?=
 =?utf-8?B?U1RXS09lbFZCYzlnaHhCdUFrY2RnTFlzZnlFZ21uNnhYRE1FWEVIWW5xalBZ?=
 =?utf-8?B?ZkxucjNOOE4rMG4ySUtBWlJPbzlCNktxSjNWZVVSQ1VUWUE5QWNqeGlqUFJC?=
 =?utf-8?B?ZzJhWjNRczhTU1YxNENIRjJrbjQyVlFyS2YzNElOT2lzMEsvMGYybmdHdC9R?=
 =?utf-8?B?YmZkNy9uVlNScW1MdkdFekxuMmg3SUllbmNUMjMzMU02Njh4d3Frc1V3SnBS?=
 =?utf-8?B?QkhiMVpNcXNZNmxsMk05SzhhNHNPZzhNeXJ2ZEV4KzB5MjFUak1FR3hqSmI5?=
 =?utf-8?B?YkpDMmxzait5eC92eS9uNStETXArRXZLVlptT3hmRkFmeXpLaW5QcmpFczlO?=
 =?utf-8?B?QmVOb3hHK0UxbEFzczlMN0hYQ3dDdWMvMmE1eWVCd1d1V3kzcDY0WU9YR3RT?=
 =?utf-8?B?N1lRUUwxMFJlTDNYZ281RE1FaVJlMnhOQmZWL3FVR21OOS9HWHd5YjlIdmZP?=
 =?utf-8?B?WXdQR2NPTU8xZStsV3dhOXZ5Vjdlb3ovY1Z6OVhsQXI4VHNQS2l2SE1VbE1m?=
 =?utf-8?B?L2IrSDZnek56V3V4SHl2dXRLTExwSVZTUUhDZXRlVUwrM1N4aFFkSzJ5aUhY?=
 =?utf-8?B?SWhFalNKb1hxQ3FpSVk0YzhXYkdDQ1A2VVZvWFQzSXNpeFNnQlkraUphK2Vs?=
 =?utf-8?Q?0GmgtVwi3yy5kpsNAC3B9BBKoGaMyI0TKB7jpQN7ZE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6D85695EE4CC549A2B69A425C699FD8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff663154-48c2-43f0-8813-08d9c05caa81
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 06:24:07.8213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSBxKt9tVYnUhdksy+8oQhcdWgIpGLYW0m/hIM0KT/csRd1aLlVOZ+IiLv9yUCCm0uMa+NCr7Qk/x/wVCfnBuSDvAR5qDbsAc+1DPy0QVy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8245
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9778c6138=Alistair.Francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Dec 2021 06:24:18 -0000

T24gV2VkLCAyMDIxLTEyLTE1IGF0IDEwOjA0IC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gT24gV2VkLCAxNSBEZWMgMjAyMSAwOToyNjowOCBQU1QgKC0wODAwKSwgS2hlbSBSYWogd3Jv
dGU6DQo+ID4gNS40IGlzIGZpcnN0IHN0YWJsZSBBUEkgYXMgZmFyIGFzIHJ2MzIgaXMgY29uY2Vy
bmVkIHNlZSBbMV0NCj4gPiANCj4gPiBbMV0NCj4gPiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dp
dC8/cD1nbGliYy5naXQ7YT1jb21taXQ7aD03YTU1ZGQzZmI2ZDJjMzA3YTAwMmExNjc3NmJlODQz
MTBiOWM4OTg5DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4NCj4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4NCj4g
PiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KPiA+IENj
OiBCaW4gTWVuZyA8YmluLm1lbmdAd2luZHJpdmVyLmNvbT4NCg0KVGhhbmtzIGZvciB0aGUgcGF0
Y2ghDQoNCkNhbiB5b3UgcGxlYXNlIHNlbmQgdGhlIHBhdGNoIHRvIHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZyBhcyB3ZWxsPw0KDQpBbGlzdGFpcg0KDQo+ID4gLS0tDQo+ID4gwqBsaW51eC11c2VyL3Jp
c2N2L3RhcmdldF9zeXNjYWxsLmggfCAzICsrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9saW51eC11
c2VyL3Jpc2N2L3RhcmdldF9zeXNjYWxsLmggYi9saW51eC0NCj4gPiB1c2VyL3Jpc2N2L3Rhcmdl
dF9zeXNjYWxsLmgNCj4gPiBpbmRleCBkYzU5N2M4OTcyLi45YjEzMTYxMzI0IDEwMDY0NA0KPiA+
IC0tLSBhL2xpbnV4LXVzZXIvcmlzY3YvdGFyZ2V0X3N5c2NhbGwuaA0KPiA+ICsrKyBiL2xpbnV4
LXVzZXIvcmlzY3YvdGFyZ2V0X3N5c2NhbGwuaA0KPiA+IEBAIC00NSwxMCArNDUsMTEgQEAgc3Ry
dWN0IHRhcmdldF9wdF9yZWdzIHsNCj4gPiANCj4gPiDCoCNpZmRlZiBUQVJHRVRfUklTQ1YzMg0K
PiA+IMKgI2RlZmluZSBVTkFNRV9NQUNISU5FICJyaXNjdjMyIg0KPiA+ICsjZGVmaW5lIFVOQU1F
X01JTklNVU1fUkVMRUFTRSAiNS40LjAiDQo+ID4gwqAjZWxzZQ0KPiA+IMKgI2RlZmluZSBVTkFN
RV9NQUNISU5FICJyaXNjdjY0Ig0KPiA+IC0jZW5kaWYNCj4gPiDCoCNkZWZpbmUgVU5BTUVfTUlO
SU1VTV9SRUxFQVNFICI0LjE1LjAiDQo+ID4gKyNlbmRpZg0KPiA+IA0KPiA+IMKgI2RlZmluZSBU
QVJHRVRfTUlOU0lHU1RLU1ogMjA0OA0KPiA+IMKgI2RlZmluZSBUQVJHRVRfTUNMX0NVUlJFTlQg
MQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pg0KPiANCj4gVGhhbmtzIQ0KDQo=

