Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWhkD-0007F3-DV
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 12:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhkB-00079c-UO; Mon, 27 Feb 2023 12:56:59 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhkA-0004g5-Bg; Mon, 27 Feb 2023 12:56:59 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RE3XB1025424; Mon, 27 Feb 2023 17:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=iy6FIcM3I34gFjGwkHGMUwy8IsBgdnCN3izL9jfq4s0=;
 b=Jc3ho5DkXtRFevX9ZxMn0Mt/DPQfm8zxkCaV6OEuzrytyp1x6Hm0tdhVy6fyvWFuyWTO
 RupenGjsdQNMpmURLDaeubApgywLCDP39LWz59TXXiiJay9j4RDbI71fbFi1g8akMYzO
 R2glPGttuUhZjRJ/gmJX/AEY0u+L69JqhFq7iGA0b4tR5FhOOV78+M6EtGuYfYhgke2y
 7HhnKmyI7W0B7lfbUlxKiJ4rwbvmJSO4MmDy3NPs7TCWa1kHbWgM8go8VI37gOoZ2uXr
 IUhv2RaoBNY+KU22clmpoe4E5K3Q1NpcK/7Et2H6n1it5MSmF2dcFSxOnPaDmATJxoa3 NA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9a0wt84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 17:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGXmPEZAXjGjU1ygX0YniCJQDmf3lXIR4HEovuxT2G97TkzzemvPwMB5ilcJbLMBCAlCJfACrTs+gjwxjBnBfhEoKCeCPoB5Rovl9DYR5JPhk8nrFmqJrCIXjYMg9BcZaYRUgXbwNiNnOGQUz6DbHzrq1OWZOy1rVjODZF1neV/O1C2BtmN6YWbKeR9Zbet0V8q/ptxbGikwsPneDh9ApkXpITXjevaNIiSQ9qU3cmTxKu3c1ak0EzCKtp1YUtzg0vkXHvw7gt2hylFF04HwN2g0dRoLSQ0C+Y+zHjXNHseWGRRbKkqTESgioAk1wfDp2yJLwrcUXiC/Oc8xrISgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy6FIcM3I34gFjGwkHGMUwy8IsBgdnCN3izL9jfq4s0=;
 b=VjpLgMyJ7jQ5+mm4H1GbmedsUKo0iwcF0bVmyMfb8RfE+ZOKW+tCboWPr9x9F0ccKFxYo9pog/pOiU1/daU/ufPhVl3QIUr2/Vm1ks1f1xvLV3tJs1BNCvg5eBEwWcMp9qNMFpaUvuHkKCB9lh9JQgbBTmyRTUYu2WKVosbRnXGpHDZvgBXiUu0zeopAMc7qV3E8SByEts6zCdobQpC/Xy9X5YBhsgVG/FhJL84UqnfBXiV3QepRAtvj+gA9MxtZRYwikI/fbNlkLALDPn0Xga1HnMfehA44xhXUF6MHdLQi56xq4PWjNrqYTdlSjsPDtG6KjOuRKMECjjqJlzwbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA3PR02MB9394.namprd02.prod.outlook.com
 (2603:10b6:806:311::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:56:36 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 17:56:36 +0000
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
Subject: RE: [PATCH v2 26/76] target/hexagon: Drop tcg_temp_free from
 gen_tcg_funcs.py
Thread-Topic: [PATCH v2 26/76] target/hexagon: Drop tcg_temp_free from
 gen_tcg_funcs.py
Thread-Index: AQHZSmwKdTcp9EKE/0GN1+ujkq/NaK7jFBUw
Date: Mon, 27 Feb 2023 17:56:36 +0000
Message-ID: <SN4PR0201MB8808D5DAC08E3C46F7981E50DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-27-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-27-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA3PR02MB9394:EE_
x-ms-office365-filtering-correlation-id: e5ee10e3-41ab-4cde-ec7b-08db18ebf864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Eh3ZecsNt7XhZimZHGFfVJVDXVty9+wfNFiyvbFl9YgyyeOF1PwdSBfL2gTPQyRWC4clVe9fyJUJTX3AR6BkiX8VJFsj0ZF972IY6Uj9tjkO0GrrjsCcTScu8PF8LoZB47dknJgBOotaQbqQli1vhp/mImPNJ2Rryts424GR6gOsCh1Saeq0try9+8rLx5rNkQGcNSzCP0+I/Fcpe9xE6nc6CIWFYgr/XD30pD1UioOn2N50ABQOh9+XlGBYYm1ekOn7mUQl9BdTIOqRg3kppzsTzG2yciDZfWY/7a/IcS9o99UNrJ3RukmSIT/yqbB/3TWkKpcHMUg2ECvJFwg8/v6jfwK5zZtNcp0b6wmKA0Mcn0dGA9PIcfGlJhWzeXuZE/LnyfF7XH6fhEZuvEkirDlYkPAgz2x0R2/SKP3oNGUObFFvtgujuaknxDcUhtCosPIp6oPXenIA4JTjtBWvHim9tBC4Jto3QQ2fJkK2n3xVE61qcIn9m/8N+IhAeWBXOVmJYdVtt0x+a7dJuIj6uTdB0EfRFF0MbI+gXFUw1mc419MqlWqSienPXE8raGpsqksQtLVDByy+RUtKdCv0AhJxzlppJdd+PRldou3fmg6SzHGk100Ptu+vN+LUhbfoTvfJ+meWkovOkS4w0N4SBIyClGfOMVghUVRXU5nVCCcrVO8dd0fUQiGZ8L3evNhIR2PoA/EbrRlYqVqSjCn/bQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199018)(33656002)(54906003)(110136005)(83380400001)(316002)(71200400001)(7696005)(186003)(6506007)(53546011)(9686003)(26005)(8936002)(52536014)(38070700005)(2906002)(41300700001)(86362001)(5660300002)(66556008)(4744005)(7416002)(76116006)(66946007)(478600001)(66476007)(8676002)(66446008)(55016003)(38100700002)(64756008)(122000001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vuQXY7oHUR10R0IWYgEa875mNmH2MSTtVElqApHkk/9MqhH251yZIDTvYHRc?=
 =?us-ascii?Q?zQ8dSankIvOUOfFUDrvHg+xMV6g9GjW0VudifCMFNnOBDiUSrqNk1sYNj0jf?=
 =?us-ascii?Q?AnqWcGFbFxwXCr1qAbwd+A5f5xudO484nTMEA+bTrl97oUKcfoiFgmzVIcJN?=
 =?us-ascii?Q?b/mXB+nMsYcSPRUmqlwxz6HaXO5li/w3JxTgUsl1qZIZmcAMTp5V1n1RpHyy?=
 =?us-ascii?Q?Lg/ukDik7DzxUZ26Qa/E/gWt5berUBxTOhSZTYZrmEjX3KVf1oXuVAzO8h0A?=
 =?us-ascii?Q?0UndE+Ky9xeM4pkofW9+VHSIHT8iMdrz4eWuDbs8masXyYZTacxjk9dc4UIb?=
 =?us-ascii?Q?6z37aW1xjTdw7AqmR50KYw3xvvKMdpRHI0D1WVJqgGN/4crjV9qEzxSbYnYF?=
 =?us-ascii?Q?u+FDmWL4pZBXGaxu4z4ykNhlSnuyDgj9u6mVzW/wJA76PwKJghaEc33zpmLI?=
 =?us-ascii?Q?B/hreAXA0HuEHCoy8Gqt+ohO/Gh/X5ZfkA/a/LZ2NZvO8QIl0VfL3RPIS9Xm?=
 =?us-ascii?Q?6hVqOlaO+Z9xV/1m3YVTtMJ6+fBkt8teX0msFgSDvxDLQCQFKYyAiCk4OEoS?=
 =?us-ascii?Q?CkCyOurf7zCMqYmtlRugVpVgdFyRxpisAuAkPt+VDrjpVFjYgKdVlDIrXN3P?=
 =?us-ascii?Q?fq8HqtlY40j9lc7suiNaXshrh0AzHjXk5I7VWdhZrMV9Iv68nWiL6Qql7gwg?=
 =?us-ascii?Q?qsSu4xiwpqrin5XePsy166cPzA7F166S3r8I3SId86fZzQrUwA1nUGjvOb+8?=
 =?us-ascii?Q?o0x0wPcEpeDPHh36EA9Kk0ba0IzzMWA5M891WSZg6Mg6t2CReesJXA1kbBE5?=
 =?us-ascii?Q?xxHqq+x4la35q47dN3vbRkd35kAAorWa2kX3Ll5XI8ganlUzMQCM28vegyhQ?=
 =?us-ascii?Q?/Ga9FUaLAOHuwBPt5vBN0vpMXYVVC4n856WcQCLFlSbAOlXs6ndDbcQ7YVTN?=
 =?us-ascii?Q?m5x/YrBWROoFzIwSoj86EqguN9NbbtWNuwOXHdVuK0Fwwp7w6dpZZdwEIJKU?=
 =?us-ascii?Q?TyTQhOja6WCu33biyLTyKCt+FG6pP9ltIEs4rNj+WNu2uNMVy3VySWz89ug8?=
 =?us-ascii?Q?guyurDlMRkEqyODtgwY7ObzXRaLo7/xH4TW5ShM1nTtU7pk8N8/iLn8AhEme?=
 =?us-ascii?Q?b3yHO0VcvPVyDtAF/iJ/ycMamHFMOMciykqkVE9xTDRnuPlx1qcHvpxr4lwp?=
 =?us-ascii?Q?twnFgLy4MQzJz732HbHzF3NqM32KUGJXqnhYTlb8ByRhCh0ZUxeW4QPp/AuE?=
 =?us-ascii?Q?vhrIA6NvXk04icTJWwcRJls7+spDbbaUX6lHyukuVwdx+DhUN/ldPnXSjdU5?=
 =?us-ascii?Q?vm54M+9Z4740LkzjPHKWDh/XZonaV5N/edEVnctZbKbG33mz9HEI6KDO8k9n?=
 =?us-ascii?Q?mNEWTaDJduJHO4atrM+nU9LK7SHUfL+2BqBRsOzcyphE+GYjM2zsVfP5w14r?=
 =?us-ascii?Q?g1gKztnHJd3tnVJsPb/yQ49MCZUGYV56Zs5ZLolCQuf0Gd8r8Pltk6ESXZvw?=
 =?us-ascii?Q?VvVWfH8Af0Z5hVsAVrfSq60QICuli1s1LFhgpTtpn9x1IRLulc04UJ7pZ9fZ?=
 =?us-ascii?Q?ON3ieWl9Qc9YXjk2viNfWmIg4rAJ6UykTnAr1tSt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?0nGKGCkZSSAWybmOJlQCbA7gT+qzEN2l6MnDuv4mzRLjgPfDfSPLYvcOGp/B?=
 =?us-ascii?Q?ohPgksndk9LXxD8z0OxG2KH7juMMRdgFEbpIR5LXy1DscFuFQ6hYiqkISHbB?=
 =?us-ascii?Q?O56l38g3JtBupTTw3xg5qtjSBa7+gUtydMTxwtxYfzzSixCZNve8Vcg7QskF?=
 =?us-ascii?Q?u23vEWmEeKwmciUx2NyHh/MyH+LrxL5y1Lq9AteQd7pBQfM8ms8r3d+8aW05?=
 =?us-ascii?Q?xZIAaanIby3pzLuQUy/hgii2iBllysp0B4aCGNdcvzDBE+lRCSWqrW4dN53/?=
 =?us-ascii?Q?P4XiUKDO9g44vPsd12jpROr1EU9QT3f/dhtrAbPstmoiPyiFLDAXpD32uuhm?=
 =?us-ascii?Q?TQ3ZaPzttWWYeQV0wZEAyFIAf9CPFVsVYCItmro++KLUucRJSjrxz80HOUPm?=
 =?us-ascii?Q?N7DU9rydjwFTX1yXdZDmIx/GritBF+AaP8Z3Y1Nzwchh2SB+qSqlR7OX0z0a?=
 =?us-ascii?Q?EEL8BrZaO5GaDluj0hyXa/76POKajP8XqBhdSDRnM1yFiO3Op9whQP8qL6/r?=
 =?us-ascii?Q?KqG2SEuTxccHKVk2DIkHMuGkbArH1P74SyiEL7B9/DkEwjHPdVv+X215RAVQ?=
 =?us-ascii?Q?xPHDgxW2PvJKxrAtx321+oMQSpDLL9mXJAppchTqlpFtzsUWRb+UJbS8pO4R?=
 =?us-ascii?Q?TG46y5sfVI//yL/XgLMoNLKjvI5HC+W/XANPrNUb/3L+5HrRfJWReNFizzqH?=
 =?us-ascii?Q?3BtOKtHGYtEFOYvYzB4QQNH7pNBWOLD8gG+sbHfc9WsH7yPQfcWHYiODks+R?=
 =?us-ascii?Q?N/d/dISkCGGEC8Mp2wXXJnaY8RAKFVZbMHpWs/g58hfkH/JhOY+1K9+BlRsL?=
 =?us-ascii?Q?HeIgsoSaYyc3CuN1qeJ7/FzyyaEIJ2tGTNx2GwoDr5WrSS1l1Z2Wc34Czi+k?=
 =?us-ascii?Q?oJTjZi1/2WBDp3G84RW0PlPshaG7Lw/xtvNuiPA1oNhsVUh5VcSerL7tmaFm?=
 =?us-ascii?Q?Ly30zJ4ZVAMc1Feu1EqSrOcn2jkT9ExC+hiiHyNhdEAHPgiOuSNrFLkGld4A?=
 =?us-ascii?Q?nPeHo2oFkJJuIgnis9eNKp4PxA=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ee10e3-41ab-4cde-ec7b-08db18ebf864
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 17:56:36.6177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rtsh72s3JWATGclDjD5HQtMV4RZuLicZsDOk46sPwhWacXyI3DF0gQc+v3NL8ZYYHJrXHEtgl/rKXQBXpdRiIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB9394
X-Proofpoint-ORIG-GUID: BGlAzLapG0ZYWpbTjPDyRgatPxfLJYsH
X-Proofpoint-GUID: BGlAzLapG0ZYWpbTjPDyRgatPxfLJYsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_15,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=323 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270140
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
X-List-Received-Date: Mon, 27 Feb 2023 17:57:00 -0000



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Sunday, February 26, 2023 10:24 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-
> riscv@nongnu.org; qemu-s390x@nongnu.org; jcmvbkbc@gmail.com;
> kbastian@mail.uni-paderborn.de; ysato@users.sourceforge.jp;
> gaosong@loongson.cn; jiaxun.yang@flygoat.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; mrolnik@gmail.com;
> edgar.iglesias@gmail.com
> Subject: [PATCH v2 26/76] target/hexagon: Drop tcg_temp_free from
> gen_tcg_funcs.py
>=20
> Translators are no longer required to free tcg temporaries.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
>  1 file changed, 1 insertion(+), 78 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

