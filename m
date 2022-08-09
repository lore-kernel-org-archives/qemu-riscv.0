Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLIhA-0006J1-9N
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 02:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oLIh8-0006If-K6; Tue, 09 Aug 2022 02:26:26 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oLIh5-000708-GF; Tue, 09 Aug 2022 02:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1660026383; x=1691562383;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zdA+N/aIVi6I91XBB6IDGJUnxRrInXvJtISyW5KTKPI=;
 b=sbOp28HA5nqAPYNEErmIZ/hNwwZUKvuomTY8fYCkvkuA4PRbAQaiNs4a
 WTgGvSr0ZZiu3or8q8n+p5b+dXvjUF83exgtU8agGHxs905XPHEHNA4y7
 lk6sUoqghqngbJ0a54RD4/kTI/1hk5gNRc2eFLyEb9NJDzaplxiFFs6V7
 NJXi60BkxZSzAUhTDoXExHzLz5rroLRg1mKDv3mThE084l1aOzXvt9CJ/
 8EmJ4BRLWPWKUbYL4Ajsqd3fodXVnM4BJmroZpkb5vyI5GSjxK3MvwqfC
 69sexstp0Z60pn3n7WBZHmfUR3nVG53QShlm+xxq9y6UhCUsu/N6drDgL g==;
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="185685370"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Aug 2022 23:26:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 8 Aug 2022 23:26:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 23:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7PT/Udzf1CvVCglPbOVgoz8WKWNWSnlsxVOwQzT6n80Hlqjfkl80vqLPfLZ3dLiApOqXxgqoGiHutjfdA2tihipbadI6PHFZclAA6Zto1bti0VgdYL1PJ4/2jy+0Sfovoxf7abrC6maiHHbo7Rbvm+k5cMFWkEc/eWwZXm/WOy9YjpJGAz8+h7MWKGH770ht6NwMlXLZG1XMSWBrQohgrhNlPNZC4DFgMctkPV2/3rjIAjFlc2SjrhBKw7xtxgWCokZaBHYHAy0QmDKnjMSf4rgNaOw6iA+qQPNYgULyIuAYDc9PDB1VKqa9wEEjdDA4Q7qu075qoKTwodir4iCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdA+N/aIVi6I91XBB6IDGJUnxRrInXvJtISyW5KTKPI=;
 b=YC1Q7q2Sku1By1j8zQ5pIfGAs0RGximm8Q/IcxNrAaKsoNTY4WE+zghVtGuQTmrKIQiYixyOqGPkCIEMb5bCFXB/HS3j2VZ0V2PoKw74Onz0yFEDJqbPBulczINWaxYm1krGV4SwbCPeX4kBqL4NurkCsvpHXX1xCxcq8nqcRGyRU+Zx7tCf8wlQzIL4pdXYd2blFMSt5kzpvdclRUMbQs/gdzXdAPtilh7JIY2GrGPGAAflEoloG5rMAH3SNw5yKnKQbrDHUNv7TGteKQKxh+2Vkd8MArVT9xOL1s6XY5zfRxzjc6LpSg3iQ3HiEi6pkPMxHMM3SGLmmiT6nXEwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdA+N/aIVi6I91XBB6IDGJUnxRrInXvJtISyW5KTKPI=;
 b=IMHFurbsvbg4f8AgDBWQvmgx/WTqKs+r11y4WYKbXeK8qjlQf6MVije4+smU0oFJWmWIKIvOslWv4Gl1YC18AcU49+1wkSa7gGdW2bKA+DRwVkCuFgODKvRK/AurMoIUbcF/pzeKTfxuBWWkakTglar1pzRUUOjM50gscwMNN5I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2938.namprd11.prod.outlook.com (2603:10b6:5:64::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Tue, 9 Aug
 2022 06:26:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 06:26:09 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>, <jrtc27@jrtc27.com>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
Thread-Topic: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
Thread-Index: AQHYq2sXKQF4nmkKH0CpDXW9uXXuca2lhLQAgAAL1wCAABDWAIAAec6A
Date: Tue, 9 Aug 2022 06:26:09 +0000
Message-ID: <3455be15-cfcb-e1d7-cc7e-ce5feb070729@microchip.com>
References: <20220808210643.2192602-1-mail@conchuod.ie>
 <20220808210643.2192602-4-mail@conchuod.ie>
 <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com>
 <842525b8-2716-4d87-7024-070fe858da6f@microchip.com>
 <CAL_JsqLa2xJN0oLaCzzE1fS-enRhv-XkLBsn_mHQ7kvXy6yWnQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLa2xJN0oLaCzzE1fS-enRhv-XkLBsn_mHQ7kvXy6yWnQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 650c34b6-5f2f-4748-0af5-08da79d00caa
x-ms-traffictypediagnostic: DM6PR11MB2938:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v9mpiaNjPQdxBZHLgJ0kUoh9925VeUxBBBAkuK9kgCAFm18bEwx/R2J9G4rkJ3uXOJ2MWtN64VDcxPDQTyd2aJnW7o8sEoE9RKS5b8yz95wbTEjw1sutBJH98ZeA8JU2ywp5XA9pp4v/HKr2nT6TPWtyzNE6rEWKQmVBhdk+/TYGvZ9MOYI53Z9ouxCqYjmVc/H67T8E1TMWNkplilquwi3qTyxpWIMKNhNztMy0e440x6vjOOGALYPcszbyOI2konJvrq/lmf3tP1PIEO3iqx23A2dWGsu/5ZXl9tLz+JXLwlGIiDJ1pRSEfOlScUXO2QLTEOhK1eJBo5ooyJlhUjscMc2slj6io7KFj9qcFM6QGl5ozzBbzzTH92kjnE2RmI4gvBhmXAWF8qg+x1KiKLIcMXK7B5Yj7F7AoVkty+vBogkGMy5SzN0pSCtni6humcuZ1J1/giR2sQ98ZZunR/4Wjmb8x0/H6lCM9y89EXV/g8RZ+0lio3JszUhh+nZoJZ7MLA6zyL0pApyYMjL6HZcGBVF5iULZjV52ZiokTgt4eVUbdKhuMOAhy8/u0VDuTpPX1HA/DdnysadF75BUxEC2emzBFIqn3rxhksTUivPla4Li7ssg8DNRIp4OVBmx1CcCLGgqKWh/oFHx+1dp6J4jI3t2Lr/yMi4BUdrQVhaZBor4iSapGDcGYB4dIXo2+AmzPG/NxtOzxVr8cUn9vIJDEIW9fUIBHr1s15z815NJ3wASTjBds6RmSZocmEl53Ty8tB9QCcpBP68gp1i4hnl/ORkNeiTUheuTJq4mmycCsBB3LyMB0WT4EW8MpwGxDrModJwTmo7o+Nhwj6+SjZAR8+F4mKTef8r2leYBmYK+h+vplFzvsBwwH+32OX2+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(366004)(396003)(346002)(136003)(76116006)(316002)(2616005)(186003)(110136005)(91956017)(66556008)(66476007)(66446008)(64756008)(66946007)(54906003)(36756003)(2906002)(5660300002)(122000001)(8936002)(38100700002)(31696002)(71200400001)(41300700001)(478600001)(6486002)(4326008)(31686004)(86362001)(6512007)(38070700005)(6506007)(8676002)(26005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVJ4bkFaWHJ6eTBHbUNtR2FrWVdHWThJM2JsREM5SXdYa0FPVmo5NS9BUytM?=
 =?utf-8?B?T003VmFYaGlIY3VkbGFpbnJQbzJrZm9uQWxIMFphSmVxWUtiWjU0Zmp4aU0y?=
 =?utf-8?B?d1lJOE9SVGJVN2cxeFRiMGNVZ0FGRStUeHhHM04vekg4Q2NSRmppUkRoRHgr?=
 =?utf-8?B?eHU0eERoOFlLdWY4UXNYVjBkRWFBcHg4SFdhWHBOaEthWnoxV1B4T0VJdDc0?=
 =?utf-8?B?WjdpRmJmU2lXblBqUlJOQ2h1NE9jUGRyTkQvZ1VKd291UWRXbDZpZlZTc09R?=
 =?utf-8?B?L1BoUjdzNVlpMnVWeWIwY3JsTk9hSzREUnhBM1NmSUlrQTMzRDNsdkFYbTVk?=
 =?utf-8?B?NEdTSEdqL0VZckRRS25uS2VZMTBNbnJuVmNsVUl5Y2lRaTdsS1FvTlM1b0hE?=
 =?utf-8?B?L2dBVzk1dTBIRmhocUNFbU90N2JjM2h1SkY0ZEJzMUt3RGEzOUlhclFsdVc3?=
 =?utf-8?B?NjlmVTRrcytzZHZFakx3TCtVazhmQktyb2RIY0FGUUNVdVAreG1JeWRMb2Nv?=
 =?utf-8?B?ajF0RTBWR1dDbzlCSG5aVUM3cjV5QU5YUXg3bHY2bjNzRWY5UThrNXpDNmg3?=
 =?utf-8?B?RkN0d21MODl5dlVwMXNUOHBtNm5KU0lBRUFUc0NRemZZMWdpV0hyalVQczJK?=
 =?utf-8?B?bGhMRDl1alRUamJzZnp4b0ZnVEVBMVBPRlpaVUJjeFpoWjMyRlpGeXVoWVRv?=
 =?utf-8?B?MEo1eTJDQWN4UFlXZWN4bHRNc3k4aXNiVlY3SnUzd1NFSnRTa1QrS3V6VmpS?=
 =?utf-8?B?Mm9hdnlwWVpQcDBUSU5RKzAvdEFCRHo3UzBGQVU1RDBqd0dVaHZuTDBQSE82?=
 =?utf-8?B?MC9aOEV2UFZHUHJ1UkRUUXg3a2loOU1yZ0pkT01CdTlvNzU2SGFQa21Cck1B?=
 =?utf-8?B?Y2ZIUm52U2o3Rnc4anF4YXZBQ3VrK3dVQ1NZeGY3YkdRUFZ4TmdiV0g3S2Nv?=
 =?utf-8?B?am53YmUrTEwreEJVUkpEZVo0clVsbTVWM1hKSFhRdnJWWDgzY1pQT1ZycXll?=
 =?utf-8?B?aXVDZlBEeFpWSlNrR0JlR09nQnc3VHplOTRVNkRwWlQrRWRraGdUNEMxL3FM?=
 =?utf-8?B?Q0NteDVjOXVVanhwVmdiOGFyc1FwTWdlMWJhaGk0NTNSUE01L2wwWDE4WFRC?=
 =?utf-8?B?REVsbnJ6NVVIUWZvVU1WQ0xaNVdMK0oxREd3YzM1MGdiT01MSTMvV0phYXN1?=
 =?utf-8?B?QkpRYTlHWXF5cTVpMnd6WE1HYXExREZtanZnenZqcDY2UGdYS2xqOU45d1Nk?=
 =?utf-8?B?VHdRTHlURms4N1kyZDhjdnJWakJ5clhTcTFvbEZnK3VMaVZSczBkZXFTNlBr?=
 =?utf-8?B?a012cTJCa2tVR0hvR2p0Uk9Ja2R2K1d3TTArL0YwWm53Z2pCOG1MY1dBRzBr?=
 =?utf-8?B?UkRwVnpQNnJYRzVyRGJmOENMWXBQMWs5RXZveFZSUEllY1o1TU0rc2tDUjlE?=
 =?utf-8?B?aWErVytjaUtZaUE1QVdGMmgyTTRsRmZBTEUvbzJNd2FIN2M2aVl4ak0zUGcw?=
 =?utf-8?B?dXZldkRVY3lickpyYzl3T3Azbmh0OVBTdTJoRDNPbXgvV3ZTWDlRZ01tRUta?=
 =?utf-8?B?dlpsTERqRlBWMHJTdFZyQ3hUbHY0YnNNTVRVT0x1TXhWbWlQbUhoNEZvNlF5?=
 =?utf-8?B?SmZsenFnMWlPRGpSaERNOUs3Rm1hOUIvUUQ1eUFaNHNiRlIrVWRiUytXb0NT?=
 =?utf-8?B?NVFpelhrTFZYZkE3a1ppT1VHbXM1ODBOblVUMVEwenFFVlhMemRGTSsrZFFJ?=
 =?utf-8?B?cTlVZ2ZrcXFKeDgxa210NlJFWnZHdVRrZ24wS1dzdythMmZkQ3JPcmozeCtw?=
 =?utf-8?B?Z2d3aU9GRzBIajJxQyszV2hDWW8wanlsdEJmN2psT09HZ1cyMG9weml1SHoz?=
 =?utf-8?B?N1F5RDFBUUpaRkx2MFMycXJnKzMwQzdLSXVkeEs2dlcrbXZLaSs5NHlzRkNZ?=
 =?utf-8?B?cGovcmlUMlUrS3U0Mkx4QWxuVmlxUDl3bGdsT29pMXBJK0s2RDcxMkxhMDAx?=
 =?utf-8?B?eUFLRW41aUo2RVJGQ1FsVFRQbWtJK0xZM0t1SEZwNUJPWUg1cmxVb3lQUUlZ?=
 =?utf-8?B?ZUlNYUtjK3orRzdtWnhCcWVKTWFxcUdGalF2UGZpaHJ4Z2RrakFsQk9lM0p4?=
 =?utf-8?Q?SIWkAjL6wVad2xvgYI7oEzaCl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F0537495FE54C4AB3168A36F94B230C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650c34b6-5f2f-4748-0af5-08da79d00caa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 06:26:09.8819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IjUespRpYxXDgXPrsIOJMdBfF69u6KT4F46gMrO4ywl0RMRw1i+bZi/ytcyDEpixTV0AzwpeWQFWjN81XekscKqPSL2/5J9Ls2DQ1X+PMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2938
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
X-List-Received-Date: Tue, 09 Aug 2022 06:26:26 -0000

T24gMDkvMDgvMjAyMiAwMDoxMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBBdWcgOCwgMjAyMiBhdCA0OjEwIFBN
IDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gMDgvMDgvMjAy
MiAyMjoyOCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6DQo+Pj4gTW9yZW92ZXIsIHdoYXQgaXMgdGhl
IHBvaW50IG9mIHJlZ21hcCBpbiB0aGlzDQo+Pj4gY2FzZT8gSXRzIGV4aXN0ZW5jZSBzdWdnZXN0
cyB0aGUgcG9pbnQgaXMgZm9yIHRoZW0gdG8gKm5vdCogYmUgY2hpbGRyZW4NCj4+PiBvZiB0aGUg
c3lzY29uLCBvdGhlcndpc2UgeW91IHdvdWxkbuKAmXQgbmVlZCBhbiBleHBsaWNpdCBwaGFuZGxl
LCB5b3XigJlkDQo+Pj4ganVzdCBsb29rIGF0IHRoZSBwYXJlbnQuIE1vdmluZyB0aGUgbm9kZXMg
d2hpbHN0IGtlZXBpbmcgdGhlIHByb3BlcnR5DQo+Pj4gZG9lc27igJl0IG1ha2Ugc2Vuc2UgdG8g
bWUuDQo+Pg0KPj4gVGhhdCdzIGhvdyBzeXNjb24gYmluZGluZ3MgYXJlIGNvbnN0cnVjdGVkLCBt
YWtlcyBpdCBlYXNpZXIgdG8gZm9sbG93DQo+PiBJIHN1cHBvc2UgaWYgdGhleSBmdW5jdGlvbnMg
YXJlIGNoaWxkcmVuIG9mIHRoZSBzeXNjb24gbm9kZS4gU3RyaWN0bHkNCj4+IEkgdGhpbmsgdGhl
eSBkb24ndCBuZWVkIHRvIGJlIHVuZGVyIHRoZSBzeXNjb24gaXRzZWxmLCBJIHRoaW5rIHRoZXkg
Y2FuDQo+PiBhbHNvIGdvIGF0IHRoZSB0b3AgbGV2ZWwgLSB0aGV5IGp1c3QgYXJlbid0IHZhbGlk
IHVuZGVyIHRoZSAvc29jIG5vZGUNCj4+IGFzIGl0IGhhcyBiZWVuIGRlZmluZWQgYXMgYSAic2lt
cGxlLWJ1cyIuDQo+Pg0KPj4gSXQgd291bGQgYXBwZWFyIHRoYXQgdGhlIG9yaWdpbmFsIHBhdGNo
IDBlNDA0ZGEwMDcgKCJyaXNjdi92aXJ0OiBBZGQNCj4+IHN5c2NvbiByZWJvb3QgYW5kIHBvd2Vy
b2ZmIERUIG5vZGVzIikgdGhhdCBhZGRlZCB0aGVtIHB1dCB0aGVtIGF0IHRoZQ0KPj4gdG9wIGxl
dmVsIGFuZCBpdCB3YXMgaW4gdGhlIHJlZmFjdG9yIHRoYXQgdGhleSBnb3QgbW92ZWQgdG8gdGhl
IHNvYyBidXMuKg0KPj4gTWF5YmUgdGhlIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHB1dCB0aGVtIGJh
Y2sgYXQgdGhlIHRvcCBsZXZlbD8NCj4gDQo+IFBlcmhhcHMuDQo+IA0KPiBUaGUgb3RoZXIgb3B0
aW9uIGlzIGFkZGluZyAnc2ltcGxlLW1mZCcgdG8gdGhlICd0ZXN0JyBub2RlIGNvbXBhdGlibGUu
DQo+IFRoYXQgd291bGQgd29yayBmb3IgTGludXguIE5vdCBzdXJlIGZvciBGcmVlQlNELg0KDQpS
aWdodCwgb2YgY291cnNlIEkgd2FzIG1pc3Npbmcgc29tZXRoaW5nIGluIG15IHVuZGVyc3RhbmRp
bmcuIFRoZSBwcm9iZQ0KZmxvdyBvbiBMaW51eCBjYW1lIGJhY2sgdG8gbWUgb24gdGhlIGJpa2Ug
dGhpcyBtb3JuaW5nIGFmdGVyIHJlYWRpbmcgdGhpcw0KYW5kIEkgZmVsdCBsaWtlIGFuIGlkaW90
IGZvciBtaXNzaW5nIHRoYXQgaW4gdGhlIGRldmljZXRyZWVzIEkgbG9va2VkIGF0IQ0KDQpASmVz
cywgd2hpY2ggZG9lcyBGcmVlQlNEIHByZWZlcj8gdG9wIGxldmVsIG9yIGFkZCB0aGUgZXh0cmEg
Y29tcGF0aWJsZT8NCg0KVGhhbmtzLA0KQ29ub3IuDQoNCg==

