Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6E5EE57E2
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 08:39:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeX1t-0001B6-4Z; Fri, 08 Sep 2023 04:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeX1q-00019Z-KV
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 04:39:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeX1o-00038z-1L
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 04:39:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so20399865e9.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694162386; x=1694767186; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PrSUqcnfqU2mzd57wEjUssD9+/Y2oqxbOIo06LQn0hQ=;
 b=XdJyxQ47M5Z2ViVfHdIXUVGMAa30AzqJdzrZk3NqeAjAw2yLuj6GdjiHfGlKs8Z1t2
 IZh/t2X9Df8rnkl7satQ5sD4HWrrV589Tdi5kU1QN21PUGBJpyovbiKSonYQFwxMQWyc
 YhG+omOqv0+dLHp2K9jeFQYuPhQndlc6biG07Vtk566ubFmZ/P1FpgTMQzAS/3hdExop
 lNBev69iKUcckMDBNsi5qZ8ztDB8WrV9/nUFQhgz19bbo+OEQKXy0C+YrneklYEcTyWF
 NRAbo+/9vUk7inN6YvnPw5VsL7xC0Y6j4Ebl1gx4jO9MRQ8MVSyuVIsuHYPcOixkeoJL
 YUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694162386; x=1694767186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrSUqcnfqU2mzd57wEjUssD9+/Y2oqxbOIo06LQn0hQ=;
 b=IDYXRDPLExjJgRQTEun7MRD7SztUD4Y/vcOXWfoMX4sZ7yR759qgphMsv/DzH5ZV4X
 O8dwn2S2ZGTQHuPC7Hot6b5vMeHhC32vuLZrxyYAlgA1CuvwULu+0ijmW3B/ekTXbsWw
 WFcdt3TpX9l4p1rQCzDvZWX15Pt0OQ69O0JhkILcCY8mgk3Yscngdle/JZD/hSRTvqYN
 GxsiH9oWT0UFhRnhiPUfbiKxCpMZG99CHG2XIPMqXuypM5GtWk0pZlOXAS8B2LqNW+qA
 Ce5lNKErslXXfFBCDZdVKsyNZP6EbtIy/4/ftetkuZtJQrzW++/EhxK4qQ4KLTTghzsw
 PSnw==
X-Gm-Message-State: AOJu0YxGlWQxaNcRw9Is7Fd/7uRadflK1QegWOBBXBaaER9sYL2hLFcM
 tFpkcajTuMyGMA/rz6yJeEA9ng==
X-Google-Smtp-Source: AGHT+IFuJTarv0IjLsyi1K7trHGQGykHLQYxQrYZ61vVRPH7Vtn1axNrTDyRoeM4/A05OIY9LWgiWg==
X-Received: by 2002:a05:600c:1c8f:b0:402:f55c:faee with SMTP id
 k15-20020a05600c1c8f00b00402f55cfaeemr1222146wms.26.1694162386225; 
 Fri, 08 Sep 2023 01:39:46 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c22c300b003fe2b6d64c8sm4595203wmg.21.2023.09.08.01.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 01:39:45 -0700 (PDT)
Date: Fri, 8 Sep 2023 10:39:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230908-5d71b8701d6efed371138954@orel>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32a.google.com
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

On Thu, Sep 07, 2023 at 10:51:33AM -0500, Andrea Bolognani wrote:
> On Thu, Jul 27, 2023 at 08:04:07PM -0300, Daniel Henrique Barboza wrote:
> > On 7/27/23 10:28, Andrea Bolognani wrote:
> > > Sorry for being late to the party, and I see that you're already a
> > > few versions in with the actual patches. Hopefully nothing I write
> > > here is going to be too disruptive of the work you've already done :)
> >
> > We just finished warming up. National anthem starting in a few seconds.
> > Whole match ahead of us yet :P
> 
> Good, because as you can see I'm clearly taking my sweet time in
> between replies :/ Once again, sorry about that.
> 
> > > My question would be, why should this be -cpu rv64,profile=rva23U64
> > > instead of just -cpu rva23U64? "Base ISA plus a number of extensions"
> > > pretty much sounds like a named CPU model to me, but I'm sure there
> > > is more to it :)
> >
> > We can do what makes sense since it's a virtual CPU model anyways.
> >
> > The advantage of implementing profiles using a new 'profile' flag instead
> > of using a new CPU model is that we can pile up profiles on top of
> > each other using the existing generic CPU (rv64) which is also the default
> > CPU for some time. Implementing a new profile would then be a matter of
> > adding a new flag instead of a new CPU model.
> 
> Is there a concrete use case for layering profiles like that, though?
> 
> I've given a quick look to the specification for RVA(20|22|23)U64 and
> it looks like subsequent version of each profile are completely
> additive: extensions that were optional are now mandatory, new
> extensions are introduced as either mandatory or optional. This is in
> line with what I was expecting going in.
> 
> So, why would I want to do something like
> 
>   -cpu rv64,profile=rva20u64,profile=rva23u64
> 
> when the latter is a superset of the former? It seems that it would
> achieve exactly the same as
> 
>   -cpu rv64,profile=rva23u64
> 
> but with extra steps.

I don't see anything in the profile spec that states we can count on later
profiles being supersets of older profiles, which means we cannot. Also,
I'd guess vendors will want to implement as broad a set as possible of
profiles and then list them all when advertising. So, IMO, something like
'-cpu rv64,rva20u64=on,rva23u64=on' would be a more natural way to model a
cpu which advertises being compatible with those two profiles.

(I swapped the 'profile=' to a '=on' syntax, because I think each profile
should be a boolean "virtual" extension.)

I'm also not sure of the benefits of using a cpu model vs. a base model
and a bunch of virtual profile extensions. If it's because it's a hassle
to collect extensions that should be enabled, then I think we'll have to
live with that for unnamed riscv cpu models. Profiles will always lag new
extensions which users will want to enable, so users will be adding plenty
of cpu properties anyway. Of course users that don't care about being
explicit have 'max' to avoid all that.

> 
> > > > 3 - reduce the generic CPUs up to the minimum required to boot Linux.
> > > > Yes, a rather arbitrary criteria, but Linux is the most common OS used
> > > > by RISC-V QEMU currently so we'll go with what most people are using.
> > > > This would reduce rv64 to "rv64ima".
> > >
> > > Can't we make the generic CPUs really bare-bones instead?
> > >
> > > Not sure what exactly that would look like, but as long as you can
> > > enable specific extensions explicitly I don't see the advantage in
> > > targeting a specific use case (boot Linux), no matter how popular,
> > > instead of providing useful building blocks for custom behavior.
> >
> > I agree that it's kind of lame to play favorites here and assume that Linux
> > is the only case that we care about. There's a high chance that other OSes
> > like FreeBSD might require even less extensions than Linux, so why can't
> > we use FreeBSD minimal extension set then?
> >
> > The idea here is less about 'make rv64 a minimal CPU' and more about 'the
> > generic CPUs should have a predictable extension set'. Having a criteria
> > like 'It needs to boot Linux' grant that we will not break (too many)
> > existing users of these generics default CPUs that became used to a random
> > set of extensions and, all of a sudden, their setup stop working.
> 
> IMO using "can boot Linux" as the criteria is directly at odds with
> having "predictable set of extensions" as the goal.
> 
> As Linux changes, so will its requirements in terms of extensions. I
> don't think that you can resonably work off the assumption that the
> set of extensions needed to boot Linux today will be sufficient to
> boot Linux 5-10 years from now.

That's a good point. Thinking about this some more I think we should
freeze and deprecate 'rv32' and 'rv64' (which is too bad, since those
are good names). Then, we should introduce new 32 and 64 cpu models
which implement specific, released, unpriv and priv, ISA specs and
do not have any extensions enabled. The cpu model names would capture
the spec version somehow, hopefully someway that isn't too verbose.

(To avoid being verbose, we'll likely have to create our own versioning
scheme which maps to the spec versioning, since it's a date, or maybe
better would be to use a spec git commit hash. So, something like
base64v1, base64v2, ... where base64v* are documented to be specific
commits of the spec and 'base64' would always alias the latest base64v*
version. (Maybe 'base' is a bad name, though, since 'base64' is also
a core utility. I'm already missing 'rv64'...))

Thanks,
drew

