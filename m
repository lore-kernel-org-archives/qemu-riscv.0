Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozlOp-0006W1-Fu
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 16:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozlOn-0006VX-KX; Mon, 28 Nov 2022 16:10:45 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozlOl-0001Ra-Ci; Mon, 28 Nov 2022 16:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669669843; x=1701205843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9MXSzNh3cRm8f5yK8Zlpjm3i8yccrYerBkuoXksJl8Y=;
 b=EhbBdECq8qN/9VDUqxEW9Tscg4ZJeEahXtOp3CMtcbV/kodtT5hNaZFv
 GVHRz/nyfEp42I+wxh0yZ0pGpckh+aOxbdIIkabqxuWA+UelVAiZ2OWsd
 shePM/sn9ecJ+VYzx56K2nfDpKNNH0Kr6ZZrKvQ/dcjiC88AMq59/pCzD
 N6sB2/IAzMOHWHGZ2tg+OI0QIfrMaK0GHw9J9g/CPQ3AbzaLrHw1xWF+a
 wpH1T0zl+5K63x3iDWTObqk4Hev8mweROFFd9nJJjBUvFKwJPuQXYP7fa
 C4PY/+Zm4oTA0tzWKVpXdtJU2aj4jFiCsgPjnSr6474Ro2VU6HDEIeGmS A==;
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="189038704"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2022 14:10:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 28 Nov 2022 14:10:05 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 28 Nov 2022 14:10:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7Slpc11CsEdabDcKD4sF2RdG6NG5qXm1+1kpmlyF8kW/kir3LQVKFJi1Yw87bDSmyztxVCqKGVX6CNgC0lBrtZZMXdEJuvwn7dOSdKeNcGjac+CjnIj0BsLiJRrbAw1cC04Br9nkxBPuH7axsmWm4ZmFivhyJDqrNfzpTwCMDvaqCyZ1fIbJ2RvgVPAtAFPleCjl/vX+ZStG7yXuRsDmxk9Ct1f3xrHLLlEMKafLfJHqd6kocwwDOUaiAhLYAoogaxFjVjS+yo2rjkOsNTx96Dw/5HE9m5YCUozcsTdk4VGnbu8B2elU2GqCKvA7Cy6VbfNj/R3XTDDku7NhkBl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MXSzNh3cRm8f5yK8Zlpjm3i8yccrYerBkuoXksJl8Y=;
 b=JLL7ZOzN4s1WO78WeBs3t4KW3h7jurkVC7HGe8uykAZmSU19Mhv5SNpv4/xM/WHbuod1pCmMzD8GQSpz+pF9z7VyzZokLElT+vKC3enWcOyU56vq0F5vxDQ/eu2TtS7dY96Alxf2EnOYMHaOsBGtgwCcUMsPYlkvtpqmYCU6ihuECuQKxSpY1IIKHTOaycfUQEAoPB5I+I6hyLoibrHkUJMDaE02yGyXfXM2ni/A2QNDmEyPCK2ikvFkjOt9QaVTemSiDpdN+IitmR6Ae5X3F3ru3BZRI/VLhK2WbShrt5dKtZ/F61mSXoYvbFEtbR0DkAxnkImDjXHErTaJuTHC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MXSzNh3cRm8f5yK8Zlpjm3i8yccrYerBkuoXksJl8Y=;
 b=I0fsBFBU4j6aZiRuRVNxChaIsAD7RsQnknxDeb9geM+rl77pVuGbIhxmh9dmOJnzr4nMbF5qTaOfV1egnNVIbnvP5TBNyffwA+hsSSNsFQk//1DU9Lcj9N3by48gw5dWlMlC1N0HA3JURgDzapTospQv7vIqrG1MPO+HtmRwFlQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 21:10:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 21:10:03 +0000
From: <Conor.Dooley@microchip.com>
To: <atishp@rivosinc.com>
CC: <qemu-devel@nongnu.org>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <palmer@dabbelt.com>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Thread-Topic: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device
 tree
Thread-Index: AQHZA2ZrKWGujbHaTkmukQtrcQh1RK5UzAKAgAAA1ICAAAftgA==
Date: Mon, 28 Nov 2022 21:10:03 +0000
Message-ID: <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com> <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
In-Reply-To: <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|PH8PR11MB7141:EE_
x-ms-office365-filtering-correlation-id: 02baaefb-4b09-42ef-9130-08dad184eb3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0cGBtwkhsQObxHh8nmneklcUqw+06eXikDDmZVNHxu3a6UraauEHMZxoUo1pqRWWT3kolhcEVZqpJkm57eLLDJWYfiYr+NrObrl4FGZANHgKOiLROrEpEwA2wuLKZxzgV7s52uL5pXNgKHcIOwpQrq+WAACTvyKqfTpejiTqG6hT9iwWSq2wCxO0tJsMwOn2euDVFMv0j1C9WsMvHRnlVMwmaUoKFAqqNQHtHMPw0M54KBNidcmnM1pJhwRJ9lX/U8DOHwqARAVP1HHYSrR4PAS26/txw2TzVAkIRYQhCCn9qBlvx8yTo8KU/vZaPKCr/qtlHRvL1+5DomgbPBaVQ3Vlky7YGdUrUBBlQxEGSWBDsWZMpvoXGC351z5w92SwxknsoCUatgSGI5o39J7gEtY3vvlQZNdGaDEtx5EQc6d3sklRW7GBJYdFVfkDkeBf220ITqWfT0sUwah0lIP9fB1kqoPt6H45HyYwDgmrvQTgZruvsXMBfibyBNGalV3Ew11Cj50Fm8JBeL+1EjeRq3FFTjnQtW4sqLH4Ni18OvsGGpS5QLX+OpWCKx58UpaCfDucegobCQM9ao0jAwA53bRP185h4odky1xyvtHA8+cpzVB2qW98myRiqm4ds4hit8sGQkOwJZMY4h5dfSv3UMzf0ieRKW6UHO3FxNsZnMSlr/qR5kVqFLSuWxJdODFnZSKDJ/uzushk845m2u++Sj+88UJKzHvQItfBCy03w/LBrxGcIDfBIbpvrBgH11bFCqrchLtARe4ET78sNaxYrDBcHH2wtunjTA3C2iEHrgA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(53546011)(83380400001)(2616005)(186003)(31696002)(86362001)(122000001)(38100700002)(38070700005)(36756003)(6916009)(316002)(2906002)(54906003)(64756008)(66556008)(66476007)(66946007)(76116006)(31686004)(41300700001)(4326008)(8676002)(8936002)(91956017)(5660300002)(66446008)(71200400001)(478600001)(6506007)(6512007)(26005)(6486002)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0tGcU5OUUltZ0dMQlh1OHF5R2NmY0ZqTUFHQnlwaW9OdXF3QnJhY1Y0UXdG?=
 =?utf-8?B?bFl4VGVRSWZOeCtaeEt4NUdBN1l3eHk3WlMrUkZScFByR1o1MDhnVGxvcUt1?=
 =?utf-8?B?cnpTNG5rZkVrTkJkTWpJNks3ZUFmdlZRR01hQ0ZEK2pDbXhJY3pVL3hJVkVE?=
 =?utf-8?B?dGZtc2FYSzlnaExUZ1ZwemJMdVlUQ0E3eGlVTG9NRzArSzFJVTBkRld5c3RY?=
 =?utf-8?B?RkpFVEhGZVB3bnVvRlFSTGNVYWJNbHFJbWhSR1dLQ0ljaUw0cUN5MTdweGZM?=
 =?utf-8?B?MmltOW90UHRUTXoyTEJxWG9Jc1h6RGZmSnlsMHIzRGZqcEJ6WDliK3Fyejc3?=
 =?utf-8?B?QkFvaTBkUkowM2lIRGxIMGpzNEtIYkh5RzFHZmwzaE11Q1JPemluSndHSVR6?=
 =?utf-8?B?OVRSWXRVanJPeWRiSzZyWUdzZ0tHV0FHaHBxTmdITzVQenovUDFkZGZrTG9F?=
 =?utf-8?B?RU8rUGZnTnhoNnRId0lBbTRPcC9ab0tGcGdKY1pRS0loYVVyaXMySE9wb0E3?=
 =?utf-8?B?ZGhBZWpoc20wWnJvRlNuZkFMczREMDdkamxlSEV2a28rT3lMWUM3RjFsU2x1?=
 =?utf-8?B?eHJSQ0J0V1hSTHBWaGJSTWJoYkhYRWR1SkRTM1hqZmQycUpqR1NFazRDVG5Q?=
 =?utf-8?B?bzJzZkF4WWVwbU5XS2FVSUtyVnVRZ0FXSWNJVkhjNnVZSGJ4WUlreGo1VDAr?=
 =?utf-8?B?aE9QZUxDNGlSaWhnWmdVOXNJUWdla3dzKzBja2dyVUpTbkFJVEVtRHcrY29t?=
 =?utf-8?B?R2d5aVc2eHN0eEdNN24zRmppYkxtWWlScUZSL1ZyMDFQdks3dHd0NDEwY21R?=
 =?utf-8?B?cnRuY3FwY1RWMEIvemx5QmFjYko1MWtrMGtiQzBZdTluZk1hWVRSaFBnUnRI?=
 =?utf-8?B?NjFOdHZZK3ZiOHhUdXpQM3dHSDk1bThBeERRSUdaQmJEcVpCd0k1amVHNUh6?=
 =?utf-8?B?U0poU25Kakh1WnUwcWZoSVNHZ05WZG8rVlZGTjQwcjZRZnNLU2tpR0R0M3Fu?=
 =?utf-8?B?cUdaQU8rV244QjFhYkkvQkVCelFDeWlxNnBIQk12dWhvbnNzak5lOW1lNVla?=
 =?utf-8?B?WTc5Ymp2R3dGdm9MMGZFTVF3V1BpWFpuSS81RFJSVUZmSFVIYkd1dW9YbDds?=
 =?utf-8?B?K0RaUk44M0UwS2hCS1VtSUgvZEx2cFdrNmxpYVc2OHFwL2pPcXJScHVCQ2pK?=
 =?utf-8?B?NXM3NGQwVU1JamxiTzRRb2w3MXNsQzZGQU5Ndk56Z3hsQ0JsODFJVi9UeGJL?=
 =?utf-8?B?c2ljdFhURndpd3pMdzhsVlhBUlRsQzE1bnBnamZRbktzMFhPYnJDRFFReEU2?=
 =?utf-8?B?K0FVeWIweVZDd0wwQ2VTY1ZBZG11OGxIWlV4TWx4eDZHYTNVZmhRazRKTFky?=
 =?utf-8?B?VVVIMWE2R0xiaVpNWm80K1JaSExoV3VPZ0U1cnZwM1QrclozNHo1TVZoYU4w?=
 =?utf-8?B?d1BLbEE0UmlwVnJxN1cyYU5zL240ZVM0RlkveFFxY2ZvY1hhalNVQ1lBNzRP?=
 =?utf-8?B?Q1dWK2R0QUpQRGZVQWY4b09VbEl1cmZESk1yMkJwQ1hGNGhRakYvbnlkVnds?=
 =?utf-8?B?ZWI1ZndzaWxxNjBObDdUeVlDQk4vT0pPQ1hxUTFYTFptTVJOTHVnZE8ydE45?=
 =?utf-8?B?dUh5bnB2NUdncGozSzFkaXV5QTVqOHdsZjZtSkxheEpnUFIwd1MyYkVPV1BT?=
 =?utf-8?B?T0xaQVFSSGZHa2VhTWtoeEZjWExZK3JOZTRyWjBIeEpDUlc5MitGVFBKUGNH?=
 =?utf-8?B?RE5KR3hVSFNFT2NBWHBsRzU4RW53cXlVWnk5WUI4MjJYOGJ2TFFZdGp0WExK?=
 =?utf-8?B?aGlaU2pCemJIdlJSc1gzb2RXU3I2cXNGWjBGMFJzYy9MTVY4dnRacC9yT3NE?=
 =?utf-8?B?UlJWYS9tUVpEbEJxVUUzMHNoMmZvMzArd3Fvd2hUNGJEaDZDM2JIWDhYVHc5?=
 =?utf-8?B?dkMwdG5NWFJIajlYMHFKK1luOVkrMUZ5ZGlNSUI5WW1UVThORUpESWpNK01V?=
 =?utf-8?B?ampKVFYvN0JkNzVSMlgvTXAxMWQ3MzQxWTdyUFkzS1UvRVQ4d0U1cmxmS1hw?=
 =?utf-8?B?enpXOEd1UXFYZXFzWWxRVGhHQ0FDaS8yL3U0TXM3UWltWkZEdjhFUmxLTlR4?=
 =?utf-8?B?bktEd0t2dW9TRGxYR2l2RkpRNC92SnE2M3E4SXFCdmVFb2JkeWEwM2h2SEhh?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D7FDED303B45541B9F67B7EA2DD0802@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02baaefb-4b09-42ef-9130-08dad184eb3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 21:10:03.8628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDjozdkaLbOH/yUo7g6sOpfiw/SKQg0X1Bz9BW6o1BqTN/yHXeTeAZTXDlAUiE/H0MPEuHMUPoceCkZFYy6CTmY7v2k42nRgtiAlYfpcYsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Mon, 28 Nov 2022 21:10:46 -0000

T24gMjgvMTEvMjAyMiAyMDo0MSwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBOb3YgMjgsIDIwMjIgYXQg
MTI6MzggUE0gPENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+DQo+PiBPbiAy
OC8xMS8yMDIyIDIwOjE2LCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToNCj4+PiBPbiBUaHUsIE5v
diAyNCwgMjAyMiBhdCA1OjE3IEFNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBPbiBXZWQsIEF1ZyAyNCwgMjAyMiBhdCAwMzoxNzow
MFBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToNCj4+Pj4+IFFlbXUgdmlydCBtYWNoaW5lIGNh
biBzdXBwb3J0IGZldyBjYWNoZSBldmVudHMgYW5kIGN5Y2xlL2luc3RyZXQgY291bnRlcnMuDQo+
Pj4+PiBJdCBhbHNvIHN1cHBvcnRzIGNvdW50ZXIgb3ZlcmZsb3cgZm9yIHRoZXNlIGV2ZW50cy4N
Cj4+Pj4+DQo+Pj4+PiBBZGQgYSBEVCBub2RlIHNvIHRoYXQgT3BlblNCSS9MaW51eCBrZXJuZWwg
aXMgYXdhcmUgb2YgdGhlIHZpcnQgbWFjaGluZQ0KPj4+Pj4gY2FwYWJpbGl0aWVzLiBUaGVyZSBh
cmUgc29tZSBkdW1teSBub2RlcyBhZGRlZCBmb3IgdGVzdGluZyBhcyB3ZWxsLg0KPj4+Pg0KPj4+
PiBIZXkgQXRpc2ghDQo+Pj4+DQo+Pj4+IEkgd2FzIGZpZGRsaW5nIHdpdGggZHVtcGluZyB0aGUg
dmlydCBtYWNoaW5lIGR0YiBhZ2FpbiB0b2RheSB0byBjaGVjaw0KPj4+PiBzb21lIGR0LWJpbmRp
bmcgY2hhbmdlcyBJIHdhcyBtYWtpbmcgZm9yIHRoZSBpc2Egc3RyaW5nIHdvdWxkIHBsYXkNCj4+
Pj4gbmljZWx5IHdpdGggdGhlIHZpcnQgbWFjaGluZSAmIEkgbm90aWNlZCB0aGF0IHRoaXMgcGF0
Y2ggaGFzIGludHJvZHVjZWQNCj4+Pj4gYSBuZXcgdmFsaWRhdGlvbiBmYWlsdXJlOg0KPj4+Pg0K
Pj4+PiAuL2J1aWxkL3FlbXUtc3lzdGVtLXJpc2N2NjQgLW5vZ3JhcGhpYyAtbWFjaGluZSB2aXJ0
LGR1bXBkdGI9cWVtdS5kdGINCj4+Pj4NCj4+Pj4gZHQtdmFsaWRhdGUgLXAgLi4vbGludXgvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Byb2Nlc3NlZC1zY2hlbWEuanNvbiBxZW11
LmR0Yg0KPj4+PiAvaG9tZS9jb25vci9zdHVmZi9xZW11L3FlbXUuZHRiOiBzb2M6IHBtdTogeydy
aXNjdixldmVudC10by1taHBtY291bnRlcnMnOiBbWzEsIDEsIDUyNDI4MSwgMiwgMiwgNTI0Mjg0
LCA2NTU2MSwgNjU1NjEsIDUyNDI4MCwgNjU1NjMsIDY1NTYzLCA1MjQyODAsIDY1NTY5LCA2NTU2
OSwgNTI0MjgwLCAwLCAwLCAwLCAwLCAwXV0sICdjb21wYXRpYmxlJzogWydyaXNjdixwbXUnXX0g
c2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5cGUnOiAnb2JqZWN0J30NCj4+Pj4gICAgICAg
ICBGcm9tIHNjaGVtYTogL2hvbWUvY29ub3IvLmxvY2FsL2xpYi9weXRob24zLjEwL3NpdGUtcGFj
a2FnZXMvZHRzY2hlbWEvc2NoZW1hcy9zaW1wbGUtYnVzLnlhbWwNCj4+Pj4NCj4+Pj4gSSBhc3N1
bWUgdGhpcyBpcyB0aGUgYWZvcmVtZW50aW9uZWQgImR1bW15IiBub2RlICYgeW91IGhhdmUgbm8g
aW50ZW50aW9uDQo+Pj4+IG9mIGNyZWF0aW5nIGEgYmluZGluZyBmb3IgdGhpcz8NCj4+Pj4NCj4+
Pg0KPj4+IEl0IGlzIGEgZHVtbXkgbm9kZSBmcm9tIExpbnV4IGtlcm5lbCBwZXJzcGVjdGl2ZS4g
T3BlblNiaSB1c2UgdGhpcw0KPj4+IG5vZGUgdG8gZmlndXJlIG91dCB0aGUgaHBtY291bnRlciBt
YXBwaW5ncy4NCj4+DQo+PiBBeWUsIGJ1dCBzaG91bGQgaXQgbm90IGhhdmUgYSBiaW5kaW5nIGFu
eXdheSwgc2luY2UgdGhleSdyZSBub3QNCj4+IG1lYW50IHRvIGJlIGxpbnV4IHNwZWNpZmljPw0K
Pj4NCj4gSXQgaXMgZG9jdW1lbnRlZCBpbiBPcGVuU0JJLg0KPiBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvYmxvYi9tYXN0ZXIvZG9jcy9wbXVfc3VwcG9ydC5t
ZA0KPiANCj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgYW55IG5vbi1MaW51eCBzcGVjaWZpYyBE
VCBub2RlcyBzaG91bGQgYmUgcGFydA0KPiBvZiBMaW51eCBEVCBiaW5kaW5nIGFzIHdlbGwgPw0K
DQpJIHRob3VnaHQgdGhlIHBvaW50IHdhcyB0aGF0IHRoZXkgd2VyZSAqbm90KiBtZWFudCB0byBi
ZSBsaW51eCBzcGVjaWZpYywNCmp1c3QgaGFwcGVuaW5nIHRvIGJlIGhvdXNlZCB0aGVyZS4NCg0K

