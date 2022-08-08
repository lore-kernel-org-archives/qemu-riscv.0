Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLAxe-0002NS-6C
	for mharc-qemu-riscv@gnu.org; Mon, 08 Aug 2022 18:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oLAxc-0002N2-QJ; Mon, 08 Aug 2022 18:10:56 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:20054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oLAxW-0006dr-Fy; Mon, 08 Aug 2022 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1659996650; x=1691532650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4/NKYkPUOMP8AStiMhfvYSn7YxtUzLpqaMjh9Z5nxaw=;
 b=vFT9ppP6+5DiUXRKgo6QKE2xyzA35SXn0Eo59PyZwSEGBS19OfRDvSmh
 vGd6zenETlvJbYG3plgWq/1JJ6T4nVQ9K3W7Rr8R9KfPSu8rF8K2soiAD
 VtrQo13XfihAqekenWIQ/76WiYGI5XqEiFAeEytYgIWnsl5DphdkokTfA
 4Zmmd5w9vZQtCe/+9iDoNOZEtvh3T0mPLmYXCEySptrheNdbQDeSznOQd
 4VUIaYcsiP5qTHge0URp7Fhs5d/EudD7fIbEp+7gcIDyInZ+/3CIoPN4l
 NBsvsGNeXjv4NbW/RokAvEAzT3/hYpkOPqVIGJftIS6CC1+UnDJYu6Csa A==;
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="185641023"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Aug 2022 15:10:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 8 Aug 2022 15:10:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 8 Aug 2022 15:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWiZNxUHKaNp1eYwMTPRv5VriV9SBX/L6794R+f+yEkay5MUJZrUJOaajjYWyxlhNK+J1ueZLCl0vxChSjewmHxO4CuKX5ysOwXJ05QDhnwIAGkS0letvjV88mmdFjw6nWMMwQbeaDSswqVoXwTkKtblpAbGuOvybXBo/toQtMsxvdU7I7rJ/uYSnj9hH+hmtUCodsiW4YYWS19QeBIJb4g5wS565/BU2fDurPVjO8J6+Fg06AnlViJlgbjEz8+tLz8JWDwI/KzjC4iJkLZoybiIz5KoAE6OzBRclCMG6aPEifactOahyO2X5GzTUhO5WBP12oBPCzNRK6S/4s8z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/NKYkPUOMP8AStiMhfvYSn7YxtUzLpqaMjh9Z5nxaw=;
 b=heyrgl9tc8WmZr32BoTVVhzBNuzQlPVYYZTxTkbsQwLo6HCjKbY2JHGOgzZsgMTFSJ9KHKAKIqJxIgON2gZRcmA0ea3BISYSepsJ7rJZ8zurLmAy7jrEsV92TYSBqmyCy0qzEQ4ELBqT8mcivyCPsLhlEtr4PzObQFIaGq50hHMCFY3uNdJT9aRyFSHjXgd905AzniRaS2J04/q5QIdWcP2ff98IWhTo3PM0AZlQhTiHrAdW88yofUJ8SGMLs5a4Atq7uuabqvZza+ur5Y/F/ynol3fJ/elFiugj9bO/7jjIBv5Rap30pHmLjhAImufxH4HzTjbPDQQw/9ezFA5gLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/NKYkPUOMP8AStiMhfvYSn7YxtUzLpqaMjh9Z5nxaw=;
 b=gVohLyN1YIYmj3Ycbs/y2At6ZY1M6+A3iJUc3ripn1yoY+qR73WpX34X8/zfzkByOjxmpfBZh7mx+jmTPSxzwcqL1pAmexm/Kk03FNke5CevMgqlCLRe9r0bRfbiS6SjrUMQUWv37QV9+XbNHDO6LpfDkx5Siq3wRRew/BbuUWs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5677.namprd11.prod.outlook.com (2603:10b6:a03:37e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 22:10:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 22:10:38 +0000
From: <Conor.Dooley@microchip.com>
To: <jrtc27@jrtc27.com>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <robh@kernel.org>, <Conor.Dooley@microchip.com>,
 <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
Thread-Topic: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
Thread-Index: AQHYq2sXKQF4nmkKH0CpDXW9uXXuca2lhLQAgAAL1wA=
Date: Mon, 8 Aug 2022 22:10:38 +0000
Message-ID: <842525b8-2716-4d87-7024-070fe858da6f@microchip.com>
References: <20220808210643.2192602-1-mail@conchuod.ie>
 <20220808210643.2192602-4-mail@conchuod.ie>
 <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com>
In-Reply-To: <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5f957cf-0104-4c37-07cf-08da798ad388
x-ms-traffictypediagnostic: SJ0PR11MB5677:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I5d0Op/xxh7loYdq3FAUI77HbNz3EE1vYr40J4xWDajxI153q/1ZB2W7ig60OAhQI6zFRMbF7MTESjeOXp/9fsxi4zcoTpBIVq/B1/jW88NZ4dtNWEF+YakJLT6SoohILRxhpVj+TreQ1LqdIvq2CpDer2K/c07CuOFJRS8OXnfpB5EQsqThojHLLnkK3+Pu/OX2V+uChXFy4pyRGM8PL7Azvx8TOSpgIKFAq9V1zEEg9es4VBQma+hKwZVWRmPMZeByMOh26aDV6sX3trKZXbgFENTzFMQ3mD/2Yg9+7h/RFS/0xbsd2seBOdWPlX4dVIv7stJWlNmdfeD/mWWCc5PHO4Sw/LtAWlumQpRXQ2aQUR0Ic4IMEgWaYWhriAZ7hqoDroEI0QJC3JNQk3tKyPIXMSZZ+55+LFPqCnJCw5Y6RNPXaaWXIKqtGtLqIasjsPVugg0rSMASTyrTimDEYTrr8pAiI11/J+oCCBCUR2clDoAUS4A1+JSA9fQcXEou6tHOcAYrL1rl4MvBjr4lb4sX5g0krii1OwRFnJcXZ7HSh/ZaKECdTYaktS8e/Ow686HW7WjB2xTp84oaoKV+MRa2Eid+y8L8I2fPVE6zJQcW6mX/9G8kQOdkoJocJt0m3GJrOnNgARHYHz/Zj7i3E+I0D48GvVz8cu0cmHPL8VPi0wctWGgxNft5YprBgNplkBNUx2sCzXGDoqoWOkT0Gw7KYmCWK/RY3+AewEhICQFvs0jis4DsWMZ2QKWN3yFo4lcc7JSOfD7PLppS1W2ir6RSZUU/+VMUKkgN1PMKUvbP91vxEZNfjZvAMSRsN25j2rofdZep8h3oTS5AVBFmexgo9ZRU7ftHZbAWhGaq4j68Anii6GC7/8pFahuBRin9fkzkznhtXdDfSkNcTfoa1NLnD9a8VlTVzucRLaq1fmqOdJ2b9fme8SJ+3OvMCIJu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(346002)(376002)(396003)(136003)(83380400001)(2616005)(8936002)(8676002)(66476007)(66446008)(64756008)(4326008)(122000001)(66556008)(66946007)(31696002)(76116006)(966005)(6486002)(186003)(316002)(71200400001)(91956017)(6916009)(54906003)(86362001)(36756003)(5660300002)(478600001)(6512007)(26005)(38070700005)(53546011)(41300700001)(31686004)(6506007)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmJQay9PMERVdkdUMlMxejBoR2M0aVAzWGtNb0xPTktwY0c1ZldZamVoRU5H?=
 =?utf-8?B?UkFEWmFCQmtNUGZpczlTTkpTM0R4eHFxMjdoSWlhRS9BK0pNdlZZdXVKNU1O?=
 =?utf-8?B?TnllK1cwMHJXL3QzN3d3UXZhTTZoR0dBVkxCL0FjY2I4ekpzUTIzZ2xXdTJB?=
 =?utf-8?B?djlvK3B4empaOGNrREdwcXFYaXgvYk1hTlR4MkJvcDZRSjBJU1pSbHEvK202?=
 =?utf-8?B?NWpWZG5KTnpPbWdXYnZMZzBaZlg2Z0RvTGNueDdhbCt6YjRsK3FGRXFsQzZB?=
 =?utf-8?B?S3JjeUlBY3lOZUg4SG5NSmRpaEF0L1BOVVRuU1E0bGZocFJFOEQxZEh6bzlk?=
 =?utf-8?B?RkJZMGNiVUJZcmhBZ3QwSDBwRGJmYTB6MFlxb1RVNUFrek1Eb3lOK3l4Zi9u?=
 =?utf-8?B?YWxXcXlKaGRXeDhMSjRuQmpwZXF6c29KVVZqS1BKMjVQWnp0dm1aZ3NTRlJO?=
 =?utf-8?B?a1ljUFVYbDYxY1FqM0pRNnY4Um8yc0VSTlBPeFBwMGphMkhFRW9CYk1jeElE?=
 =?utf-8?B?d3FZZXFvOENha1JCYm0yUkJKdXN6K2hEbFM2dVJ5V3IvMzV3OGpNbVRrM0lT?=
 =?utf-8?B?eHJBUWJlbXVsQ2dUNFJTbGdYOGdwc3E1M2Q0TTdLbUlOVXVMUHVMeUV3OXp6?=
 =?utf-8?B?Zm9yay9jUU1RMGV2OWZPU1NNT0s2TXFCK1RQMzBLaE1TeTU5b3VpNVhDakVt?=
 =?utf-8?B?RHZEUk1GRzVMNy8xWVpHWUJwRTJOZWg2WGd0cVA0dVd0UTQ5ZXdZb1lNdnNW?=
 =?utf-8?B?NVdvTHh0N0xTSk1QeUFpZmlsZUFYUkQ3QnNuQ1RNRU02a0NTdHdJMjJMVWxG?=
 =?utf-8?B?OXVJSmxGWFVRcnFlRUx2eXNkT0piM1IxNlZkYWt3dXRBS3A5SzhpUkxvWW5r?=
 =?utf-8?B?ZTRHdXZGdmozeGRMZ0xxM29rL20yMkhJZS83T1I5bzBjbks0a1RRVnptdUth?=
 =?utf-8?B?dXBDdFJJdjlzVEJmNndJQ2FsdlJiQlhHaE9MUHlLL0U3KzVsU1VxMUw1aHor?=
 =?utf-8?B?d1c3cUNFa2ZYU2ZuZGJrOVZGNGtHVlJZdDR3Z3IvSlhtQS9uME1laUFFMFNU?=
 =?utf-8?B?VGxCVzlaQ0g1WjlwRVFoSW04S0N0NVBWQ1pzZWJYVmNuV1ptTENSbHRJMnVE?=
 =?utf-8?B?Y25XaVdGL3dTZ2dGNkZDUnczVkRkSjRNOGw2Z25uOXpUWmozNHRRSG9GSExv?=
 =?utf-8?B?d2tZYmlrQXdmTWRFdy84QTlSTzJjaFBjZzd2TVdrUE5ZWXpKeU16aVlOQ01D?=
 =?utf-8?B?cVc5dGM2K1picGJrOGlEYTJKVHVsSld4dHlaS2FkdEJmcTFxRVdpZFNPY1U0?=
 =?utf-8?B?NkE0bG1WQkhQeW1tZmlUL3pvaFN5ME0weGl0U1NuTjRZMVZIemw0S2gzWCtM?=
 =?utf-8?B?MW01bWxId0htNU9KMVgyeG1oWE84NlMwaFlSckkwa2JDZzBSUW52TWs3a3ov?=
 =?utf-8?B?TW5XS3ZmT1dmR0poTDZCWjFiMFNUU2RlUHEzd1hyUWwrVmVkSEVHYm12QTJW?=
 =?utf-8?B?ek5MMWdTTXNlNkhQMW9LRDV6VHFSSDc0Vll6TlZwOWZrNDVwb1VwUDJPN2Zu?=
 =?utf-8?B?d1dyaFZrUml2NHRtRXpmY1JwbFVxZFRaSzY5UHFOOFc1Z25PU015RVVzQnRJ?=
 =?utf-8?B?UnhTNHh3Q1RNNzIrUjNPTEZhanNpK3VER0doNURiODFPaUxYNVVlc2ExRkNI?=
 =?utf-8?B?Qzc5ejE4cU02N2s2amIvdXBua00wMDFHOXhuanQzc05JYXp6eHo5YzZpM3Ji?=
 =?utf-8?B?anNueXhTMzBlNzRzYlR3MUkrV3ZwdHkvMGk4TFB5UDFtd1RNd29ueTNSSHZT?=
 =?utf-8?B?Q2ppeTVjSjVNOGFtRndIaHpOcFNGaGxzN2xkamZ0SUxBcUowY2puMWJrZHNP?=
 =?utf-8?B?T3N0MUdPTXNtTk03REI2TWlSdE5UZkx0dWZydFNIS0Vta1pwOGt0YW8wREhQ?=
 =?utf-8?B?MzJwZWZuMkFiQTEvU0wwQ0tITHVGdGlUSUkwdmJuRjI5bURRcmVHWkNpNCtk?=
 =?utf-8?B?Mm9JRFhlWThBQldWZDRyTW9raUNENmMzZjBZOWhTa0poYUhXTHFwb3krUk1F?=
 =?utf-8?B?MXZIdlJxekhuVEQ4NjcrTGNlQW1nWkpoODVTc2gyUU5hV2x0VCtwbi9hYUtZ?=
 =?utf-8?Q?V3JgRbNry7iHNfljwUcu/zt9S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <425449DC034C91498D0D1E6DEF7C9E56@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f957cf-0104-4c37-07cf-08da798ad388
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 22:10:38.7076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UwY48DHfqtiumMaPIeNL/Y7ATerPzDxD5rVicQ59nFUfziLivmB4SBBeFCRNV83KNjWaKjc8x6NeTVRi0yxa+qyyDEIF+9ryyGF/fgzfJ6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5677
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
X-List-Received-Date: Mon, 08 Aug 2022 22:10:57 -0000

T24gMDgvMDgvMjAyMiAyMjoyOCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6DQo+IE9uIDggQXVnIDIw
MjIsIGF0IDIyOjA2LCBDb25vciBEb29sZXkgPG1haWxAY29uY2h1b2QuaWU+IHdyb3RlOg0KPj4N
Cj4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0K
Pj4gVGhlIHN1Ym5vZGVzIG9mIHRoZSBzeXNjb24gaGF2ZSBiZWVuIGFkZGVkIHRvIHRoZSBpbmNv
cnJlY3QgcGF0aHMuDQo+PiBSYXRoZXIgdGhhbiBhZGQgdGhlbSBhcyBzdWJub2RlcywgdGhleSB3
ZXJlIG9yaWdpbmFsbHkgYWRkZWQgdG8gIi9mb28iDQo+PiBhbmQgYSBsYXRlciBwYXRjaCBtb3Zl
ZCB0aGVtIHRvICIvc29jL2ZvbyIuIEJvdGggYXJlIGluY29ycmVjdCAmIHRoZXkNCj4+IHNob3Vs
ZCBoYXZlIGJlZW4gYWRkZWQgYXMgIi9zb2MvdGVzdEAjIyMvZm9vIiBhcyAiL3NvYy90ZXN0IiBp
cyB0aGUNCj4+IHN5c2NvbiBub2RlLiBGaXggYm90aCB0aGUgcmVib290IGFuZCBwb3dlcm9mZiBz
dWJub2RlcyB0byBhdm9pZCBlcnJvcnMNCj4+IHN1Y2ggYXM6DQo+Pg0KPj4gL3N0dWZmL3FlbXUv
cWVtdS5kdGI6IHNvYzogcG93ZXJvZmY6IHsndmFsdWUnOiBbWzIxODQ1XV0sICdvZmZzZXQnOiBb
WzBdXSwgJ3JlZ21hcCc6IFtbNF1dLCAnY29tcGF0aWJsZSc6IFsnc3lzY29uLXBvd2Vyb2ZmJ119
IHNob3VsZCBub3QgYmUgdmFsaWQgdW5kZXIgeyd0eXBlJzogJ29iamVjdCd9DQo+PiAgICAgICAg
RnJvbSBzY2hlbWE6IC9ob21lL2Nvbm9yLy5sb2NhbC9saWIvcHl0aG9uMy45L3NpdGUtcGFja2Fn
ZXMvZHRzY2hlbWEvc2NoZW1hcy9zaW1wbGUtYnVzLnlhbWwNCj4+IC9zdHVmZi9xZW11L3FlbXUu
ZHRiOiBzb2M6IHJlYm9vdDogeyd2YWx1ZSc6IFtbMzA1ODNdXSwgJ29mZnNldCc6IFtbMF1dLCAn
cmVnbWFwJzogW1s0XV0sICdjb21wYXRpYmxlJzogWydzeXNjb24tcmVib290J119IHNob3VsZCBu
b3QgYmUgdmFsaWQgdW5kZXIgeyd0eXBlJzogJ29iamVjdCd9DQo+PiAgICAgICAgRnJvbSBzY2hl
bWE6IC9ob21lL2Nvbm9yLy5sb2NhbC9saWIvcHl0aG9uMy45L3NpdGUtcGFja2FnZXMvZHRzY2hl
bWEvc2NoZW1hcy9zaW1wbGUtYnVzLnlhbWwNCj4+DQo+PiBSZXBvcnRlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4NCj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjIwODAzMTcwNTUyLkdBMjI1MDI2Ni1yb2JoQGtlcm5lbC5vcmcvDQo+PiBG
aXhlczogMThkZjBiNDY5NSAoImh3L3Jpc2N2OiB2aXJ0OiBBbGxvdyBjcmVhdGluZyBtdWx0aXBs
ZSBOVU1BIHNvY2tldHMiKQ0KPj4gRml4ZXM6IDBlNDA0ZGEwMDcgKCJyaXNjdi92aXJ0OiBBZGQg
c3lzY29uIHJlYm9vdCBhbmQgcG93ZXJvZmYgRFQgbm9kZXMiKQ0KPj4gUmV2aWV3ZWQtYnk6IEFs
aXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4+IFNpZ25lZC1vZmYt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+IA0KPiBUaGlz
IGJyZWFrcyBGcmVlQlNE4oCZcyBkcml2ZXIgKHdlbGwsIGl0IGp1c3Qgd29u4oCZdCBwcm9iZS9h
dHRhY2gpLCB3aGljaA0KPiBpcyB3cml0dGVuIHRvIGhhbmRsZSBzeXNjb24tcG93ZXJvZmYvcmVi
b290IGV4aXN0aW5nIGFzIGEgY2hpbGQgb2YgYQ0KPiBzaW1wbGVidXMgbm90IGEgc3lzY29uLg0K
DQpJIGtub3cgbmV4dCB0byBub3RoaW5nIGFib3V0IEZyZWVCU0QgdW5mb3J0dW5hdGVseSBvciBo
b3cgaXQgaGFuZGxlcw0KYnVzZXMuIE15IHVuZGVyc3RhbmRpbmcgb2Ygc2ltcGxlLWJ1cyB3YXMg
dGhhdCBpdCBpcyBzdXBwb3NlZCB0bw0KcmVwcmVzZW50IGEgYnVzIHdpdGggInRoaW5ncyIgbWFw
cGVkIHRvIGFkZHJlc3NlcywgcmVseWluZyBvbiB0aGUgInJlZyINCnByb3BlcnR5LiBBbmQgdGhl
biBzeXNjb24gaXMgdXNlZCB3aGVuIHRoZXJlIGlzIHNvbWUgbXVsdGlmdW5jdGlvbg0KcmVnaXN0
ZXIgcmVnaW9uIHRoYXQgY29udHJvbHMgbXVsdGlwbGUgZmVhdHVyZXMgb2YgdGhlIGhhcmR3YXJl
Lg0KU2luY2Ugc2ltcGxlLWJ1cyBkZWZpbmVzIGEgcmVnIHByb3BlcnR5IGFuZCB0aGUgZnVuY3Rp
b24gbm9kZXMgZG8gbm90DQpkZWZpbmUgb25lLCBJJ2QgbGlrZSB0byBrbm93IGhvdyBGcmVlQlNE
J3MgZHJpdmVyIGhhbmRsZXMgdGhhdC4NCg0KPiBNb3Jlb3Zlciwgd2hhdCBpcyB0aGUgcG9pbnQg
b2YgcmVnbWFwIGluIHRoaXMNCj4gY2FzZT8gSXRzIGV4aXN0ZW5jZSBzdWdnZXN0cyB0aGUgcG9p
bnQgaXMgZm9yIHRoZW0gdG8gKm5vdCogYmUgY2hpbGRyZW4NCj4gb2YgdGhlIHN5c2Nvbiwgb3Ro
ZXJ3aXNlIHlvdSB3b3VsZG7igJl0IG5lZWQgYW4gZXhwbGljaXQgcGhhbmRsZSwgeW914oCZZA0K
PiBqdXN0IGxvb2sgYXQgdGhlIHBhcmVudC4gTW92aW5nIHRoZSBub2RlcyB3aGlsc3Qga2VlcGlu
ZyB0aGUgcHJvcGVydHkNCj4gZG9lc27igJl0IG1ha2Ugc2Vuc2UgdG8gbWUuDQoNClRoYXQncyBo
b3cgc3lzY29uIGJpbmRpbmdzIGFyZSBjb25zdHJ1Y3RlZCwgbWFrZXMgaXQgZWFzaWVyIHRvIGZv
bGxvdw0KSSBzdXBwb3NlIGlmIHRoZXkgZnVuY3Rpb25zIGFyZSBjaGlsZHJlbiBvZiB0aGUgc3lz
Y29uIG5vZGUuIFN0cmljdGx5DQpJIHRoaW5rIHRoZXkgZG9uJ3QgbmVlZCB0byBiZSB1bmRlciB0
aGUgc3lzY29uIGl0c2VsZiwgSSB0aGluayB0aGV5IGNhbg0KYWxzbyBnbyBhdCB0aGUgdG9wIGxl
dmVsIC0gdGhleSBqdXN0IGFyZW4ndCB2YWxpZCB1bmRlciB0aGUgL3NvYyBub2RlDQphcyBpdCBo
YXMgYmVlbiBkZWZpbmVkIGFzIGEgInNpbXBsZS1idXMiLg0KDQpJdCB3b3VsZCBhcHBlYXIgdGhh
dCB0aGUgb3JpZ2luYWwgcGF0Y2ggMGU0MDRkYTAwNyAoInJpc2N2L3ZpcnQ6IEFkZA0Kc3lzY29u
IHJlYm9vdCBhbmQgcG93ZXJvZmYgRFQgbm9kZXMiKSB0aGF0IGFkZGVkIHRoZW0gcHV0IHRoZW0g
YXQgdGhlDQp0b3AgbGV2ZWwgYW5kIGl0IHdhcyBpbiB0aGUgcmVmYWN0b3IgdGhhdCB0aGV5IGdv
dCBtb3ZlZCB0byB0aGUgc29jIGJ1cy4qDQpNYXliZSB0aGUgc29sdXRpb24gd291bGQgYmUgdG8g
cHV0IHRoZW0gYmFjayBhdCB0aGUgdG9wIGxldmVsPw0KDQpkdC12YWxpZGF0ZSB3aWxsIGNvbnNp
ZGVyIGl0IHZhbGlkLCBidXQgd2hhdCBkb2VzIHRoZSBGcmVlQlNEIGRyaXZlcg0KdGhpbmsgb2Yg
dGhhdD8NCg0KVGhhbmtzIGZvciB5b3VyIGlucHV0IEplc3MsDQpDb25vci4NCg0KKiBPbiByZWZs
ZWN0aW9uIGl0IGxvb2tzIGxpa2UgbXkgZml4ZXMgdGFncyBhcmUgbm90IGNvcnJlY3QgYW5kIHRo
YXQNCjBlNDA0ZGEwMDcgd2FzIGFjdHVhbGx5IGNvcnJlY3QgYnV0IHRoZSByZWZhY3RvciBicm9r
ZSB0aGluZ3MuDQoNCj4gDQo+IEplc3MNCj4gDQo+PiAtLS0NCj4+IGh3L3Jpc2N2L3ZpcnQuYyB8
IDYgKysrKy0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9ody9yaXNjdi92aXJ0LmMgYi9ody9yaXNjdi92aXJ0
LmMNCj4+IGluZGV4IDhiMjk3ODA3NmUuLmE5OGIwNTQ1NDUgMTAwNjQ0DQo+PiAtLS0gYS9ody9y
aXNjdi92aXJ0LmMNCj4+ICsrKyBiL2h3L3Jpc2N2L3ZpcnQuYw0KPj4gQEAgLTg5Niw3ICs4OTYs
OCBAQCBzdGF0aWMgdm9pZCBjcmVhdGVfZmR0X3Jlc2V0KFJJU0NWVmlydFN0YXRlICpzLCBjb25z
dCBNZW1NYXBFbnRyeSAqbWVtbWFwLA0KPj4gICAgIHRlc3RfcGhhbmRsZSA9IHFlbXVfZmR0X2dl
dF9waGFuZGxlKG1jLT5mZHQsIG5hbWUpOw0KPj4gICAgIGdfZnJlZShuYW1lKTsNCj4+DQo+PiAt
ICAgIG5hbWUgPSBnX3N0cmR1cF9wcmludGYoIi9zb2MvcmVib290Iik7DQo+PiArICAgIG5hbWUg
PSBnX3N0cmR1cF9wcmludGYoIi9zb2MvdGVzdEAlbHgvcmVib290IiwNCj4+ICsgICAgICAgIChs
b25nKW1lbW1hcFtWSVJUX1RFU1RdLmJhc2UpOw0KPj4gICAgIHFlbXVfZmR0X2FkZF9zdWJub2Rl
KG1jLT5mZHQsIG5hbWUpOw0KPj4gICAgIHFlbXVfZmR0X3NldHByb3Bfc3RyaW5nKG1jLT5mZHQs
IG5hbWUsICJjb21wYXRpYmxlIiwgInN5c2Nvbi1yZWJvb3QiKTsNCj4+ICAgICBxZW11X2ZkdF9z
ZXRwcm9wX2NlbGwobWMtPmZkdCwgbmFtZSwgInJlZ21hcCIsIHRlc3RfcGhhbmRsZSk7DQo+PiBA
QCAtOTA0LDcgKzkwNSw4IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9mZHRfcmVzZXQoUklTQ1ZWaXJ0
U3RhdGUgKnMsIGNvbnN0IE1lbU1hcEVudHJ5ICptZW1tYXAsDQo+PiAgICAgcWVtdV9mZHRfc2V0
cHJvcF9jZWxsKG1jLT5mZHQsIG5hbWUsICJ2YWx1ZSIsIEZJTklTSEVSX1JFU0VUKTsNCj4+ICAg
ICBnX2ZyZWUobmFtZSk7DQo+Pg0KPj4gLSAgICBuYW1lID0gZ19zdHJkdXBfcHJpbnRmKCIvc29j
L3Bvd2Vyb2ZmIik7DQo+PiArICAgIG5hbWUgPSBnX3N0cmR1cF9wcmludGYoIi9zb2MvdGVzdEAl
bHgvcG93ZXJvZmYiLA0KPj4gKyAgICAgICAgKGxvbmcpbWVtbWFwW1ZJUlRfVEVTVF0uYmFzZSk7
DQo+PiAgICAgcWVtdV9mZHRfYWRkX3N1Ym5vZGUobWMtPmZkdCwgbmFtZSk7DQo+PiAgICAgcWVt
dV9mZHRfc2V0cHJvcF9zdHJpbmcobWMtPmZkdCwgbmFtZSwgImNvbXBhdGlibGUiLCAic3lzY29u
LXBvd2Vyb2ZmIik7DQo+PiAgICAgcWVtdV9mZHRfc2V0cHJvcF9jZWxsKG1jLT5mZHQsIG5hbWUs
ICJyZWdtYXAiLCB0ZXN0X3BoYW5kbGUpOw0KPj4gLS0gDQo+PiAyLjM3LjENCj4+DQo+Pg0KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdA0KPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZw0K
Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dg0KPiANCg==

