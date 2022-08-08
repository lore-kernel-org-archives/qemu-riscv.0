Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oL9lD-0002vc-QC
	for mharc-qemu-riscv@gnu.org; Mon, 08 Aug 2022 16:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oL9lC-0002rp-Bv; Mon, 08 Aug 2022 16:54:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:62367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1oL9l8-0004UM-9d; Mon, 08 Aug 2022 16:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1659992038; x=1691528038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Z0fja/Dzy8FXL5f+6cjyilojQrglzXCe/YQkf87fQcE=;
 b=h8yIGTKxzd/2GK2VASInxtHAm5hqqgxs06+eHkvFQQj9RbFQ0Yz/kzHH
 V6RJXjaI59L0HKFtNeXxcS7pH7i9AJ5YX5BfTO9JeWbWBfyYN8uxlzLHt
 BUjjOAzLIQTVX+truvUAmuhuoJJD2sVo8H//Rgmdx6OYFTxJ71I9n3O2M
 gMJC+oCXfYGpEFMl1cBJzpNaju1Ui9+VotaUqJvzzMriOIbQB4l71qU0Y
 HCAOmq3o2ezl5Hykw9Z/LmrL6svSvSIt23aOaOf+B21JfhP4u9YUh43Ax
 1LImtahL0DeJRseR3QKzplxElCMb05LRBt8Efyaxn/ZUe+PJ/siF/GOAc g==;
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="108110166"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Aug 2022 13:53:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 13:53:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 13:53:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=av83IciFVt4S09Q3mt1il95hlWBFOuv4lOWrssuAR5TG4AGaYmRrL7FocLMjsJae2kPxL7xHxTHFvo+PaaSdNpqdn1Pgxq45oypAwQ1LIyT/D0GVODx5HYXGMOWQ8fkhSln6wJ5NRSjOreHGDvW82k4P11KGSK/RDTH4bxqLAAkMJw07CxGzfCJ5j2eJGPbIR1Q2+l/mZ6d/fNi0C+OsWFCu14cxyzFFe7/LakeelK5ColF+G0rinAKMrGUAANedCVoLsUzZEq3DB04tjQdj51t3HjMfjWUyADp9Tl+bR2aTVJ3v8pDikhGO/syt8HBIJoHznscrWLZaL0dASWxFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0fja/Dzy8FXL5f+6cjyilojQrglzXCe/YQkf87fQcE=;
 b=EGa31mEP/Oz59F5wC3jorSDcj9lkiP9EJAueEXJYQzkLf3d3/A9EyO9MSdUS82fGgQqzcMw/MkxWBWrpxA4kuQoG7OF2df7c3W7y4qOo+A7yQXjJlGmNN/7LQyQvW4lITEBNfz2CTLdpcJ35kU5mea/mKyy1E6XajZgyPGdNeDREdm3mcXInJdAZIuxLKv0vBoX8nnmJ5b+cPSrcLmz4sLeMuUb9eMjWsGYr4+/KehauNccv2JYZsIf/4eWIkChGsRf4Fy8aN0SuQgaMonxZ7wWl8ung9O9wpVhKTbuWNSFA8lvm8dl51gneR/GDPhwZXPCyqX4T3MWQoekNDLiadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0fja/Dzy8FXL5f+6cjyilojQrglzXCe/YQkf87fQcE=;
 b=cacBcwhAJssEW3z2ThWAFLv07p8S6DLflNE3/Wu76Sa4gw31P8qST7wTlwBjtZUF6lsWMRdVS0rUInkwu6rEzsE4WJvGEW2WE9t5vO1Y7tF95aXJhsUiOzB9kHPeKmsz2D12txLkIfy9GJ5qSTkaau4VgHZI+Lx6Sl2ItKkGd3w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 20:53:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 20:53:36 +0000
From: <Conor.Dooley@microchip.com>
To: <alistair23@gmail.com>
CC: <research_trasio@irq.a4lg.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <Conor.Dooley@microchip.com>, <robh@kernel.org>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>, <linux-riscv@lists.infradead.org>,
 <palmer@sifive.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Topic: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Index: AQHYqOO1TG25AQQCRk+oHxWTs2yK5a2lHi0AgAATygCAAE2gAIAAAHwA
Date: Mon, 8 Aug 2022 20:53:36 +0000
Message-ID: <0fa07f29-e455-f20d-9c48-726cb2c68265@microchip.com>
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
 <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com>
 <fe4bc495-14a3-205d-480d-083c2a81fd13@microchip.com>
 <CAKmqyKMURX0ZVgWBOWtWD0fLXTfLDRfdhDtsqLEEPKL=h=afPw@mail.gmail.com>
In-Reply-To: <CAKmqyKMURX0ZVgWBOWtWD0fLXTfLDRfdhDtsqLEEPKL=h=afPw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c4219fa-de7d-4603-05e9-08da79801065
x-ms-traffictypediagnostic: PH8PR11MB7072:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pB4m4UT2f5klnXwiMtc1yo+mzctEGl+knuURICrCeKkgEtW0GNgDxHO0NKcmMWc2VCNE7WwTV0iV06lvUnFZLP7Y8DHp580WqrqZttlx3oBTLmNvdEUp0W+MBqUf6HvHuHYXHXXp+xsnRsHUf139dz2S3aasE3cR7GUtDStNEnGuDrq8FfEnaNhaOQ8NTcTdIkciyFYEQTVIR8SkmOAtwzbgQBJloxg+MltcVvHcD9mgbPF1lF9mUXRZ+emRG2UfFipgultG5iFQnCw0URPywNIri7iA0FcIxCcMEmpGJGMsPb/ySZD44o7dOAuYIWAk3ujG17GXwC6wotu69u/qhUuy+RrKGnwOUpi7f51UQbH78IuroTM4Fdes7XzcYmluLvyLhNtUOpZMkozQ9L0WA0TeqM4+GgJvoZAAoYGvQPMqCW7Kh1JsYVc6bZuSB2MZGP2F/obQiQYFVBOZLmlHgWtc8bCSsxxtCvytIyAA2dkI+ZHTyDdDnliSXP1/HbLk2yEzb47LL8FKtvh6zB07EavF0tQBmZ631UHkZ+tf8zsyEzWj1Q27CUv2S/BZB0XAqqHZf1AWOlS3T3zjDIaxS3rBOjPG5QqmcAcS45GsMug7wdd+Hru6fnO/KNu+IbqdUsK7Lk39ZkzMz+wj9hSmGhldfuL3732Upz8bXGJ6fHCVIk87vq0iC7jjaG85uzevpqaysgqAO3K0Z4t1WuCScaIPFb+cNAV6zQZ0ib+v0ovL7dVw3YvrbG7dw/d74K0YcQLqLiHz7mi1SL5JoRxNYkw+U5LVsm9WA1I8JyIP+KItEXi/macU0NnMoLOqOK1FNcA3VGRwQ99+sC8ZmfkbUuGG/xFdGegHbRyiAm8wWNpkc50w5dVX+MF4dhVPIheN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(39860400002)(136003)(376002)(31696002)(86362001)(41300700001)(26005)(6512007)(53546011)(6506007)(122000001)(38100700002)(38070700005)(91956017)(2616005)(186003)(8676002)(64756008)(66446008)(4326008)(66476007)(66556008)(66946007)(76116006)(36756003)(4744005)(2906002)(5660300002)(7416002)(31686004)(8936002)(6486002)(71200400001)(6916009)(478600001)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVV3RG82K3hreEpISWxJZllLVG81U2s4MmpsbGFOc01naFMzaDg5L2QyMVdw?=
 =?utf-8?B?d2o3SFBXT3JzMFpxYndTand6WkdGdVg2OE1xdDVRVlAyTXNPM0RFRW1pM1M5?=
 =?utf-8?B?TFVJY0EvSW9PMUhETzFpRlhEWGVoeFMycXhVMTZiQlNaQTl5MzZMbks5T01R?=
 =?utf-8?B?clJSMk1MRDVBT2puaFgvMlVrd09uRFpnMXlzTGxuMFErYVJNNlhNaUFQVE85?=
 =?utf-8?B?cFRMelFKNTN4M0xjRTlESEtoS3RsV2oyUHA3ZnRybTNVbFpyTklFTUJBRmhm?=
 =?utf-8?B?SXlVditLcnhxWHBRRHYvZzdUeHFJUE5BZ0dHNzZ6ZHBkTDNPY0Y3LzhlbVg3?=
 =?utf-8?B?ZVljVHYxRytOczBySnJUOTFvbUlrY0NKdUIyVFNXcnBTK1J2YnhESWlpWkgy?=
 =?utf-8?B?cmtTem9wY3RISjhNOUE2R2FuUmxkZ014enFJeE1LV2pmbGJFWFl4REF4WTh6?=
 =?utf-8?B?VlFXRjZhQUtFNExEWlRiaExWT0xxSHMvbGVYRDlpZEhiVVBQY0ticHJoajQx?=
 =?utf-8?B?ZTUwZkpGSUwxWmVMWWZkMUtnMU5Lc0FablBtclcvd2NqZzBaVXlwaVpoWXNQ?=
 =?utf-8?B?Z0RzUnJQTzRNQll2akhrYW81dFhqbDg0Vm1wYUpNK2tYVlh2Wi8xTWI3eEZH?=
 =?utf-8?B?enFrVkRrcE5VYVd6cHJZb0FTRzBZbHVoK2RvZ2MwVTE2dW56WTg1cGsyNjls?=
 =?utf-8?B?cXlDeXNSOHJTUXV1TURaZVlqdkJBKzVQTkYrWUN1M0pVV1JoSlNtcHphaFB6?=
 =?utf-8?B?RDdGRWQ4WmlLL0lURGZwblE0NGp6amJ5ZHczL2o2R3laMTczcWNwRlU5OWlw?=
 =?utf-8?B?QXpEZElZUkNyQ3VSWU82TUI1dVRUMzBEUHZmc1hyK3lGUnVVZnBROHBUdXFQ?=
 =?utf-8?B?QVhYQkJiNThheUJ3QWViYVc2YWlKWjEzYUlEM1V4ZVpzZjhBcGxEa0RRaGNu?=
 =?utf-8?B?Z01za3BKdWQ5Nk44MkFVNmgzTWJYUStQSktSZUpCa1VQL0FzSWRCbFRxK1Jx?=
 =?utf-8?B?ZVFwUkNaNTg4VTNNaVc5WlFjZDRuZjd3aGFMakdFbmpXenlHbTRoVnZqOXJQ?=
 =?utf-8?B?b3hPZTRoNGoxQjdwN0VYQ3JaQ1ZPWm8yTCtmMFMzWkVlbXI2TGlEdXpVNmtr?=
 =?utf-8?B?ZlpBT29HWkxEdDFWekUrZGtoY3dJU3g0bzYvRll3RnkxTzl5RGJXcUwzNnUz?=
 =?utf-8?B?eExtbWxVSHFNS1BSeHhxQndzaTBMTkdoTWVVR0g5cDJKaktVRW1DK3N2eDBx?=
 =?utf-8?B?OGtJUW9UN0xhUVdLTHEzY1MrdC9qS0ZLN2FGa0VhMmY5R3N3UzVUVkFPT3k4?=
 =?utf-8?B?ejU3WlY1U2VCVzkzeFpxWXJ3a2JVblMwbTZKS1NLQnBEUUNPaFlWQTlmVmdL?=
 =?utf-8?B?T1hXQnJKL2dlQTVuZE04NlhBejBoQVdYa1BvUjRIdzc3ZWFncnBUMzV4SjEz?=
 =?utf-8?B?SlR1b3NVQ1ZEa0pKUUpwbnR5VWl2TWtjYitCQ0dRSXVFSDRrQmZoK0RpTFhT?=
 =?utf-8?B?aktnUHczNzNUSnZRWk45eEs3ZnNZTVhIQy82VERseTNoMnY1MFFtOFBQL0RT?=
 =?utf-8?B?eWc2NmZucEpMY094VmUxZGw0cVlSd2tjRExTcDFHTGxOSHR1RThTd25WdWFx?=
 =?utf-8?B?WG1WWFRESC9RM21tczhRd0IxUGdWanFML2o3SndtVUp4MWJJYjBva3ZVWFlj?=
 =?utf-8?B?NjJUTlRpbXF2NVJRUmtsRFFuenlubVRiZ0ZkK0RGRjQ3YnI5ck5BSEVUeG1Y?=
 =?utf-8?B?V2EzQkpLRHlqaUNRR3lPczV3THdrS05GT2t2OUlNaE53U0sxTlJielFUMndU?=
 =?utf-8?B?NEVteXRwTzBBOVBoaThURjVJQXp0OTgzRmt2L3grUEFkWTJmdGx5QzBYSEdu?=
 =?utf-8?B?a2NzczB4TzkwWHdwQ1VTaGd1cDdiRHFhNVhuRlpGWFoyZUZnNVdDMTVmMnpW?=
 =?utf-8?B?Q2dEWTVHejZtOTJtdS8xTVB0bUFFR3k0Rit2VytsaW9OVnllWmJHYUM1TW1p?=
 =?utf-8?B?akFNZ09QbU5OVlI1bDdvN1hLUjRYcUFCeGl5RkJjWlpRb3FEbDJCR2tlNTE2?=
 =?utf-8?B?dGZrWFpIRHF2ekNsdVRuaE5mcXNUSUhpdHRyeUd6NE9xQ21zQ3pFUmJHeGtL?=
 =?utf-8?Q?Jy4GSeX5jIxTv6EcXcBTB1QLW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37CFBDAE6DD877439238E202FCD03A2D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4219fa-de7d-4603-05e9-08da79801065
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 20:53:36.3865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eRw6/g5iuHggM3Fa2TyGGLoaVea+g5bUz81+mGrFGkztjLUQ4ra91IJlcIbiweadrcvboLtO+PqH4tsK0ZSymxPi0SlMZA+50oZqMMxwG+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
Received-SPF: pass client-ip=68.232.154.123;
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
X-List-Received-Date: Mon, 08 Aug 2022 20:54:02 -0000

T24gMDgvMDgvMjAyMiAyMTo1MSwgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4gT24gVHVlLCBB
dWcgOSwgMjAyMiBhdCAyOjE0IEFNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6
DQo+PiBJIGd1ZXNzIHRoaXMgcGF0Y2ggY2FuIHRoZW4gYmUgc2FmZWx5IGlnbm9yZWQgOikNCj4+
IEdsYWQgdG8gaGF2ZSBjbGVhcmVkIHRoaXMgdXAgYXMgSSB3YXMgcmF0aGVyIGNvbmZ1c2VkIGJ5
IHdoYXQgSSBzYXcuDQo+IA0KPiBHcmVhdCEgRG8geW91IG1pbmQgcmVzZW5kaW5nIHRoZSBzZXJp
ZXMgdGhlbiB3aXRoIHRoaXMgcGF0Y2ggZHJvcHBlZD8NCj4gSXQganVzdCBtYWtlcyBpdCBlYXNp
ZXIgZm9yIG1lIHRvIHRyYWNrIGFuZCBtYW5hZ2UNCg0KQXllLCB3aWxsZG8uDQo=

