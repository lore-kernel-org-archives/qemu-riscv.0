Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D1DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:29:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDZB5-0002s5-HW; Sun, 25 Jun 2023 19:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy_murphy@hotmail.com>)
 id 1qDZB4-0002re-Di
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 19:29:54 -0400
Received: from mail-cwlgbr01olkn0809.outbound.protection.outlook.com
 ([2a01:111:f400:fe14::809]
 helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy_murphy@hotmail.com>)
 id 1qDZB2-0003F0-77
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 19:29:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWfWQBP/tWFkuWBdtO8Zet/h1zuhcs/t0ok66MzWnKlGrm+GJRNMKn7FCwQOcE4arglN8sFgLJx1Xt/Mz0rS3sb46FR3gyD0Y6FwTCa29uhTARbfSYjJ+dKTRrcEhzU56foDBmYcZTEn+jdifsX6nmALdmcp2BqOzvR6Y0w+zL3tRg2bvFC3KGfc3N05RXVtslzw8PwKAhm+oGcgWO/1eEeODI8FxkFSLcH6v6FzzeP0Dl8eU2WknwqWlr2+8ZcnoyRNyPuQGX3oD8xOOUaXl0JygAQSxTCzIUszRt/ICeF8l39jfzssfFpgMWvI89Qk0fzDLxVzHB8bp1IOIFYjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA+W7c3Ie0X68XARb2K463qb2p8fGGDfs6WTweOXv5o=;
 b=aHdpzjbm3FaFcgyhH88LX5gAm/c6a+aFLkb/6LpfQHTN/LYP/Nqh476651SX3lBPdcFhYLOXY9IUbsJMhbELw6w+28qyYSxZSMwGqf3lXqRcqjZbWs44kbZBd9Sk/4CDl0tCdlq5MMD9gPwxu9EcizMOgIjppxeXGgiTJrWLOWNXGCMqZnDcxwZytt2Mo9qBWtMpTn4yGYyBo6z3+gPSnrjUNIstV4h3VDd9dBUVZtDW3rV69+KBhBJ2HdPu84pul/xRJrApHguZ4yn8A660MbriHohmTzqi50M4Ig/1JZQ7Ge7dQBMiMQWh805AHmEBZKi8MyEG1zSpNT02feJdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA+W7c3Ie0X68XARb2K463qb2p8fGGDfs6WTweOXv5o=;
 b=uPvTz8/Ba6Noa/qI0Mp9PlvVg7RuOWj+oUDSkqmYm5Faem4dPpEkSJ5DBZN+I57R86gfQqH2WNpNeWoVShqJKKg1isphPyipkAEmA4ye673u3su+zRVIJXoLCe8OH86ikbHoRWKQjTUcB6G6lG0kGC8+hTOZlMGd9LPzi9mcv4277A5Z7ELkc2va0uVkjts62Q0YOi3oDKX4hWNdgT4Nd+QWy0gIbX0xA74UUjeGuu98MIbeLBcKX8nnOgv/H+6HlB66L1ce+XWK2d0WW6WeOS/Po3+z+veTx8L8ZELqggYmmGzjTMP9piUg/ua01cbD5nhSUUMMPrvBKoNsW1saBQ==
Received: from LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d7::13)
 by LO0P265MB2601.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 23:29:49 +0000
Received: from LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b870:1776:525a:482d]) by LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b870:1776:525a:482d%5]) with mapi id 15.20.6521.026; Sun, 25 Jun 2023
 23:29:49 +0000
From: Tommy Murphy <tommy_murphy@hotmail.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: How to enable Zicsr extension support on qemu-riscv32?
Thread-Topic: How to enable Zicsr extension support on qemu-riscv32?
Thread-Index: AQHZp6Tik5XYO+yanE+VCghfDM1x3q+cKQkAgAABKwE=
Date: Sun, 25 Jun 2023 23:29:49 +0000
Message-ID: <LO0P265MB686697E7508B5BA227E324D4F921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
References: <LO0P265MB686600A85E9B6F3AEFAC066BF921A@LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM>
 <a998a5d1-f397-4925-d61f-5abacf44fb96@ventanamicro.com>
In-Reply-To: <a998a5d1-f397-4925-d61f-5abacf44fb96@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [u3Kl+J7jCQ4SJbIM8yuif6SREgGQwgV8]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB6866:EE_|LO0P265MB2601:EE_
x-ms-office365-filtering-correlation-id: 64906d5a-b2ab-4aa8-26d1-08db75d411b3
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cs2BA4folfUgXd3sAmA4H9L6q3vLIAuRJbX7nymiv68dVUvU20jcw1HFxTQAepO8b1qI9K2uXNgIlgjuW106wkdcrLr3bjoLpnwbKBDFmnoXhaG1/RdtiITPGJb6oojcW1oEVg2PgKkrTiyN9ZhvRw0GjDVK9HOVwJK/cnloiVSFnvKz7QcLJb3bfkj/cj67+Qyr9fbBdi4iu+XRg780Fr3vya0p9E/Px+02FoorS40KtS7tC2Ve7CsqHokT/tV3g+/phLcTpUcAmPvEH+pyhjdCy07VI2Fnvu6g7Twojzf3BVWavfE/nYlEmUYE+F8OlMEMlVAkqOvcEJUojs96TlE6SYFhMoWmQKDKD1EviSs7fK3pS2VpWjinjtEpGsl1kG4tlJ9O/mFZnygsDk7drFt6/wiRICmG1YbHsA39Ys4NcymVD1bxQesvXkCyKDNPLc7qOHhPJIPE4Uy1K6PV57HfYlfpkUD6IXpPWLB6LsaRQIWYZHLnjvO4jltDxW8pOSURw53btUBkToBXCcCXiCh6anmXs48mB538zI1SC+I2uMBHjEjPHxx/rP/SLMRg8EOf+QMXs3L7udX4SIBpjeWFXp7lpwKDi+gPFcwkhxA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?d1mNFDm62KBn4SNueRo5+HwHZ7F7nuK6eupBONWM4A8XTzEk551qOLIbzQ?=
 =?iso-8859-1?Q?T1BEzqy3gyd7a7srBQNDyMGPR9kcc4VMX+XuD4RbI2lLtxNwqKyZ5kXLKZ?=
 =?iso-8859-1?Q?dWBayfMh4nqz6WX4eENMk4bpie8JmeTK5nwivf0jm9z6fMygHmyPW10C3x?=
 =?iso-8859-1?Q?crLUlK7qtobcbKDdQ7qcdY/CIMvjHiJsYWNPCX92Vesk/2I8VkDpCufffn?=
 =?iso-8859-1?Q?yUEYTfv07jcLbxO3oE0UHQQtBFJD+8JDL1MB1IFTPgkvdAowBbyVIxafaw?=
 =?iso-8859-1?Q?g46GrOE44C/rbhYkRgYb+0nTLzMW+c+/i2Gfui4F3jFlK7wDw4sFH2SxyB?=
 =?iso-8859-1?Q?4gXDKjuKcbdwXL2xF6vQEd8matf2YLYyVumRdQzKn7zsltevtOZJocl59L?=
 =?iso-8859-1?Q?lfTCFY91r8XI1nto1mz+zBHi/1eroAZSsCZYMCdoJeDmKnXNGzrrGFMM/n?=
 =?iso-8859-1?Q?HIIstVvujlgdiG6KtXvq8mkHkpx6nwWG0iBGreqLoBZEOrZf3qn7eMJI86?=
 =?iso-8859-1?Q?5R/WryA4GK0F77sHMiQx1vt2TJhzg1OMAC5Op/G/UpOExViS9rhop4W1md?=
 =?iso-8859-1?Q?+0Jubg2xSu8q/1Ojgotu6VLxKE9M8O5n27G1JlOiH9rrJNxsGZy8+Aq0F1?=
 =?iso-8859-1?Q?jvPemtCtlE5VD2HYqdBvy7TqUuX9sQtI0EdbWrJMP8inpxssT2E/fafGeU?=
 =?iso-8859-1?Q?cYsBJVn+/J2JP6f/rzDMBZvA1ueYophnobyftnjF5c6y1ZI0iW6vF1r70X?=
 =?iso-8859-1?Q?HjOrbtl9UsJC+UugnwMghUS94RBcNFRsOSGYrjgVdmZQC+BxboJbIra5pz?=
 =?iso-8859-1?Q?ClcXoaGm8fiDCGU85yrJhYYdcTegX3HStXXYHccnwSOKtEFT8skndkAT5G?=
 =?iso-8859-1?Q?LnbHLSgIneRqoYdjR7H8ZviXaJdZlDiFE2u3CmvyKUFyyQvX91duOkFu9a?=
 =?iso-8859-1?Q?i2CzS//Ki1PIjv7T8UOgXKBZ+iuSZPJyjC2SNSM+1K0x+d3gjZdGx9DzFP?=
 =?iso-8859-1?Q?+UZThPC9Exh2JuT4xPxH1OYPnNriJ86PGZyqQEywyZwXr0ybw0wcmYVjD3?=
 =?iso-8859-1?Q?8saZHWzr/O39VClWGZU/4D2ntBNlmXTYRqiTlUpFq+ifyi1yM264deXkH6?=
 =?iso-8859-1?Q?Qt19DpZugn9t+Lbd+cFG4FnSQ1CAxrbLmZS7V92QDhK7tEMnDd3cNt4oA3?=
 =?iso-8859-1?Q?FqIeFluldhKA5R01sgKAvDD66jLRmejJpADmb3G/HTV9wz8SfvyBcqgFOj?=
 =?iso-8859-1?Q?EWQNlk3P2JYgkOlzetOg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_LO0P265MB686697E7508B5BA227E324D4F921ALO0P265MB6866GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5e42a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB6866.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 64906d5a-b2ab-4aa8-26d1-08db75d411b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2023 23:29:49.3129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2601
Received-SPF: pass client-ip=2a01:111:f400:fe14::809;
 envelope-from=tommy_murphy@hotmail.com;
 helo=GBR01-CWL-obe.outbound.protection.outlook.com
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

--_000_LO0P265MB686697E7508B5BA227E324D4F921ALO0P265MB6866GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> rv32 already has Zicsr support enabled by default. There might a bug
> somewhere.
>
> Please file a gitlab bug (https://gitlab.com/qemu-project/qemu/-/issues) =
and
> we'll take a look. Don't forget to mention that you managed to reproduce =
the
> SIGILL using upstream QEMU as you mentioned in the toolchain bug. Thanks,

Hi Daniel

Thanks a lot for the quick reply.
I'll collate the relevant info and log a bug as you suggest ASAP.

Regards
Tommy

--_000_LO0P265MB686697E7508B5BA227E324D4F921ALO0P265MB6866GBRP_
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
&gt;&nbsp;rv32 already has Zicsr support enabled by default. There might a =
bug</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
&gt;&nbsp;somewhere.</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">&gt;<br>
&gt;&nbsp;Please file a gitlab bug (<a href=3D"https://gitlab.com/qemu-proj=
ect/qemu/-/issues" data-auth=3D"NotApplicable">https://gitlab.com/qemu-proj=
ect/qemu/-/issues</a>) and<br>
&gt;&nbsp;we'll take a look. Don't forget to mention that you managed to re=
produce the<br>
&gt;&nbsp;SIGILL using upstream QEMU as you mentioned in the toolchain bug.=
 Thanks,<br>
<br>
</div>
<div class=3D"PlainText elementToProof">Hi Daniel</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Thanks a lot for the quick reply.</=
div>
<div class=3D"PlainText elementToProof">I'll collate the relevant info and =
log a bug as you suggest ASAP.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Regards</div>
<div class=3D"PlainText elementToProof">Tommy</div>
</span></font></div>
</body>
</html>

--_000_LO0P265MB686697E7508B5BA227E324D4F921ALO0P265MB6866GBRP_--

