Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psDfK-0007t0-CQ
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 22:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4752be609=Alistair.Francis@wdc.com>)
 id 1psDfI-0007ss-Uq
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 22:16:52 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4752be609=Alistair.Francis@wdc.com>)
 id 1psDfF-00082y-Tp
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 22:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1682648209; x=1714184209;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=CEH+uL9mT0EHOvorPoDViP/QmHWKmXjuBkRArFrnMz8=;
 b=P3lArzK8Kdz+DXUcC1zlvVXLqbDMegHkvXJsCLo1rVAdsE2NXwFyt97T
 tIWTJimdv+82sqJGVyhhMt1fXZz8f5V8O2RhYL1/kLfSZwfrfKrH7tOX+
 qITGL4pl6uUalPaKNimLBOgoDmZOZbuf3QLEGMNMm61LrzEUopXS9GqrA
 YVHZAqx+eCDhLO0Faw7u76OuYtfZmVysUdxQMpzu9cF1HK3uIoSwRO6bp
 4U/uCTaEk8NANWY7/DsIz+y83dIw/uhMarFSiKDWF4MvB6Hb1n83mEZdQ
 PZyvcCxBnqiTh7k5AUhsPejBMQJvO/Evw2cVptkR9YI0T8hoIfkZz026L g==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677513600"; 
 d="scan'208,217";a="227680942"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2023 10:16:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxnbGUpgPpA6gzlQEjEAB6vRNd0BB0eGX0P+Q8oXr+7dxoQ0cNvw4cER3kVc6BPT/OW5Apef+CUXL4TTZAf0j9kcKX1ZPQJzU93kvX0foMU03dIdMReelS+pp9+cblZqW1UB7BCnrCebesVPvQhhuOxvEHi5SpnetmZjVz1n1nLrF/HETe2AYOt84rqIPPagRyRiUjXWTJpes5Jyb89tgKdrZn9UdNlJE38obQD8ev0qyxnUDIYd/TAvq/N5tD55zuZA2cKWAIBY/OX6s9BKj4olt9kyUPOFp602pIFmli2ZDf9gqxI3Pqz0NjfRpJHR/oayHt9ISyxOoTiMQk+4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxuZDBOVBML4iB/wHJhdz5Jd9DG+5Iqq6/wecWOrAKU=;
 b=LjdkIvPLg2yo6GMraOEQuFOyxaNlsh5jSMHKKLVWeXFmbTRkhTA0JzghvgMQxMasOLi8iL14+dzn80OOAmjNnfxm3FX3T5gaHS/JUc8mCUCeGsuYUw1nBNxfSe5ydInx7PPMCk5YNMryqoVojXYq/Bk3W5l0JmfaSpQ7rDZr27UHW6eGg0DiSZEJkfk+8rKfXKT/EamdjRXiomd1wDnkMM8RREQX8vrwtWRENJC3KIlllu5DHYDS0E7kIaJi47T8wm3aQRH+x5DVjcaclc808biK4wcWjKuuSWhqsTMyMrU10ywC3odP6+oAoETjeNSJVHPt0YW0lXyiiIsZyxD2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxuZDBOVBML4iB/wHJhdz5Jd9DG+5Iqq6/wecWOrAKU=;
 b=HoQlfmye4p/nLShaDEZc6y3cdiyak+sHZVZI7g3Ldc9qzztccPByyB2ntsIcW6usCNlJHxPUHzhz7ApjFlpDoW45/uBLr+Gl6YZYohzAA3PSF8d+bo73vMwdhkm+gmn2XV0Q0wAdB7NKHmqnjCSQdxTP19O8jdSEqaI2vdV5ejA=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by DM6PR04MB7051.namprd04.prod.outlook.com (2603:10b6:5:244::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 02:16:38 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e%7]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 02:16:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>
Subject: QEMU SIG Meeting
Thread-Topic: QEMU SIG Meeting
Thread-Index: Adl5d3WEYXigVKyHQyaMjKOJ2jvZOA==
Date: Fri, 28 Apr 2023 02:16:38 +0000
Message-ID: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|DM6PR04MB7051:EE_
x-ms-office365-filtering-correlation-id: b9b59a9d-0112-4f3c-5c74-08db478e9934
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YTeav64gJYDLZLR0rFOsZHVaEQf5E8yrE20sJzuUA1vad0UY+M3q37pK1RP2vt1PKDYYKzAyJDdtx0lrUj4clAX4S+1fvl8iqDx4TEfeEmzoEzxhPvqfTSL1ZxfcpIAjX0ieB2tETjhl1Q07bL1J38MEOfMTsIEHc4DdgxVdSrce6RQ82inoz+FISYjOPo/sjVr/z6Ag6dNSUiKjYEDUR3TrIC+EqPTc45kEco+RiViB9kttYy2e/ySBCpJ6UoBcpYi7U1SRnLT0JoU19N3CEFoGVA13sMAd//jn5oZL9dQF4VMtc65traDRagFva5jpCFzkvo8DmNk6jpNeo1jWyu4lOeMDXfUtdfl7ME4vzE0vbtEFkLsxiO2fZez4RZ8s3wp3U+D5T2Nwcv0ERtxjkz+e1zT3dr+w/ZFjZ8OCKHZhU9xNpKWfcZIKjajbYpTM6hMZxPr7UmfIpLIYJbg1EcWfJ2KRSLyMu7kVS2j0esDUWoMg9107q0VjpLbiRV/Sj4cCX17hymMOzxSEb4exuMINrrjqqKSMCqkhpDaOvPNXxGOkRMaTTHucoEvmo432zM7gDx1eRrC0W9SWBlMnKKbFIiMnROXT8JOl1rzqHN5HarmXhkr3P2ZZNIajI+D8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(9686003)(186003)(26005)(6506007)(83380400001)(3480700007)(122000001)(38100700002)(55016003)(33656002)(38070700005)(82960400001)(316002)(478600001)(52536014)(5660300002)(7116003)(66946007)(4326008)(66476007)(66556008)(41300700001)(66446008)(6916009)(64756008)(76116006)(8936002)(8676002)(86362001)(7696005)(2906002)(4744005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z67X222pgCFIWzkSBZfoFplXbpfb8SpIaU1vW8cCV6BjhL0lbEQqAPR6Ey62?=
 =?us-ascii?Q?oulmEep8sfrI6+WhpWpi+mCrTlnssYdDUtJZSBFtRXAzk4LVBPoHD1jjY3wC?=
 =?us-ascii?Q?AwjXPEPhvsMMwAfEMPHROsgdrgMiLOarsIVUN/SmWpE325DZZO/8RqyYk41r?=
 =?us-ascii?Q?BHhfFlRS8S5GSeIJTBtCgDD0zY/eInDrJp8IEf3qusRvlXJTINQFhCSHo/6e?=
 =?us-ascii?Q?kPg6mRHvzLYXtijCsPqgOiHsN1njftdRJX/jxJv7AfYJN1VuQXOoMh5+GXDs?=
 =?us-ascii?Q?Aoh7f0kindt9rkWYAMcHDABz43/ut4mNJETOqg1JGxS+CzPw6JuFSJLCY8kt?=
 =?us-ascii?Q?oOIcNvBmEetI9gmkg7aNsW5mEALXTSVGXDjW2AHMoXnyiS3lR/T0vlRPtsYl?=
 =?us-ascii?Q?gKZhj3A1F0SXOHOYmaDNSlyNsU6C5VBrfacJZzS/qF4+hscVJ8MQh5H12Udk?=
 =?us-ascii?Q?58j7u9XQfJthplZKcwnabUyYA8T9XaltU9a5GjHXVbwbGQtAnplaOlgALjeP?=
 =?us-ascii?Q?9BN4KGIfA39VGLGh879oNf7z1j7Nccailv64YiBCuS56eXKERzcBofPQqmHO?=
 =?us-ascii?Q?PQW4wJPdunEQhA60jPp/3DkLzc1PyDldCKX57BwZLZR9dn0OBQv5T6zE98TG?=
 =?us-ascii?Q?ihRBmaj/nJsmHZHlwM9O02lj/PfUehbg5eSyev5IriMzgLlsGP+uMCKFsxni?=
 =?us-ascii?Q?IfcPEx39JFvOXIzsPIKrxa0DKPFy8HhwFcpoggCie7VU8WKI/y7qvCxfgDMo?=
 =?us-ascii?Q?8T9pjPDI/nrhAMB9x2foXGgzQRxNW0O4xDW14pg5EHuRmXhDW618CnQqpTYi?=
 =?us-ascii?Q?O2HzXowCPHvNPGrWWB2SyKtxCAbgPR/CmRESP1EQP9mg+/cqFTtF7Ib/rDXs?=
 =?us-ascii?Q?l21nFv1m0Pc5weakU3JiYNDUTHDxmN6Qq8zSpfVH/PKojPa03WktJQljsnGK?=
 =?us-ascii?Q?f2718ojEwm9qkFIzM3f96oRonedH2F5uzC+m89UYnRNzk1+cPa1+7wwwQ/V/?=
 =?us-ascii?Q?+wt6FHxF3Fs/JJBW6En/gI/zuNFoqCubFnGn7APF6kVS9qhvZIFn3ggtyybY?=
 =?us-ascii?Q?rtrWQrqRtKwy/cuOuw1cFXcFRwQIb2nL1bx26f96zvELVy7zC9D3fB+zF1DU?=
 =?us-ascii?Q?OTXDGBuNXmpSxcfPFNgaArHx9+ld88sQjGaxAvowLZe81VMg3DQ+HWnDEI85?=
 =?us-ascii?Q?oxuP9e3LqfnpnbiTOJE6BzHPvTxg/QfVyflQ5BNAvaCz1iWD5pl3gm1wxhp7?=
 =?us-ascii?Q?FBhFZ7gph9/syT1TWpaP1sLHhorzt9AXK6UTBgwOSW5QeZ8B+CKcI7ZrGjXu?=
 =?us-ascii?Q?sEwa8IMCzyvW0gqVj6GfHojd1E0mwSt9+OrNhSCkpkRkyXmlU1Xwmtl2VVqd?=
 =?us-ascii?Q?eH0EX3y5wHo66ZHvtbxXWRRIZiRJgyvJmYHhoarJS/CeqLOwPzyyaynvC+ik?=
 =?us-ascii?Q?SS2Hfd3g1mwC3hMcvoJZJlnoXPF7XgwqbxYI6HXRjvlY/2b/kIAj6/C95Me0?=
 =?us-ascii?Q?VK0UTzb6vlu+lWbb4mEgRS3V+uT+jOvPZLcuZNJvK3Tg3eodTOWRasqWhHoj?=
 =?us-ascii?Q?nfr+EQ49XuDWHfYpN5B9p/0/MIPw77rf0juRTNgV?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR04MB787223A0357CF1901224B0AE906B9SJ0PR04MB7872namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jNZDXB/Z00+l2DiX50xKkI6/4RcH8+eF8jZHQxxEHtHzPNZeC+tGm5VUzhUZi1q2xC0GnvTeOhLMp+HbBznOTZOcPLf3dog5fNSaxzKLs+myv/IK6q5YeV/BeR4kdYWKeJgxgeDBnDywW8HJBtiDvJ0vuP6xegIGUI+j80MFlQx8HmhCbWG7GtyHk+eqLn+13awwnCN+GmaDXdpY9mvdQeXVYms1MuyGGpRK0FP0ws7XZP/H/7jXsKkp0jN1/fp2A6PjqBP1tOij1PZrnJ1ikvH72KJrzGZnlkgSxopMRWXTEvmkg4kzIX70XqrANhHsFyTW6vvOCO1bW8FgZv+P9PEvVF4Wi728z3NjTiPAhHK6W0dFMcCoblQIN7V7g5ezSXdky99IabcoI0fTmBLMJ6NFcTIEBlxVLf+hOG/lZvu+cSPp3LPP9VFqhMzRsifiC7p6SP6LkHw2dtuA3dKlPQrFZrxXDGgECLx/HoYqlDsAjaTxerh53gPg9D0Xwx9NuD22efgsVo41cX27XFrPJ8m6s+V68lrJ/60mnlyjTGkmoXVGIrUPNueXxV8m13KfVRZw2pwoYAZr4D2/fEl7azKP5bus3TksZxD8nHv7xNPCzawCJu17dZhQkQrayNB1NayU/+BI0Ig0er0bfDQa8+RdsWUu6N81ilK/CgZKVZsEb+4xZAs3zUdtc+Dz8OfyVw4qsR49qtuWTS5nbaTItne0tuu31qEjto6MfQHtWU3f8xhTO9rqTID2/cevQF5lmMP5kqOCLUnJLO1+JiOd2nWYW7Na8JHN6e9fDUflbufRUoohKqIBoANJbf6krzm2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b59a9d-0112-4f3c-5c74-08db478e9934
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 02:16:38.4116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qak7qKZx9Yz3uQU6/kkSXMzMi1fECZdBeQPoIFCRpZWXml/VleDJZ2dQURJOxRQvDtXRrEdvOtlM8LYvL2KesrjwmsS0yN3GTDf4BUjrmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7051
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=4752be609=Alistair.Francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Fri, 28 Apr 2023 02:16:53 -0000

--_000_SJ0PR04MB787223A0357CF1901224B0AE906B9SJ0PR04MB7872namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello!

Sorry about the delay! We have had some technical issues over here and I ha=
ven't had access to emails. I am trying to switch over to my personal email=
 to simplify things in the future.

So a few updates from last time.

First, Zhiwei and I are switching chair and vice-chair positions. I'm no lo=
nger a RISC-V foundation member so I can't remain as chair.

Secondly let's actually schedule that meeting! From the poll the two best t=
imes are:

Tuesday 4PM AEST -> Tuesday 6AM UTC
Thursday 10AM AEST -> Thursday 12AM UTC

So let's alternate between those two. We can start with fortnightly (so peo=
ple should be able to attend a meeting a month) and go from there.

Alistair


--_000_SJ0PR04MB787223A0357CF1901224B0AE906B9SJ0PR04MB7872namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.size
	{mso-style-name:size;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sorry about the delay! We have had some technical is=
sues over here and I haven't had access to emails. I am trying to switch ov=
er to my personal email to simplify things in the future.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So a few updates from last time.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">First, Zhiwei and I are switching chair and vice-cha=
ir positions. I'm no longer a RISC-V foundation member so I can't remain as=
 chair.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Secondly let's actually schedule that meeting! From =
the poll the two best times are:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span class=3D"size">Tuesday 4PM AEST -&gt; Tuesday =
6AM UTC</span><br>
<span class=3D"size">Thursday 10AM AEST -&gt; Thursday 12AM UTC</span><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span class=3D"size">So let's alternate between thos=
e two. We can start with fortnightly (so people should be able to attend a =
meeting a month) and go from there.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Alistair<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR04MB787223A0357CF1901224B0AE906B9SJ0PR04MB7872namp_--

