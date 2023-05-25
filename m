Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85684C7EE31
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 15:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2CUZ-0004IJ-91; Thu, 25 May 2023 11:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2CUU-000420-Pg
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 11:03:01 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q2CUS-0002RI-8U
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 11:02:57 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5552f7a9bc5so185165eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685026975; x=1687618975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JuPkBe7X+N1ieWQlPpR6mRzBN/kS+8NPGLFFxQsivi4=;
 b=DCWpvm8gBNeHPtch+3AsiV0dM0Qm9Vt2VYNfAU+tjDblFP1t08gEHf8Cu/3n9Bf/QR
 oSTboZ3fhJ7rrlWEZXtqwdIvfgxij147Liylt9JWWWJil+7d2sJdbx04gvM3mqd78opQ
 xQnpz5VXoF1HtQiKnzZN3GfpL9USLWr72HNdIKxJ7uJGAkmmcXBToyB+Xd/A5YXCWtek
 E4f0myD9T4etMlsjTz5nm/3eLKUNt9V8hiDSWX0jRqov6OUC+6DFvUyfMkJKCon/2oLh
 X1SZ3PzjcFtZLaeb5TK+xmPKsLlQeD+fXLnk+B3hZkXm/qFkmwlOHIuAxHjEnQ2dPATZ
 tcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685026975; x=1687618975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuPkBe7X+N1ieWQlPpR6mRzBN/kS+8NPGLFFxQsivi4=;
 b=gkGSMD9yHhD8gDDHMLy3+4gA9nXbWuGUgn1yPZW2zLDe3a+tXiF0WCvi2oOMHKJv5r
 VOnLbAR6GpIrvufsG+54KBcw8x7v7wN8TZU6W4eBcd6U4JTEFyKWBhOUylcpe7R3ksUD
 9LSmrYiwxNs/JG3AQyW0bCvI48U+/pJ+NeeGuAcrZWRHdJoPOhr/fZEWtjGeiDudlHBb
 bH0vDSl38AzByvv9T1GG4t6M6gSqsxkoy97IGbPjQmI0CZ+Lf9vXNPSYl5JT4tdQ1nHZ
 Hv3yHm/hBR52ZQXSpBG7QgknJ9rPnpaVqP3Wkk9kNhPe07oXVMALg6Z2QItRgHG5EZNo
 9oUg==
X-Gm-Message-State: AC+VfDxQ7H/ThqvE0XLrH8Q5CmVIUbVU6acC6YB4If7yBD/DJYokf2oi
 cCqpR0uGrFg/NIUDuGQO+uBsKw==
X-Google-Smtp-Source: ACHHUZ4CGqODwc/dSbjJTyN25SatHgCnKQ+RDY8dhjmZ0py1dfTVg/BnilmOElfoXyALTgVoa/Lluw==
X-Received: by 2002:a4a:9cd2:0:b0:54b:ce85:490a with SMTP id
 d18-20020a4a9cd2000000b0054bce85490amr7983866ook.0.1685026974663; 
 Thu, 25 May 2023 08:02:54 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3]) by smtp.gmail.com with ESMTPSA id
 b9-20020a4ac289000000b0054fd51435efsm511052ooq.8.2023.05.25.08.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:02:54 -0700 (PDT)
Date: Thu, 25 May 2023 20:32:46 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v3] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
Message-ID: <ZG94lvAYggnRBfLQ@sunil-laptop>
References: <20230523102805.100160-1-sunilvl@ventanamicro.com>
 <CABJz62MQ5uRHUP4LLKt=AxTf-Sz0aTEOLWDz=9ftK=H3tZ9JUg@mail.gmail.com>
 <ZG5KgLQ4H/leWKJi@sunil-laptop>
 <CABJz62NHXrBKkc3Gux0TXOjUCO4up-OunwJ6UO94ts+rTgVsAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62NHXrBKkc3Gux0TXOjUCO4up-OunwJ6UO94ts+rTgVsAg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Andrea,

On Thu, May 25, 2023 at 01:43:28PM +0000, Andrea Bolognani wrote:
> On Wed, May 24, 2023 at 11:03:52PM +0530, Sunil V L wrote:
> > On Wed, May 24, 2023 at 03:50:34PM +0000, Andrea Bolognani wrote:
> > > First off, the only RISC-V edk2 build readily accessible to me (from
> > > the edk2-riscv64 Fedora package) is configured to work off a R/W
> > > pflash1. You said that you have edk2 patches making R/O CODE pflash0
> > > and R/W VARS pflash1 ready. Any chance you could make either the
> > > build output, or the patches and some hints on how to build edk2
> > > after applying them, somewhere?
> >
> > Please build EDK2 using the branch
> > https://github.com/vlsunil/edk2/tree/separate_code_vars.
> >
> > The instructions to build is in
> > https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support#build-edk2
> >
> > However, now it will create two images for code and vars.
> 
> Following your pointers, I was able to build suitable edk2 images and
> verify that they work with a patched QEMU, so
> 
>   Tested-by: Andrea Bolognani <abologna@redhat.com>
> 
> Note, however, that said testing was limited to verifying that edk2
> would come up.
> 
> I have also tried booting an openSUSE Tumbleweed "JeOS" image, since
> that's the only distro I'm aware of that uses UEFI boot on RISC-V at
> this point - though they use U-Boot's UEFI support rather than edk2.
> 
> During that attempt, I ended up in the edk2 shell. Running
> 
>   fs0:\efi\boot\bootriscv64.efi
> 
> brings up GRUB just fine, but selecting the default boot entry
> results in
> 
>   Loading Linux 6.3.2-1-default ...
>   Loading initial ramdisk ...
>   EFI stub: Booting Linux Kernel...
>   EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
>   EFI stub: Generating empty DTB
>   EFI stub: Exiting boot services...
> 
> being printed, after which it's back to OpenSBI and from there to
> edk2 again.
> 
> I feel that this has probably more to do with the way the openSUSE
> image has been built than edk2, but I thought I'd report my
> experience nonetheless in case there's any useful information that
> can be gathered from it :)
> 
Thanks!. Please add -machine acpi=off in qemu command to boot the
kernel.

> > > Going further and testing libvirt integration. After hacking around
> > > other issues, I finally stumbled upon this error:
> > >
> > >   qemu-system-riscv64: Property 'virt-machine.pflash0' not found
> >
> > Thanks!. This needs some investigation. Let me look into supporting
> > this.
> 
> Yes please! It's critical to libvirt integration. Feel free to CC me
> when you post patches and I'll gladly test them.
> 
Sure, I have the fix ready. I need to convert this into a patch series
now. Will send it soon and thanks in advance for helping with testing.

Thanks,
Sunil

