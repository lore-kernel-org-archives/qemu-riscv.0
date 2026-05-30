Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0684CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 May 2026 10:44:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTHAP-0000mp-8j; Sat, 30 May 2026 06:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wTHAN-0000mN-9i
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 06:43:43 -0400
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wTHAL-0004L4-NW
 for qemu-riscv@nongnu.org; Sat, 30 May 2026 06:43:43 -0400
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B56097A007C;
 Sat, 30 May 2026 06:43:37 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
 by phl-compute-04.internal (MEProxy); Sat, 30 May 2026 06:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1780137817; x=1780224217; bh=h8M15AucGo4Wf44ckIMr5iiPk1c7vlqy
 odbXHhrm6HU=; b=JEHIqncIf8bfpmoUTvlfWzzaf0zh+1IY3Zte3h/UMz3lteBI
 AvvNNrEobYpzjTpiiOldl1QIFd0YOgE17qh5Hlj/2O9LFLNgwvx6O3eVhIgyu/+R
 K5eN+dSdeBizzDumDhUZDjg13qhxuzwElijbTf3IbsYpGFkA7WdUxWCkvIDZEehg
 P0KT6e04bV4agcNGqAa8YTGycq6graP5sUd8cnS6TDGeanuwiAZHLFUmKwrREuZ4
 FAwrHQD0kC+qjgpycC4y7eAKUf03vudwK9uWEUTafP6vy0ZpMUAPrqlLqYA05syf
 nAYSYSaT24Lb3BqrNJfl+YzxyhYiYABu0VNyfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780137817; x=
 1780224217; bh=h8M15AucGo4Wf44ckIMr5iiPk1c7vlqyodbXHhrm6HU=; b=k
 RuZB9Zulm6QoGr2JQL2QFKZSuriW/sFbuFP6q9ep2cXcLgVAQOOZ4kpQDDNypKG6
 MgA2pcU7jGHz5vsDQ9txoOw5sgrJxbLEZuPgNU0mZJQR0ZBgz3Wf/WlloBF8Seik
 +uSHcW9nIKL/u9uRB+4W8wzVvs1C2VIVzQvK3romhtIGozYvL/ye0RAWGaP0Bt6A
 nM36/QiwwOxiHw0/eoILrJteHUuhwIOrA8HmxX0HRx3ZYvCM4wMkvSjfErAr3cHJ
 TinkBXwI8IIA0EzHolV31l2DDgNBuQwkoPmNFzR6iC1+QB6K5/nq5jmFdYtVmIX6
 Tb2iGTR9SbSS3vmjotI/w==
X-ME-Sender: <xms:Wb8aasZGumfikXg2QTFXsiKu32MOzRWNtxQ2ShVRFHhMn5x20qiMGQ>
 <xme:Wb8aaiPa_FNkKH19cON_wbQI5Gr7r-ZG6DFqeCEzlLbuj0_oTKPYEnrT0NCAc7nFj
 e8SAGwG6JiZNxHP5YjKi8BJDTlhvFav3rlbQF6Ki5HiArs268sVRS0>
X-ME-Proxy-Cause: dmFkZTGoPa7uWKc6ssCFR1Ad24s8QvM3rFWMVyFFHTrhba0oq+Ir//7CA0jZKQIsftV3DQ
 2Sflm5JvK3DfpDTUPSqIWcLFycfMFV1DxaNDclF6k0XQ9s/S28m8LGbUr2oPv0Mu3AZStU
 HwQ5FxqquV95xjGImI99tY3+L4BhoWTS6is1cDEW/rEIpKNp3D2rXVFzrkRl3KKHZhB1pT
 SMC7TDscWYig03+HEbnzN4n4NDr8NDlS6ZCiswwg/qfJB/6DGcjqaDnAUBkoBS815im2+P
 6uMxN1gBgF/Rh6gNkgZUoIhXmkViOnuQ5mCmWcRrmLgRgq3mbgshakw08sZFJ2qrvaFVT1
 0SdUzeQyuBtpXsiOirN7gk+RUTVrxnh8k6ajM8OujUdF8tZFJV83YqAiN0WVgqKy05rAo6
 wZ4lGaqvFtRBUD7WR85m2HxQafduzETZi80uj7EqAAg9kHpN+MmEldF6pihXAAL+Q9d1sS
 /KrsYDoDIDlCqkmNTTrM908w6Ip2pwbJ52IGx6Bui8FTtDqXJVlQmdp5YPD7Ifnv/gvOHH
 xsYD3rx55W26BXqGocQU6wtxHru3YLyXhfybfoFe6ZVdsdLQ5KbvDwsjKV7RlVV8VjP1ov
 slUq/KQ0aaAYZLU7MgQovYhg3xGXBmFaQNvHawOx9p8Lc/jlkAP8C4iTBnJA
X-ME-Proxy: <xmx:Wb8aam2_LYK3gaNg-A6vf52Z8pxa-F96VqforclCJVNYgYOWzC-HlA>
 <xmx:Wb8aag3zvG55E7CiFZHgb3zT4k8hruyPyB0mjqDEEiX3N2TnlY2yeA>
 <xmx:Wb8aah-mLqmlv9aPUVP_EhyYuAKT0CW4xgbkroa4ofuevNFAg3YtRQ>
 <xmx:Wb8aal0WQgM5lTE0B7E7f2Ll0Jk0lJhtMh2DaFSLuDG6s-UUK8PADg>
 <xmx:Wb8aajfeNdAwblJn301KOVJxMuU48qUQsHeGp8iObVy_eYtavRy4vmkH>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 151412400098; Sat, 30 May 2026 06:43:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXhrCD0H-1yV
Date: Sat, 30 May 2026 20:43:16 +1000
From: Alistair <alistair@alistair23.me>
To: "Max Chou" <max.chou@sifive.com>
Cc: "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Message-Id: <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
In-Reply-To: <ahkrD2h1kaubNtXq@sifive.com>
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
 <ahkrD2h1kaubNtXq@sifive.com>
Subject: Re: QEMU RISC-V Call
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.154;
 envelope-from=alistair@alistair23.me; helo=fhigh-b3-smtp.messagingengine.com
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

On Fri, 29 May 2026, at 4:00 PM, Max Chou wrote:
> On 2026-05-28 21:37, Alistair wrote:
> > On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
> > > 
> > > 
> > > On 5/27/2026 9:15 AM, Alistair Francis wrote:
> > > > Hello everyone,
> > > > 
> > > > There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
> > > > 
> > > > So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
> > > > 
> > > > I was thinking 1PM on Monday the 1st of June.
> > > 
> > > Can we make it 10AM AEST?
> > 
> > Sure! Let's do that
> 
> Both work for me. Thx

Great! I'll send a meeting link out on Monday.

Alistair

> 
> rnax
> 

