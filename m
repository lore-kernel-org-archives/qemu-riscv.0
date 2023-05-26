Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8650C7EE2D
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 08:19:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2Sfo-0008Ej-DE; Fri, 26 May 2023 04:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2Sfb-0007be-LU
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 04:19:32 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2SfP-0006bq-SE
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 04:19:31 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3942c6584f0so172604b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685089158; x=1687681158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gLCwfQjI9CEpyNqNrK7IbY60JHN2vYALCzfox2aXPhc=;
 b=F1rIrTyzuHXSefEj+iKrPU9XKfQLYkgCKY5rUKqRHOMxFhiirglclR3F97oq0YS2IY
 pwEUMLkxwF2tFVRUkbsi0P+nYShy9d5tWnQfr1YNCmdR+MSS9AEQ7sVL3nqkjNYtDmbw
 JrkZRt39eDYJX0PSxXDpSc2d0ciHFhXZ+OZPo8VzBu4v2g3BeXC8grJGCNO/61bSt01p
 k/zrk4YO+xz44En0jiNPnjaMHviZ1S3XGAqZemkqWHEWL7wP9tvEv8IeQedEsXNCl+de
 n9ia22E1Sd3YsHuhWx3LAsw1dIDYL7fupryirUwhzwxZCVlH5vcmUxOW9Qg+/Of1e+XM
 9XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685089158; x=1687681158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLCwfQjI9CEpyNqNrK7IbY60JHN2vYALCzfox2aXPhc=;
 b=Ya9CQaKTADTET13BKcMn855bVj0uyeRJ4P7vizAK4MR7ELFeWOcyMiU7037e78TPl5
 cIXEJc/R1vx4u0W1lUqamMVDEegenPZqV04P7eaE+OPFYZeOcilus82uXLLv9HPO1oNP
 o0yZY9rEP1LOD4b0kyv91Kzga/cT8MRv6IC8aIEFXhR2zQs1moL5NoRyJON3XVigXAbN
 SPv7GNar0mwclxPEECBD1iZ43lPFxGEsI8wtaMpYLTEH0WNIKB5uIAti2kGNf5jyBOIm
 LfvdqBjepd278ibJ3UFvQ3qnWZFg89AT7BHKTBgMEkZuqRTpGhV5Winp/0wHUZUsbXLX
 GEWg==
X-Gm-Message-State: AC+VfDyYvNZ6ZXLk5hqFQFXiJcG5WWIAeEXzvqVvc+bCx3nI5jBFk6GJ
 j+XbJmtAcM0STWmg9j51z3yYOQ==
X-Google-Smtp-Source: ACHHUZ5qI6lO0Sptn95hcyFRwLeaxA/NNvLcwRRY/fkenJrIc7ZxIUChHPTKJldm5Xy6hlZDRuMWvg==
X-Received: by 2002:a05:6808:144b:b0:398:4a82:76e1 with SMTP id
 x11-20020a056808144b00b003984a8276e1mr619473oiv.36.1685089158059; 
 Fri, 26 May 2023 01:19:18 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3]) by smtp.gmail.com with ESMTPSA id
 d3-20020a0568301b6300b006af99ac5832sm1518604ote.47.2023.05.26.01.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 01:19:17 -0700 (PDT)
Date: Fri, 26 May 2023 13:49:09 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
Message-ID: <ZHBrfV3U1+iDw2J6@sunil-laptop>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
 <20230526-b0d8b56e9688dea7ae9d00d5@orel>
 <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Fri, May 26, 2023 at 03:49:11AM -0400, Andrea Bolognani wrote:
> On Fri, May 26, 2023 at 08:39:07AM +0200, Andrew Jones wrote:
> > On Thu, May 25, 2023 at 11:03:52AM -0700, Andrea Bolognani wrote:
> > > With these patches applied, libvirt built from the master branch,
> > > edk2 built from your branch and a JSON firmware descriptor for it
> > > installed (attached), it's finally possible to boot an unmodified
> > > openSUSE Tumbleweed RISC-V disk image by simply including
> > >
> > >   <os firmware='efi'>
> >
> > Hi Andrea,
> >
> > I'm a bit concerned that we don't also need to add some XML in order to
> > disable ACPI right now. RISC-V guest kernels will support ACPI in the
> > near future. Ideally a default libvirt VM using edk2 will also use ACPI.
> > Will there be a problem with changing that default later? If so, then
> > I'd change it now and continue burdening developers a bit longer by
> > requiring them to explicitly disable it.
> 
> libvirt doesn't enable ACPI by default on any architecture, not even
> x86_64. virt-manager will enable it by default if it's advertised as
> available on the architecture in the capabilities XML.
> 
> However, it looks like the corresponding code in libvirt is not as
> dynamic as I would have assumed: instead, we hardcode the list of
> architectures that advertise ACPI support available, and at the
> moment that list does *not* include RISC-V :)
> 
> I think it would make sense to fix this, but I want to make sure I
> understand the impact. Is this just an UEFI thing? All my other
> RISC-V guests (Fedora, Ubuntu, FreeBSD) boot just fine when I turn
> ACPI on. In fact, even the openSUSE one works with ACPI on, as long
> as the UEFI implementation used is the U-Boot one rather than edk2.
> 
> So, are edk2 users the only ones who would (temporarily) need to
> manually turn ACPI off if virt-manager started enabling it by
> default?
> 

Right. Currently only EDK2 supports passing ACPI information to the
kernel in RISC-V. I think it is true even in aarch64. Hence, we need
this temporary solution to turn acpi off only for EDK2 users.

Is there an issue with delaying the fix in virt-manager to add RISC-V
to ACPI supported list? I think there is no point enabling it until
kernel also supports it.

Thanks,
Sunil

