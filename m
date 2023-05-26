Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C583C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 08:35:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2SuH-0006px-Nb; Fri, 26 May 2023 04:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q2SuG-0006ph-QK
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 04:34:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q2SuF-0001fR-3z
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 04:34:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6da07ff00so5195135e9.3
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 01:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685090077; x=1687682077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+QeROxGL8S3u9qXGyWHke6FHNpvHe1nmLqm9H5BaL4=;
 b=UOzRoLC2hSrBx8152XbwaEYQXkhrtFvvUrBQDkfm+qU7hYZReBOoWAh6qTCIFKqsXL
 tIA3tx8SFYFTIqyLO8jSFwPfs0wb9wiy29NmSHrZm/ly1f1sAXaRyQJ/aNMkmv6USw16
 WUtoKhxl03OMIae3sBS/cyVmexbBaNaYW+shiFhi0FSdDtpFMxGWZSSLQWMEPpzyDyQ4
 /oMNEb+1uVyNSvD+tk057fl7gzs2F75dnEAKnzJ7LTblITATjDUqnxWjKWmpbcnRz+nM
 DT+CbgxYAXvPl++EKn3x7iPO9+5FG4qfQ925m54WGS96fseTwFWSAhs1SqMWdU6zZ9y1
 pGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685090077; x=1687682077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+QeROxGL8S3u9qXGyWHke6FHNpvHe1nmLqm9H5BaL4=;
 b=lVA9nEAO0R8Gsp46FjLbeOPpOqrlEupUJdxJFhOYl9NdudzNL0+gD5F3hogED4vi48
 4pWJ3QfeEILntlLB9ABO1MAlN1scDLjAgtNDTppAV2TmzVj5Fl4FlqDRPg8HWuUjVKmZ
 SpLD+bLVeBbygpOFFJMf/yzLKOUyAM7eKn/ZsZ0X+DbKsm12Cg5duy4t4rUYyBaXNalQ
 cMxAnDKXJcKVxZ1HoKkjCANgGmBtODZxoMNtAmlMmQWAdcQaz6dDurvVuHzWLoOYb88v
 /rxaykZh8u6/x1QmYqQtf6w3AZQMXoX0AXoKKq3miXthiN8il+4Nc5xHlZSiGRd2g3+h
 aoRQ==
X-Gm-Message-State: AC+VfDy4STLCZA8XBX+1pg+07Z2wbivhYFBxAiTudbHnAUPHBIqfk+za
 4j+X2Bc9rwypTN7Cg7HWngT9ww==
X-Google-Smtp-Source: ACHHUZ763k2ZtYyCPgt97PYO8LbkOWsJvI+jyfYGvy+x+9yaEnmLmhht3PN7cArVRrquJwPvXB4tBg==
X-Received: by 2002:a05:600c:21d9:b0:3f5:d0b8:4a53 with SMTP id
 x25-20020a05600c21d900b003f5d0b84a53mr1030253wmj.34.1685090077661; 
 Fri, 26 May 2023 01:34:37 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d4e8f000000b00307bbbecd29sm4316940wru.62.2023.05.26.01.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 01:34:37 -0700 (PDT)
Date: Fri, 26 May 2023 10:34:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v4 0/3] hw/riscv/virt: pflash improvements
Message-ID: <20230526-e398cfda73f326653323ea68@orel>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <CABJz62MFZzx3jBgW6TtGFD9emY+DAbbftSybD8ZouC65n3-auA@mail.gmail.com>
 <20230526-b0d8b56e9688dea7ae9d00d5@orel>
 <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62Nk-U+qHQjn6G2-bN8i9RcMEZWdYTyi7wqC=7BVjDSBWQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I assume so, but I'm not tracking firmware status. If the firmware
doesn't extract the ACPI tables from QEMU and present them to the
guest (afaik only edk2 does that), then the guest kernel falls back
to DT, which is why it's working for you.

I suppose we should wait until Linux merges the ACPI patches, before
adding RISC-V to the libvirt capabilities ACPI list. Then, is it
possible to use something like libosinfo to inform virt-manager
when it should enable ACPI and when not? Later distro images, with
later kernels, will want to use ACPI by default, but older images
will still need to use DT.

Thanks,
drew

