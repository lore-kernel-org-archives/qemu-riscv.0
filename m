Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIdCz-0007n2-AE
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 17:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pIdCx-0007ma-Ep; Thu, 19 Jan 2023 17:16:31 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pIdCv-0000UA-1b; Thu, 19 Jan 2023 17:16:31 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JLndSd011793; Thu, 19 Jan 2023 22:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=pRy7lBy9b5fnTAjR1xNCZkXjQ/GWREYRusUgwbrq1Ms=;
 b=kFwwURnImGIBVDMZlg2W9PdDQsZ7ih9A8Z2mP3icIpD4ZJXOWON6EG25m/okslWRFalQ
 QV5oYjp9ig7auxJVeb6opa4bGA5oYfgPRfo/0QFvV2I4e9nFQgxzyeKsiiNQRkI2LT56
 pxI31jsCHoAofQzpmfOy9TblgSoSzuTHJqDyvcBkDxqiqWv4aWZvSaKVicI3EgtNs32d
 ao76R61hsQmAsVlP/mJ6xXMWi0dySIYQwOLvvVvYtrfGjnTAEOi4+dnD0Oa7WIyaiyQZ
 uTvkOGne9DE1yit/C+6oMbSj3K2ZgnUh7Ms82bhqFgMXCrPWqRxJeY12N5DLwgaPXq5L uw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n7593sahw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 22:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKJVgc5C0AOuS0t7CAHwIedSzyzpqjSuYQWGWbI09ioN0UBVtNuVHrGOvSkxubF7mNp5TdjN+zhXBfbNfygn6njNT1e6EJ0CntWNBKq1sDmWIWIs0l9cwy49CGk+ywSHXq55QSV90+YEYSL3SGt73pGDMBfkamnzuRdjRMREZIcYoFNqGT3Yhx8nukxzSrVkO+haffyvd573TqWtn1hGVUlBJ8baq5A2r7MnZmpzV/v8x7bw35ROsVdUUcSy6I1h+EvMjOkTl9Xd5zouMoIZwYRz/wzvEQltVsnjFdmmsFUhD5Osmzabx04CrXwwk1zCsfFCKRt0Q/qiw8JG49ZNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRy7lBy9b5fnTAjR1xNCZkXjQ/GWREYRusUgwbrq1Ms=;
 b=WloHMv1JPThbrIDblasTP2sUg4JPvp74qfxBw7AMxYLCi0LMtXZAeTa0xzeeU/tlTyWLcuZQgmK6GZrS3B0XYMto2FBDO3zdyX9YyBjybhD6nFoCyinkmCYfASb2Y/1Q0emB4cqUlFTDWnaap/ZZfVP33SIm3bMslzWRcgN36plU5ylvxV8J01b5v169bESOOZpoJNBVKSX+LC4jtfrN4g56bI0Cm6C1wQB8qkOJBd6m2QvnDRmeRpfW/Ql5ii3wIUu0lC7WTwxOm78SuclATJJPUg4m2dFWwrETICk0IboS+Ga/7YXdMxCpGntf3aZuWsSTrJVmLXcWnVdai02qlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB7462.namprd02.prod.outlook.com
 (2603:10b6:510:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 22:15:37 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 22:15:37 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Markus Armbruster <armbru@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "imp@bsdimp.com" <imp@bsdimp.com>,
 "kevans@freebsd.org" <kevans@freebsd.org>,
 "berrange@redhat.com" <berrange@redhat.com>, "groug@kaod.org"
 <groug@kaod.org>, "qemu_oss@crudebyte.com" <qemu_oss@crudebyte.com>,
 "mst@redhat.com" <mst@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "alistair@alistair23.me" <alistair@alistair23.me>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "jonathan.cameron@huawei.com"
 <jonathan.cameron@huawei.com>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>, "kkostiuk@redhat.com"
 <kkostiuk@redhat.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Alessandro Di Federico
 <ale@rev.ng>
Subject: RE: [PATCH v4 12/19] target/hexagon: Clean up includes
Thread-Topic: [PATCH v4 12/19] target/hexagon: Clean up includes
Thread-Index: AQHZK9Oz9cNKvsxIg0OQ391b03AawK6mSg6Q
Date: Thu, 19 Jan 2023 22:15:37 +0000
Message-ID: <SN4PR0201MB88082EB8B56772833BE60374DEC49@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-13-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-13-armbru@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB7462:EE_
x-ms-office365-filtering-correlation-id: e3a4fb53-d479-497e-18ba-08dafa6ab13e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8/gLLWFLT61m71EpWDKU/YUuQmQzwNIM0aMAWOIb1KmDU5f3PB+PIVI4/i/gBumfi6jC+kohrx7oy3xzVEBvYspnSuB4xzweraU5qyKOeey9/riQnmSzHD0wyL9mveEcARUZpPplitVp3tTDuI8YgCxDTyJHexBlcqpaQkxyHhyLVQkJQZ3uK5bwoNl+Ue9jdDVh+7lsNqdMLv1O/LtFI2Z8k+oSsfMSewtMPELCUeYypLi/mMeMlqFD/wjotem7DBH0nhsKOXsO3eH3yV6hpD8XJcnPFObfq1NOW/tuxg8/nz+LtTG80Gt5P36jQNCPuLO/VvzYWg36wHRefKjR31W6dS2zC6MjaKjzBm/D5qV4M3OqVLb05EQllVEX5pewmM7lNRQj1j8MMCZ6Sby3JDNF1I7NGT4A+hLDvgFeL+JGiMIYlASVm1JnrSUWQDhk83KLqH5883rSutITZq34uQ9WB7xSan+LZN7avpGe5c2F9Sw/X3jh/9iZLJYALaraYqvxYP1Ik7z9UvCLwXeSfl334f0VruwvguxiZgRMAMyrhzLaBLGVGGlGX9iTSWseSNlSfIM2sm2b0RGzpOAywZ/AxPpEPqmlGYdpvKLDozFbeCu2D29dlSjWysnesDnDWzeIf8Vn1aKMbD9ywlKdHRcfdc2pN53/eq258ocP15tG0+TFZWgKI34AqEiA/rN0DxY3zRtQk8UyZQe2ogg/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199015)(110136005)(54906003)(316002)(4326008)(122000001)(7416002)(5660300002)(8936002)(38100700002)(52536014)(41300700001)(8676002)(9686003)(26005)(186003)(66556008)(83380400001)(64756008)(76116006)(66946007)(66476007)(66446008)(33656002)(38070700005)(55016003)(86362001)(2906002)(6506007)(478600001)(7696005)(71200400001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eHPwDzaf49DmOoTjQGgd30iMXPWOznGSqB9mBhhqhR5at+Eo5iKdLUM0jWZ5?=
 =?us-ascii?Q?mCz5EqQfyoFMK+nDe4quFFayxOqeO8EyN9tlMUNOW79S1KW+jPIyIjQB1Tns?=
 =?us-ascii?Q?8tK1KHx2dqA1jGx88LAsuBiLw36fv/Pba2p6FCYQ4ldf7LigmnVVhTBuagGp?=
 =?us-ascii?Q?KaMi/NXLYKRcDBX24/YCYkVUdtTEIpz2YeNPXHtcLzX6FPrqELiJKdk04aIY?=
 =?us-ascii?Q?DqhBhIRSHT/B72e/0oBZsyE+JNwTIRrhX5ea9TM5NUPLjHCudGnKKBISFoQT?=
 =?us-ascii?Q?AcKYU6KRR+GlkyO89SMPMqUUAlMJKeSFdlziiIiW3/Q1i9zT3M8Tbch5Qjix?=
 =?us-ascii?Q?0Fcuk+JFQBkAMlIWdL9LS7shVHM/ElOoiWM8CA5dSQ3eQENaOAme1YPIw3NZ?=
 =?us-ascii?Q?02MDy79xFveE8ygaUm+xZDK/ALaMEopXoopfqkwPjeIGwyWPPjIk6hYHuRka?=
 =?us-ascii?Q?+8xz3SEbR6fRvBuc0DVPp0so9y7tpqz3J+1tZ82IVoFByqfyu6Wpp9hzgf02?=
 =?us-ascii?Q?P561BEUncgPprvkpRFBso92aOoJYa5XZuE31kQas+JAVr42HoJb2vtwDMrjc?=
 =?us-ascii?Q?Swlvr2eCXmS1sLl0shW514pWYsyJzztMLP7kVOxk7PVX/5KJzvnFcQD/Eha6?=
 =?us-ascii?Q?dVWkP3xkzkyoRuPvi+wfk/ze1vazWyuiXZM9pzAqMEmye4C2EovG5NKInOcZ?=
 =?us-ascii?Q?Pd63G+XBicphAZlfw+/Wfo9y67VIKuQZOkwrC8KxAxJetVUQ9OQOXfFmwaqF?=
 =?us-ascii?Q?NkxHkEabPHTNi9D4KwUNYoT6fW2HvIAUNeMW3ZiZfXe7hM3QUUN0QFkal6ya?=
 =?us-ascii?Q?AzaUSqUuI9z3WeTDusYzFlevohnW5MBEwcwu2gBN5gEXNHQzg/a1EkRgEBkw?=
 =?us-ascii?Q?QVcIZ009tYFTjrXCVKvYThgXL5fxeWtni+GUXcwJ7TEQsgfhelhDhOpZ1MOg?=
 =?us-ascii?Q?c28dXC8NRcGWIwCyBBJQecX7DYBsJQ7hKVx8oGUp4sD1WBV1GS12WJfsToAI?=
 =?us-ascii?Q?UuGSMsLk1tuhcX8nrzIrMbfsbRgchINb7qQ4/q6Rc0eBJGoh4STxjGQmwADc?=
 =?us-ascii?Q?U44/MaBoOzBsvI8NQyIYgYoq+lTvaTQS4p6G9Q9TQ8U4HhllLxU8qsDeaYns?=
 =?us-ascii?Q?GpwCTw5GmfnnfRKCZfSLwyM8FsxcqYb709oD17uDl9HJHBlkKGMH9P7aht/v?=
 =?us-ascii?Q?yHCH7CqTWPPy4zvG2GSLyEpijdxSlui2Xwf+/4Ms9J6EauDvntUzCER6EkTR?=
 =?us-ascii?Q?11pA5DP2muq0w9FQp+d5V62Yd56RNehaRE52UevrudQynHMjL4yxRHzs+s+r?=
 =?us-ascii?Q?kDHDJTqLgx6ROxUJpVf2POxFQpdCKJMcsxCUPqZO+W6KvpmK5t6KOwZNXjqV?=
 =?us-ascii?Q?xNuo7O7ZE2lKG4F+Ei4syQDE8azepu49SUMLKSIVFYBOXcKqP+aDTMXbtWe2?=
 =?us-ascii?Q?3tqdmVODsVrerAgxYR6Mc0a2BtJI+L5/rp72kQcrXsVkjkcdiIsRXfAInwtf?=
 =?us-ascii?Q?aeT1Cy62zKKz8MiWVHZfNkLQ1CeZmbCvXFgGJ2a1F+uxM5fvcaz6J+D0wBQw?=
 =?us-ascii?Q?Wa2Wg5N8pkYTz9BMSZ2esyNAHgTfbIc/QbPcOjtC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?wBFKMRqtFhBHnEUFOs5TF8PbCRjAQUGisOOg+bXuGvqcqk5t774mENQhzOWG?=
 =?us-ascii?Q?l6FoszXzN3GgZ7mMpdkbfT6KXTksxod/mW8bRlZGx96i0wNjOTDl/7rM0GMz?=
 =?us-ascii?Q?C1htNH3qBshKP0qIBTkg1trXZhzavypVCj99Url63VXtyI/W4gOn7o2cpmX9?=
 =?us-ascii?Q?L/hKVmJF6ByWs+XZUMTh2W6xCBtsVuaFJkjHLF+qUfbbBF8fLwRyqBo18Jjp?=
 =?us-ascii?Q?CQAqAce26kHMsGhkLYs8W6PULeZ93EUeeHDdHOENKaAyYKS1pTGySFFqacyR?=
 =?us-ascii?Q?rNHO5SNA5oOx1lg646H6os1tB7dp3maJ26MVOIycW2JFIrD4eu2G+221aCTx?=
 =?us-ascii?Q?dJU3cx5U0vezbKB6Lpibkxi3iV7uB9uWgfPmXTJSVC8w+6TDcrON0BOYRAH2?=
 =?us-ascii?Q?ys9bna7R2FZJd5e9dSIOt//PVUf5jmHolNVGZSptgtHnFJwqz5irtjtviFpC?=
 =?us-ascii?Q?k8uki5bgnDYaWiqfuhXgPimgFqKHT1diXS4j/PFk+giAyhvqDkWCllAuHn3c?=
 =?us-ascii?Q?N66vzhw1mwgP36cOMjnUt5qDS3iWHkOMeXAqRSDsxS6JLvriIIXenkGZcUqC?=
 =?us-ascii?Q?rk/sK9l608r5Bw+Xw+IiXyx9N6/lKyFPvFIbSfhfdZyU8bD6Dhk+Mc36zVCW?=
 =?us-ascii?Q?HEDjsLIJ0UACk0G8bt99ftBcJuE47wtZHsRUb9T2Lgc7xt/CLHu9SbKga8CD?=
 =?us-ascii?Q?3lUFgm+ir5s6SZDpvy7rtwpI7mcgniMVC6hTJJiZPZjnPOtU73m/hprU/Tro?=
 =?us-ascii?Q?IdQGBiGdk16pOlenCEDROCm4ikf4XfUvLXbsp9A6adxdSurJVV1GkNGvdQRC?=
 =?us-ascii?Q?z4vCOh5BcpEbu7f3fG1cL2B2XCXQNwwu6ozDVFf6ILx9KfiFGUFzhLLAykFd?=
 =?us-ascii?Q?48h88nrIsKHTRIlivnQXDivsustnuxq+rd+44hSjAe+3aef6W0Ht7Sz/X8IC?=
 =?us-ascii?Q?nbLuIli38XCk/6DUwZz+GINJJGN/w1FZi0SpC/CB26aTkv1Ylv/dU9vA/u7X?=
 =?us-ascii?Q?wLraDdrjPsCbilZJcAtTsedeo5L9nCcPu/oNdKmE1VLhc2PhwuJbOOcqrDfw?=
 =?us-ascii?Q?8exYAVbddrwBe+E8DBp15VWFFZ8gze/vjfi0gM8rpwus23Pz29kZS82syvxi?=
 =?us-ascii?Q?Eo9OPr2RbsL0Bsbk7pbZvpUI1fXKLLEPQWlPOM9M/yZgXa+Ti40IV5VLOdTz?=
 =?us-ascii?Q?bByQmHH+ZwJz8zhV?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a4fb53-d479-497e-18ba-08dafa6ab13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 22:15:37.2835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xB1ZkMmVRs18qBBr439U+FxkvNIibjkXpuNAH4hl+UytJJ4FFHwdIDaXdNZAxou6naw8s8mFqC5Wj8rl7E3Ksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7462
X-Proofpoint-GUID: 1W0SMECAJC65rZIJi79CWyLj4lL6L4lr
X-Proofpoint-ORIG-GUID: 1W0SMECAJC65rZIJi79CWyLj4lL6L4lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=558 spamscore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301190188
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 19 Jan 2023 22:16:31 -0000



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Thursday, January 19, 2023 1:00 AM
> To: qemu-devel@nongnu.org
> Cc: richard.henderson@linaro.org; pbonzini@redhat.com;
> kwolf@redhat.com; hreitz@redhat.com; imp@bsdimp.com;
> kevans@freebsd.org; berrange@redhat.com; groug@kaod.org;
> qemu_oss@crudebyte.com; mst@redhat.com; philmd@linaro.org;
> peter.maydell@linaro.org; alistair@alistair23.me; jasowang@redhat.com;
> jonathan.cameron@huawei.com; kbastian@mail.uni-paderborn.de;
> quintela@redhat.com; dgilbert@redhat.com; michael.roth@amd.com;
> kkostiuk@redhat.com; Taylor Simpson <tsimpson@quicinc.com>;
> palmer@dabbelt.com; bin.meng@windriver.com; qemu-block@nongnu.org;
> qemu-arm@nongnu.org; qemu-riscv@nongnu.org
> Subject: [PATCH v4 12/19] target/hexagon: Clean up includes
>=20
> Clean up includes so that osdep.h is included first and headers which it
> implies are not included manually.
>=20
> This commit was created with scripts/clean-includes.
>=20
> Changes to standalone programs dropped, because I can't tell whether them
> not using qemu/osdep.h is intentional:
>=20
>     target/hexagon/gen_dectree_import.c
>     target/hexagon/gen_semantics.c
>     target/hexagon/idef-parser/idef-parser.h
>     target/hexagon/idef-parser/parser-helpers.c
>     target/hexagon/idef-parser/parser-helpers.h

Correct.  These are standalone programs not built with the full QEMU contex=
t.

>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  target/hexagon/hex_arch_types.h | 1 -
>  target/hexagon/mmvec/macros.h   | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

