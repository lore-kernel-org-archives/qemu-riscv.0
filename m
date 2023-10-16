Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E520DCDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:40:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsGKt-0008Ca-60; Mon, 16 Oct 2023 01:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsGKp-0008Bj-MY; Mon, 16 Oct 2023 01:40:11 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsGKn-0005s7-2X; Mon, 16 Oct 2023 01:40:10 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-495eb6e2b80so1064878e0c.1; 
 Sun, 15 Oct 2023 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697434807; x=1698039607; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zE9UwSqwIHGw5aoPS28rfFXvqq3SJsm0lULwwMvhNKM=;
 b=FttIJ9JIeTe+dCdA289rag6jMHXjdiIsDUvL45otKN7aV/98aS2rVaiPPXMmSHBwix
 2+O1hsuxfLEGVhVS2+5LYxxEj2xaedQv9RkOyml0PU9lZTfFBfqDoD+rM0nkhpD/dF3/
 1AfHSahNmGVn4zsKCjuFTjGrGpPTbsgu+yyrHioFsUD+lhCeSO/JcHflhhMygb9RWPy+
 ayFkPAWXf0RnTq6AAld8a1/v+sGZDm9gA5az1xh86v3+LM0OFA1xHEbVk/BSikYjw9VD
 rF1+mu4X2SATA6GMKeQXJskgIwiYi6eWIJSmcjMcC/U7h2J7JMiXBV3kqfvLVkX6ffaa
 tq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697434807; x=1698039607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zE9UwSqwIHGw5aoPS28rfFXvqq3SJsm0lULwwMvhNKM=;
 b=n52SDr/4qib1md9KFlO2BYWrFqUDE+QIqAnlG8akWw5dZ9caSbCp3grann+y5a4C38
 5/1UPCBYt7nlRkZ7fWnU/XRhAcodMGEiLb4mU1F9r40tBg/y2ngBD2ETD9kfUxE/rKDR
 lCV+f/HOzlSbyZ5kx+ozBmYQHx7yMErXU9NRBsMmD5+17N/ZGP0E7hJNuucdKb/I3Qd2
 YftPN2iUiD/vl0FeV4u3jf7pqv5XZOCSohwPu1BgHkI9QSBC1ZjHuM/2SkcLCJBL4GY7
 g7EtRqBUoS4i8ehzhHFehmweib/WvAeFA1dPf0WH+qVIa3IVDYzdfwmfJ4EfinLxk+Em
 UaUQ==
X-Gm-Message-State: AOJu0YwZRfzuJ4KAFVpY4sSDZs6Xq0QjC4TGcF0AOSbsvckke3bL0qld
 Z78Bl6NxP69GjuiHX9Rvb8REWBuulDf0SLd3Uwk=
X-Google-Smtp-Source: AGHT+IFvd2Kr7SsbPP7w4Hlzp4oND99v/UnTM5lXKy9mKgTLonLqZ+B1JXgZxHME5hkKFnzR5ZRBxz7q2/QNo1+7PL4=
X-Received: by 2002:a05:6122:2208:b0:48f:cd3a:108 with SMTP id
 bb8-20020a056122220800b0048fcd3a0108mr26247931vkb.12.1697434807321; Sun, 15
 Oct 2023 22:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <20230808181715.436395-2-vineetg@rivosinc.com>
 <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
 <1aa3bdff-0db4-c589-8863-56bbea825fda@rivosinc.com>
 <CAKmqyKP2jQ1TYFNjMJNJxGqxHgq5fe5RhBhJDiPE1DoBXpf0gw@mail.gmail.com>
 <20230811-f81889afd0f38ffdc215883d@orel>
In-Reply-To: <20230811-f81889afd0f38ffdc215883d@orel>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:39:40 +1000
Message-ID: <CAKmqyKMsND1oboZTPJXmrYb0y1=44KnHsDbpUJM3KeCuw730dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: zicond: make default
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Aug 11, 2023 at 5:01=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Thu, Aug 10, 2023 at 02:07:17PM -0400, Alistair Francis wrote:
> > On Tue, Aug 8, 2023 at 6:10=E2=80=AFPM Vineet Gupta <vineetg@rivosinc.c=
om> wrote:
> > >
> > >
> > >
> > > On 8/8/23 14:06, Daniel Henrique Barboza wrote:
> > > > (CCing Alistair and other reviewers)
> > > >
> > > > On 8/8/23 15:17, Vineet Gupta wrote:
> > > >> Again this helps with better testing and something qemu has been d=
oing
> > > >> with newer features anyways.
> > > >>
> > > >> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > > >> ---
> > > >
> > > > Even if we can reach a consensus about removing the experimental (x=
-
> > > > prefix) status
> > > > from an extension that is Frozen instead of ratified, enabling stuf=
f
> > > > in the default
> > > > CPUs because it's easier to test is something we would like to avoi=
d.
> > > > The rv64
> > > > CPU has a random set of extensions enabled for the most different a=
nd
> > > > undocumented
> > > > reasons, and users don't know what they'll get because we keep beef=
ing
> > > > up the
> > > > generic CPUs arbitrarily.
> >
> > The idea was to enable "most" extensions for the virt machine. It's a
> > bit wishy-washy, but the idea was to enable as much as possible by
> > default on the virt machine, as long as it doesn't conflict. The goal
> > being to allow users to get the "best" experience as all their
> > favourite extensions are enabled.
> >
> > It's harder to do in practice, so we are in a weird state where users
> > don't know what is and isn't enabled.
> >
> > We probably want to revisit this. We should try to enable what is
> > useful for users and make it clear what is and isn't enabled. I'm not
> > clear on how best to do that though.
> >
> > Again, I think this comes back to we need to version the virt machine.
> > I might do that as a starting point, that allows us to make changes in
> > a clear way.
>
> While some extensions will impact the machine model, as well as cpu
> models, versioning the machine model won't help much with ambiguity in
> cpu model extension support. Daniel's proposal of having a base cpu mode,
> which, on top, users can explicitly enable what they want (including with
> profile support which work like a shorthand to enable many extensions at
> once), is, IMO, the best way for users to know what they get. Also, the
> 'max' cpu model is the best way to "quickly get as much as possible" for
> testing. To know what's in 'max', or named cpu models, we need to
> implement qmp_query_cpu_model_expansion(). Something that could be used
> from the command line would also be nice, but neither x86 nor arm provide
> that (they have '-cpu help', but arm doesn't output anything for cpu
> features and x86 dumps all features out without saying what's enabled for
> any particular cpu model...)
>
> I know x86 people have in the past discussed versioning cpu models, but
> I don't think that should be necessary for riscv with the base+profile
> approach. A profile would effectively be a versioned cpu model in that
> case.
>
> Finally, I'd discourage versioning the virt machine type until we need
> to worry about users creating riscv guest images that they are unwilling
> to modify, despite wanting to update their QEMU versions. And, even then,

What's the problem with versioning the virt machine though?

I'm thinking that in the future we would want to switch from PLIC to
AIA; change the memory map; or change the default extensions (maybe to
a profile). All of those would require a versioned virt machine.

I was thinking about doing this now, so we have a base for a few
releases. So when we do need a change we are ready to go

Alistair

> we should only consider versioning when we're aware of problems for those
> static guest images, i.e. we introduce a change to the virt machine model
> which breaks that supported, old guest image. (NB: It was me that
> advocated to start versioning Arm's virt machine type. In hindsight, I
> think I may have advocated prematurely. I'm trying not to make that
> mistake twice!)
>
> >
> > >
> > > I understand this position given the arbitrary nature of gazillion
> > > extensions. However pragmatically things like bitmanip and zicond are=
 so
> > > fundamental it would be strange for designs to not have them, in a fe=
w
> > > years. Besides these don't compete or conflict with other extensions.
> > > But on face value it is indeed possible for vendors to drop them for
> > > various reasons or no-reasons.
> > >
> > > But having the x- dropped is good enough for our needs as there's
> > > already mechanisms to enable the toggles from elf attributes.
> > >
> > > >
> > > > Starting on QEMU 8.2 we'll have a 'max' CPU type that will enable a=
ll
> > > > non-experimental
> > > > and non-vendor extensions by default, making it easier for tooling =
to
> > > > test new
> > > > features/extensions. All tooling should consider changing their
> > > > scripts to use the
> > > > 'max' CPU when it's available.
> > >
> > > That would be great.
> >
> > The max CPU helps, but I do feel that the default should allow users
> > to experience as many RISC-V extensions/features as practical.
> >
>
> If the virt machine type has a default cpu type, then why not set it to
> 'max'?
>
> Thanks,
> drew

