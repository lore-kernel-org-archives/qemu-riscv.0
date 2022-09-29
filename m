Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ody0P-0006A4-2y
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 14:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1ody0N-00066P-Gy; Thu, 29 Sep 2022 14:11:27 -0400
Received: from mga06b.intel.com ([134.134.136.31]:20685 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eddie.dong@intel.com>)
 id 1ody0L-0004Ku-0M; Thu, 29 Sep 2022 14:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664475084; x=1696011084;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5k9xt7jXPIZyAT2tBB2t8QycShwgipHH1+ZhTajXahU=;
 b=RRkQN4dyLUvLErzoTZaxHgu/X0efTNnOt1PP6Q42GDHsHbbpDy7Xr7lN
 hhlecC0volFnCnuSyjrPsiFFrHlmn+6kKaC6w/PRY8h0lFfxw6yWMqC2b
 8XEd1cKCa0OCPFynWUEv/p+Sjefn8gZPUwa/DnEm8akzY6cGofngVVsle
 JZQxrLA+p0h7A6YMeCVfCc4CBdIcim8lXC8KUQd9bWmrJw5wk54Qt/MzC
 3fY6yrQSnYgXp+ZEfVGZpKPXhlYTw4IZhJIyJuLGbP4jnWWueI1kBMmZS
 y7xHu956TtnrU5N6by+D0nCDJ69zrBn7+Wo8tcZsRDi6EvV+ApWBV7eqF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="363828786"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="363828786"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 11:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="764825864"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="764825864"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2022 11:11:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 11:11:20 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 11:11:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 11:11:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 11:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O86a/TcDODHpdImYbFE/6YqzOclKzi8Ri3HDj+8ESyHG9Kizws7UHIDftIqKE/7jy8Eo8FxJkRabjU8yXYxAPco743VVz1HwYKQF3gBpp8/l6RQVBConfLpT43LnilG1qS6N1FMtpoy/XWtrV8t1vkExXcXUSjtKaCDLp+4U9h8DMZpntyHTcElU81bVh9/0cFukeRpgoD9gY+dsZbrOwlxb86jYmCxb4LvNUSXMztGH1Br377dth4VI05qtR67PfCLnSIVrHHYAKbW8OeCG7OeVQOCXEcuwIR0LwPlMm9UcqXKoAYScPVvKIrNMX72jCWCRNUkM+4sgOjppxqqMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k9xt7jXPIZyAT2tBB2t8QycShwgipHH1+ZhTajXahU=;
 b=L8AZkk4d7Lh2NwH1XNRz0mBpn/XOeb+8UvNg1v+LDo79t//FiYZG/RDD1W6izui6OOPwOIU25VcP5CpXoJIwqFF/N8U947AGGaG/7WkvE/AnXU7ghRotOwFMuO6OFFDWF32C2qtkS09IxI/WtBS7iA5NdqFN14rsOVS8PO+XcF7+LuQ5ZeUqlrj6Eub9nm9TQi7npizEu9FnUR/LEoejVSfqOkGLnwJVrIU+VLYLfsILBcPCBoAHB5rX09oNIonvA9Wrnhg+r9eM1VirxqOVuIPNZGQEL3i/bWVWIkFpx9jJWJEtTCFKwshLnjLE3Yz6YsNEv0gu2rwqcOS7HoB6qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3050.namprd11.prod.outlook.com (2603:10b6:5:71::24) by
 CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Thu, 29 Sep
 2022 18:11:16 +0000
Received: from DM6PR11MB3050.namprd11.prod.outlook.com
 ([fe80::d986:870f:8e02:961]) by DM6PR11MB3050.namprd11.prod.outlook.com
 ([fe80::d986:870f:8e02:961%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 18:11:16 +0000
From: "Dong, Eddie" <eddie.dong@intel.com>
To: Tyler Ng <tkng@rivosinc.com>
CC: "open list:RISC-V" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org
 Developers" <qemu-devel@nongnu.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "Meng, Bin" <bin.meng@windriver.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Subject: RE: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to
 mtime
Thread-Topic: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to
 mtime
Thread-Index: AQHYzqkvl5V8vtDHKEydnSHXOofrPK3yOU1ggAArcACAAxQrQIABI2wAgAAjudA=
Date: Thu, 29 Sep 2022 18:11:16 +0000
Message-ID: <DM6PR11MB3050E5C5A223C617DB6A209D8A579@DM6PR11MB3050.namprd11.prod.outlook.com>
References: <CAB88-qOuB+uR6epr7h5F76A9qNOB358WikXDfmpvn-ceW71p7Q@mail.gmail.com>
 <BL0PR11MB3042B671D5847E3764C951898A529@BL0PR11MB3042.namprd11.prod.outlook.com>
 <CAB88-qMQbxRV+5e=g=_WGH9VFjP-bYnhQ+=mptnsLJg3XAXkqA@mail.gmail.com>
 <BL0PR11MB30424EDE79EA4926F417DD6C8A549@BL0PR11MB3042.namprd11.prod.outlook.com>
 <CAB88-qOtDc3EMGcPGdiLicYE3DiUD_2NHjeMDRYzn3SoiZdmrQ@mail.gmail.com>
In-Reply-To: <CAB88-qOtDc3EMGcPGdiLicYE3DiUD_2NHjeMDRYzn3SoiZdmrQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3050:EE_|CH3PR11MB7201:EE_
x-ms-office365-filtering-correlation-id: 06a53e96-05a9-4b98-d5ce-08daa246003b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zTH94c0I4KND8lGgDanOm40BCd44S02icAWMqxCSc/I9LH2GESDmLKM6hzqdtfKuur8gPDjALaeOvp2YHAFlaF9RxTWlnraXJfbC++8w8aiSHh7FBIv2bxJGZ249QB8UMDuE1B39+WNKNzr+02gkfZxx6BAbyUlLnjlJO1BJLW2wBtE9aAXFoQuNiFWePdgGSRDhEjxVR5oP0FlVlqfEr+sNk9yo7cYYLwlbjChdX8DeQpSaMEWl+7I0n5y891HtvK5i34RyNB5aoTNVR5uCvefzQX8OmXBOrZY7E76MRYSVCkZenMhodYhCLxadWQFcO7QaUKhUWKjpkqXLU4itOKdOy3BO0FBANJzU2NuLBJEVDlestnqfe+D9UHS9powF2AhnCVqYm36eVx9BV+fjgbISarzVnZCzHEbv4fzFDk7WEw/F4QYpl8KrHCnfEq5zkZ4WUHs73X2Rl5/vZ2W/3kmMFYjUBQpy2RzxT6XTa90JJxxrMv7zgmoFTxjISBsqiao1FfPU5w/BhPvNaA8aofBCXZht+F7Kscr1+8+n4D+5nh+Oi7fzYDgL2HWZNf3+73CMkF9LALGjduHGTmLe8u1Uc8BUDrNVzhYSRXxyPKaPjtzFc4+nSOkBC1jQ/SXpJSg2WREwIUoRZmIh2j3j5x2nKTOWC5VWfdht4GJwVO9kkj6IsYkAuNnOvL/uWy4dzaPak089f6jJtW94v4quSyJGzqPkvUull3e2KgwYHsdfAIDZsut+AGqfukN7aJrp0r/kjqRUTx84yr56cNDZIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3050.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199015)(66476007)(38100700002)(71200400001)(478600001)(52536014)(186003)(4744005)(5660300002)(316002)(54906003)(66946007)(76116006)(83380400001)(41300700001)(6916009)(8676002)(38070700005)(66446008)(55016003)(82960400001)(122000001)(4326008)(8936002)(66556008)(64756008)(86362001)(33656002)(2906002)(6506007)(7696005)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXZOM1QzeUlMZ2Z5dExDeHdOK0RDcmpsRkxWSTY2UHJ6aHhOaGZ0THVxNFRH?=
 =?utf-8?B?ZjBTTGlVMnlHdUhkL0p3SUcwNS8wZVJBL1VrQzFIdWpkeTlNTDc1Qzdyajc3?=
 =?utf-8?B?OTF6T0Q4eDNyTlMyS2JsSDEvVmNwQ2thN3E1VS9weGsrdjIwSHE5VjdyTlhw?=
 =?utf-8?B?NEdBZVVmRUMxMmVMRmJ6VDN4RlBYSFFwbWNKUU5pUEI1UmlFVkx5MURUMklo?=
 =?utf-8?B?K2lqU1ZsUThNZnNad25SVkZPR2RRK25UZ0JEeHBKUTVNOFpMdHZsZVRBYlBl?=
 =?utf-8?B?bU9UcUgrNGVyeTFTTTZtLzcyWTRIcTdTM1RoSTYya253UmdTTlNhUTBQRnNU?=
 =?utf-8?B?aDlZYlk5QkUxa0FYZHVsbG1tTU1POWRubUE4VTRML00yRkdlYlFRaWtFRmZK?=
 =?utf-8?B?cXc2VEFLZ2VBS1ZmVVJoZlZLOTFUekVXN2ttL0ZyZDVRZ2RLSkRzMzlXc29y?=
 =?utf-8?B?eU16TVgvQWVFd0NwanEzak52M2lEQStubG0vcWNzTW1mMmpVajk1VVZKdlBS?=
 =?utf-8?B?dXY4M2hlcVNxN0hubSt0ZXNiYWZpa2dQQ0F1djhkQ3ZZK21lNFZBcWpzNktl?=
 =?utf-8?B?UHhBQ3RocVcxVnVxSFUwVE1FNzY4eXRkb0owMnVpbWg3VFN2SzNqZWRiM2VU?=
 =?utf-8?B?L0QwNXhmR1hWMUp5eVZiMUpmTWF5b2FoM2hCa0tCWTZDbmlMUEJxb1BYNVVZ?=
 =?utf-8?B?aTQzVG9DU1ZCQXZFaCtFdUZrL2NXUnVjZ21vU3VvVStSQmtKN0JxenVyNmZ3?=
 =?utf-8?B?TUNmbHRoSVRrdWRaQlBOV014cHNobzV5YWFoR2FMdGdDdFpsYlhKaHJzNGF0?=
 =?utf-8?B?OFBORWJnY3dWOU92LzBYSjhJNVVDN2hUUFlvdEJYdjY1aXEvQ1NhTGhER1pt?=
 =?utf-8?B?ZlkvR0dyK0RUVnFORmNLeVQxS3lmR0pmdisrY2xTYVJzdFFWL3BWVkhFdVNp?=
 =?utf-8?B?MVI3bXJGQXI5Q3dCZ2xPWXJVbUR2cVlyaFIxditTNjN3cWxDUjNsWklGZEp5?=
 =?utf-8?B?ZVZSUkV2OWdPdlAreTRhbUdxYU40Q0NiUDZSamFvUFlPWUZacnR6NmdGTEIw?=
 =?utf-8?B?MTJKTEk2Y2FqTXBvUTV2WTVEWnRseUMvZ2RHeDhBcUd5NjQrc0Y1d1k4aG91?=
 =?utf-8?B?YVpuQldmS0IzYkRxTlFiTCtmL2RoT1lTZHhoTXZhRmxKMmZmeEE5aW54Yjcx?=
 =?utf-8?B?VGp6MjJFR3k0QWxCRXUxL0RTMnNFck4wMlJBSU15UGt6a0xLeVczUlpCbWFn?=
 =?utf-8?B?SHYxNVZnMXpYMmFFUkt5ZVA5WGlHZTVvODVRZlZZaUVxVEdMMHFEYS9OUzI1?=
 =?utf-8?B?aUswK2I3ZzEyZGlIbWVYOFFwWE5QTDduOXowMjNWMUtTVitOVTFUWXlKY25z?=
 =?utf-8?B?Wll0NXNSdEdUYkNEbkQ5d2VJczg3aVAyUEJTTFdTdUxYWTljZjVpaFhwMEM0?=
 =?utf-8?B?TCtoWDZDZEMrRnVGM0cyQXFaSkp2M0tLSFZiSFAyd0o3elhKb1dpOTRuK1lF?=
 =?utf-8?B?cXQwV3Rnb0lVbndPclJQOTFHOVViNVFqdEVRaHlLVE1wZExlYmoram15UFNW?=
 =?utf-8?B?SFRrUkRTR0M3cnBGVlR2SVUrMG8wVFhVSTMzT2xPVkxFeVFrY3pjdy93dno0?=
 =?utf-8?B?UVFwcjQwREtrVlZLVEJldys1eEpiNXBZenI5SlJiWHE2bm04cDZ4M3F0UWQ5?=
 =?utf-8?B?R1d2T1Q5NzFVM2FCYnBwUkdkVW9BWEVJZVl3Ri9OMEFrbzdsUE4xVTBZd3NZ?=
 =?utf-8?B?S3gza2dVRjNydHgvMlV4UDlEaGRtWnJwSHE5ZGRydGxpaHUrdXhFVzdSM0Ux?=
 =?utf-8?B?bk1pRWx3WFFuUUJNVzZvRGNWTGtSSFpldWVEdmtpRWlSOU5XN1FUTGNmR2NI?=
 =?utf-8?B?c2I4dm9oYXhyZTF6ZXd2UkRiRURJWFB0NTIvaTVmQ1prWGN6M3FhQ2pFa0Vu?=
 =?utf-8?B?eGpMSFRSUTF5KzYzQWIvZzRuLy83Rm5PSTEzckhOYlIxZjNqQ0pVUEg2eGh4?=
 =?utf-8?B?eGRyOWtGaHR5aDY4RWFtQ29KaGlNaTJQWWZoQkJyK2RhYUJqV1p6cGFjK1hQ?=
 =?utf-8?B?NXEzUkRtN3VRYXVaRjF6WE92SnRsS05rUmdwV09EYXpQUFQ0YUFPaUpYM3Y5?=
 =?utf-8?Q?J4nuyZnVPHWOfF8W9+lUsYrRA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a53e96-05a9-4b98-d5ce-08daa246003b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 18:11:16.1522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qgUW8+6cNVnbF1puDbBLyd3oft24bpghM8w94nd73/tXCuUlofJpBykBX//KZ9dM9FZN7nJCefb3jLtsQM/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=eddie.dong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 29 Sep 2022 18:11:27 -0000

VXNpbmcgYSB1bmlvbiBjYW4gYmV0dGVyIHJlZmxlY3QgdGhpcy4gQWxzbywgaXQgY2FuIGF2b2lk
IHRoZSBjb252ZXJ0IGZyb20gMiAzMi1iaXRzIHJlZ2lzdGVyIHRvIDY0IGJpdHMsIGxpa2UgdGhl
IGFib3ZlIGNvZGUgZG9lcy4NCmliZXhfdGltZXJfdXBkYXRlX2lycXMoKSBhbHNvIGRvZXMgdGhp
cyBjb252ZXJzaW9uLg0KDQpJdCB0b29rIG1lIGEgYml0IG9mIHRpbWUsIGJ1dCBub3cgSSB0aGlu
ayBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbjogYSB1bmlvbiBvZiAyIHVpbnQzMl90J3MgKHBl
cmhhcHMgcGFja2VkIGludG8gYSBzdHJ1Y3Qgb3IgYW4gYXJyYXkpIGFuZCBhIHVpbnQ2NF90IHdv
dWxkIG1ha2UgaXQgZWFzaWVyIHRvIGFjY2VzcyB0aGUgY29tcG9uZW50cywgaXMgdGhhdCB3aGF0
IHlvdSBtZWFuPyBUaGF0IGlzIHByZXR0eSBoYW5keSwgdGhhbmtzLg0KDQoNCllFUy4gIFlvdSBk
ZWNpZGXwn5iKDQoNClRoYW5rcyBFZGRpZQ0K

