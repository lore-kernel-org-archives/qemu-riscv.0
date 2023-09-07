Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD0BEC8721
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 12:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeEFT-0000W3-Fm; Thu, 07 Sep 2023 08:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeEFQ-0000Vc-RN
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 08:36:37 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qeEFO-0002hg-9P
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 08:36:36 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so16141511fa.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694090192; x=1694694992; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=URPI3ewrlqRSlnGa6Jr4RVOXCwSPxiiPxFVsL0rbVws=;
 b=l4FSu3aYlRGnrkSu7iHc4cnmROsj9q7lfuGzoIEE65bNWnGsWCP/W0tw2niB3D47OR
 Ms20YMj98WQPQ4QvW8S4XvTyfwkfKkZD8dje2Qol+Crz+8Mm5JKh7UZMi35w656wlmot
 oehuOFDQqdOrJ53e3bYQRud9pEmI5pv+uXa11J7FAmZNt16JJ9Yrp6NqfP+PHkWw3iBK
 NEAN9YKV04rAhIKWz8IwI4UQS2KUWI5Aj1G/y/YDe2ElPILlTIQ01BhebInOkCzirZVT
 clOuqEQBQNazluePfIge/xfz64Mxb8pDci8Dw2+2lFJIzoD7BiyHRWIkP1weAGRujV//
 uTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694090192; x=1694694992;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=URPI3ewrlqRSlnGa6Jr4RVOXCwSPxiiPxFVsL0rbVws=;
 b=fXjKf7tpgYKatlcd1P+oz9fQfy4/U7o7gxC5cDb8ylf3pUUdZYjo0gi//+Wd1AAo7Z
 1T/VEYyTeWnFsB3cuNiVvO54gDQv5vqwgMv35YH6YbaVQEEl77jbvQzDf3Wg3qE/1p1s
 nCkcoSH58Ud0kcMqvgF3bml0Jz6NhWA/U1yEE9rl1goxTDy8J9nDMj5sar0oby6nZdYi
 14VGnQEP7HjQ9M+y77CYJm+ot5KM2GBvhindpSfX7eoZ4DhUh19qTKuzZj4ihlaHCqr/
 V+VU9k7gZoJ2XiRYMhoezL0ojiQ0SM6/NBvmlFKcxy+HiBU3ogCPqwommJyhDBTJos5g
 zK4Q==
X-Gm-Message-State: AOJu0Yy2vSXmqwMIPsxpOFzlBq49c8MRY7LQS6kc/Lmf4RLqDaAs6rrb
 ly8X3RIgs/6JQkTgu576e/yxGg==
X-Google-Smtp-Source: AGHT+IGg6qudx3fnNhyo0LxAAdyBTR3oWamzBPLSGP41vkYabBFH45O0YqFTnTonTetC099bYZLrvg==
X-Received: by 2002:a2e:900e:0:b0:2bc:de11:453b with SMTP id
 h14-20020a2e900e000000b002bcde11453bmr4901230ljg.1.1694090191188; 
 Thu, 07 Sep 2023 05:36:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c230c00b00401e32b25adsm2425218wmo.4.2023.09.07.05.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 05:36:30 -0700 (PDT)
Date: Thu, 7 Sep 2023 14:36:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, peter.maydell@linaro.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] docs/devel: Add cross-compiling doc
Message-ID: <20230907-d272560607f40c00538e4e3f@orel>
References: <20230907084604.253347-2-ajones@ventanamicro.com>
 <87sf7q1djr.fsf@linaro.org>
 <20230907-6262b40a0a352bdce53999e3@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230907-6262b40a0a352bdce53999e3@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 07, 2023 at 02:31:20PM +0200, Andrew Jones wrote:
> On Thu, Sep 07, 2023 at 11:20:55AM +0100, Alex Bennée wrote:
> > 
> > Andrew Jones <ajones@ventanamicro.com> writes:
> > 
> > > Add instructions for how to cross-compile QEMU for RISC-V. The
> > > file is named generically because there's no reason not to collect
> > > other architectures steps into the same file, especially because
> > > several subsections like those for cross-compiling QEMU dependencies
> > > using meson and a cross-file could be shared. Additionally, other
> > > approaches to creating sysroots, such as with debootstrap, may be
> > > documented in this file in the future.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  docs/devel/cross-compiling.rst | 221 +++++++++++++++++++++++++++++++++
> > >  docs/devel/index-build.rst     |   1 +
> > >  2 files changed, 222 insertions(+)
> > >  create mode 100644 docs/devel/cross-compiling.rst
> > >
> > > diff --git a/docs/devel/cross-compiling.rst b/docs/devel/cross-compiling.rst
> > > new file mode 100644
> > > index 000000000000..1b988ba54e4c
> > > --- /dev/null
> > > +++ b/docs/devel/cross-compiling.rst
> > > @@ -0,0 +1,221 @@
> > > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > > +
> > > +====================
> > > +Cross-compiling QEMU
> > > +====================
> > > +
> > > +Cross-compiling QEMU first requires the preparation of a cross-toolchain
> > > +and the cross-compiling of QEMU's dependencies. While the steps will be
> > > +similar across architectures, each architecture will have its own specific
> > > +recommendations.
> > 
> > "some architectures" - most of the cross compile stuff is hidden away by
> > the build system on systems with appropriate development libraries
> > installed. I think we would be remiss if we didn't just outline the
> > common case:
> > 
> >    ../configure --cross-prefix=riscv64-linux-gnu-
> > 
> > I think we could make it clearer that in most cases you don't need to
> > prepare and cross-compile a bunch of dependencies lest we send
> > developers down a rabbit hole.
> > 
> > Maybe build-system.rst be updated and this reference it for the common
> > case?
> > 
> 
> Hi Alex,
> 
> tl;dr, I'd welcome instructions helping people get cross-arch development
> libraries installed without having to build them. I wouldn't make a good
> author for those instructions, though, since I don't know how.
> 
> I'm guessing the dependencies can be installed with a distro's package
> management, assuming the package management supports cross-arch
> installation and installing to a specified root directory. I'm on Fedora,
> so I just tried
> 
>  $ sudo dnf install --forcearch=aarch64 --installroot=$SYSROOT --releasever=36 glib2-devel
> 
> but it wanted to install a huge number of packages, which most people
> probably wouldn't want to do. Maybe that command isn't what you had in
> mind or other distros can manage this better. I'm all ears.
>

Ah, I just saw your other reply on the original posting. The magic is in
docker stuff.

I'll look into it, but I'd also make a poor author for anything regarding
docker :-)

Thanks,
drew

