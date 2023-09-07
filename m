Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C307EC873D
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 15:52:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeHJM-0001ld-1S; Thu, 07 Sep 2023 11:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qeHJK-0001lN-CD
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 11:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qeHJH-0005QK-7I
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 11:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694101965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fDBbnU3PVSG+hudj3kWgYlXIjzBwGVpAcx65ijtrw0=;
 b=BbIXn1jIjR9AKlW9bIci8l3FbRIC0bIVkZkfWSquxVN7H9trrYrGyzKflypoQTM0JMmap8
 TLudGaclZbAfrOZyweN3vCftRqJwZv1wHOhPa7Mm1WzmX2Jo0Gr1KoZLhoX2a10t2eUBM+
 RX3PXCBx+Dgot05NimpnwK76HYPZHFM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-8xh17n-wNyq2hkrMuBMe6Q-1; Thu, 07 Sep 2023 11:51:35 -0400
X-MC-Unique: 8xh17n-wNyq2hkrMuBMe6Q-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-58d9e327d3aso12379647b3.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694101895; x=1694706695;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fDBbnU3PVSG+hudj3kWgYlXIjzBwGVpAcx65ijtrw0=;
 b=QCYa3nBgodahkaD+XNyF8QsLtAZ+e13DSWQKZRgfOYclsT15CjrbsZq33FyPGGbGUf
 XyqZgMiCLSKjl0va2prD7OJZlzZRJIirRVBXnxUqBPAvBPgY7Jt6r1KjdAJS4DSyYRwD
 uU8Jmaqa9DAhdvizUsW/c+G3kQyumiAiB2kskUDxyHn3TMjPKruiz6L26YapfpKvxWhK
 PaPg5IQHy+j88V5EnC6ByFCNUJV93MBKb0/aWw2TUVkooH3C6Mu7nKhjZh3DzljO2bvy
 XGPY01QFJk7SsWDEFW7CrgfPSHXcr6ULk/fOoY9fTsHWyaslWZC5iF4hptRnTsSAWNnG
 VI1A==
X-Gm-Message-State: AOJu0YzqBPmCEMVdpGOPazCk5VMkhhsD5WbLm2NCo2VUdnleBtfv0rAc
 HqcHUxYtdhc7+ZEejqGayuREWzKbP1Li9QmLpWJnt7V1Gq7ylyygTplGh82QE3oLqp441DuKse6
 ZdtBr9qmE3XTyPt1+446rl+TdrDSdnI5AU5NswxQ=
X-Received: by 2002:a25:d20d:0:b0:d0d:102c:78a8 with SMTP id
 j13-20020a25d20d000000b00d0d102c78a8mr19419810ybg.31.1694101894804; 
 Thu, 07 Sep 2023 08:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGEgic3gD+33MQNbYr1cx/9kVPlDzTJJ3mSWla4WhlwRw+KILwEZIQTxfp8ddb0T6F8BRbhW7RDWnBwGQJx8k=
X-Received: by 2002:a25:d20d:0:b0:d0d:102c:78a8 with SMTP id
 j13-20020a25d20d000000b00d0d102c78a8mr19419795ybg.31.1694101894488; Thu, 07
 Sep 2023 08:51:34 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 10:51:33 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
Date: Thu, 7 Sep 2023 10:51:33 -0500
Message-ID: <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jul 27, 2023 at 08:04:07PM -0300, Daniel Henrique Barboza wrote:
> On 7/27/23 10:28, Andrea Bolognani wrote:
> > Sorry for being late to the party, and I see that you're already a
> > few versions in with the actual patches. Hopefully nothing I write
> > here is going to be too disruptive of the work you've already done :)
>
> We just finished warming up. National anthem starting in a few seconds.
> Whole match ahead of us yet :P

Good, because as you can see I'm clearly taking my sweet time in
between replies :/ Once again, sorry about that.

> > My question would be, why should this be -cpu rv64,profile=rva23U64
> > instead of just -cpu rva23U64? "Base ISA plus a number of extensions"
> > pretty much sounds like a named CPU model to me, but I'm sure there
> > is more to it :)
>
> We can do what makes sense since it's a virtual CPU model anyways.
>
> The advantage of implementing profiles using a new 'profile' flag instead
> of using a new CPU model is that we can pile up profiles on top of
> each other using the existing generic CPU (rv64) which is also the default
> CPU for some time. Implementing a new profile would then be a matter of
> adding a new flag instead of a new CPU model.

Is there a concrete use case for layering profiles like that, though?

I've given a quick look to the specification for RVA(20|22|23)U64 and
it looks like subsequent version of each profile are completely
additive: extensions that were optional are now mandatory, new
extensions are introduced as either mandatory or optional. This is in
line with what I was expecting going in.

So, why would I want to do something like

  -cpu rv64,profile=rva20u64,profile=rva23u64

when the latter is a superset of the former? It seems that it would
achieve exactly the same as

  -cpu rv64,profile=rva23u64

but with extra steps.

> > > 3 - reduce the generic CPUs up to the minimum required to boot Linux.
> > > Yes, a rather arbitrary criteria, but Linux is the most common OS used
> > > by RISC-V QEMU currently so we'll go with what most people are using.
> > > This would reduce rv64 to "rv64ima".
> >
> > Can't we make the generic CPUs really bare-bones instead?
> >
> > Not sure what exactly that would look like, but as long as you can
> > enable specific extensions explicitly I don't see the advantage in
> > targeting a specific use case (boot Linux), no matter how popular,
> > instead of providing useful building blocks for custom behavior.
>
> I agree that it's kind of lame to play favorites here and assume that Linux
> is the only case that we care about. There's a high chance that other OSes
> like FreeBSD might require even less extensions than Linux, so why can't
> we use FreeBSD minimal extension set then?
>
> The idea here is less about 'make rv64 a minimal CPU' and more about 'the
> generic CPUs should have a predictable extension set'. Having a criteria
> like 'It needs to boot Linux' grant that we will not break (too many)
> existing users of these generics default CPUs that became used to a random
> set of extensions and, all of a sudden, their setup stop working.

IMO using "can boot Linux" as the criteria is directly at odds with
having "predictable set of extensions" as the goal.

As Linux changes, so will its requirements in terms of extensions. I
don't think that you can resonably work off the assumption that the
set of extensions needed to boot Linux today will be sufficient to
boot Linux 5-10 years from now.

> What if we:
>
> - leave the rv64 CPU as is. We'll document the default enabled extensions the
> CPU already has and leave it at that. We'll have to refrain from enabling
> more default extensions in it though;
>
> - if required, add a new 'barebones' CPU. Call it 'rv64min' or any other
> suggestive name. Since it's a new CPU we can really strip it out without
> worrying about breaking existing setups. Can be a good CPU for debugging;
>
> - all future profiles are implemented as flags, similar to what we already
> do with regular extensions. That will enable us to do things like '-cpu
> rv64,rva22U64=true,rva23S64=true' and let user combo profiles that might
> be compatible with each other.
>
> And, reproducing here a question LIU Zhiwei asked me in the QEMU SIG meeting,
> I believe enabling a profile should do just that - enable a certain set of
> extensions. If the user wants to enable a profile and then disable some
> mandatory extensions, have at it.

Yeah, I agree that it should be possible for users to go out of their
way and create whatever FrankenCPU they like by picking a profile and
then enabling/disabling arbitrary extensions.

I expect that users for this feature are initially going to be
primarily developers; at some point, libvirt's CPU driver will likely
need to use it to define synthetic CPU models that are migratable
between machines with different hardware revisions or coming from
heterogeneous vendors. But that's probably a few more years down the
line :)

> Let me know your thoughts. I have one more prep series to send before
> starting the profile implementation, so we have time.

My opinion so far remains that profiles should be exposed as named
CPU models.

Regarding the fate of rv64, it would make sense to me to turn it into
the Minimum Viable CPU, to use as base for completely custom CPU
models. However, due to backwards compatibility concerns that would
probably have to happen quite some time after the max CPU model has
been introduced, so freezing it in its current state feels like a
sensible idea.

-- 
Andrea Bolognani / Red Hat / Virtualization


