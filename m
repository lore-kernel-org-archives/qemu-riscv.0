Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678EECDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 07:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsIFw-0003TX-Al; Mon, 16 Oct 2023 03:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qsIFs-0003T6-MX
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 03:43:13 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qsIFp-00081M-KX
 for qemu-riscv@nongnu.org; Mon, 16 Oct 2023 03:43:12 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b95622c620so729335366b.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Oct 2023 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697442188; x=1698046988; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Cnp0W5kMAhHvZuIn/uXaoZbVTw13OUxx+q4weFxiht8=;
 b=Ayyj1QZko+HRTg4EbA/yzcFjJePJXo/sPK4guL35dvwxnMuZwUeklPL3rxN/jvFSUv
 ozRdXpGAGTi8IMOzn/tSPqSArcBghvE4oulv+RIHWrf8L0L193wH+Bj4SQy6xNR5X09h
 /kp5M94ZeJzkmzE1mI2WsmWEjnI40dZXckXmQsoqVcwn+ipvxReuccC94ruTLzgMqY1D
 Yh06LZsZAzpT2lUrvdgwWafhZbEqW3BqXApHLJK/LYxW+nDTMjWgOstkOnpYi4bOkj7n
 6iExAIQ4O4xgWA8D38D1OEMX2XRFSOwbIQgB0ETG/joBs/8/HMERLoi9rhkAlFap/1/r
 1HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697442188; x=1698046988;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cnp0W5kMAhHvZuIn/uXaoZbVTw13OUxx+q4weFxiht8=;
 b=Ey83/WHlDCVdWUfDpIK4NuHpJvBDE/2q8V7jhA3DSsc+ucE3XSzJOqnMZCCTF9+x1m
 I5rk+ibfQhvktV5aINiUgZspLkXm4oX98jrkFjXCRARZnyQYYz9zypnBtZeI6uLE0xYy
 XF32Sw4PS4SDM4xdHgDd7D4Ey8fWpC1UmZQi0Q1j6hmPL7DmRo82Ee73E0+OpVhwTujH
 O1FiCeelMBzOJTuQg4UTp/Oj0GXLLLA2cbavylrw/OZNY2FTHGvD5giqViF7of2YK+TE
 Ir3mX7inZ+O7eh3h+8Dqf93JcYz4v+jGDeEjGlphj/jsqXtyXFVyfza0xCNKfip8lWCu
 dr/Q==
X-Gm-Message-State: AOJu0Yxf4KHYoknT8sCt3QgBOWne/cwv77pnGhwok2uDIELKaKkWE8QD
 mXrI2z6srXFUnLSammkqSvgLtg==
X-Google-Smtp-Source: AGHT+IEnYrX+mtpPPgTua+Fj1cZNu5/Ca3EMtw/t7bcouElHRzqIHaFRX6YrMRvw6p7NcWm//BH3Dg==
X-Received: by 2002:a17:907:608d:b0:9bd:d8d6:c1ad with SMTP id
 ht13-20020a170907608d00b009bdd8d6c1admr8122643ejc.61.1697442187885; 
 Mon, 16 Oct 2023 00:43:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 dk20-20020a0564021d9400b0053da3a9847csm7981454edb.42.2023.10.16.00.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 00:43:07 -0700 (PDT)
Date: Mon, 16 Oct 2023 09:43:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 2/2] riscv: zicond: make default
Message-ID: <20231016-cda65479c9cc05ce29070efd@orel>
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <20230808181715.436395-2-vineetg@rivosinc.com>
 <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
 <1aa3bdff-0db4-c589-8863-56bbea825fda@rivosinc.com>
 <CAKmqyKP2jQ1TYFNjMJNJxGqxHgq5fe5RhBhJDiPE1DoBXpf0gw@mail.gmail.com>
 <20230811-f81889afd0f38ffdc215883d@orel>
 <CAKmqyKMsND1oboZTPJXmrYb0y1=44KnHsDbpUJM3KeCuw730dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKMsND1oboZTPJXmrYb0y1=44KnHsDbpUJM3KeCuw730dg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x629.google.com
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

On Mon, Oct 16, 2023 at 03:39:40PM +1000, Alistair Francis wrote:
> On Fri, Aug 11, 2023 at 5:01 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Aug 10, 2023 at 02:07:17PM -0400, Alistair Francis wrote:
> > > On Tue, Aug 8, 2023 at 6:10 PM Vineet Gupta <vineetg@rivosinc.com> wrote:
> > > >
> > > >
> > > >
> > > > On 8/8/23 14:06, Daniel Henrique Barboza wrote:
> > > > > (CCing Alistair and other reviewers)
> > > > >
> > > > > On 8/8/23 15:17, Vineet Gupta wrote:
> > > > >> Again this helps with better testing and something qemu has been doing
> > > > >> with newer features anyways.
> > > > >>
> > > > >> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> > > > >> ---
> > > > >
> > > > > Even if we can reach a consensus about removing the experimental (x-
> > > > > prefix) status
> > > > > from an extension that is Frozen instead of ratified, enabling stuff
> > > > > in the default
> > > > > CPUs because it's easier to test is something we would like to avoid.
> > > > > The rv64
> > > > > CPU has a random set of extensions enabled for the most different and
> > > > > undocumented
> > > > > reasons, and users don't know what they'll get because we keep beefing
> > > > > up the
> > > > > generic CPUs arbitrarily.
> > >
> > > The idea was to enable "most" extensions for the virt machine. It's a
> > > bit wishy-washy, but the idea was to enable as much as possible by
> > > default on the virt machine, as long as it doesn't conflict. The goal
> > > being to allow users to get the "best" experience as all their
> > > favourite extensions are enabled.
> > >
> > > It's harder to do in practice, so we are in a weird state where users
> > > don't know what is and isn't enabled.
> > >
> > > We probably want to revisit this. We should try to enable what is
> > > useful for users and make it clear what is and isn't enabled. I'm not
> > > clear on how best to do that though.
> > >
> > > Again, I think this comes back to we need to version the virt machine.
> > > I might do that as a starting point, that allows us to make changes in
> > > a clear way.
> >
> > While some extensions will impact the machine model, as well as cpu
> > models, versioning the machine model won't help much with ambiguity in
> > cpu model extension support. Daniel's proposal of having a base cpu mode,
> > which, on top, users can explicitly enable what they want (including with
> > profile support which work like a shorthand to enable many extensions at
> > once), is, IMO, the best way for users to know what they get. Also, the
> > 'max' cpu model is the best way to "quickly get as much as possible" for
> > testing. To know what's in 'max', or named cpu models, we need to
> > implement qmp_query_cpu_model_expansion(). Something that could be used
> > from the command line would also be nice, but neither x86 nor arm provide
> > that (they have '-cpu help', but arm doesn't output anything for cpu
> > features and x86 dumps all features out without saying what's enabled for
> > any particular cpu model...)
> >
> > I know x86 people have in the past discussed versioning cpu models, but
> > I don't think that should be necessary for riscv with the base+profile
> > approach. A profile would effectively be a versioned cpu model in that
> > case.
> >
> > Finally, I'd discourage versioning the virt machine type until we need
> > to worry about users creating riscv guest images that they are unwilling
> > to modify, despite wanting to update their QEMU versions. And, even then,
> 
> What's the problem with versioning the virt machine though?

The initial versioning support is no big deal, just a couple new functions
and macros. And, new versions which don't change anything or just change
the current state of preexisting properties and attributes also have very
little developer work. However, when changes require adding compat
variables, which scatter around if's to manage things in one way for
one machine version and another way for others, then code starts to get
more difficult to maintain. And, since adding compat variables is known to
cause a maintenance burden, then just about every change the machine model
gets will lead to time spent discussing whether or not a compat variable
is necessary. But, none of that is the worst part of versioned machines.
The worst part is that the test matrix explodes. Typically all test cases
will get run N times where N is the number of supported machine types,
even if for most test cases the machine type doesn't make a difference. So
that's a waste of time and energy. And, if nobody really cares about the
old machine types, then running test cases which do depend on the machine
type is still a waste of time and energy. And, of course, machine types
which are just a number bump, definitely lead to waste.

> 
> I'm thinking that in the future we would want to switch from PLIC to
> AIA; change the memory map; or change the default extensions (maybe to
> a profile). All of those would require a versioned virt machine.

Having never versioned the machine type before, we're going break command
lines whether we put these types of changes behind machine versions or
into machine properties. Currently a command line only specifies 'virt',
so unless we leave 'virt' pointing at the current, which will be the
oldest, machine type forever, then users would need to change their
command lines to point at virt-1.0 or whatever in order to preserve their
configurations anyway. I think, particularly considering the current state
of RISC-V in production environments (not much), that we could instead
require users to change their command lines to be more explicit about what
they want, by using machine properties.

Regarding the 'virt' name, Arm also has 'virt' which is always an alias to
the latest virt-x.y machine. This works best for users who use libvirt,
since libvirt will convert the alias to the versioned name when storing it
in the XML. So, IMO, RISC-V should focus on libvirt support before QEMU
versioning, which also gets RISC-V closer to being used in production,
where machine versions are more important.

As for extensions and profiles, IMO, they shouldn't be coupled with the
machine type. Either the max CPU type should be used by default or users
should be required to select the CPU type, i.e. no default.

Thanks,
drew

