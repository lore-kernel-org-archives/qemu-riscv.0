Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B30EB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 10:17:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDjHr-0000Y7-Mm; Mon, 26 Jun 2023 06:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy_murphy@hotmail.com>)
 id 1qDjHq-0000Xz-HJ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 06:17:34 -0400
Received: from mail-lo2gbr01olkn0828.outbound.protection.outlook.com
 ([2a01:111:f400:fe15::828]
 helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy_murphy@hotmail.com>)
 id 1qDjHo-0003Im-Ik
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 06:17:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/JB3RTPpMuFlJfF91+UaIyOzX3WxIROtel76+mz+zERybig2EuLxh7eaeIDVy8cxt2mdaE0s0IN86HHo3Z3+pBnQI3Vy6UlhmlBtzu+JW9eoPpCRo2uxCTR88c/FTGxE5+h9pJkkeARCOkr+7RcTk2t7H334fikVFi77FbBboW0Z7D5266ll+DhS3pS2++yrKjOxlRKuq/PuTz6Dp83WpP5pIduG5YeTAJyiV2NR6mvMUdJ3M0DrDTLBd4bIP19ahG7OJpjH9qFfypr19KnAV7riIquNvsOMph3F2I9ng3LrcFZchdXUBOy7bZJY+cJilqnz84bYqXcg3WiuP/aeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lluNVRDTDF7hnDLeP1pak9Q2zBuXOnPLiO63KtsszOw=;
 b=VaxVnY9T/i7inIsCfT4Spj+HN4ih+cqUTB8L06hQwYdiGM+ovp1vHEL7RI+OHCTF0RPWk+Firn549XVMltla4c/fB50tt/+H6A8G6HWze9rZlNQ+J452u4St0RyaE/jhjt85ivGZsfckZrdYQzqGM2JcxV9CE3sx1Sa/LyVsTfphEgU8Tv2al5QH2XC2cN/+3XQs2KgU15rQ8g1wzjph54ENtkam9lcaq4OwYDdO7OrisynA60HM7iENLu1s2E46H1JRMWW2EOAbzhsFO07l4BJ5aaZM0QYynoA4R2JDZVJGLYpNUoOr3487d4ZJMSdEbgJ35R6UE2G/KBWnY8/qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lluNVRDTDF7hnDLeP1pak9Q2zBuXOnPLiO63KtsszOw=;
 b=S6sHUCFsfXhgbU5194WOZA87+97vM3HgOhAuctPimeZEWyR/Ilrd0PCEkd+kFQ1OSgYVo1G2/e+tlM+MKTeoDZYW0a/wfvGFlFLj6ul7rmpkRlleIk4NHNNPm+7CaXWU3lDtU3gvxDB8RcMLqi8k9U5teyRFsY9q/0tDbkFwiCoQU1i/ZfftqMocQjQ/Ko5XgPviqC/7IkNJTpOD1GGkUjmpPs1bvLbhZhCjUcCFJ7I/UsRizkOll150OXflHhlWsOOPlNfOcrTeHZBj6sRnEe910ie2Hm/PMUdTYG2vp7nox4OV6/KNMQ2dUgOFz4i5sNd+YVwy3vkCliw9b43xAw==
Received: from LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d7::13)
 by CWLP265MB2370.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 10:17:29 +0000
Received: from LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b870:1776:525a:482d]) by LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b870:1776:525a:482d%5]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 10:17:29 +0000
From: Tommy Murphy <tommy_murphy@hotmail.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: How to enable Zicsr extension support on qemu-riscv32?
Thread-Topic: How to enable Zicsr extension support on qemu-riscv32?
Thread-Index: AQHZp6Tik5XYO+yanE+VCghfDM1x3q+cKQkAgACvNYCAAAatvg==
Date: Mon, 26 Jun 2023 10:17:29 +0000
Message-ID: <LO0P265MB68668C5E0CCBF1620784D376F926A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
References: <LO0P265MB686600A85E9B6F3AEFAC066BF921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
 <a998a5d1-f397-4925-d61f-5abacf44fb96@ventanamicro.com>
 <e7491dd0-6bbc-b785-1019-2bd26b123de8@ventanamicro.com>
In-Reply-To: <e7491dd0-6bbc-b785-1019-2bd26b123de8@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [AZS88bj9tiKV6eATcuN1VCDHjYjYxZRR]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB6866:EE_|CWLP265MB2370:EE_
x-ms-office365-filtering-correlation-id: cf679885-25ba-4a2b-8181-08db762e8c0b
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bE/vwrEo9dtscK1bHE8DpyY+YnyWkm7IhJPRdRJrQJ/UYMuJlvFb/aapXARY+KTEBAKCBYwctQpFcos3CdT9gqXlOi/mi5qrssG2oTE37J6YqpYQ4N1OsAszvripfE8rlf0a7YsunkBTeOTBbd56n2V+UY0dwIbAz0m23D9YtHpAO5FnNR9N1KYZXB+y0zqG6VXGu1WBJr0//Wzvw8aFvqfkmi8TUvl5BeQnruF3qTeMqCCj3kEYml41BHjezOSRjl5yd4rpM5GkbACblzjCOwETUKPW2IyjUaTdtQW8BZkwN3Zyzi5rsUWPcUMTfPX7qd7zChjMJ3s4lZZcivDLAtCujvAYrVDxHUu0vGRwRYJ6NCVIv5Jt/FgMdzgrXgI53tPVn/v+/Xp6pLF5na6MV4lDAXs/aiWCk6IJpVccA3pJ5TNYjxKNEt/kApKLT9Lr50qOU2CFCJ5hYRJkVGq43D4GOg2tDKVtq5o/iVsxl/5dT3JTZ6IEqD0hZA1JRpICRpsLbHiVrQlG0R8Ndk16jHw6W9wLJlNZIV8BzCV6bYvWxPE1lblz+an0sRa93QQ1
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aOcEni5aunTvtI7yqyoeqPNJ1/8poQ4ssJbHrzEt1yaUCScyDeilK3vXzyp1?=
 =?us-ascii?Q?dy/ahj+ivFPsPUHCZ+kdHoxE1IuzY56sNdrQADFQsmptKoppNOrvKPf6rChS?=
 =?us-ascii?Q?42FmbcM/thMBaxHw+/PlsogQlNhjmxY/olCTifIlcpRA12N8RRHRSnixC8H2?=
 =?us-ascii?Q?iMxKsmFetnYMOrmquRcDJP/GXWo1xNlEbll0iTrtplzUTJtC23dVSFDDT5vR?=
 =?us-ascii?Q?3Eyxz8nZSvYEwzElv13FnM7FYZcvyotd8HFb6UR9iHxcoIFsxFaR+8fTrpib?=
 =?us-ascii?Q?MLDZrsSeR874WIwTa6yWtbdfU5KVZUS4gZUwSEoEanPfDJldJmA7h5SWYax+?=
 =?us-ascii?Q?AAZmKsUzPnLz+UZX2o+PCH2JPK9OjFrs7MqfCpci4E2vRO0UcdCQxUr0kT6B?=
 =?us-ascii?Q?fQ4dpptIdOKvueE+kK72K3AOBIMYl8ExmaELU7JQdpdp4BtXwKYQt24byjDM?=
 =?us-ascii?Q?P07GlgpnGEsq4WqcBq2BeXdcsfA1t59V0R1YoZtLevZ1j+FrwFceub1bzi4p?=
 =?us-ascii?Q?QpTldtC1MZoEws1qyftW2ce5qt7b2Rkl/n2p2BiGCAWJCQlUY1ZJQMnJJZw1?=
 =?us-ascii?Q?BIEQXuiNsv0G4qM5uKrHjfkx86I/iAZZKhoHzr744olykJG/yTdYCcQXNObW?=
 =?us-ascii?Q?4KzEi8S7k4JeZ/8Q6K+EXYJZ+F8uJ/PevlQelhesu9oPkUG7fgywS4rIw6id?=
 =?us-ascii?Q?j6AZ7Ay8+gTWAF5SfTmpg5sgsrHlSNTee8LaN6dlXJhuKn8h/VMic5WZgO3r?=
 =?us-ascii?Q?M1F8Nsr/rR1VPNuTJ8jaITscO+wcj55YicRUKcZwGA7IbMv+QXTiLVnlYCX6?=
 =?us-ascii?Q?p3InF99afz77/50zbj80ndBoXXwuPoJX0aRz/KhaXbdgH08dQfybl5wJXNQK?=
 =?us-ascii?Q?jD/Qs0kJHDPEXsjeqc+MFqRdhvaJCN/3R9tHKEIwtbAlzrwRR9uiLzyuecZ+?=
 =?us-ascii?Q?7KBUAB2QLY8XOWIiGwdkjUbbyd4d4igyv5IE5i/m2JEiKKQpR2kVBZFC8GSc?=
 =?us-ascii?Q?2t2LyC3P/ZLtNRAMzQgPlVfD/hyBkNx+T3uoOOXLr4MLC84UMCxoZJCyqrX/?=
 =?us-ascii?Q?GCxGH58mmw6K1ZLz9dkxcCyZrxHgRXRG76JUodcCbRmDhA4KJ7ZUQSB7v+PP?=
 =?us-ascii?Q?ArIEu8YpDtM0kd5DYL+D6bInB0Pn2F8MY5MoUJhyb3UAu64znMXZyT3SY+sm?=
 =?us-ascii?Q?e7p/lnn2UaBTPqjjQqsCd+i1UzIzHMVrp1rMDuawx4rktoEAt6Nvn53aZ1WF?=
 =?us-ascii?Q?ALWZIq/JILGCAQU5teBW?=
Content-Type: multipart/alternative;
 boundary="_000_LO0P265MB68668C5E0CCBF1620784D376F926ALO0P265MB6866GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5e42a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cf679885-25ba-4a2b-8181-08db762e8c0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 10:17:29.3006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2370
Received-SPF: pass client-ip=2a01:111:f400:fe15::828;
 envelope-from=tommy_murphy@hotmail.com;
 helo=GBR01-LO2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--_000_LO0P265MB68668C5E0CCBF1620784D376F926ALO0P265MB6866GBRP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Thanks a lot for the explanation.
It never dawned on me that misa or other M mode CSRs are of course not acce=
ssible from U mode but I should have realised that.
Apologies for the false alarm.
Thanks again for looking at it and spotting my mistake.

Regards
Tommy


--_000_LO0P265MB68668C5E0CCBF1620784D376F926ALO0P265MB6866GBRP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"" dir=3D"auto">Hi Daniel</div>
<div style=3D"" dir=3D"auto"><br>
</div>
<div style=3D"" dir=3D"auto">Thanks a lot for the explanation.</div>
<div style=3D"" dir=3D"auto">It never dawned on me that misa or other M mod=
e CSRs are of course not accessible from U mode but I should have realised =
that.</div>
<div style=3D"" dir=3D"auto">Apologies for the false alarm.</div>
<div style=3D"" dir=3D"auto">Thanks again for looking at it and spotting my=
 mistake.</div>
<div style=3D"" dir=3D"auto"><br>
</div>
<div style=3D"" dir=3D"auto">Regards</div>
<div style=3D"" dir=3D"auto">Tommy</div>
<div style=3D"" dir=3D"auto"><br>
</div>
</body>
</html>

--_000_LO0P265MB68668C5E0CCBF1620784D376F926ALO0P265MB6866GBRP_--

