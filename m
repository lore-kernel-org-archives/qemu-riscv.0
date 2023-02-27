Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWm9Y-0000AR-4g
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 17:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWm9U-0008VP-9e; Mon, 27 Feb 2023 17:39:24 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWm9S-0003tr-9P; Mon, 27 Feb 2023 17:39:23 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RMPENQ030468; Mon, 27 Feb 2023 22:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=CUE4nmuj/27CEwjMEmPQGYqVftrUh7OMSiNPy2PB6+s=;
 b=kdMG1+7ivPJiljlMUU0PaCitAuUGy6+3iKykjrfHv41blQfyNe+iHCra9/zQ52JPAhdY
 4J9bG3XMUX2bCjglcVx3OPvjq09Nq5WId343dbbESA4sjuUS+25EqVwtQtgTuW4KIK7Q
 fd4Qjjc9iU1vddKJtn3jdfdZizG73+B6nQoNuCxG3vGk9eTnVWo75MkIpm4CLgdTOaKU
 VFMwUTyeLnj10BiEm4Zcjp/VmSbaKixUspH7SBu0KACc5jU4P85EOXaMG88bulC89kG6
 aJvg8TMhc1UyajuAQZHxuPtUB8ZJ6kIoYzOpQkkKmIAaSzjFaQhDkl0vQaDrneNH2YDG hQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nybgue7fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 22:38:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPidHiEQVqLsMjCc4+/AqRZuYWYRi3ZdVZMTbQBdiID1MFJQrxpljJngl1vgbmZvpiQ0KUkx0G4w9spdauBMHAVh+l+ZXMPz5ddDjVMWYNODjlONL3RsXWwubDKr9nsHlevHWxDziWPxe0X7CNJErIt0p/IyQ6gIm/9xtpZP8ruFvYr7hvtbRP9rLezEra0FbF4IWgR5kH80R7/SN2W9RA1S0kJ9yX+WyhTvrxqaqNPCCHUpuPiMEGWczJZ+SPqkEsmZPYuqqXdn5AfqQnhSXC/QnhqRGkjHnvmHGjMsQepFAT5lRBmwD7BIzFcySgwU1kxt3yOp+lqyzbDyXmdn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUE4nmuj/27CEwjMEmPQGYqVftrUh7OMSiNPy2PB6+s=;
 b=Ge3cNsJ/unhkvjDfI3haTRj6pZMoza0c8jC3u6iOE+I/bkNi3mVizumXlFdw92uqAjTqSvainl5mNHfhpGu2IV4OYM33SvpDSII+WucwCJ/JKJKxYMXmGk9hMeLBv7s67hCnmu4UW2Pfu95ZbL0N3AybfK/Ma1LcQFH0GDNpfwPLERFreCrpJJXsoYD4yl9cPsp/S8pyLCqLL5mna38yb5VZYdzDZqmMaLmfgkrlZwEEReQUTlQ3K0BOYR63AxJuMKLF0wTjwsT6w4xQ0c9xvM32wQI72GqCNo+XcYyppoAUMBdZ1OgnT/JEA8i9ZJDP6YyS3n7a6azfgqCr3SsK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DS0PR02MB9077.namprd02.prod.outlook.com
 (2603:10b6:8:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 22:38:54 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 22:38:53 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, "ysato@users.sourceforge.jp"
 <ysato@users.sourceforge.jp>, "gaosong@loongson.cn" <gaosong@loongson.cn>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "ale@rev.ng"
 <ale@rev.ng>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Subject: RE: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Thread-Topic: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Thread-Index: AQHZSm50ZyXv9tx31EmNxsaO9Mt21a7jVrrwgAACSICAAAp6gA==
Date: Mon, 27 Feb 2023 22:38:53 +0000
Message-ID: <SN4PR0201MB88087172BE507CF674B101E3DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-20-richard.henderson@linaro.org>
 <SN4PR0201MB880877A0320F4E445033484DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <b80bcdd5-d64c-0d90-151c-bc73257744bc@linaro.org>
In-Reply-To: <b80bcdd5-d64c-0d90-151c-bc73257744bc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DS0PR02MB9077:EE_
x-ms-office365-filtering-correlation-id: 5d518ce8-c9db-4353-ec7b-08db191367cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BiINK7nlE/ZCZK2ON4iD+9RT2L8E2G24ghgu5xKzmHccHFJmdHQvgdOaPTe9TVYKP07Xe2OVjXZr+gxrb2yPZMNB6CEIIX7NbwtejXB/yo76VJq2kcSYPfvjMI/o0jQk1YN/P1JzK4BDsI423bkOinDTLQMMfCW5SB+hImn351SlRUvm3StQDRRORO6DGZCjm7bxJQoUxmm7Dy7Pxt6kcBMu7Jq3wAFLsYXXkaFjdLvGcOLCxUZntSPZR3C9klriTonaC+17eEMtQWIcLbvHq4CP77sZwYQx99/ID9YW+c+bYMRXoKmH/U3purXZoJHd6cRyF9kn8SywMgnCam+LD+9r80u9zMwNW7bI9oOid3J1GexD7x0xXzIEVur+cQyXf1B9DNs78tKMeIuAHhz5502dJp7AnlaNKQFQ6J6hLa6gPAYabDCFzp8GpjjI2urLl9NkFcEIVkog/xT9UNid0zHai/0XLCWRlxQEaAyQQfDRpAGCh2OpgIV/PRSKdr3NP6ZDRikD8mRj6e4WkLqgYihRoSmFDKt/CZwFg1c5h/mvVzyPwQcuf+gRTOsVem+ZX2BmlGYPk/A58L0a36ag6fKhrB7xrlefRYLvvP7x/X3WmDZzeQbIIvMEiBvIbIY2ReFujE0K0cP+9nDYuSL2YJ0ordyeMyoj/Rd1255opKHhxqEgiuA1EflYE0TYqp9U8h9MjMMv5psdczrfc4RgBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199018)(7416002)(86362001)(2906002)(38100700002)(122000001)(7696005)(71200400001)(478600001)(53546011)(9686003)(186003)(55016003)(6506007)(33656002)(38070700005)(76116006)(66556008)(8676002)(316002)(83380400001)(4326008)(66446008)(54906003)(110136005)(66946007)(41300700001)(26005)(64756008)(66476007)(8936002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjZqUDhwMHY4NWlFcDlCcDd4aG9VQ0dTcnBMdTgxMHZqY3FFRHFaK01GckZ5?=
 =?utf-8?B?d1I2Q01TWjVOOHNHZkFUU0pON0tKbW1RYStDOUxTOUFDUVIwUnBxOWFOME5i?=
 =?utf-8?B?QnN3ZWZmYUphWVlIOW5wUmF2UE9BREpMREFmUEJjeC9vZ05RSExxMERsakNY?=
 =?utf-8?B?RkY0Vm1NK0lZQ0tZMFFudDd6YnZBbnlyZG5TbTZqRXhXTFY0RWpIcnZGSGpM?=
 =?utf-8?B?bHV1ejVyQTcreDNKRGVyOUp4VExsa09hT0M4ZWJXbjJtZmF6YTJzN1laZ055?=
 =?utf-8?B?S3NxT0ZJcEUyb010WUo4anZBbUN1WmtwTjNZYjdTQk9hNDc1Yld1MlhOWjMy?=
 =?utf-8?B?cm1KcnFRYUtwaFI3YkRVWDl2clgxNUZUUHZQSE9ibDUyZXc2NHhVVklNRVFW?=
 =?utf-8?B?cDRVTjgvUnNhZll2eDdzcndkVDFOZW5zQ1JRVmFPSFhuRzB1S2lSclpVV0JI?=
 =?utf-8?B?MEo3Y1BORkdvU3UvS0NHdnNTd0pRL2dIazVUdUpORWQwclA1d1Z2UTV4SDBL?=
 =?utf-8?B?SnY0Mm1vREVTcFBYRmpMT0x6c2hKQWpuZzZhcnJFcGMvL21mT3dMaEcvNEdB?=
 =?utf-8?B?QkFqVkFrRW9ab3NZRm9rUXJDNHc1bWh6b3d0OWdpWXkzcDdYczl5eXBLV2lR?=
 =?utf-8?B?all1Y3VNRStMbzV2V1o2ZTltWVFSV042TFUzb0dxaXJ0ZXRoNzNWcEJUSE9a?=
 =?utf-8?B?Qld6NVRHald4YUsyVklwLzl1MFFHNXQwYWI2cXhhdWtwNlhrZjdRZDF0OFpZ?=
 =?utf-8?B?dittcWJOWnYwanZ4WjYwdXNaZ011Q0NQWUpHdFNmbXR0WHF4Ykl1UnVROU5v?=
 =?utf-8?B?REZRTG53YXRGUTMvckNjZGF6VHpSby9Ta3pxakRCQnFsYlJrS0U4Ri9BcE9i?=
 =?utf-8?B?UW14VDZheTk1RFZSTExGZ29kTHpkWGR2eTUyUGx6a0lXajdRTnVjcHRMTzNP?=
 =?utf-8?B?RzFsdFg1djI3NWlTK01QSU9OQVhFa2RQMzNSc1VsZVFpNmdpR1BkcU8xY09U?=
 =?utf-8?B?ejU1TWZiT3JDVVA4TDgzUWZRVmdYQjg5TjZMTjRWZytOcVNrSTJ4Nm5CSkhy?=
 =?utf-8?B?SHdib01rN2VPMGZsRFhBQzZkRndmY0F0QU1jZWFwQm1tcVdjYWMyR25GN3J6?=
 =?utf-8?B?MHhOWTNCSW01ZnJpWVZrOHlpMGt4YXdBbmRhN0VPYlBEN1VkUGtydmlKNFRF?=
 =?utf-8?B?c3hwWnVHL1pWYXlWak9jU0NBU2JSZnRHVVhCVDAwTmdXRVJBL2E2cWxRWUFJ?=
 =?utf-8?B?UWFqSUZDNXpud3MwMTZ0TUZVelNxNDRFQUQ0ZjQ2aFd6cWd5aHVLTkY2eWxq?=
 =?utf-8?B?U3BUQTYzcit2Y1FPYmQ0Z2xJelh0RTUwUS9YczFxUXdZUlFSZWFsNk8rUFZr?=
 =?utf-8?B?L1hLRUlMQVNqSTI3czlJQk5OS2dCMDlXbTkxSjVkbkovdWMwQkEzaThCcjRT?=
 =?utf-8?B?Z08zVlpwQit1UG1aZ1lwZXN4WDdRTDlKWFUxQnVoNkNTZWVWZnVtZEw0VXdh?=
 =?utf-8?B?Nzc0amxFVmkzZlFVQmlSR283ellhcGUvWjBQRXRMeWV6ZUkvNVRPMG5RWW5D?=
 =?utf-8?B?RmZMaFJrZ1dlQmZuc0crSFptb1BaMVUwSzhWaXVPR0trR3RwWUpqSUVmTlBn?=
 =?utf-8?B?clJMUkI2dWh0MVBLK3FxOVd5Z0lUTmRCTFU4bmhkNU16UU5NVVdMRmZhb0dI?=
 =?utf-8?B?bjBEUkU4UGpBcmZLbGdUU2ZnSFpUemdjSHlPNGtEdFoxTzNuWldldVl3NnFP?=
 =?utf-8?B?bkYxTUNTVm16NjM0QWFIbTBSU2N1eWlGdEJTaFMyb0lDb09JYy9lOTJPcllR?=
 =?utf-8?B?eXBkM2c3TDhJU3N1SWdjbmRkakhrdUkzcmpRMDh6MUpWMWN0Rmc0aUNSQVhr?=
 =?utf-8?B?NE9qZjhOOU1keVNRRTRVelFNUXVLaTlLQzJWVXRabkFPMFo4MDViZ0lBMnJv?=
 =?utf-8?B?SVhFempQNjhZT1VrY1J4L0hEdnIya3VZaElVa004UFBtTmtDY2ZVNWMxWkcz?=
 =?utf-8?B?UTdzaHFnNUZHMFgxMndsTHRzNDByQm5Jc0x0b2VQQ0dVQ3c1T0YwRTZpbG1J?=
 =?utf-8?B?cThvbTRaRnc1OE5TQ0NUeFhaRVNiWkQvVW1LRUsvSC9nVEZBNU1ySmdlY1Z5?=
 =?utf-8?Q?LSwqpb+3dbpb2K1DUdqLsl3mS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VzcvR0NyMFRtN2JnUGx6NVBTTzduajJtZWQ3MXpOL0tTR2JUWFhHRmF4bEJ5?=
 =?utf-8?B?SFpOYzUzRk4va04vQ0VxbUd3Nllxa09ncVVqcWVGZ1VEUFIyU3JFckp6MVM2?=
 =?utf-8?B?cHdPRnJVdzh2YWRVUWhvUm5kMEZ5UkJyRTNMYzVSdnhXQ1ZCM0d0ejFBcU0x?=
 =?utf-8?B?V01tY1YvUUk2citvTWhVSlNkOVBpUmRIWDNpSEcvNEhkZjNoZnI3RFRkSkNX?=
 =?utf-8?B?ZFJ5NitCR1dSb0VkdjRZTmh3VDNqdG5YM0hKb25uMTZKRzZuR0JKQW4zOFZW?=
 =?utf-8?B?bk1JbEJmYUJXYUtmWDZaSzd6UnlMNDRXWlBHc25WNm9ZbjFDc1hOUWFFeU8v?=
 =?utf-8?B?ODh0bEtFTG4vcWVjRTBpZzFRWlRCcTZqVWpMZXErR0oxeTlkT0hMYlMxYlky?=
 =?utf-8?B?eFVJR210M2p1WGtYeXhpRUQ5aHhCcmNxaURjNzRrMTlyS3loTnZWUnc0ZzdD?=
 =?utf-8?B?aldEeGdER2ZmQk1ncFdBU2NxU3dvNFQrMEdGemtsKzEwRzRzenJHTis2em9P?=
 =?utf-8?B?NTdCVldkdW1RU2ZDbG02QllQcTVNU1Q3Q2xxVHRsd2NtU3ZPVVMvbHB5dmpW?=
 =?utf-8?B?NEVnV0cwTE14YmtYQWtabm1IU3hJbk9TanB2eVNqakZnUmcyaDYwcmRXVFJy?=
 =?utf-8?B?QWp1cXdEMXpPYzhHQ2hCVytncTkvdlU4RDMyamlDaWRRbmg4QVJHc2U1Wnlw?=
 =?utf-8?B?QTZyYjU4KzlQUG5yWXUvcEFpbXBkUDJnNUk5SDdyZEhoUEpXS3VtWm5xZW05?=
 =?utf-8?B?RVgzVWpsSXYzbjZXSThEYVlaYnI4VGtsdDVsQmlJZXYwQzRpM21JSkxXcXlz?=
 =?utf-8?B?M2U0dlZHZTFKMDVQV2lvK0N5dTRGZ2NiaDc4YWhZaG1VZmFMdWR3eGpYa3ls?=
 =?utf-8?B?TmhubWlKRmRrZ1lmYXJhZTRHN2VXY0ZBWnZGR2U1Wk0yazE5VkNVeitONkVy?=
 =?utf-8?B?WVZOQTJXak4ySnlkUGR2Vk1oaTZIRDJHM25xanBjclZ6VWRidTdqUlJaZU9R?=
 =?utf-8?B?Sk5aRmFZKzhoZVVWaDVVWFBJdlllYWlzL2dvTEFmdjJLLzdHeDFqYXVzTEEy?=
 =?utf-8?B?ZlkyUm1EWXU5SkxDQys3TXBrUmpNRWRmZ1lZbkJLSm42TjZMUzhuRjZHamRp?=
 =?utf-8?B?L2lkdkxXa2tOK3ZvU3dFZ3BxSStRUTVyOVhxblR5MldCenVZYVpJdXBuRDI1?=
 =?utf-8?B?dmJhM2pDUzA2WUpvZjNCUVFwR1RDaWJDQmNXQ0t6MzJqZkRHZDY3UmpGb0l0?=
 =?utf-8?B?UWlIQVFIc0RFbmlnNGRzMmY4amlERDJBclA3NERlcko2TkZhaSt2dm54cGxh?=
 =?utf-8?B?UDNpbVd1U0FOS2dHdWZTOTYwZ0x1dkg1WHBXZ080N0tUZzY0ZlNhazIxQnpU?=
 =?utf-8?B?VVNqWnZ3dEdBWXc9PQ==?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d518ce8-c9db-4353-ec7b-08db191367cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 22:38:53.9144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +PKE/yKiR1JumYOvioDJv4k225VUSp9uozLTq++EJv8iyX3Qs7m+8x13JZnWa/FNhHY5MBrSJHupfzUhPfswig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9077
X-Proofpoint-GUID: nVD4bQ5b9BttlpIK3n4RSH01znaYAhLN
X-Proofpoint-ORIG-GUID: nVD4bQ5b9BttlpIK3n4RSH01znaYAhLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=279
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270181
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 22:39:26 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVh
cnkgMjcsIDIwMjMgMzowMSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBxZW11LWFybUBub25nbnUub3Jn
OyBxZW11LXBwY0Bub25nbnUub3JnOyBxZW11LQ0KPiByaXNjdkBub25nbnUub3JnOyBxZW11LXMz
OTB4QG5vbmdudS5vcmc7IGpjbXZia2JjQGdtYWlsLmNvbTsNCj4ga2Jhc3RpYW5AbWFpbC51bmkt
cGFkZXJib3JuLmRlOyB5c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcDsNCj4gZ2Fvc29uZ0Bsb29u
Z3Nvbi5jbjsgamlheHVuLnlhbmdAZmx5Z29hdC5jb207IGFsZUByZXYubmc7DQo+IG1yb2xuaWtA
Z21haWwuY29tOyBlZGdhci5pZ2xlc2lhc0BnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAxOS83MF0gdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXI6IFVzZSBnZW5fY29uc3RhbnQNCj4g
Zm9yIGdlbl9leHRlbmRfdGNnX3dpZHRoX29wDQo+IA0KPiBPbiAyLzI3LzIzIDExOjU1LCBUYXls
b3IgU2ltcHNvbiB3cm90ZToNCj4gPj4gLSAgICAgICAgSGV4VmFsdWUgbWFzayA9IGdlbl90bXBf
dmFsdWUoYywgbG9jcCwgbWFza19zdHIsDQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZHN0X3dpZHRoLCBVTlNJR05FRCk7DQo+ID4+ICsgICAgICAgIEhleFZhbHVl
IG1hc2sgPSBnZW5fY29uc3RhbnQoYywgbG9jcCwgIi0xIiwgZHN0X3dpZHRoLA0KPiA+PiArIFVO
U0lHTkVEKTsNCj4gPj4gICAgICAgICAgIE9VVChjLCBsb2NwLCAidGNnX2dlbl9zaHJfaSIsICZk
c3Rfd2lkdGgsICIoIiwNCj4gPj4gLSAgICAgICAgICAgICZtYXNrLCAiLCAiLCAmbWFzaywgIiwg
IiwgJnNoaWZ0LCAiKTtcbiIpOw0KPiA+PiArICAgICAgICAgICAgJnJlcywgIiwgIiwgJm1hc2ss
ICIsICIsICZzaGlmdCwgIik7XG4iKTsNCj4gPj4gICAgICAgICAgIE9VVChjLCBsb2NwLCAidGNn
X2dlbl9hbmRfaSIsICZkc3Rfd2lkdGgsICIoIiwNCj4gPj4gLSAgICAgICAgICAgICZyZXMsICIs
ICIsIHZhbHVlLCAiLCAiLCAmbWFzaywgIik7XG4iKTsNCj4gPj4gKyAgICAgICAgICAgICZyZXMs
ICIsICIsICZyZXMsICIsICIsIHZhbHVlLCAiKTtcbiIpOw0KPiA+DQo+ID4gV2hhdCdzIHRoZSBh
ZHZhbnRhZ2Ugb2YgcHV0dGluZyB0aGUgcmVzdWx0IG9mIHRoZSB0Y2dfZ2VuX3NociBpbnRvIHJl
cw0KPiBpbnN0ZWFkIG9mIG1hc2s/ICBJcyB0aGVyZSBzb21ldGhpbmcgaW4gVENHIGNvZGUgZ2Vu
ZXJhdGlvbiB0aGF0IHRha2VzDQo+IGFkdmFudGFnZT8NCj4gDQo+IFdpdGggdGhpcyBwYXRjaCwg
bWFzayBpcyByZWFkLW9ubHksIHNvIGEgd3JpdGUgdG8gaXQgaXMgaWxsZWdhbC4NCg0KSSBzZWUu
DQoNClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQoN
Cg==

