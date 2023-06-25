Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 20:49:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDWg7-0007Le-Lv; Sun, 25 Jun 2023 16:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy_murphy@hotmail.com>)
 id 1qDWg5-0007L9-JB
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 16:49:45 -0400
Received: from mail-cwlgbr01olkn0170.outbound.protection.outlook.com
 ([104.47.20.170] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy_murphy@hotmail.com>)
 id 1qDWfz-00025o-SW
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 16:49:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCuZvye2ItRCFgh/7xtUD8kqJ0lPCAPJNqDHpfBcqRoSULMWHEJI7v27pP/hZiaVVIevPJ0H5x/PX+/lbn43HBNwV3LmiRJUcNUb8d/K4Uh2EZjnveD5BkQNAR40J3W2GvLoaiVXTShCLz5Y6J3e5qxPoKyXd7VGa0dFZOY4JFoHFi88EaaUtE3G79QdV3NrKha0UBtUVIFn67nMeI5sSgiD7ku3wQDO7DZxDbIypPxmD178WrtW5uYoi8G0NDAKeh+gFP53HxTEmgqDhwCzMSjyz9rB4UjLnNDjkbaTNMBZ88rbUSkqthx/acCXGvmpMg3A9IzLmazv5P1x6hVFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOVrtQZMQtqOv9+6lqGDoEkH/5cepntLN3YfICmamtY=;
 b=Iq2Z/CbPHgtEGc2F+GJrzjHE69+4iU9FX91L3csompevxA4RTj/TOGZnUOHthFOxzSECzBKE0n3Qh3BJPhcBGKIIWNor68mZBebg6ZAwASoUX8mgw0NBtfG5bmB8kC60aU5lHKCQXGfr4erjF4Vb2yCxBAdKYpLoWYnQtcayJT8skQiF1CJItjL1iBbU5Vn6rlK3loihYFY0cA86x7FbjxLaluAJmTayQG1NiqlnmRFVhYL42p9pduKuYDezPUwTczdx5y2dDVhJJEc5ssa03qRSm6uVjIETTb+pU9TpYxsfLsHU5LUWXdWz6EGPG+nfenu5ZHEzgjPyWtbMXPEJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOVrtQZMQtqOv9+6lqGDoEkH/5cepntLN3YfICmamtY=;
 b=g0mQguAfS+zUP/KYXgU9JQz5w4YiNabIkeAmCctIGv3XUvi8BCD4MiKOd1J1jrm8UQELAuCOtOovCpGgRfoeCzV3LAhTfVlWgAOMHl7xJE5nl7L6hUBahCiJbMPZByto8cy9Mt53p8mFw46++yZ2ZMxdAvpFUGD/deIux2UFarECraUDu8MIl5kjPYPjKVaF0OwXusTp6rzj4wRNfXioJ8SfUsidnqAApuLndeX7/j9DQicJJepQADYGBEdppCSA/81/5UYeTVBcEQ5i21k1SHXYQCsYaQ/OSBIh8yAW9dCwVA9zjA+i+EDywa9FDdrFLL/FKI+PuJhQ1TJKomDQXQ==
Received: from LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d7::13)
 by CWLP265MB6232.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:185::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 20:44:33 +0000
Received: from LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b870:1776:525a:482d]) by LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b870:1776:525a:482d%5]) with mapi id 15.20.6521.026; Sun, 25 Jun 2023
 20:44:33 +0000
From: Tommy Murphy <tommy_murphy@hotmail.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: How to enable Zicsr extension support on qemu-riscv32?
Thread-Topic: How to enable Zicsr extension support on qemu-riscv32?
Thread-Index: AQHZp6Tik5XYO+yanE+VCghfDM1x3g==
Date: Sun, 25 Jun 2023 20:44:33 +0000
Message-ID: <LO0P265MB686600A85E9B6F3AEFAC066BF921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [uE4ik427rnesPYLw7j8zrzazz3aJmoL6]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB6866:EE_|CWLP265MB6232:EE_
x-ms-office365-filtering-correlation-id: f789bffc-2e6d-44dd-5018-08db75bcfb6c
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lMjHrHIs35e82IicTiHKwplPjpwJVE8qH4xi0iY0DpTJ6zAW297aEZJlbnimzXyIqh/fa71FyaI9skYFLM6rL15deST+PD2Ot4AYoeAlDEk5JgRhn8pbiwfKmlwhPXBphWOg2JHqIvDJOwjMYtZUZ9KvUn6t4K7eV9Xy8Iyn5L5DbWplDLdIo9I5VLbN/2OmzeP5hEw8Iz8SFezwjX3tlL1kn7YnSq261c+LHuU4H3+FLDjeUcviArvflvNBnGxHWt194zef0/OzgcAzarbYDZe7ri4yNxvv8ataPFzjC7EezdOHn+LBIl1yfGHZ3Xy6P9bQxevk2XRffoiVnQbgfL3cxt5NpeH35yJuAdxBwdYZsJT/FEQOgCv0YIdZEtpfafG0rrdhSbORa3l1aELMphJ4Xg1uubPdL+60ACkpiVxOouE/LKoqcnt6Eb4aXCoJ+HtCXiL7PeYgfdh4jV2c/x96JnTtH+sekvEarU8Fu293IFh/JGpiurpgU0uDcZkmBRWeKFQ/N1pthucyjufQ+VpW7HVx6Agt8hLbmOvwIxaj+HLQaGA0rQXdz8d1hYyv8PAzMa9LgFNRc/0NfXj4PniACuChGxkGvxAmfEvFVv0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2qsCAlKSL3mYXYxiVUAbZCb7we7VX+tqFNf3xiUNXSY7rA8g1XEic6ooCs?=
 =?iso-8859-1?Q?iDs0oa+qkGTwbrWgF2HryIlUwBR72et8cKc/SDcSMiGfQVbqrso2xrvfYC?=
 =?iso-8859-1?Q?MrY2o0/HR95XeDvoP1RBHgpdjI7lfecCnF5HmNITBY6pOTBNxzscuobGeQ?=
 =?iso-8859-1?Q?smsunznFYlBCyMJHlxvTd34NRgtdWMfVp2ZXpp4y2oFQCJJx1fyNxHn9dj?=
 =?iso-8859-1?Q?EXXQa7YeifIIkHng6puOvaUjM5+W/8pdV+SydqmusT5piLzRJJPCDcU+F9?=
 =?iso-8859-1?Q?gCMygXK34rS6aVSfaAIswvrtIF0cce1S83FHcNKOHvTERy92RZCVu+HXPG?=
 =?iso-8859-1?Q?wMDiIVsTPul3RZKzkbo4D9Ctx8UGdDFhldapljHE4bobLNNT6mwWoQHf8y?=
 =?iso-8859-1?Q?JYzX+l+TYtBHEn61cm9IcAwJJeYLNYaCrpAVxunJD+dYGwz74Nu3+Utgvr?=
 =?iso-8859-1?Q?t/P6x91D16AnWdNch5dYDO0T0R0GkUqVEAaK9dWFmTpV9kJ5rv87iGE2cA?=
 =?iso-8859-1?Q?6SRGP3oaJWFiiS5/et6onD1orVV6/N19JtJMyLcdfuohpQjPHlfHmiVo86?=
 =?iso-8859-1?Q?LuSDrNkfO4JWSZnxrjxEfLnN1XC3QoFjdIM9pY17Cqx91FXjHMxvLPo7lH?=
 =?iso-8859-1?Q?t/EicLwOn8AdhV1LZX/PVXDHt7UwfO9zP6VX6FEnzGL94EarKWN7SCsyFh?=
 =?iso-8859-1?Q?yQLYgVut4sSvM5DPmSUONBEAj4jg1XUAtxaUa+eijvRflVG6L7EcviweXc?=
 =?iso-8859-1?Q?VdEbU3U/FQLeNapBgWnvUv6saqe8foAIAjcoRefKamHTFVWszP7WzbPUVt?=
 =?iso-8859-1?Q?uZ6mOY8atr5jGdb8r17eKyG9W27rFJ08MOeqzQubGn3O3v3LiwvTBIwlOo?=
 =?iso-8859-1?Q?GRtXAECBwuzukhxF8RswsyvTHg0oKUGNt9IFtFiYPLKyLKkNDNCuRnoXSb?=
 =?iso-8859-1?Q?pvrHtErXllcKbRU5a20sGYe6vLXp+CU4NSgc+iFPRLHGmsr7j3WJasq/fV?=
 =?iso-8859-1?Q?lDu9XANeSMxCbHYvlcTDPIvqWngBQqfuusMsMjlZj+k6FdjJyIckGZ7Wjx?=
 =?iso-8859-1?Q?9+UR5WebwALKpLjuam2Sc+22kPvXuNMgCT8K6/emElNqs8eZFrh7QenkhH?=
 =?iso-8859-1?Q?sdL1/KNMt9PajkZp3fo2b0376nOVP1qCni7NXnok1PPXCubmeAMhIfykaV?=
 =?iso-8859-1?Q?RS1p9DCIF/o2V1apBjmDTI56tHFZT0GSFKOi8/zI857W4y52Dx+pjRqztK?=
 =?iso-8859-1?Q?XKifNnovXa974PfDobQw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_LO0P265MB686600A85E9B6F3AEFAC066BF921ALO0P265MB6866GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5e42a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f789bffc-2e6d-44dd-5018-08db75bcfb6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2023 20:44:33.4982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6232
Received-SPF: pass client-ip=104.47.20.170;
 envelope-from=tommy_murphy@hotmail.com;
 helo=GBR01-CWL-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--_000_LO0P265MB686600A85E9B6F3AEFAC066BF921ALO0P265MB6866GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there

I've tried searching to find an answer to this question but with no success=
 so far unfortunately.

The issue is discussed here: https://github.com/riscv-collab/riscv-gnu-tool=
chain/issues/1278#issuecomment-1606108826

But the gist is that I can configure, build and use `qemu-riscv32` to run a=
 simple bare metal "hello world" program fine.
But if I add a CSR read instruction to it (e.g. `asm("csrr t0, misa");`) th=
en I get Illegal Instruction.

This is the case even if I use `qemu-riscv32 -cpu rv32,Zicsr=3Don hello.exe=
`.

How can I configure/invoke `qemu-riscv32` so that I can emulate CSR instruc=
tions?

Thanks a lot

Regards
Tommy



--_000_LO0P265MB686600A85E9B6F3AEFAC066BF921ALO0P265MB6866GBRP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi there</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I've tried searching to find an answer to this question but with no success=
 so far unfortunately.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
The issue is discussed here:&nbsp;<a href=3D"https://github.com/riscv-colla=
b/riscv-gnu-toolchain/issues/1278#issuecomment-1606108826">https://github.c=
om/riscv-collab/riscv-gnu-toolchain/issues/1278#issuecomment-1606108826</a>=
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
But the gist is that I can configure, build and use `qemu-riscv32` to run a=
 simple bare metal &quot;hello world&quot; program fine.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
But if I add a CSR read instruction to it (e.g. `asm(&quot;csrr t0, misa&qu=
ot;);`) then I get Illegal Instruction.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
This is the case even if I use `qemu-riscv32 -cpu rv32,Zicsr=3Don hello.exe=
`.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
How can I configure/invoke `qemu-riscv32` so that I can emulate CSR instruc=
tions?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Thanks a lot</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Regards</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Tommy</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
</body>
</html>

--_000_LO0P265MB686600A85E9B6F3AEFAC066BF921ALO0P265MB6866GBRP_--

