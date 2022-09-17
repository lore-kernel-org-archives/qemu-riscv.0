Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZM9B-0003IN-LR
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 20:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZM97-0003Gd-44; Fri, 16 Sep 2022 20:57:25 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:6154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=252df0604=wilfred.mallawa@wdc.com>)
 id 1oZM95-00060L-09; Fri, 16 Sep 2022 20:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663376241; x=1694912241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ODRf7u5nf866mkf2CoLSkvsp/5jCS40Nk7+8DEmQT34=;
 b=CQuJU3v+eFWm+e3ekD8QsfRFQ/lxpBe8e1hT5Kz/1yi24hBxpYrI9v8f
 9fKAeNcJWVD0gf1vKCfAIYCzw/8CJQQHVPPvY5uDZUmuPPCnvynR41/ZF
 e/JKkgxu05yWxPiOJwj7waKvOfpZm4DZ2L8LWi7gRofPsqnSDHEl7L59V
 6qdNdOJkc+mNkM3Ubz1AePH2gtcBNwe3jSlMZXtqkaR0TUXaGNeNOk89M
 8V6V77cd+HzZXaRacH97DvIKZ6k+VKRZJPCYhMbDyCvEcVXGfBxxcKXmc
 f2Ok+emtDcfeiFvO+p9Q+GMG1MyCqa64XUFzuau+kQ5QTNHFzpM4bbxBI A==;
X-IronPort-AV: E=Sophos;i="5.93,321,1654531200"; d="scan'208";a="216743605"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2022 08:57:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dY6bXfxfysozSSSO735lEw5jLOR4lfQZxPl3R7YZlsybAXaUA6qMS+PmYhbZMzFclO8FphiqyR01vVfWggqSU6Q/89nZZPbFXOCWEYSjHVzfGxCe/u22Y2zu/PkZ0jE+X1FLCJqnFxjBqH/gdw68N97ttbTHVEjR12S2ZWXTZP89Lsoyy92525I1tWfsZ+F/bOfPr1+qWPXka0ajYt7o2acfraPG5V+9SJgvZBtGx+e86bwXdHE87s3Csd75tCMdxfnp1pRdKFqz6qfcUyQ6pB440exuokPNxXidnSBAOSVtMMV7yofD2NFox5hsMSE0Oi7NNbGVLHU5k0OecpCzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODRf7u5nf866mkf2CoLSkvsp/5jCS40Nk7+8DEmQT34=;
 b=de0S57uMOOhQcz9tSxKn7gYuRsuBNF8zA2N5UgMnkoMyUyfOZzsfo7nGUCoHEjvJcvBslNAy3vgbWIEMNCQq6uNSFXRrjQIOh6ysplkPbHKuLUM1BVe8CLP+cMwQd4TrfiNw+En1sAciJ8QEZL9Vl+kmms5IeBYsCo/AB0Z7b8PkDpTHBUDWvmMFM5oJwdVTjHEnBqFwH/RXsN7CLoZa12AobEuhwWgNku9ooukWwLe/kIoMZjHmC+E4EjPmD6qrXkdfRPhyNyKM8NTyjxsBNfJObP8R8y4G5HHhWCuPqX/o4atUYw9pZzb2fo2gIKqE+oS80fM9OdMI4iaNlOe8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODRf7u5nf866mkf2CoLSkvsp/5jCS40Nk7+8DEmQT34=;
 b=scIDa6i7LQksA7b3V0sYhIRegBDFMsm1oE8wkDL5KMM9FARQmDBL5dkqlrOJcbip+mu1UHo+53n6hFFK0wcrANJ2SizWhHVzpwlBMV1mSz6ISk554Kt5daBQJV0TKdFj83SY60ZZB5c7yOGktZNhhiOoK1cp28C9OrmqmawaWis=
Received: from BL0PR04MB6546.namprd04.prod.outlook.com (2603:10b6:208:1c2::14)
 by DM8PR04MB8053.namprd04.prod.outlook.com (2603:10b6:8:c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Sat, 17 Sep 2022 00:57:15 +0000
Received: from BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319]) by BL0PR04MB6546.namprd04.prod.outlook.com
 ([fe80::6ef0:1511:8fe1:d319%7]) with mapi id 15.20.5632.017; Sat, 17 Sep 2022
 00:57:14 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "palmer@dabbelt.com" <palmer@dabbelt.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>
Subject: Re: [PATCH 3/3] hw/riscv: opentitan: Expose the resetvec as a SoC
 property
Thread-Topic: [PATCH 3/3] hw/riscv: opentitan: Expose the resetvec as a SoC
 property
Thread-Index: AQHYyCPIKlUgLxq54EKz+zHh/78XUa3i0I8A
Date: Sat, 17 Sep 2022 00:57:14 +0000
Message-ID: <b83a1e4a877406d57302b414d0bf68ec8d2bb241.camel@wdc.com>
References: <20220914101108.82571-1-alistair.francis@wdc.com>
 <20220914101108.82571-4-alistair.francis@wdc.com>
In-Reply-To: <20220914101108.82571-4-alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR04MB6546:EE_|DM8PR04MB8053:EE_
x-ms-office365-filtering-correlation-id: eccb4879-9ae7-42b0-079d-08da98478fd6
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CY1riKv/FrmhlhDHkmmCkHVuiOcKaqWcSUhatIsGbbbonNnTzdCp8XVu367yM3wO8kGFktEopVvHWYuq8znW6eWTJejaZa+xETE6CR6iIPe7vMGZovIXKCgVuetZR3wn0rB1EGhatPnpLNYSavJDt9dur6ZftVAeJK6Irw2cGvNC9GlNVoqFwLStcC+N7usVOfxpVby+zbXQZKuug7DIpcLednEWUr0Ylcfq6+WwhE1i3qBARDanbj1Iu5fktXgxYDBw5yS2jq1ZSgI7PpI/Mb0nBPx8RMAFjCGWg/pm7thdIY69UqtzTRvrNxZ8ig0jTgyMUx3YEylctkn0KZYWHWlLutzAnpDsNgIV5hqEpq3RktXRDpYWxDbyWRi4IraEgvkYV1x1DHbJHz/x/Tx7p6b0sYLkbf2T85/uiR23AyY0cvM/v1bFxnGrEXjDddMsigU5o6uMtiz4UDlp4qiB9+FxTbA2Q//A89v4wk0rqGRU7wipfGHJ1F1Y1qgPTSaO5gqeFeagYR8XZvdguYwJItPkQ0g4fw8IKIA2blKMb11TeBUiO9me04Ls1VyN4pyN+3FXpiVOFYcvdIVLIMJYhAux+S18XTOotSDapvMj6VLA+dvB5gnU752eI1eQLe5gs1fz/0HDguxoKna00pu7P6LtPafOmaF1sZbRYBGlO/NKR/eKvAy94rsiToRjCqeCpknhQfLseMv+EU7XxMWED7WD77xA1sp7cHEp7vJTsRQtXGpV2Q71xVtcwBomymAd/1zvFYwtHnBz8Lsr81TfJMZKEtoFJyujxS2hm3GzotA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6546.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(83380400001)(2906002)(54906003)(44832011)(41300700001)(64756008)(6486002)(6512007)(71200400001)(4326008)(26005)(36756003)(76116006)(2616005)(5660300002)(122000001)(82960400001)(478600001)(110136005)(8676002)(966005)(66946007)(186003)(316002)(66446008)(8936002)(66476007)(6506007)(38070700005)(38100700002)(91956017)(66556008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVgrWUx2a29hdlhYVGsxa2FiK3I4TlR1M2xqN3hXa2Nsa2xmRlNHQU9NUzZL?=
 =?utf-8?B?aTNiUU54cDVlbFovUFp6d1piTHZwYitzaW92ZXlqazRUcTVGRlY1a3oremRk?=
 =?utf-8?B?K1VFbjVtZkNoWHlxWTBmQzNld2xXK2lJSjVScUd0MlZhSzM3VDJ3ZVpTR2Ji?=
 =?utf-8?B?Rnd3cG5KMUxReU82NDRnR0M2ZFlXdFpzOVNSMnFmZFRCNGIwd2xKUFN0ZWRF?=
 =?utf-8?B?Vklqc25WNUFHYlJTMFhUWjJ3L3dXa1U0WjRrWW5FamlDb0puT0NESGUyZDA5?=
 =?utf-8?B?VldIOVVObys3ZnRQb3o4TkF2cEUyNGJ4YnJ0bFlvdGFSYTJXRW9seFVxaEE4?=
 =?utf-8?B?dFM5bkFWZEhrT2MydE1PNEd4ekdUWmN6RmZLQk5BMzU1VEg3Nng1RXNwNmNo?=
 =?utf-8?B?MkZDOXJreWVyY053V2dhN0s5RzZzem8veExtUmlwQWU4eWFSNUt6cStPL0dO?=
 =?utf-8?B?VFltd2pKYXhPQjdmSmdRV0xHN2IySkxvNmNONXRDdVJnUWNMaGNTNXhiNUJ1?=
 =?utf-8?B?TVU2d0NxWDR2Tkh6MjlCanN5cXlHbEMrNksrcmxiYkkxY0V4QkZCeWNJUFZ1?=
 =?utf-8?B?V3NRbDdnUWlTOUoxM3ZuOGh0M3BTcGdhTTFCNm5hU3FBeEx4MytxSTNDUmlU?=
 =?utf-8?B?V1ZlelhIR1k1bzZmMXd4NXYrbEFmRWdJWi81WXFPQ2xXZDFZL2JIWjFpYTIy?=
 =?utf-8?B?M1RCbDZteFc0RDhiays1S3dYMVJESkFKMXVNS3FWUUZKa0JYQ1gwNG5TRHFT?=
 =?utf-8?B?dC9nWm5vSDRuYjJkbnNzdXg5WjBPSy90L2hybkZXTUtLUXZZU1M0L1VtOWh6?=
 =?utf-8?B?Z3JiQ0NlVGxBNVZmUUdtZGg5NGlOODVnOVdkQ2V0eC9CQlYxdlIxOCtJS1Rk?=
 =?utf-8?B?dGtDOFJnZGRuNDFpelo0T0NreGEvS0ozcEdwaDh5eGtvMHNqQVhJNXJiS0FD?=
 =?utf-8?B?b1hiUllKY3dsZEFuOEgxUEZTdnpVWmhoQnpFYzhTTkRzZEc4WXlrWjRPSmVU?=
 =?utf-8?B?L3lhbE5NZmZraTRhazFwekY4WVJSWmw1dDhxdVgyQTFZRy9qMG1makdLM2x5?=
 =?utf-8?B?MVgwNG9BR0EwM2xUQTdaWDY4ZmsrdG9VR2ZaN2lYbTlSMFJucXR2SGUrbXE5?=
 =?utf-8?B?ZjJ2WmxiZncyRnphL09JN3FZdXBmSjdtOXBSOTViVnVSalh4cnBFaFNGSVFW?=
 =?utf-8?B?UVU5R1hybkRSeGRLV1hFUFJXSnc4a3orM2VWRThVWmwvTzMxV04wZEpBTjJF?=
 =?utf-8?B?ZTByaGhHRVl5Wm5YZ2RjUExxVHpLaGpWNGRyMHBqc0dOaCtaUGtkL1dpaDJk?=
 =?utf-8?B?eWRUbTFoTjhuRE03aS8zTnAvTCs5ekp4MCt5V25nM3Z5SmcyTkZHSG9heEx3?=
 =?utf-8?B?RVNUNUZ2Wnp2MUdrNWp5OGJ6bFlxUUZBWXFjTDBEeUFlZTRJdGVjOTRQYXZu?=
 =?utf-8?B?dlJRQWsweTM2b2NUVUxYWGVwdUpXV01RU0FrUXJnWlg5L1VNcFgzRitwR2l3?=
 =?utf-8?B?S2pZZlN2QWU2cUhhanpxb2tYNGlCQnRjc3N5T3JWYmtzOFdOa0FVWHBLVEVx?=
 =?utf-8?B?YlJmMGhHb3lYb2F4Ym5TM25RSk1xN2tyTjVGOUh5Q05ESVBKOHEyeDBUVWoy?=
 =?utf-8?B?SmRNRVUybDNLOGRlRlorTGQ5dWE5c1pOOXpOZjNBalJiM2owYUhZTTBhMkJl?=
 =?utf-8?B?UVNHUGRSSzJqWnIwS0ExWlV4S0YwVEFtRHpLNGtxNFN3R2YyTWl2WC9IRlNT?=
 =?utf-8?B?TzkxWlVqb2lWcUFyQmc3aGdRZ0kvM2ZFRlB0YnhrbERCTkNUSzFWdFkwcVhH?=
 =?utf-8?B?YkRCZTdSYkNTUTNBc1J2bDdmc0VPdXphRVlzcDZrVXZJNUFvakl6MnBMRmhz?=
 =?utf-8?B?S2NUdjNGbE8wM2ZTaG1kODRPcGluK0RxLzJrSkwzeU5lUlBHVGxwL3B6ZXFY?=
 =?utf-8?B?aDdJY05FajRiamdPbjhhV280aXI5ZDVDYkZCWkdMWGczUnFkMXVNVWhTbUFT?=
 =?utf-8?B?WGxJMVRQSVRIQ0tJeE9IRHhNU2VGb0hacVZTMERyYmYxSm5YUnZ3d1UrQWM0?=
 =?utf-8?B?TmVSeEFTTWFBRk9VdEUxMjZMVGV5cCtlOGwrWUlUT3Y2MzROSmFZbElDUk1Z?=
 =?utf-8?B?QTZZbzl2QkxOWi9UWU4xcVZoL1dkTUhMRnJxVE90Z3BpdUFEVWFRYjRPTS81?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39F7D3813764CA47A91A17CA77D40344@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6546.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eccb4879-9ae7-42b0-079d-08da98478fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2022 00:57:14.9302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tE1dX2ZPk3Zy59V7CKt2B1FHoX4QseNBlTDCrT33EtY+0gcSqpI+JB0jdFwAtYJgSQud92hvK6oONNN6SEiZng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8053
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=252df0604=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Sat, 17 Sep 2022 00:57:25 -0000

T24gV2VkLCAyMDIyLTA5LTE0IGF0IDEyOjExICswMjAwLCBBbGlzdGFpciBGcmFuY2lzIHZpYSB3
cm90ZToNCj4gT24gdGhlIE9wZW5UaXRhbiBoYXJkd2FyZSB0aGUgcmVzZXR2ZWMgaXMgZml4ZWQg
YXQgdGhlIHN0YXJ0IG9mIFJPTS4NCj4gSW4NCj4gUUVNVSB3ZSBkb24ndCBydW4gdGhlIFJPTSBj
b2RlIGFuZCBpbnN0ZWFkIGp1c3QganVtcCB0byB0aGUgbmV4dA0KPiBzdGFnZS4NCj4gVGhpcyBt
ZWFucyB3ZSBuZWVkIHRvIGJlIGEgbGl0dGxlIG1vcmUgZmxleGlibGUgYWJvdXQgd2hhdCB0aGUN
Cj4gcmVzZXR2ZWMNCj4gaXMuDQo+IA0KPiBUaGlzIHBhdGNoIGFsbG93cyB1cyB0byBzZXQgdGhl
IHJlc2V0dmVjIGZyb20gdGhlIGNvbW1hbmQgbGluZSB3aXRoDQo+IHNvbWV0aGluZyBsaWtlIHRo
aXM6DQo+IMKgwqDCoCAtZ2xvYmFsDQo+IGRyaXZlcj1yaXNjdi5sb3dyaXNjLmliZXguc29jLHBy
b3BlcnR5PXJlc2V0dmVjLHZhbHVlPTB4MjAwMDA0MDANCj4gDQo+IFRoaXMgd2F5IGFzIHRoZSBu
ZXh0IHN0YWdlIGNoYW5nZXMgd2UgY2FuIHVwZGF0ZSB0aGUgcmVzZXR2ZWMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+
IC0tLQ0KPiDCoGluY2x1ZGUvaHcvcmlzY3Yvb3BlbnRpdGFuLmggfCAyICsrDQo+IMKgaHcvcmlz
Y3Yvb3BlbnRpdGFuLmPCoMKgwqDCoMKgwqDCoMKgIHwgOCArKysrKysrLQ0KPiDCoDIgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9ody9yaXNjdi9vcGVudGl0YW4uaA0KPiBiL2luY2x1ZGUvaHcvcmlzY3Yvb3Bl
bnRpdGFuLmgNCj4gaW5kZXggMjZkOTYwZjI4OC4uNjY2NWNkNTc5NCAxMDA2NDQNCj4gLS0tIGEv
aW5jbHVkZS9ody9yaXNjdi9vcGVudGl0YW4uaA0KPiArKysgYi9pbmNsdWRlL2h3L3Jpc2N2L29w
ZW50aXRhbi5oDQo+IEBAIC00Niw2ICs0Niw4IEBAIHN0cnVjdCBMb3dSSVNDSWJleFNvQ1N0YXRl
IHsNCj4gwqDCoMKgwqAgSWJleFRpbWVyU3RhdGUgdGltZXI7DQo+IMKgwqDCoMKgIEliZXhTUElI
b3N0U3RhdGUgc3BpX2hvc3RbT1BFTlRJVEFOX05VTV9TUElfSE9TVFNdOw0KPiDCoA0KPiArwqDC
oMKgIHVpbnQzMl90IHJlc2V0dmVjOw0KPiArDQo+IMKgwqDCoMKgIE1lbW9yeVJlZ2lvbiBmbGFz
aF9tZW07DQo+IMKgwqDCoMKgIE1lbW9yeVJlZ2lvbiByb207DQo+IMKgwqDCoMKgIE1lbW9yeVJl
Z2lvbiBmbGFzaF9hbGlhczsNCj4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L29wZW50aXRhbi5jIGIv
aHcvcmlzY3Yvb3BlbnRpdGFuLmMNCj4gaW5kZXggNDVjOTJjOWJiYy4uYmU3ZmYxZWVhMCAxMDA2
NDQNCj4gLS0tIGEvaHcvcmlzY3Yvb3BlbnRpdGFuLmMNCj4gKysrIGIvaHcvcmlzY3Yvb3BlbnRp
dGFuLmMNCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBzdGF0aWMgdm9pZCBsb3dyaXNjX2liZXhfc29j
X3JlYWxpemUoRGV2aWNlU3RhdGUNCj4gKmRldl9zb2MsIEVycm9yICoqZXJycCkNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmVycm9y
X2Fib3J0KTsNCj4gwqDCoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5j
cHVzKSwgIm51bS1oYXJ0cyIsIG1zLQ0KPiA+c21wLmNwdXMsDQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZlcnJvcl9hYm9ydCk7DQo+
IC3CoMKgwqAgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5jcHVzKSwgInJlc2V0
dmVjIiwNCj4gMHgyMDAwMDQwMCwNCj4gK8KgwqDCoCBvYmplY3RfcHJvcGVydHlfc2V0X2ludChP
QkpFQ1QoJnMtPmNwdXMpLCAicmVzZXR2ZWMiLCBzLQ0KPiA+cmVzZXR2ZWMsDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZlcnJvcl9h
Ym9ydCk7DQo+IMKgwqDCoMKgIHN5c2J1c19yZWFsaXplKFNZU19CVVNfREVWSUNFKCZzLT5jcHVz
KSwgJmVycm9yX2ZhdGFsKTsNCj4gwqANCj4gQEAgLTI5NywxMCArMjk3LDE2IEBAIHN0YXRpYyB2
b2lkDQo+IGxvd3Jpc2NfaWJleF9zb2NfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2X3NvYywgRXJy
b3IgKiplcnJwKQ0KPiDCoMKgwqDCoMKgwqDCoMKgIG1lbW1hcFtJQkVYX0RFVl9QRVJJXS5iYXNl
LCBtZW1tYXBbSUJFWF9ERVZfUEVSSV0uc2l6ZSk7DQo+IMKgfQ0KPiDCoA0KPiArc3RhdGljIFBy
b3BlcnR5IGxvd3Jpc2NfaWJleF9zb2NfcHJvcHNbXSA9IHsNCj4gK8KgwqDCoCBERUZJTkVfUFJP
UF9VSU5UMzIoInJlc2V0dmVjIiwgTG93UklTQ0liZXhTb0NTdGF0ZSwgcmVzZXR2ZWMsDQo+IDB4
MjAwMDA0MDApLA0KPiArwqDCoMKgIERFRklORV9QUk9QX0VORF9PRl9MSVNUKCkNCj4gK307DQo+
ICsNCj4gwqBzdGF0aWMgdm9pZCBsb3dyaXNjX2liZXhfc29jX2NsYXNzX2luaXQoT2JqZWN0Q2xh
c3MgKm9jLCB2b2lkICpkYXRhKQ0KPiDCoHsNCj4gwqDCoMKgwqAgRGV2aWNlQ2xhc3MgKmRjID0g
REVWSUNFX0NMQVNTKG9jKTsNCj4gwqANCj4gK8KgwqDCoCBkZXZpY2VfY2xhc3Nfc2V0X3Byb3Bz
KGRjLCBsb3dyaXNjX2liZXhfc29jX3Byb3BzKTsNCj4gwqDCoMKgwqAgZGMtPnJlYWxpemUgPSBs
b3dyaXNjX2liZXhfc29jX3JlYWxpemU7DQo+IMKgwqDCoMKgIC8qIFJlYXNvbjogVXNlcyBzZXJp
YWxfaGRzIGluIHJlYWxpemUgZnVuY3Rpb24sIHRodXMgY2FuJ3QgYmUNCj4gdXNlZCB0d2ljZSAq
Lw0KPiDCoMKgwqDCoCBkYy0+dXNlcl9jcmVhdGFibGUgPSBmYWxzZTsNCg0KTmljZSEgSSB0ZXN0
ZWQgdGhpcyBvbiBodHRwczovL2dpdGh1Yi5jb20vdG9jay90b2NrL3B1bGwvMzA1NiAsIHdpdGgN
CnRoZSBhZGRpdGlvbiBvZiBgZ2xvYmFsDQpkcml2ZXI9cmlzY3YubG93cmlzYy5pYmV4LnNvYyxw
cm9wZXJ0eT1yZXNldHZlYyx2YWx1ZT0weDIwMDAwNDUwIGANCg0KQWxvdCBtb3JlIGNvbnZpZW5p
ZW50IHdpdGggdGhpcyBwYXRjaCBmb3Igd2hlbiB0aGUgZW50cnkgcG9pbnQgY2hhbmdlcywNCndp
bGwgbG9vayBpbnRvIHBhcnNpbmcgdGhlIG1hbmlmZXN0IHRvIGR5bmFtaWNhbGx5IHNldCBpdCEg
DQoNClJldmlld2VkIGJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29t
Pg0KDQo=

