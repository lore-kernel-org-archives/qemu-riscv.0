Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECC8EE57EF
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 10:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeYip-0006nj-Mn; Fri, 08 Sep 2023 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qeYio-0006nI-T7
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 06:28:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1qeYim-00073y-EC
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 06:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694168895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tG0Qr4WBj2dh6mkV4dmmVvVBv78whN5wwqxu/t1NkfE=;
 b=bKtRo7A72D9T8XgFSwJv3qQG6WIfsGAaXm68g1K6ArBpFSKnvLmjowbK/LIQU89KWXpcAm
 IUiLMUT1SazzPRck+F5Kj/5ADjAd7hJShJqqVZpIJ5Nzm5xatLhu+QhcSyUASFuj0Ls1g6
 /1o8ARCCSu1toNFzgCKPZyEy6ezBQTE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-Vh5zpbIJMCqDnbMYgXlvdw-1; Fri, 08 Sep 2023 06:28:14 -0400
X-MC-Unique: Vh5zpbIJMCqDnbMYgXlvdw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-411f7e77b44so22638781cf.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 03:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694168894; x=1694773694;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tG0Qr4WBj2dh6mkV4dmmVvVBv78whN5wwqxu/t1NkfE=;
 b=Sti6eQXB3hBZfv6ixHWI0oRFFVex2B4evsZvg2OQPilYhOFZ3AjAsAXKVI1M8UbXP1
 7lgshzRA2jDRmjd7EJ/gHfGspyEFGuczxUkuAb8U38hXDvmb6rpYyYwytsx1xHFzYZns
 jQ0EpsRq9JRkGIcBVro8yGpGU4ZIz0EJPfqpA8QcDCSc7tr7tshtY/TelHqSPC+/ctEX
 yhhZbSWk0WnYJwQQcy9h+Q4xpBBwlnShQn301jxb9d0LpIoRM0Pe9vz2m4STXXKiiihx
 eFg5g2EIyqaRPwQNrcVoz5ilQCrFHytfXKzi56b5yqVEEz1lQu+/I9VWq/7BLL7kgeMJ
 xtbw==
X-Gm-Message-State: AOJu0Ywm2O8YOHJN35hmQ7iNTefs3FJdn5SR7tE4rT2cdCJZYdLLpGKQ
 hUSs7vqvzBtyNFNv48eq2YZUuM5bqup6P3Iq8tvVUQTXFl+khyCZFmKPTVj5YJOIu/vE2TBKcQL
 3TCQrvH665i7dH1kywwsgeCcXZ8kiMhc=
X-Received: by 2002:a05:622a:15c1:b0:40f:cf7c:5e7c with SMTP id
 d1-20020a05622a15c100b0040fcf7c5e7cmr1907578qty.24.1694168893892; 
 Fri, 08 Sep 2023 03:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMAGNnC3iTxE5InE+VS4RCtcOVQA3aHK9xu9abf6JfkoXYccN6qr95Xn09dETvFp+SkpEiaQGUpeCx9v2HP1c=
X-Received: by 2002:a05:622a:15c1:b0:40f:cf7c:5e7c with SMTP id
 d1-20020a05622a15c100b0040fcf7c5e7cmr1907567qty.24.1694168893585; Fri, 08 Sep
 2023 03:28:13 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Sep 2023 03:28:12 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
MIME-Version: 1.0
In-Reply-To: <20230908-5a7f4c1da93e556147100a70@orel>
Date: Fri, 8 Sep 2023 03:28:12 -0700
Message-ID: <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv <qemu-riscv@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Sep 08, 2023 at 11:13:54AM +0200, Andrew Jones wrote:
> On Fri, Sep 08, 2023 at 10:39:45AM +0200, Andrew Jones wrote:
> > On Thu, Sep 07, 2023 at 10:51:33AM -0500, Andrea Bolognani wrote:
> > > So, why would I want to do something like
> > >
> > >   -cpu rv64,profile=rva20u64,profile=rva23u64
> > >
> > > when the latter is a superset of the former? It seems that it would
> > > achieve exactly the same as
> > >
> > >   -cpu rv64,profile=rva23u64
> > >
> > > but with extra steps.
> >
> > I don't see anything in the profile spec that states we can count on later
> > profiles being supersets of older profiles, which means we cannot.
>
> I just found a potential example of why we cannot. A recent mail thread[1]
> stated some vendors are considering dropping support for the C extension
> on "higher end" platforms. If this were to happen, then a profile may be
> proposed where C is optional. In that case, platforms that still have C
> could state they are compatible with the older profiles where it's
> mandated and also the new profile where it's optional, whereas the
> platforms that don't have C will only state the new profile.
>
> [1] https://groups.google.com/a/riscv.org/g/fw-exchange/c/qxnKKS4jhLk

I can't access the URL, but I get the gist. Point taken about
profiles not necessarily being purely additive, though I don't think
this invalidates my criticism of the approach.

> > Also,
> > I'd guess vendors will want to implement as broad a set as possible of
> > profiles and then list them all when advertising. So, IMO, something like
> > '-cpu rv64,rva20u64=on,rva23u64=on' would be a more natural way to model a
> > cpu which advertises being compatible with those two profiles.

Wouldn't that be exposed as a named vendor CPU rather than something
that users have to assemble themselves by layering profiles?

Note that I have zero issues with the implementation of said named
vendor CPU being, internally, handled effectively the same way as
what you've just described. I'm simply unconvinced that we should
expose this mechanism to users.

> > (I swapped the 'profile=' to a '=on' syntax, because I think each profile
> > should be a boolean "virtual" extension.)

On one hand, I like this because it avoids having to invent a new
mechanism. On the other, I dislike it because it overloads an
existing mechanism O:-)

> > I'm also not sure of the benefits of using a cpu model vs. a base model
> > and a bunch of virtual profile extensions. If it's because it's a hassle
> > to collect extensions that should be enabled, then I think we'll have to
> > live with that for unnamed riscv cpu models. Profiles will always lag new
> > extensions which users will want to enable, so users will be adding plenty
> > of cpu properties anyway. Of course users that don't care about being
> > explicit have 'max' to avoid all that.

I feel that this validates my stance on the matter.

If you're working on defining a new CPU model and need fine-grained
control over the exact set of extensions, then you can already do
that by explicitly flipping each one of them on or off, and adding
the ability to layer profiles doesn't add much value except possibly
removing a bit of verbosity. Not particularly compelling IMO.

If you're testing an application and want to ensure it works fine on
CPUs that implement a specific profile, e.g. rva20u64 because even
older hardware should be able to run it, then you're not going to
need or indeed want to layer additional profiles on top of that. So a
regular named CPU model will work just fine.

  (This also gets really interesting when you start thinking about
  extensions that are optional for the profile... Maybe we need
  something like '-cpu rva23u64,optional-extensions=off' so that
  testing against the baseline for a profile doesn't require combing
  through the spec and disabling extensions manually?)

If you're someone who just needs a RISC-V VM, then you're either
going to be using 'max' or a named vendor CPU and profiles will not
enter the picture at all.

-- 
Andrea Bolognani / Red Hat / Virtualization


