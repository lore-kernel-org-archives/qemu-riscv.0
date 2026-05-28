Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7710CCD5BD1
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 11:38:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSZ3r-0005PT-FK; Thu, 28 May 2026 07:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wSZ3p-0005PC-Vr
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 07:38:02 -0400
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wSZ3o-0003Nf-3f
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 07:38:01 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 70F357A0070;
 Thu, 28 May 2026 07:37:56 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Thu, 28 May 2026 07:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1779968276;
 x=1780054676; bh=5l7wtqttowCsZUM/e+4W4bS17EQ7MUGGRWIGgDmj2g8=; b=
 VZzyzWtCzCcZQuqctdCHCHkscowN3fmhcdWrsApXjefrX2rkuQb8iZzBdS56DDSU
 n+ndaleGacoASGUn0I9SXzhdv7N6RJ3vl/E5YImdbcTVfYBBGPeEsDHRt02qd2W0
 r9X2QFRDHBK4Lj149gT/UeDYYqiNp9OO++QVyi2KenOtPtF9DyG1r1P+fOkQXEF0
 aEkvAVItRQCJv4zTk1yNhs0grYUtpJszYSVGeCeLzf/QzpgIWV4lNN10v6gTLrI4
 Gj/4xdXk17xzuqQCwamii5zPj+hlVWhycHKcageFmE/QpW9e1NpEHi+4+5INdOfA
 nhxyj5xMxaefjkFVFEqyNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1779968276; x=1780054676; bh=5
 l7wtqttowCsZUM/e+4W4bS17EQ7MUGGRWIGgDmj2g8=; b=ntbLK+ByQnHduY/lu
 I2thfSIUCNOicKUYp3zk4lI1LxqXzYFUHIVVYRfWXHdV9IwbUHx9pmt/ixYrqI15
 O4eG/ZHSroRAUjRr0CRII0eJYh4GjB/r0hdP4BZUf2tmx3tv7RWFOe697kWEneeo
 0W0oNH7IKagTAIJhsTxVzZzgGjTDM3lpNmgE/QQebzIy4xDo9+s3ORJNjH8fQCc3
 FZK+bUFoTrzM3Ykhn8S0oQ3mDVDqxAtQQhDVOFUomGN1nPke2StmBYM3w7dLC6Vn
 v90FUyZCWA7lXOmHbHOj+jKGWH9BxrmTNKVNo0Xa9gosJL2FcWc5wglRPUfrKgpZ
 EeGSg==
X-ME-Sender: <xms:FCkYatgMR-l2WeVQa1r3-uryLQ_IaDD4IzWaLMhTz89qpg2Sn9mOMQ>
 <xme:FCkYas1beSsfesC2oUlqksYW8D8rR6JT7oWoCgvV-YOSXp6y964qGClYiJLsI5BY7
 7JKOX_YOnp_EIjl0cjhMPo7gxD5GfpyAciE99LXVcsabT4G0LAim9U>
X-ME-Proxy-Cause: dmFkZTFoPkje//QXkksftWJnzmsBhsnff4HQQZCLWdk3JoF2D/z45Chx3X4Ip8B/rZsW2P
 pd+DvrBsxUo+c6rnTnzDAVpjSKs7ohbini5hIWaUC3GJG7L/Y8BE7HS5Qq/aKqbS8ULCVX
 BxkdvAkDMeVkjidJPLEnuAvTsEqBOeevbbyii9u7L8CAkxpCD836NibkVUQ8+5ziEGNCW9
 qdQiWUqOklz0Orm31VbKMw799UIrOiFMBLoduilhr2cOoD8Al73uI5v9YYy09GTYv9fUnd
 ZqK2ygRFhsGcoNXji2bTGYkkSG195fYGPo5/kitE997eUsUo1tRovv4FRyndrcnojGt2Ib
 nJlu/9Um4PnHU3hgN4xvt30JlzsdXMbbKo1dd4SUKUEtn6dQ0KUd7oGaEJHvUuvcTqTXIo
 PxwGL/lvWVuABtyHfBydKVMVtmSHF8dNv8OKWaOO2wx86NHY0ddgpm2QF4vVDOGVkuJz9r
 HU3BJ5p9VmpLzuqw+ifJYTucZe4ZPHrq19FWzk2hRQC2CNNZHRdBtLqXA9XIaCGJ+yLwch
 TWEKLa7z/uGFhIaPC/VHc9ytopSzcxhqTn+BjmnJf/2t36QY3hUP8BoE3NYD86RBdBp82H
 z+iXgC75I++Nh9SaIZa+4h+ofY9XMspIDga3Zi+TcByx8IS8FwazvfG1MvvA
X-ME-Proxy: <xmx:FCkYagNaTpaqO2skeGpIdGcl1_8jW8mM4p2r_Fd09k-Di-DH3HHzEA>
 <xmx:FCkYak5O2SBtK84W0oRDK0UN6KfSxH5_WKQPNcimmnOHwX6cPX05Ig>
 <xmx:FCkYau3ojvZsPbOUJMO_QqofESsxax5SLqGvMqabQzOF-3O6w9u3pA>
 <xmx:FCkYalYGMj6Xw77-O2m3f9F0Cw7oq-8kUMUM_bepzoIJblP0uEtBiQ>
 <xmx:FCkYauHjhDlY5R9zKei4W27PYcfqqQpjepTUVth0TONy-pAI6cws782P>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id EBF2D240009A; Thu, 28 May 2026 07:37:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXhrCD0H-1yV
Date: Thu, 28 May 2026 21:37:35 +1000
From: Alistair <alistair@alistair23.me>
To: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Message-Id: <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
In-Reply-To: <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
Subject: Re: QEMU RISC-V Call
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.159;
 envelope-from=alistair@alistair23.me; helo=fhigh-b8-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 5/27/2026 9:15 AM, Alistair Francis wrote:
> > Hello everyone,
> > 
> > There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
> > 
> > So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
> > 
> > I was thinking 1PM on Monday the 1st of June.
> 
> Can we make it 10AM AEST?

Sure! Let's do that

> 
> > 
> > Kind of similar to the defunct RVI QEMU calls that never really took off. I know scheduling can be hard, so don't stress about missing anything. It's mostly just a chat to spit ball some ideas and get any feedback. I can send out details about the discussion afterwards
> 
> 
> I recall that we had some difficulties dealing with RVI calendar not sending
> invites or something like that, but we got that call from sig-qemu rolling
> throughout 2023 and mid 2024, IIRC.

We had lots of issues getting meetings setup, it was a mess.

> 
> Not sure if things got better w.r.t RVI calendar or if reviving that SIG makes
> sense.  If there's enough demand for it, I suppose ...

I'm no longer a RVI member, so I can't be involved there. I think individual members got kicked out at some point.

> 
> > 
> > Currently I'm thinking about:
> >   * Current QEMU RISC-V extension policies
> >      * We are getting inundated with extension support patches and I can't keep up
> 
> Spoiler: there's (a lot) more to come ...

Urgh!

Alistair

> 
> 
> Cheers,
> Daniel
> 
> >   * Vector cross implementation issues
> >   * Any upstream issues and how we can make things easier
> > 
> > Alistair
> > 
> 
> 

