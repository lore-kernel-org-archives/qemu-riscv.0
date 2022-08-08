Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oL3kI-0003St-D4
	for mharc-qemu-riscv@gnu.org; Mon, 08 Aug 2022 10:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oKwCu-0008ES-DR; Mon, 08 Aug 2022 02:25:46 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:24387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oKwCq-0004t4-K7; Mon, 08 Aug 2022 02:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1659939940; x=1691475940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e3nFVW66q2mO6+eFPbez+R8Afc9hoSNwsDJbbMM8N0c=;
 b=hcx6o+42SZ9Al8FPxeomNljJjzb4M98cLJVkqlORRJGB8dv4/SsxNxRQ
 X67tbs0eEe88adReThfULsXt1as9FUFtc1u/cb2bEEcqEgic8QEv0Tfnz
 UpD9aL5IM4C9mMDSQCOYxuj0X66Qqz7Z7T91/qABNU0O20NoYE331iWAt
 Y587H6mqIHz7/fX6wS8L2cku9kj8Dj4oe4NSDxiXSW21il1mINDxqyKFW
 zxTDwczcuthwRVc60jtKKDFsjWJjfiogB8Y4Wsk9DEEJ2ZpkXWnQ16J01
 3uo60gTq2ZXUkx+2Obn1WkpjEMaTYCv/jaGLGIvJaUiHDpaqmlxN1BTt+ g==;
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="185509424"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Aug 2022 23:25:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 7 Aug 2022 23:25:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 7 Aug 2022 23:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaOdZPSGDuC8SzBpX8vngCDn2CJ0WKvNRR3dH3ITnShieFl5sj+QWCMed1phzqKV0ocrxUNG037os5I9PyQ12UJkE91XhSCfRJZjbbDwmRavw9NpANO/NqHRg9ods5htID9mHWqpV0UgGaZmJzx+4YRaxH1tRZv2zEo81n419deh4z6DY94dui1at0YzzlqttN1Ef4BFjX2xs0nt5Mzq0vL+6QIyslKQ+C9LuQtZZiObjVqeqCtVbbE3LbySJcxlv4u4KXQjHr2R+EVZ+KffsbJ1KXapdBQ0Q130SPDLioeOyAeQyo/s/8ydyiwqypv3Je1qrEk0QW2l2B8WsSde2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3nFVW66q2mO6+eFPbez+R8Afc9hoSNwsDJbbMM8N0c=;
 b=EOScS+/Dln5qM1q03oSya9D4r03WoV38PJmu1bPGyTXSwAWs2zh0lw30pY2K0XgxoixLxNUG3m2VInZTgqcuCnqIZbEH1yB+B9Jz01XvjchUOJnMxtvxV3eGQCF1frWWLosrp1sw9GXS0Vrn7E6h9t7KCVL6Dd2QvQSUNiDHDGb1Mgy4+C6qg1oPfyMeTD65wLK3y+RRSrkjyV3RN6abzX6ZcbXLkhFLrjaOE4+n8e39dU+QXjw60mLUn+XgiaNC8Qy9TPKzkVgzGJznGZA0Og3/D7ZmFllqy+vfPIf1jvruzF217DEotuwEx6FC2T5JZnGpmL+rShYh+yxpVaOzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3nFVW66q2mO6+eFPbez+R8Afc9hoSNwsDJbbMM8N0c=;
 b=ZZpa2AZVQWtyWtniYzwEnqDu39FiOKX84oXwsZXb8aDsXXllyO8IeqMrKnFxJDUH2Xw5ZY7N2tHwcp82G8/Kl5BGx1Y7iVe9I59uqAsTkqTQ3zr2wdaWeC12SNaGxMn96UDLWGcqm8pRYb+X78Dx2DBoGJfB1PVh9XDPGjLilBo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 06:25:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 06:25:25 +0000
From: <Conor.Dooley@microchip.com>
To: <alistair23@gmail.com>, <mail@conchuod.ie>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <robh@kernel.org>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>, <linux-riscv@lists.infradead.org>,
 <palmer@sifive.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Topic: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Index: AQHYqOO1TG25AQQCRk+oHxWTs2yK5a2kD2AAgAB+UoA=
Date: Mon, 8 Aug 2022 06:25:25 +0000
Message-ID: <dd5f0ddf-5fc6-00f8-d425-5b3161f6e977@microchip.com>
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
 <CAKmqyKOORP+ciE0ZybCbtqFV5N4g6B8J2JwSrn0fen0zd9RfUg@mail.gmail.com>
In-Reply-To: <CAKmqyKOORP+ciE0ZybCbtqFV5N4g6B8J2JwSrn0fen0zd9RfUg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 724e952b-d51e-48ac-b1f0-08da7906c7b6
x-ms-traffictypediagnostic: SJ0PR11MB5102:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7RvR0ALYkVIYhgNg30U6KeN0sqkG/LlXwA8zahYCvuQxA4TCOFsLDj90Dgk1UJ5oljs6pnsQd+mneRERBPaHWBKvGO9giFNb6SnrTWnzcaBuw0qHKunYh+A5F4U/qHi8B0kTGBBR1TRR8e3ieUfc2ajjkbZ/hn4eVDwrtDE+AM48ELfS7FQSUWF3oha3ejTk+3w2Ikf/R7037YeWof4UrtWEYXyyoRS6u4zcVkAYa8YH3EHLtb6Ig+VNrBhsXM1leOsfz29myKzuX4MPSHikbZHqiEeuYIHdWAs8NwX3QkFUlmS3WpckfINpbZ/178uQDalawMsbi3XybgLIWcGz82SGJd20JzQfg37905s69unek8RYav8B46XQ97o/ymnzLrPdi4vG/XeGzOzwd08mowLISIrjpEkFAGJf9sGMHSt2WyuBxX8DH/SbYlLrxYoxysE2H43UBoFMzdI9+2HqSHerffVeXyMgXhnLtnXPalzNSgFm1kQYc+N9V4bC6+o47du5fI2aUWNavdAP7PHA3izm/Px7qsKbOTy+0w+puC8pTRfZyBHvG5CuML7gknBGjd80As9pXo2hf7gmybHS7DSp3G6vFKZScHG2XOeRLrQwOBvMQkFL/+x8MjkJErb3zaEJVPe/+T9OLgARetTGQdHu3s4Ciz9Y91Uf9wyvzixYRnTz3o3/4AemEoDWW7iBrrFUWRYj4gFGLljh9rDm9P80qQmmMa0UIBikUJ2KqnSGoOCzkMWihbwl9fJx8UzpBzbu1cmEkC3oShSjDqHjDoIz6YSZGdL7ggcpXPq7TfmauEm3gXXHV91Fb/kQwCe7oh4umvH0WVKUaHmk99HpqVDdNZtAibenImKYS5Hu6295han5BMGemhgDnMN0q2EO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(346002)(39860400002)(136003)(8936002)(5660300002)(7416002)(6486002)(6512007)(478600001)(86362001)(26005)(53546011)(6506007)(41300700001)(2906002)(31696002)(122000001)(38100700002)(2616005)(186003)(38070700005)(83380400001)(76116006)(8676002)(66556008)(66946007)(66476007)(66446008)(64756008)(4326008)(71200400001)(316002)(36756003)(31686004)(54906003)(110136005)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE1mRzZ2V2JLWmV3SXd4SGhVWFF2djBQRzFXWTVhbS90aGNEdk5FWDA5OXVU?=
 =?utf-8?B?QXJYc2hsMTY4a1JRaUY2dU01bUFyRW93RC91czZYVXZRRHJtN1FvTFBDNDJC?=
 =?utf-8?B?c3h4VmY4VjlTUWZPRVpvR0tYRGJ0eGUrVS9nYVJrTzdYcjlEaENSQ0ZHUUEz?=
 =?utf-8?B?dDZNRXY3QWNaeUJlaDJwb2dhWVd1SkU4SjVRU24rczlDYUtWd0U3akhROEo3?=
 =?utf-8?B?R0NrNzA5TVo2bHV3bGpaWVFMMit3ZGUvTHpZNW9KV2Z5UzlFT0xZcXhPWm9T?=
 =?utf-8?B?RW01bWxsY3FWRTFpYmx2QkJ0Q2crbWVHN09ha0lQU3JlOWI3MnArOWgvSmRm?=
 =?utf-8?B?TllqMEpnK0hrNW9SY0lqbW5naXVaN3dLRVN2WHU4SVBoVnFJRURjY1JLQS9L?=
 =?utf-8?B?NW1SODFIY1hQL0Z2SXU4ZVozdTVWRWpGbkNiS044dk9Ua3o0dzJpbmpMSU94?=
 =?utf-8?B?eGpXK1dobVV3Q2tSV3QzaXJMc3lzaWl1Zkg2TE5JODc4N1RWVkhWT0djazFC?=
 =?utf-8?B?Umw5N0NzWmJRTUVuRzQvdTVoVUNReW1TV3JaWnhPT3JGNWlFeFJXYW5jR2pU?=
 =?utf-8?B?aW82Nm43Y1RUMTFMMC9LYld4UCsvZ05SbWtQOUxmRlRVekJsTUk3Zk9Yc3Mr?=
 =?utf-8?B?NTNRMWhYNThBWi9RYXlDM3gxN3BSVGtheDcwUmJCVzN4aklSK0FYem9nWDQ1?=
 =?utf-8?B?elI5Y0M2SXBZamtGQUd6T09UMnI1WHQ4VXIyOGJZMWVGNzBtcnJkbDNyQ2VY?=
 =?utf-8?B?dDR3RHlkaTZ5TUxMUWNaYkN3QkNtckRKdnRrN3J5YlFSUzRLOGpBd2VGcG0y?=
 =?utf-8?B?THhDWkZlczNUUjdIN3BwQzZLMC9FVG85US8rZ2JscTNtQ0pyUmJLajdXSWZJ?=
 =?utf-8?B?TEdKdlJXZVp1WFBlQkl4OGNOTktaY3dMekM2WEpvSkUrN3dud25kRXZYRjR6?=
 =?utf-8?B?a2gxWnZ1NHBCMTZ6clZObmdQa2NzVG1CaFNaeWpmcHd0MnNjM3B5RCtzNnov?=
 =?utf-8?B?a1BEaVpxbE9JYlZNRk1XanJKUzRhVUhxdG4zMUx4TXd4WkNEdktUVEljWE5h?=
 =?utf-8?B?eWl0OFhab09KanpEbDVkMWJpVDVUTG9qenRGQStTWXc0VzdSQ2FRekhhOHEv?=
 =?utf-8?B?aHdpRkpOY1dpTlcvOHlIak13MmNqTGt0T0x3OEVMYWtKeXFrNkVKUUYydkRh?=
 =?utf-8?B?Tk1aT1ZMTHhuVTlKSklJNXlyOUpqWTZxT0N0ak94ZVdWQ2lUdmp4aHA2aW9S?=
 =?utf-8?B?dm9yengzcXVkaU13TExaOEorU1cxeG83anJOV3hHaGZMa3k2NGh3UlJPcFlj?=
 =?utf-8?B?V216ZWUrSkNDU2l6ZTFvd2RIYmNzNnRqKzA4WUNvRWRYT3ZPMnpWWkw5N095?=
 =?utf-8?B?QVVmWCtPSk1VeXAyS0FFS2t0dnRLektZTjdlRDBzZzZ5bUVjN21YVEx1aldT?=
 =?utf-8?B?WkRMcm9IYUVoekpVRDB6VFQ2ZnBOVVM0bURBcnZVWXFwbTdPVXRqUTUxbDNI?=
 =?utf-8?B?dVNrL1R3QTZFYmNBSUU3M1hKa0ZYYkZOOU9MT3U1d0hGTnRuQSt3V21WTnJY?=
 =?utf-8?B?ZWtieEQvOHRuZ2wvb1dGbGlMTVlHait6Ni84Nk9EMjRuZFp3UFNKUDNjQnlK?=
 =?utf-8?B?Mmd4Q21VM2VLT3pDVGxFM1RLck5TQm9BcHdiTlYyMFFWZVprWCtYc1l3MW1i?=
 =?utf-8?B?ODNHUHUyNC83N3lmWDRZMEhic3NyYVlrdVlabTh4Y2pFSExVd2ljeXRLVEth?=
 =?utf-8?B?cVQycEJEWVBMQi9TSzFaYThqYU14UWJGS3hGcEFuMGR5L2hqTVJ2R1dqSGw1?=
 =?utf-8?B?TFhPdVZua1RVS3h2L2tKUDlmUGY0SjkvYVBtWFhmd1lHL3ZDaGQzMHU0MkhR?=
 =?utf-8?B?bmV3UFhZeHRIMzBiOUtPczE3dWJvREJYVkRpTDRoM2haZi9OcmdjelJuMGJw?=
 =?utf-8?B?Qk5UdFFZN24rbEdxTUxoRUtBNkkxY3EzV2p3aUV2eWJsamZEUU5DdW1LTGpZ?=
 =?utf-8?B?SktzSXdOb2kxQVF6QUZWNmtSNDlGRDRYMVpmWXZoM01uYWNNSVV1M3UzSjgr?=
 =?utf-8?B?Ky9oUkE5MkgzdDdTeFN6NDJFN25UNlFVNkNRWENKTy9ZNmQxVFhSY1AzL1pO?=
 =?utf-8?Q?taIqX45wL+1Qmr5Cv1zWIVEwl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B10453797FFEB4FBE9EA134EAFD6B99@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724e952b-d51e-48ac-b1f0-08da7906c7b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 06:25:25.3280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jXvBkQ4VcmW5zIdqNnRlgazc0arb7MfQOsXofTGX4VlOgpCO0xSWkTqJkK9ELkMb0eX0og3TVdrgfQpBWcEMmehkao8G+KeCJwHMm1Yhe8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
Received-SPF: pass client-ip=68.232.153.233;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Aug 2022 10:28:41 -0400
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
X-List-Received-Date: Mon, 08 Aug 2022 06:25:48 -0000

T24gMDcvMDgvMjAyMiAyMzo1MywgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBTYXQsIEF1ZyA2LCAyMDIyIGF0IDI6
MDggQU0gQ29ub3IgRG9vbGV5IDxtYWlsQGNvbmNodW9kLmllPiB3cm90ZToNCj4+DQo+PiBGcm9t
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+DQo+Pg0KPj4gVGhlIElTQSBzdHJp
bmdzIHdlJ3JlIHByb3ZpZGluZyBmcm9tIFFFTVUgYXJlbid0IGFjdHVhbGx5IGxlZ2FsIFJJU0Mt
Vg0KPj4gSVNBIHN0cmluZ3MsIGFzIGJvdGggUyBhbmQgVSBjYW5ub3QgZXhpc3QgYXMgc2luZ2xl
LWxldHRlciBleHRlbnNpb25zDQo+PiBhbmQgbXVzdCBpbnN0ZWFkIGJlIG11bHRpLWxldHRlciBz
dHJpbmdzLiAgV2UncmUgc3RpbGwgdXNpbmcgdGhlIElTQQ0KPj4gc3RyaW5ncyBpbnNpZGUgUUVN
VSB0byB0cmFjayB0aGUgYXZhaWxpYWJsZSBleHRlbnNpb25zLCBzbyBqdXN0IHN0cmlwDQo+PiBv
dXQgdGhlIFMgYW5kIFUgZXh0ZW5zaW9ucyB3aGVuIGZvcm1hdHRpbmcgSVNBIHN0cmluZ3MuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPg0K
Pj4gW0Nvbm9yOiByZWJhc2VkIG9uIDcuMS4wLXJjMSAmIHNsaWdodGx5IHR3ZWFrZWQgdGhlIGNv
bW1pdCBtZXNzYWdlXQ0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICB0YXJnZXQvcmlzY3YvY3B1LmMgfCAxOCAr
KysrKysrKysrKysrKysrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2NwdS5jIGIv
dGFyZ2V0L3Jpc2N2L2NwdS5jDQo+PiBpbmRleCBhYzZmODJlYmQwLi45NWZkYzAzYjNkIDEwMDY0
NA0KPj4gLS0tIGEvdGFyZ2V0L3Jpc2N2L2NwdS5jDQo+PiArKysgYi90YXJnZXQvcmlzY3YvY3B1
LmMNCj4+IEBAIC0xMTIyLDcgKzExMjIsMjMgQEAgY2hhciAqcmlzY3ZfaXNhX3N0cmluZyhSSVND
VkNQVSAqY3B1KQ0KPj4gICAgICAgY2hhciAqcCA9IGlzYV9zdHIgKyBzbnByaW50Zihpc2Ffc3Ry
LCBtYXhsZW4sICJydiVkIiwgVEFSR0VUX0xPTkdfQklUUyk7DQo+PiAgICAgICBmb3IgKGkgPSAw
OyBpIDwgc2l6ZW9mKHJpc2N2X3NpbmdsZV9sZXR0ZXJfZXh0cykgLSAxOyBpKyspIHsNCj4+ICAg
ICAgICAgICBpZiAoY3B1LT5lbnYubWlzYV9leHQgJiBSVihyaXNjdl9zaW5nbGVfbGV0dGVyX2V4
dHNbaV0pKSB7DQo+PiAtICAgICAgICAgICAgKnArKyA9IHFlbXVfdG9sb3dlcihyaXNjdl9zaW5n
bGVfbGV0dGVyX2V4dHNbaV0pOw0KPiANCj4gcmlzY3Zfc2luZ2xlX2xldHRlcl9leHRzIGRvZXNu
J3QgY29udGFpbiBTIG9yIFUsIGlzIHRoaXMgcGF0Y2ggc3RpbGwgcmVxdWlyZWQ/DQoNClNlZW1p
bmdseSwgeWVzLiBUaGlzIGlzIHdoYXQgZW5kcyB1cCBpbiB0aGUgZHRiOg0KL2hvbWUvcm9iL3Jp
c2N2LXZpcnQuZHRiOiBjcHVAMDogcmlzY3YsaXNhOjA6ICdydjY0aW1hZmRjc3VoJyBpcyBub3Qg
b25lIG9mIFsncnY2NGltYWMnLCAncnY2NGltYWZkYyddDQogICAgICAgICBGcm9tIHNjaGVtYTog
L2hvbWUvcm9iL3Byb2ovZ2l0L2xpbnV4LWR0L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9jcHVzLnlhbWwNCg0KV2l0aCBQYWxtZXIncyBwYXRjaCBhcHBsaWVkLCB0aGUg
ZHRiJ3MgaXNhIHN0cmluZyBiZWNvbWVzDQpydjY0aW1hZmRjaF96aWNzcl96aWZlbmNlaV96YmFf
emJiX3piY196YnMNCndoaWxlIGluIG4gL3Byb2MvY3B1aW5mbyBpdCBpcyBydjY0aW1hZmRjaA0K
DQpUaGUgc2hvcnRfaXNhX3N0cmluZyBmbGFnIChJIHRoaW5rIHRoYXQncyBpdCdzIG5hbWUpIGlz
IG5vdA0Kc2V0IGZvciB0aGUgZHRiIGNyZWF0aW9uLiAgbWVhbnQgdG8gbm90ZSB0aGlzIHVuZGVy
IHRoZSAtLS0NCmZvciB0aGlzIHBhdGNoIGJ1dCBvYnZpb3VzbHkgSSBmb3Jnb3QuDQoNClRoYW5r
cywNCkNvbm9yLg0KDQo+IA0KPiBBbGlzdGFpcg0KPiANCj4+ICsgICAgICAgICAgICBjaGFyIGxv
d2VyID0gcWVtdV90b2xvd2VyKHJpc2N2X3NpbmdsZV9sZXR0ZXJfZXh0c1tpXSk7DQo+PiArICAg
ICAgICAgICAgc3dpdGNoIChsb3dlcikgew0KPj4gKyAgICAgICAgICAgICAgICBjYXNlICdzJzoN
Cj4+ICsgICAgICAgICAgICAgICAgY2FzZSAndSc6DQo+PiArICAgICAgICAgICAgICAgICAgICAv
Kg0KPj4gKyAgICAgICAgICAgICAgICAgICAgKiBUaGUgJ3MnIGFuZCAndScgbGV0dGVycyBzaG91
bGRuJ3Qgc2hvdyB1cCBpbiBJU0Egc3RyaW5ncyBhcw0KPj4gKyAgICAgICAgICAgICAgICAgICAg
KiB0aGV5J3JlIG5vdCBleHRlbnNpb25zLCBidXQgdGhleSBzaG91bGQgc2hvdyB1cCBpbiBNSVNB
Lg0KPj4gKyAgICAgICAgICAgICAgICAgICAgKiBTaW5jZSB3ZSB1c2UgdGhlc2UgbGV0dGVycyBp
bnRlcmFsbHkgYXMgYSBwc2V1ZG8gSVNBIHN0cmluZw0KPj4gKyAgICAgICAgICAgICAgICAgICAg
KiB0byBzZXQgTUlTQSBpdCdzIGVhc2llciB0byBqdXN0IHN0cmlwIHRoZW0gb3V0IHdoZW4NCj4+
ICsgICAgICAgICAgICAgICAgICAgICogZm9ybWF0dGluZyB0aGUgSVNBIHN0cmluZy4NCj4+ICsg
ICAgICAgICAgICAgICAgICAgICovDQo+PiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+
ICsNCj4+ICsgICAgICAgICAgICAgICAgZGVmYXVsdDoNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICpwKysgPSBsb3dlcjsNCj4+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAg
ICAgICAgIH0NCj4+ICAgICAgICAgICB9DQo+PiAgICAgICB9DQo+PiAgICAgICAqcCA9ICdcMCc7
DQo+PiAtLQ0KPj4gMi4zNy4xDQo+Pg0KPj4NCg0K

