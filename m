Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA65BC35FFA
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 00:28:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tv3lF-0008KN-Aw; Wed, 19 Mar 2025 20:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1tv3lC-0008K7-L2
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 20:27:47 -0400
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1tv3l8-0004wO-KA
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 20:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1742430440; bh=6+wizq2Ge5bAB2/0mg0tkKUs9qDwMTLQ36MUCak6bEU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=h6XN1wteYwNh2eSa/8+SgFPLcsBwMU/wtOufsO3Ca+oKRA5SwJAEfrmfa/jfNdjQH
 7pJhc1T4l87U4cGcZrSuCH6sSbwgy/QD9uvbkOt6z+39dqVVgcGumoDDht6WPataHz
 d+GU1+SIFxRU984W2hm/MY8v5Lg71egPONY5xctY=
Received: from [192.168.1.13] ([218.89.199.104])
 by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
 id 6D1B66DA; Thu, 20 Mar 2025 08:27:17 +0800
X-QQ-mid: xmsmtpt1742430437t88p43d1v
Message-ID: <tencent_A3914DBB3F3F204A55AC29202DCCEBF8D50A@qq.com>
X-QQ-XMAILINFO: NioaTWkRhWwapXY4CK8odNtz9mR9o8GRn/q48WRBQSYKtGCxWSnk40uBQgWXmj
 HowI2UhYlp/vz0Xv9jPzp9g9y0eawNhb93y2kfW2FO1lR1/yKX1lckgyZ+9YlLUP7WaqpXlprWTb
 5W5zjIl3veuU5Yhecw9CZjjtGgHjeDjgLB91+rZ1qu0up5GslBAOMma6O8cGz0m1zllNiTzqCp1z
 RDt43naUsi4nogeR+c3Gf3O7s5QmsHhassh86kqaSMQ9PNLbFMroUIF8SVciFyVt1DxB2pQVt7/m
 vAVp8TvEqijfVaBgbGeKS3qUqrkpApzGnuvmw6+yVHg4DQmNmIOsZfG1lrb7ZebHKRLm1Utkrrdc
 KdC3BeuQ0CNuHu4Nk/kaDZNAaIlq+gWOFlLZSWE3w0Y5T4BUhqH04D6rpnLjBs9/XuSLOZ4Q+ZlA
 Dsa+bXkY683GNHnEh/lpUFs5zfv2BRka7wKBlWA8XwN4RtOosainaOxskDGXWyoohFpma7l2whS0
 ERltiAAMAEgDQWB5FmvCHWDD42BFwKN3m1PSKag50VXpyWY9J29nbBepN6KFo3Zxm00AZL9qAfw/
 on+L4PLgHa+OotetnyddYw0AVYjHU/y/I/BYoP7hD7lDCzWf8m3HoWrbGviv6OjwDnX9xogcKdFc
 GCCVx1rx4xi+GGdcPJtx48Yoqmmflf47xdp8rpKVa/qRpH+UdocogVUywrE0b62yIwAvBxeug4IL
 uCIPaH8+LH3745EtoXrAfZZYZWMfd3Ie4WJJFe9GMECeFdz4B3NJ5DOnuOqWC0URJVLnahFas7p6
 qDw8JygWIlt/drUpRcB2CoZj8QDz/U23uJCsMNrFQZ67GXTHeSPN1HaFonAuHsGQGT2MeCc1oa50
 oZAJH/2yRksVHjm61ka68NCp+qXeFLKZCRyLl9/Af1boPRAzxD51Q=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <2ce6aa752dd10f1ad1cfbe52660b2e895584a5a0.camel@qq.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E8=A6=86=3A?= emulated riscv PLIC
From: Yanfeng Liu <yfliu2008@qq.com>
To: Alvin Che-Chia =?UTF-8?Q?Chang=28=E5=BC=B5=E5=93=B2=E5=98=89=29?=
 <alvinga@andestech.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>
Date: Thu, 20 Mar 2025 08:27:17 +0800
In-Reply-To: <SEYPR03MB67004C8A706EC1F1BE648E23A8D92@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <tencent_B08E6CCE1DE2E1580A782D03697B9EC40F05@qq.com>
 <a7ffa471-c5f6-4a80-9e2c-f1b4d0c19b64@ventanamicro.com>
 <SEYPR03MB67004C8A706EC1F1BE648E23A8D92@SEYPR03MB6700.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.205.221.239; envelope-from=yfliu2008@qq.com;
 helo=out203-205-221-239.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Alvin and Daniel,

Thank you so much! Now I understand.

Can you teach if writing PLIC pending bits is allowed per RiscV standards? =
Do
real world RiscV devices support that?

Regards,
yf


On Wed, 2025-03-19 at 13:04 +0000, Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=
=E5=98=89) wrote:
> If you are using sifive_plic device, the pending registers are read-only.
> https://github.com/qemu/qemu/blob/master/hw/intc/sifive_plic.c#L213
> [
> https://opengraph.githubassets.com/330b9ad4759e334541fcb6e9e3108402f45472=
5445d7
> 013e75efa01fcf01429c/qemu/qemu]<
> https://github.com/qemu/qemu/blob/master/hw/intc/sifive_plic.c#L213>
> qemu/hw/intc/sifive_plic.c at master -
> GitHub<https://github.com/qemu/qemu/blob/master/hw/intc/sifive_plic.c#L21=
3>
> You signed in with another tab or window. Reload to refresh your session.=
 You
> signed out in another tab or window. Reload to refresh your session. You
> switched accounts on another tab or window.
> github.com
>=20
> Regards,
> Alvin
>=20
> ________________________________
> =E5=AF=84=E4=BB=B6=E8=80=85:
> qemu-riscv-bounces+alvinga=3Dandestech.com@nongnu.org=C2=A0<qemu-riscv-bo=
unces+alvinga=3Dandestech.com@nongnu.org
> > =E4=BB=A3=E8=A1=A8 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2025=E5=B9=B43=E6=9C=8819=E6=97=A5 =
=E4=B8=8B=E5=8D=88 08:50
> =E6=94=B6=E4=BB=B6=E8=80=85: Yanfeng Liu <yfliu2008@qq.com>; qemu-riscv <=
qemu-riscv@nongnu.org>
> =E4=B8=BB=E6=97=A8: Re: emulated riscv PLIC
>=20
> [EXTERNAL MAIL]
>=20
> On 3/19/25 4:55 AM, Yanfeng Liu wrote:
> > Dear experts,
> >=20
> > I am wondering the emulated riscv PLIC in QEMU allows triggering an
> > interrupt by
> > writing directly to the memory mapped pending register?
> >=20
> > For example, to trigger PLIC interrupt 12, I wrote uint32_t (1 << 12) t=
o
> > 0xc001000. But with QEMU v6.2 this seems has no effect.
>=20
> Can you test with a newer QEMU release? There were a lot of bug fixes and
> changes that landed in the PLIC emulation in the last 3 years.
>=20
> Thanks,
>=20
> Daniel
>=20
> >=20
> > Regards,
> > yf
> >=20
> >=20
>=20
>=20
> CONFIDENTIALITY NOTICE:
>=20
> This e-mail (and its attachments) may contain confidential and legally
> privileged information or information protected from disclosure. If you a=
re
> not the intended recipient, you are hereby notified that any disclosure,
> copying, distribution, or use of the information contained herein is stri=
ctly
> prohibited. In this case, please immediately notify the sender by return =
e-
> mail, delete the message (and any accompanying documents) and destroy all
> printed hard copies. Thank you for your cooperation.
>=20
> Copyright ANDES TECHNOLOGY CORPORATION - All Rights Reserved.


