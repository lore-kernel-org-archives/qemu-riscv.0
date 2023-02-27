Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWlTA-0005cE-0J
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 16:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlT7-0005ak-W4; Mon, 27 Feb 2023 16:55:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlT6-0000z3-1h; Mon, 27 Feb 2023 16:55:37 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31R1v8kh028066; Mon, 27 Feb 2023 21:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=F5axuwISSPANH2ew5QG+VJqtffLX6v5AjwkU9eiYVlA=;
 b=KS54XgA4AKLPflY4rRIP/lWJAePCRPqa6h60rr1aFlkzrGWtfYozkZYseQa/JVRiHkOz
 rbDjaNKoP2c7WaA4QfC+yJof9akHGbeveifj7bTYi1dsD8TxtugZK42AfQVOqt4bf79Z
 FIykHgTsHYN1Q1QINGWowq9echtnY2kTbS/DXBafSY57RWwVBFVCF0nPjrjK8Q39HZTX
 kvWINUMjwJ3PQrzZLd3sKDAT6CW0GPCgCV5srsVC+qwTtgl0/lZAqN75LJeWnMkbwuqf
 vmZRAZ3JPeCdme1GqitiPxVGHacuDERtbb/k+TROdsLEHh2OeMhhwU7l0GBQus31G1V1 iQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nyb3qe4fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:55:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkGVUIwpvsSoQPgBD/BuLPSG3Ne4EYSjpSjW1vg7xRiUkL6WMBpwiflDj7Yf9KfTCtowAjcYcl/4EsTJDGRVA+Sm/FvJGYF14m2d95gsTWLNEJEB3Yw/MZkdLU9TzM/iNzGm4SvXuQ7ITOdIYnBcgQggNYJFoLRL5ICT0MMU/Zr+ESUh+9fjXOOWwENMiakClmtz3vIXrTeI16oO7YduzbUn2ds4rznJNZ2qkqUnGr4h1sODcP5v+tDVcWp43+EOGTy96aazEEMLZ0XFOj7+tyHIp84au/BoO1xme9PZqKN1rNDrCHL+NteDx8aLAjvhq2idHagIk+4d/R5ZI4Kmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5axuwISSPANH2ew5QG+VJqtffLX6v5AjwkU9eiYVlA=;
 b=l2WDJTChiczqCH/xaQZK/oGfujTK8FD7ZXCbCShmnBxVyayCPb/9OqgjERxAi5VcGAkD88WHZXB0+M+G0+CeTBNsD7tYcD0b0vpFMY382ssi8JKb16viRRWBAM6V7H7ZdaR9TGkwxeGLiiRJPeVZf2jHLB7cqBkOqODgUw5Yro1klLzgUMdf8FepfqWnS8rl0je3UugrY37U5vyx8sHBp4ECMjFLp9voyPbhgZMyvLak1XSdnHweTk0HYYV4JKH9qRDeh9mPOtqU9Hcf7z1GVTDDCsuWmJLR++ovy8RWCJt1tfbWnU4JUj7jx09qubRc7UqXJuoc5hP27oUG/0Ftfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6948.namprd02.prod.outlook.com
 (2603:10b6:a03:23f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 21:55:08 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 21:55:08 +0000
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
Thread-Index: AQHZSm50ZyXv9tx31EmNxsaO9Mt21a7jVrrw
Date: Mon, 27 Feb 2023 21:55:08 +0000
Message-ID: <SN4PR0201MB880877A0320F4E445033484DDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-20-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-20-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6948:EE_
x-ms-office365-filtering-correlation-id: 57e5c55b-db58-4765-86ee-08db190d4af9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Df9svK8jbz0D1gxICkS65MQXVX5q43j9sHnF8ESKK15Di16/IiT75vwqvCnrxOFvYbgGOfndZHrzZ8WKvmyRpQD8zK2NPJFfGF+PdelTENEWSbsEutd7rObJvMeDOkRrVACwODjadXFZ44tblMAK+F5KQezvY2HzqJW1LrABP0SpTCrmFjgpXYfXp3J/4ZABzr0OTkgTKgZeQ8XW9YzpTpvKZ0KJWNJx6BkdUewwXvfvrvrETtLgS7KESKBbGmqw07W6fHM1LTvZyny9uT5CCnTDZwnU2j7n6OXF6PA10k+NYGr1wDTfNYBlHswbf0SpxkpGji/tEYwKKg9x4WBRuHdeF+2Fcl/zKe59kRfy/rhhBcz+Ef6lTW/r9danx2kJ8n0f1efYXH+HgRuqA9tdL/t8glfkcRrLj9BXDVZoO2o1F9tHtW1cdSWLRPA/iQhfTCqLIK8ZkpjgWij1QDlpReppXZvgFaBgedStZqS0UlzlaSFkrTFDhVBLScw2CuRAYoliumBwCMh4a/WgygRD4woPvY5LOTSmpGAKmB/hULmZnPbb9tjrFtR8Rr2PcB9iaLyfZjhThQEKFG1A85BsNXBIlMDR4WsRSxhXxagw+KDe4qG90ffC7a074q8Lt6G7a1awSQUIuoitBNhSzVre0WAJTbBIjqTRLbLhXILEi8Th4j2UXdyoFQZboV93qt+fYmpQsgINvYhDaPyMFWdtkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(83380400001)(54906003)(110136005)(316002)(33656002)(4326008)(122000001)(64756008)(66476007)(8676002)(66446008)(38100700002)(53546011)(6506007)(478600001)(186003)(26005)(9686003)(7696005)(71200400001)(7416002)(5660300002)(55016003)(66556008)(76116006)(66946007)(52536014)(8936002)(38070700005)(86362001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ORwNyCh36OdevKwSEc2lPS8GJTlMZDaWkw4P4+Yy2hb80aE1exHBwwm5yr1m?=
 =?us-ascii?Q?tPg8R7mEwjuHm/YW1INROaiPEIhQvkAmifDpMQRjjTRL/e3o0rjvumslqnkL?=
 =?us-ascii?Q?nNpgANUn8ACD78Z2220XvdnEKakVb+0J0ljl4szrZBATQIR/Ov51iYQxwkE7?=
 =?us-ascii?Q?bFT5Pfc9BgC5ukJ3teuMza5cQbu/1+IGGcfk3pFuba7WqiXtRLka2hcphlfb?=
 =?us-ascii?Q?8+1gI7YO7mRp8Ewf96vhXw2KZOOoEUphikPa0c56u89w6Q/R+0+3PDjNV/MM?=
 =?us-ascii?Q?KO7ZfGYLsuiVrICBo2CVjTg/hEHXmG2erxzbEH8fvvoFOOH003dU3r+XhkHS?=
 =?us-ascii?Q?/k2Dy3ml/5OBZ882yV7No1nu2GdD0Yy4uJcJIU37zJ2hgVi1Levpf3zbHIh6?=
 =?us-ascii?Q?6I3MdxlH3iV6393VfSP7R3qE0SapikeGfel7pELfIpI0V4l9TXYuAxMZvT1N?=
 =?us-ascii?Q?MopcmVMVpNRVFVXAsleBG3rvvFP3inFMI021mkMkJFZs013e+hgY83ofF//k?=
 =?us-ascii?Q?Rxq1Q1jCJO5hFkqAmS0utarefki96oOlfxyhYMCc2HjGeWaiudwyoTaCYGE1?=
 =?us-ascii?Q?t7anCAs09Y/R7rNOCghc9FOB1z3rvdNwpsp0/QOVNR7HWkBPttVfL1J2VCHF?=
 =?us-ascii?Q?sttQf8AX+ytnqpiJthjdEU6GUqoUPpwMX29aaapEzSnmejB1klWUUAh41P0T?=
 =?us-ascii?Q?2QvlWj7tlsZ/rQm5a7RiwMiCkYx24DsJ8VdayD+2iwSxt1KcUxWEvIHPURCI?=
 =?us-ascii?Q?OQq5KZr+2sUDfW+MPyb2Suzc89lMrmv+T2YsxWvL0hlmWabtevm2xtmy4PEJ?=
 =?us-ascii?Q?eqTAGEFpFAF3BNKymx9M0pjffOhswThxlMWIvFbCpRImVa0aIBGOygE4owi9?=
 =?us-ascii?Q?MGuHUuae5jt5kSYAcw3GAvAuWnkUwa2N0VDqiX8ZSSw9f6bYuvhHZFSsBG0d?=
 =?us-ascii?Q?luqcQLRa6GrOXkMv1G67880Q7CYCTMyQFU5zUNXEJ8S8rBk5oaWYDFFPuB73?=
 =?us-ascii?Q?bzG2Rd6qP+RpqWD+h9Tq1nwmXaR3HAbewa086DuygjoaYa6VBRIdWkb0zwGJ?=
 =?us-ascii?Q?vTgpuGmCxlHU+ZaQE6JE+ujyyvrUjzPHTSNj2fZpLjY9riUHH/n8rEYtGIFQ?=
 =?us-ascii?Q?ZNT6M/18oBaKYniMIvsRTmHcGXcTNI2u1FaraB9fKO2PSxtL9gcrQo/HQrMS?=
 =?us-ascii?Q?MjX4cq8Zpi1JOM8CYaMGEFpv4zm+XS00NR0uyeK1XhRfW0fDCIzCVou67TCe?=
 =?us-ascii?Q?4H4r7wWeVOwy9euWp+5UpliCTCu49PVrmgJupINOgLUQv6bwDbayfz7K/XY7?=
 =?us-ascii?Q?dkQdMIIbfnmPZDmYRCKZxLCCLTQL/bCxh1eLvx0kxiq8NbXOncyQ8waYoQ98?=
 =?us-ascii?Q?DXaVeqrIYfX0BzyVCcfCVFaP26UgWd/cOmDyjOoRCxSgr1fth25Sqte6705J?=
 =?us-ascii?Q?kuPGZLAjIrBhJi0vhp8Q+9C3plAPfhVluqQt0C+hkFPG+jLw9Nt2+iko8ZlL?=
 =?us-ascii?Q?SyxOYQjg7fSQoQf6GoYtd3uMFKNV9NyoX2oFET2eT+idAt0OSDdXEaG4VHYr?=
 =?us-ascii?Q?bHbQCSKmV3BSme72gc924Pikpuy9EIogQwBxhnMx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?jyehwKyjGNDtFqLXnHk0DamK5rLKBbJ9Dku0hBrcbDiPYZ2KXlFCFqmP9iuE?=
 =?us-ascii?Q?pOWqGieztU5Od/pVwiQKmvjmpo4aw2GWVReFV1Cvr01PndEwFFL/Ii4cNP3r?=
 =?us-ascii?Q?X5uMrrV495cmVXkxy4Y2zVng+EWNp4OaVNtLVdYv7QWCy+f6vji6WKYJsVfa?=
 =?us-ascii?Q?BbEqNLmO1kaAVVsrXFUvCOPrl0fcm7ThQL1UZYWztJDvGhYPpOTvuEsehjVM?=
 =?us-ascii?Q?ALvV8qK7NpGXc/sk2aIHaYF4DAIiFbe+vxPheHvX9fcnO9mSvtRi55OrOSZJ?=
 =?us-ascii?Q?VRGePktzYGtIMoKnEaoQBWFlWrwWcaiIRnrMZ4l2jUFEf39VSHFjA8kC1Zzs?=
 =?us-ascii?Q?ZttvA7uqvy+0eBg4ip0MbBbWIbcAAarl8jWBWS6xsiVAB8wNlzpPZe/S95BB?=
 =?us-ascii?Q?0eeeI8xPDDwp+/zAnWOTMSTCn0WK1hh1yBmTUgFT7JvHjEt8jAlsf7VzHt8b?=
 =?us-ascii?Q?YfCzTqWRKUza694s2eXK77NqKrWX+xR7XdxB7JHDvsyOQjK/mMexAr66FHrI?=
 =?us-ascii?Q?WT3DX3cJ4Vk0ZJZIuiFVh/ok9+b6mLbj+r11qOrbvGFrW7QM9u63HahFvX5+?=
 =?us-ascii?Q?d6i06K6IH8UiPsfhbCZwDEDxEPLgrIJBvyEZy07I0MLllpXrqrXZfYLTw3by?=
 =?us-ascii?Q?7n5EISRnxzjA49aUZaSodaTuZF8XVnZe4sbuiZ/dbAxUErYjOtjDD7QA9zTD?=
 =?us-ascii?Q?u3dHFHQcjkhSro1ubgNmM1IXSVNwQ62sTWU9LG4iLjVx95ebVx5YLaUz1NoD?=
 =?us-ascii?Q?XQYiRLbkWDdK6K98tkie4prx97o2cURT3Ksq/kk2IqptzXN7ppXXEmMpXb1j?=
 =?us-ascii?Q?Eq5slwLfRc2tZIA7Ye6i9WW6V38r8R1T83A6p9PnyDPlkz6kwuPPDybWoxr3?=
 =?us-ascii?Q?JFkb3zWEaAQSXKRrKeQqJ3WpCg6tXhDfYjTgZ1WC59WxVdm6wP+A4T7LGRWP?=
 =?us-ascii?Q?iUCP9VecbJ9H/6Ow+uzngdtMN7xug/h+mtPCvk4HcPDYZ8v5V4YbwPiCgSRF?=
 =?us-ascii?Q?mjTAYYigW0bDQFllA3ZUFve96w=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e5c55b-db58-4765-86ee-08db190d4af9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 21:55:08.5412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1iNobsP8IRWo6nHTioIt7SjBXdwSAU7Xuc3NIvb9D9CkSsRj2pPUz8XDW4O4TzW1+veVyKnzPmpisDCnG0P3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6948
X-Proofpoint-ORIG-GUID: l7OY7SZI0lpOmuIFyYs-0M-Hruq5aOlc
X-Proofpoint-GUID: l7OY7SZI0lpOmuIFyYs-0M-Hruq5aOlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=649
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302270175
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
X-List-Received-Date: Mon, 27 Feb 2023 21:55:38 -0000



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Sunday, February 26, 2023 10:42 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-
> riscv@nongnu.org; qemu-s390x@nongnu.org; jcmvbkbc@gmail.com;
> kbastian@mail.uni-paderborn.de; ysato@users.sourceforge.jp;
> gaosong@loongson.cn; jiaxun.yang@flygoat.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; mrolnik@gmail.com;
> edgar.iglesias@gmail.com
> Subject: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
> gen_extend_tcg_width_op
>=20
> We already have a temporary, res, which we can use for the intermediate
> shift result.  Simplify the constant to -1 instead of 0xf*f.
> This was the last use of gen_tmp_value, so remove it.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 30 +++------------------
>  1 file changed, 3 insertions(+), 27 deletions(-)
>=20
> diff --git a/target/hexagon/idef-parser/parser-helpers.c
> b/target/hexagon/idef-parser/parser-helpers.c
> index c0e6f2190c..e1a55412c8 100644
> --- a/target/hexagon/idef-parser/parser-helpers.c
> +++ b/target/hexagon/idef-parser/parser-helpers.c
> @@ -1120,15 +1100,11 @@ static
> HexValue gen_extend_tcg_width_op(Context *c,
>      OUT(c, locp, "tcg_gen_subfi_i", &dst_width);
>      OUT(c, locp, "(", &shift, ", ", &dst_width, ", ", &src_width_m, ");\=
n");
>      if (signedness =3D=3D UNSIGNED) {
> -        const char *mask_str =3D (dst_width =3D=3D 32)
> -            ? "0xffffffff"
> -            : "0xffffffffffffffff";
> -        HexValue mask =3D gen_tmp_value(c, locp, mask_str,
> -                                     dst_width, UNSIGNED);
> +        HexValue mask =3D gen_constant(c, locp, "-1", dst_width,
> + UNSIGNED);
>          OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
> -            &mask, ", ", &mask, ", ", &shift, ");\n");
> +            &res, ", ", &mask, ", ", &shift, ");\n");
>          OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
> -            &res, ", ", value, ", ", &mask, ");\n");
> +            &res, ", ", &res, ", ", value, ");\n");

What's the advantage of putting the result of the tcg_gen_shr into res inst=
ead of mask?  Is there something in TCG code generation that takes advantag=
e?


>      } else {
>          OUT(c, locp, "tcg_gen_shl_i", &dst_width, "(",
>              &res, ", ", value, ", ", &shift, ");\n");

