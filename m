Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozv77-0007Jm-Ld
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 02:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozv72-0007IX-Je; Tue, 29 Nov 2022 02:33:05 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozv6z-00016k-51; Tue, 29 Nov 2022 02:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669707181; x=1701243181;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=X/34SnNCE1AKL6AF+DoTQ8KpV0u0HqbSgQ8bZqlM/cE=;
 b=bh+v5UO5+Fg2xb5EnhNH1O37ppUL+//mWr4DX5EcoiOxsgkAemzoUnNT
 lifwBI0KtamdgGP07Yjj3PTkCxpEDFJI/TkU8PYjc7bVzPWMZ9I8zgIyv
 58LgfIwSc6pSFr5z6THqaAWXoZGQx5frTYssIr0OfEtzFT/+Qun1Lv1wI
 iFcmdTcLmLOwvzS15hKtjfe81cYtU3ZIZ9Ab2KKCdpi3JLwzL6Z5oES+e
 ctwHdZDs08Z6bzngoJWIcE9WBTqKmCUkOnS63BxdvRoYPDR1Ul7iLUvcv
 zW0HWF9Ckxxk32uSSIs6utPQRxpETYFITm7pQaTSOKN0HoesRiUWixBr3 w==;
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="185630218"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Nov 2022 00:32:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 00:32:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 29 Nov 2022 00:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeHUFc1IIzPg6YuED4R8W6X6U01bzohOLA1IHbWGM/VQCEY8mk2+/Wfo/YCRJmetKnzThDioLWJJqmZFXmLwF8AIOpzyJ56KzVZ+hgTN/LkhjJF5iKYG9CoAntyedNf6w7jOK8n85KYLtl47frkqQkG5Y+vgxmRntJ/LvZb9KLeGqHGBwy2NvQ/jbRODwVTkfF4uFURSbC808xx0uEZGrQ8EdlABG7w5vzc8qu06L/5lrEA7keuAEACBoSw5LhgkIw955VxzcBXHxhh8sk5Ce7FPLoZtxaNR5WQG3ZIUDBM+68YCVcB76ZQpmJVNvhWJD82vpj1K/9uHUZTyZY1llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/34SnNCE1AKL6AF+DoTQ8KpV0u0HqbSgQ8bZqlM/cE=;
 b=T13XpaMS8O+Zkzf7EEXNWeOwr97T5/HYQtUntcinbTKNtHQfWg5Nb2ivymuz0PjgFjcyOoqVkJTiXblr9rVw1zRBNl1zwPRoU7T+N1/eGYeFQ5avzrmqBQKUAS5bBYNfdsnUoKWJosnSK3mtxYSkyVKDsXn9OsTQjQLQd6Ak5K4IdavZ4+u5OFKVC2jvvdzSNSyoMXVnxgyHFEVvq7yvF3D21Odng1edp2sk0aIwv/HcIGQ9nNTqhrnnIQnTDlIp3BQS8dsF5VlbZvuEgLR3/5/O2s2EOBx+8rh31zHUn8KOamnC27QZpKnj6g34+I97MnqKTSGRPLWI2Kaxiu2Edw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/34SnNCE1AKL6AF+DoTQ8KpV0u0HqbSgQ8bZqlM/cE=;
 b=jZklG4wsbWhEbDjQ0b7+5nqKkyuhkRoyX/VQCldMBVau6DuJNS7nRstNbZooPGFWHxcDi75X/NjTqV3RH48Dx5/XxKoNqmXYYubQNFGyAIZYatzNS7QWKbdoqyWFY/6MX41ZWE83HJLU6VHu0eiqyDC3OlPaCUT7XqLiAViic4o=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 07:32:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 07:32:52 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>
CC: <atishp@rivosinc.com>, <qemu-devel@nongnu.org>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <palmer@dabbelt.com>,
 <qemu-riscv@nongnu.org>, <samuel@sholland.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Thread-Topic: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device
 tree
Thread-Index: AQHZA2ZrKWGujbHaTkmukQtrcQh1RK5UzAKAgAAA1ICAAAftgIAApykAgAAGxoA=
Date: Tue, 29 Nov 2022 07:32:52 +0000
Message-ID: <cd386574-b115-328e-c5db-6f85b6cf6c9e@microchip.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com> <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
 <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
 <20221129070820.7varmruxjkhdwoc6@kamzik>
In-Reply-To: <20221129070820.7varmruxjkhdwoc6@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|PH7PR11MB6450:EE_
x-ms-office365-filtering-correlation-id: cdb4172a-b6a9-40fe-5a2f-08dad1dbec9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aJEwEoYK1E2JZkDLQCprqQs44J7WyVvQr7+6awMboxAwanyPu3SU3g9mn01mv7Oyg8UkXE4eHfQ2dsRq34yupsrYwRVbqRqJe/Fkvzht/hwUP745QrYL/ox3FVzeDZ38hzrSlhWn6SyINBzMl+ev/XN5HrVFOxRWyGPmWpbSE/gCs9em/1fnDZaV8UVF8uNz/v8qqAVpQrY80FrX33LpOwuHmzkikXZlzGPzw0NhPI4eIYH8lL/5QJUWFY3QLWMFJQCzAB3AaZCacjRZ+u42GlYpbDVVBzRZWhfzcQPuwQuknBPbMECBUb3Seh45Ue3KMc4CmupkZVWVYOuo/wye+lSIC8vOoTA0dXJ/92H805CMtvmXRZQ7NqWtQvJvWGnbqmpDgTC/NHsjHsbvXEbrDYRq4RkMqLwMmfJ6GVsW5lIysGIZE8KNHlD+trO0R0gp1na3sXxI6/mOvf/vYYrFEBAapG+hy4cG+r6EYCB3Q/SCPRIEin9Lav3Olm/L0B/AeQUI4nD/jJSix1RvXiJmtKBxDPJKxhoHSCsHbZKZBTiD8hsTrR7N0LAjBSiwhSPIpuOW7A0cX4rJ8P1D46tR3/5BxtsnWt9vmXSSLh5BmW1rmJ8sljWpyMxqTMXhNChKfsqEJLf/3qLI8RRnGffBbmFp+zLDoq+L3FsI2mSGIQvvCuei5x90JRlBY9eZ8efVWolCETNkCq3r5EO5ZX22JlBlGPfMZKgnPZFjI8koOWcwU5YvBiIQtpp84LeN/UYxjV08qhzW7i+cNGkEq6MnzlF9gp6OF0i/PIUph/nqgRCowqiW5Rt7kIxcIqHqf4rXLNgLltUAj7yOsdm7r1C0xw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199015)(38100700002)(6506007)(53546011)(31696002)(26005)(86362001)(36756003)(76116006)(316002)(6512007)(66476007)(66556008)(66946007)(5660300002)(91956017)(122000001)(8936002)(4326008)(64756008)(8676002)(6916009)(66446008)(54906003)(71200400001)(31686004)(2616005)(2906002)(83380400001)(478600001)(6486002)(966005)(41300700001)(38070700005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTdKVnh4cUY0UlNVSGJuWU82VEVyQjVqTGgrVi94eXRjTmlsTG1WblRyOTdS?=
 =?utf-8?B?TjFrUWdKdVJTNHRuZzJlYzhZRE5jemxPUDdnc1FlbStvS2hoTG81UmVCL3Rj?=
 =?utf-8?B?Sm5zOFZVNWx4ODFNSkNNUEI0aXNZZmVMU1cvdmdueEpnN2FrbTBpSnpOQXhG?=
 =?utf-8?B?V1RMcCtvc3dWYS9yZElMYmVMVlJpR0xMOFh4TzZCZFNsVHBseW5wRTY0Um9K?=
 =?utf-8?B?TzNGaWFmMkwvN0VGZjErT2wyanMzNTdnZ3lDN3h2VWEvVWdPSjZwZml3aW11?=
 =?utf-8?B?clVCK1ozZXJKVTA4RlVMWm9tOVJNQjRYOWh4UUhieUNMTG52Q0RYRDNjOVh4?=
 =?utf-8?B?cFk3WEYrbzFiV0tRR2xTSElpeHB1eFArTVRDcWgwMzErdzRvOGxwNkVGeC9o?=
 =?utf-8?B?eVhoc3BDT2xMN1Z4NFhra1JEWktBZXFXNTkvcVVJOEVpNTM0OG5la1VrMG5Y?=
 =?utf-8?B?OGl1ZjBMNWxuZThkNGdac0w5NjFkQzZPMTN4WmhBdXRCOUE5T25KYlNlTjJU?=
 =?utf-8?B?YTRxK0lNTnJGRnBmV05PZXQ0cHM5WTlNRldkMkFZYkowTE5nM2lUTC9oR242?=
 =?utf-8?B?SnBaM2UxSXZYM05aYjIxMWhyKzhUTWpMSlpkUkEreXN1eS9hazJFSXV0Nk5a?=
 =?utf-8?B?K29yRDdOZm03Lzh1dWFyL2hHYzQ4RHJHWEh4NEtjYytiNU43QlZBMnZmcjRL?=
 =?utf-8?B?UnRiSHMybnQzWjRFS3Z5NFZDTTFLdklzZldXcEJObnV2SG8wY0JxalBQb1I5?=
 =?utf-8?B?OXdhSW1rNnIzSFpyeURBSk4xYjRjdDdLN2IxYkt2T2NwamQ4UG50K08vMWF1?=
 =?utf-8?B?b1ByTnZUTjBhVFB6d0JZUlYwSFljaVM3dzd2Q3QrbHRVc3JNZ1doaUN3R3o2?=
 =?utf-8?B?RXlWNFFaekRReFU2dDNMelpaekhaQjhiTVMxSktDMFFwN2dxTmlrbU5uT2l3?=
 =?utf-8?B?VTZPRHVVUHBnN05vaUVnbEJMUVZRRHh5UzlZM29sTzdkRnNFbEtSNlJ4OVRF?=
 =?utf-8?B?ZDhWZ2JjVHpMY0c1YWNJWWJtY1RwZGp5eTl5UmJaeWtHVVJGWWJEekpMMyt3?=
 =?utf-8?B?TTdLN2RGRXJCRUh2WWVsNnYvNnJFakhtL2pCTFhUVXFNRUxwMWJUV3Z5WWh4?=
 =?utf-8?B?STB6T3B2eWpoditFdThQMlM0cGhES25JUzJJYmtnSHR4eEhmallDR2MwWFR6?=
 =?utf-8?B?eEJOL01oaHUrWVpMYlBHeEl4TzRFM2dXUjR5VVI0T09aNGloMUVEWm82TG9E?=
 =?utf-8?B?ZlI0UExqUURJNUFxYXB0Y2hISURSbm5OTkFGSXdONUVPODV0c0JGUGxzV280?=
 =?utf-8?B?VzlmbUJLQnZXY04ySEhBeGh6ZWxkV2ZkZDdhR1lmMTBXcEpwSzYwTHJjazI2?=
 =?utf-8?B?MDBLVUhJWGNyMUZYUUY5UDlPWk1JdHhtck5rVjJsbS8xdGxnVURNTjY0TjlP?=
 =?utf-8?B?MzkrQVFUR25DazE4QlZqL0FUM1BIaHdjVEZQVmVpRm5Ec0lZczE4bUp0Z2lt?=
 =?utf-8?B?SGVybWJ4bUtacGZacXowZGNiR1JXbWR2aUh5Y3IzOWFmRjlZYm9pMWVWRytL?=
 =?utf-8?B?WGRPemhVajJkYi96VTYwUHBHNS9wZVRXRlNHWE5KMlFranlMZWxxbDQvRXFB?=
 =?utf-8?B?aDJHa0FQOThxMHlldi85bTRlUWVuYTExTk9Ed2xvZklzSy9sb2N4L3hmUkZN?=
 =?utf-8?B?eENEd1ZiU05xS0JwUW9RSWJucUpudWNDZHdFV2Z2aERwWHpKdjF1c3VmMjlZ?=
 =?utf-8?B?T015SlpFUjNqOWRNT3pZNVNUbEVLdUpZYTNJQk1BQVpZM1dtMmlvNTBQUWhR?=
 =?utf-8?B?bHRJYU5vZ2g3aWwrdTlQRS9WZDJMdGNJUWZySGZGN1lreHdkK3VabEVJN1lC?=
 =?utf-8?B?NnVCOXd6eXJTOWhBbkRwN2tuLy91ck9BUi9kKzd6MFI3RjVqem1pRTJ1akdT?=
 =?utf-8?B?UmJqY1pUY09IRVZydnFVNzNXQXEyNzRlSk1KMDF6SFAxNWg4Ny9wUUZUdVN1?=
 =?utf-8?B?QUlOVXZmcUNvbzRkQ1VQL3NudHBUWjVHdUsxbXlMV0h4Unljd1B6aVdTTmYz?=
 =?utf-8?B?anpOL0xWcVo2aENuMEhUd0dHYzJoeENBUFRpMmRsMi85RU4rNGlLOVRiZ1dB?=
 =?utf-8?Q?2jLUVBQdESTDWTB+0usvCFa49?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86794FD256A5BB4E84AC7F6785BC2A8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb4172a-b6a9-40fe-5a2f-08dad1dbec9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 07:32:52.3630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRr9hn8lEkfs9jypjHpiK0EuvbEgaIl29OMHFPrszscoOA5iBUw7uVMB63heE1w9p7ActaYnHm28dAeMujkc2/B6d9DgcQYbkhs6rqOasOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
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
X-List-Received-Date: Tue, 29 Nov 2022 07:33:07 -0000

T24gMjkvMTEvMjAyMiAwNzowOCwgQW5kcmV3IEpvbmVzIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIE1vbiwgTm92IDI4LCAyMDIyIGF0IDA5OjEw
OjAzUE0gKzAwMDAsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMjgv
MTEvMjAyMiAyMDo0MSwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiBNb24sIE5vdiAyOCwgMjAyMiBhdCAx
MjozOCBQTSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBP
biAyOC8xMS8yMDIyIDIwOjE2LCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToNCj4+Pj4+IE9uIFRo
dSwgTm92IDI0LCAyMDIyIGF0IDU6MTcgQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4gd3JvdGU6DQo+Pj4+Pj4NCj4+Pj4+PiBPbiBXZWQsIEF1ZyAyNCwgMjAyMiBh
dCAwMzoxNzowMFBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToNCj4+Pj4+Pj4gUWVtdSB2aXJ0
IG1hY2hpbmUgY2FuIHN1cHBvcnQgZmV3IGNhY2hlIGV2ZW50cyBhbmQgY3ljbGUvaW5zdHJldCBj
b3VudGVycy4NCj4+Pj4+Pj4gSXQgYWxzbyBzdXBwb3J0cyBjb3VudGVyIG92ZXJmbG93IGZvciB0
aGVzZSBldmVudHMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEFkZCBhIERUIG5vZGUgc28gdGhhdCBPcGVu
U0JJL0xpbnV4IGtlcm5lbCBpcyBhd2FyZSBvZiB0aGUgdmlydCBtYWNoaW5lDQo+Pj4+Pj4+IGNh
cGFiaWxpdGllcy4gVGhlcmUgYXJlIHNvbWUgZHVtbXkgbm9kZXMgYWRkZWQgZm9yIHRlc3Rpbmcg
YXMgd2VsbC4NCj4+Pj4+Pg0KPj4+Pj4+IEhleSBBdGlzaCENCj4+Pj4+Pg0KPj4+Pj4+IEkgd2Fz
IGZpZGRsaW5nIHdpdGggZHVtcGluZyB0aGUgdmlydCBtYWNoaW5lIGR0YiBhZ2FpbiB0b2RheSB0
byBjaGVjaw0KPj4+Pj4+IHNvbWUgZHQtYmluZGluZyBjaGFuZ2VzIEkgd2FzIG1ha2luZyBmb3Ig
dGhlIGlzYSBzdHJpbmcgd291bGQgcGxheQ0KPj4+Pj4+IG5pY2VseSB3aXRoIHRoZSB2aXJ0IG1h
Y2hpbmUgJiBJIG5vdGljZWQgdGhhdCB0aGlzIHBhdGNoIGhhcyBpbnRyb2R1Y2VkDQo+Pj4+Pj4g
YSBuZXcgdmFsaWRhdGlvbiBmYWlsdXJlOg0KPj4+Pj4+DQo+Pj4+Pj4gLi9idWlsZC9xZW11LXN5
c3RlbS1yaXNjdjY0IC1ub2dyYXBoaWMgLW1hY2hpbmUgdmlydCxkdW1wZHRiPXFlbXUuZHRiDQo+
Pj4+Pj4NCj4+Pj4+PiBkdC12YWxpZGF0ZSAtcCAuLi9saW51eC9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcHJvY2Vzc2VkLXNjaGVtYS5qc29uIHFlbXUuZHRiDQo+Pj4+Pj4gL2hv
bWUvY29ub3Ivc3R1ZmYvcWVtdS9xZW11LmR0Yjogc29jOiBwbXU6IHsncmlzY3YsZXZlbnQtdG8t
bWhwbWNvdW50ZXJzJzogW1sxLCAxLCA1MjQyODEsIDIsIDIsIDUyNDI4NCwgNjU1NjEsIDY1NTYx
LCA1MjQyODAsIDY1NTYzLCA2NTU2MywgNTI0MjgwLCA2NTU2OSwgNjU1NjksIDUyNDI4MCwgMCwg
MCwgMCwgMCwgMF1dLCAnY29tcGF0aWJsZSc6IFsncmlzY3YscG11J119IHNob3VsZCBub3QgYmUg
dmFsaWQgdW5kZXIgeyd0eXBlJzogJ29iamVjdCd9DQo+Pj4+Pj4gICAgICAgICAgRnJvbSBzY2hl
bWE6IC9ob21lL2Nvbm9yLy5sb2NhbC9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL2R0c2No
ZW1hL3NjaGVtYXMvc2ltcGxlLWJ1cy55YW1sDQo+Pj4+Pj4NCj4+Pj4+PiBJIGFzc3VtZSB0aGlz
IGlzIHRoZSBhZm9yZW1lbnRpb25lZCAiZHVtbXkiIG5vZGUgJiB5b3UgaGF2ZSBubyBpbnRlbnRp
b24NCj4+Pj4+PiBvZiBjcmVhdGluZyBhIGJpbmRpbmcgZm9yIHRoaXM/DQo+Pj4+Pj4NCj4+Pj4+
DQo+Pj4+PiBJdCBpcyBhIGR1bW15IG5vZGUgZnJvbSBMaW51eCBrZXJuZWwgcGVyc3BlY3RpdmUu
IE9wZW5TYmkgdXNlIHRoaXMNCj4+Pj4+IG5vZGUgdG8gZmlndXJlIG91dCB0aGUgaHBtY291bnRl
ciBtYXBwaW5ncy4NCj4+Pj4NCj4+Pj4gQXllLCBidXQgc2hvdWxkIGl0IG5vdCBoYXZlIGEgYmlu
ZGluZyBhbnl3YXksIHNpbmNlIHRoZXkncmUgbm90DQo+Pj4+IG1lYW50IHRvIGJlIGxpbnV4IHNw
ZWNpZmljPw0KPj4+Pg0KPj4+IEl0IGlzIGRvY3VtZW50ZWQgaW4gT3BlblNCSS4NCj4+PiBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvYmxvYi9tYXN0ZXIvZG9j
cy9wbXVfc3VwcG9ydC5tZA0KPj4+DQo+Pj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgYW55IG5v
bi1MaW51eCBzcGVjaWZpYyBEVCBub2RlcyBzaG91bGQgYmUgcGFydA0KPj4+IG9mIExpbnV4IERU
IGJpbmRpbmcgYXMgd2VsbCA/DQo+Pg0KPj4gSSB0aG91Z2h0IHRoZSBwb2ludCB3YXMgdGhhdCB0
aGV5IHdlcmUgKm5vdCogbWVhbnQgdG8gYmUgbGludXggc3BlY2lmaWMsDQo+PiBqdXN0IGhhcHBl
bmluZyB0byBiZSBob3VzZWQgdGhlcmUuDQo+Pg0KPiANCj4gSSdtIG5vdCBzdXJlIGlmIHRoZXJl
J3MgYW4gb2ZmaWNpYWwgcG9saWN5IG9uIHdoZXJlIERUIG5vZGVzIHNob3VsZCBiZQ0KPiBzcGVj
aWZpZWQsIGJ1dCBpdCBsb29rcyBsaWtlIFNhbXVlbCdzIG9waW5pb24gaXMgdGhhdCB0aGV5IHNo
b3VsZCBsaXZlDQo+IGluIHRoZSBMaW51eCBrZXJuZWwsIHdoZXRoZXIgdGhleSdyZSB1c2VkIHRo
ZXJlIG9yIG5vdCBbMV0uDQo+IA0KPiBbMV0gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlw
ZXJtYWlsL29wZW5zYmkvMjAyMi1PY3RvYmVyLzAwMzUyMi5odG1sDQoNCllhaCwgdGhhdCB3YXMg
YWxzbyBteSB1bmRlcnN0YW5kaW5nLiBTZWUgYWxzbyBVLUJvb3QgbW92aW5nIHRvIHVuaWZ5DQp0
aGVpciBjdXN0b20gYmluZGluZ3MgaW50byB0aGUgbGludXggcmVwbzoNCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvMjAyMjA5MzAwMDE0MTAuMjgwMjg0My0xLXNqZ0Bj
aHJvbWl1bS5vcmcvDQoNCg0KDQoNCg==

