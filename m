Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6661EE57E6
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 09:14:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeXYy-0002of-Rs; Fri, 08 Sep 2023 05:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeXYv-0002no-Ab
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 05:14:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeXYr-0001RG-ST
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 05:14:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31f7400cb74so1127280f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694164436; x=1694769236; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xoXSYUWoELPmFeog56yWYCj6qVpKv8DNcu6AKAnf5No=;
 b=E1eJne1b6dez3VGbPvj2xYCiOt4dDchFgZbAz4IK6TdRWOWOhV2O4yznvOgMskyu6P
 qBCbQAZwdMLDs6aMvSjt9bU6zZqrq3ax/J9knnh8KXsMcNnRyirGPo4Z1wjjDrZbtJ/q
 aFz3//6xNeRrhtSK5iEn2d2qFpujSSUSCkkAKnwHLWW3I2zwkPf/A5+ydN8dvjWgosZe
 /GNMMRovpVlFqhdloGzLL930uHzNkMv7F62aCogwajmnRFV1y29xcdVtkoNZuSc//bud
 yU+J89n/lwdtQY0IkUUzkkN7hFXJX0H4IGF6FgWMkc6T/EGwv+rPQ005lCT50cgl8uSU
 2KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694164436; x=1694769236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoXSYUWoELPmFeog56yWYCj6qVpKv8DNcu6AKAnf5No=;
 b=v9fMybozIkk7nazWpf3uwIyxRJ1F0RuufbxeaRHj9Ax/hds9lt6S+mlaCMbzdOgksR
 lltcXMs73fgSc2D7/RSTHUMIw/MP7qJgW7u3S6LMu2rba5ul5JW1ZLd/c/OFP9omNX0s
 I2c0GZhmqMv668VzvhW9AxxUhB6qEbLHFOGwTUfnMi/NUVlAwM1l8lEv1/5oBgIqq8YA
 eD0zCx3+24lCAeWYFoPupRUUDg9A7YhSh+90cZmctnF6NMUsHoRuVNqN6lbn6BQ452YS
 ZemLmy2gSZQGwMKZqFcxvWnVwHyDxouoRo/5WsPcuEdU1RGanulYk/4ERHClVsBEBB4U
 c5LQ==
X-Gm-Message-State: AOJu0YyPSm/boQdDoo+tjGT+k11qYnIfnHpOMvuACnwI6lSQ0eeL6ihj
 lvzZyKT4v7SwjPfADzxRRxXBPQ==
X-Google-Smtp-Source: AGHT+IGLHeYsrMnarzrBAyRsdkeTYXHdHtjxpY0MgbNV4/hL7M8a5OMtqBp/cJsl33EMYJ0F6ONfUQ==
X-Received: by 2002:a5d:4568:0:b0:314:1560:cc68 with SMTP id
 a8-20020a5d4568000000b003141560cc68mr1461711wrc.56.1694164435831; 
 Fri, 08 Sep 2023 02:13:55 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adffd87000000b0031762e89f94sm1536540wrr.117.2023.09.08.02.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 02:13:55 -0700 (PDT)
Date: Fri, 8 Sep 2023 11:13:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230908-5a7f4c1da93e556147100a70@orel>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908-5d71b8701d6efed371138954@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Sep 08, 2023 at 10:39:45AM +0200, Andrew Jones wrote:
> On Thu, Sep 07, 2023 at 10:51:33AM -0500, Andrea Bolognani wrote:
> > On Thu, Jul 27, 2023 at 08:04:07PM -0300, Daniel Henrique Barboza wrote:
> > > On 7/27/23 10:28, Andrea Bolognani wrote:
> > > > Sorry for being late to the party, and I see that you're already a
> > > > few versions in with the actual patches. Hopefully nothing I write
> > > > here is going to be too disruptive of the work you've already done :)
> > >
> > > We just finished warming up. National anthem starting in a few seconds.
> > > Whole match ahead of us yet :P
> > 
> > Good, because as you can see I'm clearly taking my sweet time in
> > between replies :/ Once again, sorry about that.
> > 
> > > > My question would be, why should this be -cpu rv64,profile=rva23U64
> > > > instead of just -cpu rva23U64? "Base ISA plus a number of extensions"
> > > > pretty much sounds like a named CPU model to me, but I'm sure there
> > > > is more to it :)
> > >
> > > We can do what makes sense since it's a virtual CPU model anyways.
> > >
> > > The advantage of implementing profiles using a new 'profile' flag instead
> > > of using a new CPU model is that we can pile up profiles on top of
> > > each other using the existing generic CPU (rv64) which is also the default
> > > CPU for some time. Implementing a new profile would then be a matter of
> > > adding a new flag instead of a new CPU model.
> > 
> > Is there a concrete use case for layering profiles like that, though?
> > 
> > I've given a quick look to the specification for RVA(20|22|23)U64 and
> > it looks like subsequent version of each profile are completely
> > additive: extensions that were optional are now mandatory, new
> > extensions are introduced as either mandatory or optional. This is in
> > line with what I was expecting going in.
> > 
> > So, why would I want to do something like
> > 
> >   -cpu rv64,profile=rva20u64,profile=rva23u64
> > 
> > when the latter is a superset of the former? It seems that it would
> > achieve exactly the same as
> > 
> >   -cpu rv64,profile=rva23u64
> > 
> > but with extra steps.
> 
> I don't see anything in the profile spec that states we can count on later
> profiles being supersets of older profiles, which means we cannot. Also,

I just found a potential example of why we cannot. A recent mail thread[1]
stated some vendors are considering dropping support for the C extension
on "higher end" platforms. If this were to happen, then a profile may be
proposed where C is optional. In that case, platforms that still have C
could state they are compatible with the older profiles where it's
mandated and also the new profile where it's optional, whereas the
platforms that don't have C will only state the new profile.

[1] https://groups.google.com/a/riscv.org/g/fw-exchange/c/qxnKKS4jhLk

Thanks,
drew

