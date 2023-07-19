Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E4EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 03:38:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLy0n-00081c-JB; Tue, 18 Jul 2023 23:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qLy0m-00081I-2R
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 23:38:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qLy0k-00059X-Fj
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 23:37:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b9e9765f2cso38478545ad.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 20:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689737876; x=1692329876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p4FSI+TJXz+i2rFMQzor+Uv2E1K8lVetu4ZigiR9to8=;
 b=QDUqkKJDOnDucP6SMLgF+RvnSpsb7QIdkDcyMrM6VwtlmQlEOTQ8EYVIvPJDvM04B3
 z2tGb6g5UbliY5gPA7RWQotrtiDBDgNTEJeMJoJNfo42TqhT2ncqc5LCuLHPELwRHf0o
 zytZmjADH9yoNMX3LcS1pAmfMneB2iKk1IgSMnubxR8AaglbCZd+/rMdTAULomp/a4Xf
 H6+oIlhJV1iU3pY4XrB6qeZ9zDbnWLrfEGA6upJgROKCGCunmZ9THM8YZxXxYZhPhrO9
 USt/YaT9faMJlU3iqDUJrpt6cTJYytF4u+pY/i/Bv0HtgZDkqS94eadcN3qqjq6KafxK
 sjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689737876; x=1692329876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4FSI+TJXz+i2rFMQzor+Uv2E1K8lVetu4ZigiR9to8=;
 b=CMQKFMOpjK87i94IqHT7AZfoqlHeg6z8FA8MUlZP1NMQB0pPKHY46FU1nUg2ZkXjsh
 DZfGyFqCi36kjVOCLfu0NGxbLISjd8DulW/nGrkGF7P4Nko2nI/Yy0leYaiUOktQBSD6
 /aRgbPEvw6KbeKleHLRCHtptZ2cZrRK+PAtd52MLJXLThGTV7ah4L9+FFiEEm8LGCi1w
 23eXdq+uNws8rZ7XuFXZeKrMIH685u5+S6zTagUkobJzlyJS/Nad/kLpDyhf9ipKu8fC
 IiQxcofKIgJOXkB18SeNiCRJklgKb9isK3fsqE2EW+e2yf5KCWHkWBgD7DwGlFe1u47C
 i7NQ==
X-Gm-Message-State: ABy/qLZCDFfi8xpA2kcUMgj1ZiBrYNOnnPRe2U4SOAdCiRBPIETMqSIv
 Kk3fonEFdVxRYTJzmy8Db0MSJw==
X-Google-Smtp-Source: APBJJlG+dv6PQ4M39JK4muDuabBScOAkoBcZchJjg1Rd3T9raqT0Ug8GagFZYrYDifG2FMzsQ6gVfw==
X-Received: by 2002:a17:902:ed54:b0:1a6:b496:4053 with SMTP id
 y20-20020a170902ed5400b001a6b4964053mr1250581plb.59.1689737875925; 
 Tue, 18 Jul 2023 20:37:55 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 a22-20020a170902b59600b001b86dd825e7sm2654579pls.108.2023.07.18.20.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 20:37:55 -0700 (PDT)
Date: Wed, 19 Jul 2023 09:07:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Message-ID: <ZLdajOyuPXxxaVJO@sunil-laptop>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-5-sunilvl@ventanamicro.com>
 <6105a331-7c24-2c8e-a3ce-65c6080fd17f@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6105a331-7c24-2c8e-a3ce-65c6080fd17f@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jul 18, 2023 at 05:05:12PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 7/12/23 13:39, Sunil V L wrote:
> > PCIe High MMIO base is actually dynamic and fixed at
> > run time based on the RAM configured. Currently, this is
> > not part of the memmap and kept in separate static variable
> > in virt.c. However, ACPI code also needs this information
> > to populate DSDT. So, once the base is discovered, merge
> > this into the final memmap which can be used to create
> > ACPI tables later.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >   hw/riscv/virt.c         | 31 ++++++++++++++++++++++++++++++-
> >   include/hw/riscv/virt.h |  9 +++++++--
> >   2 files changed, 37 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index f6067db8ec..7aee06f021 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -84,6 +84,22 @@ static const MemMapEntry virt_memmap[] = {
> >   static MemMapEntry virt_high_pcie_memmap;
> > +/*
> > + * virt_memmap doesn't include floating High Mem IO address entry. To enable
> > + * code organization in multiple files (ex: ACPI), it is better to have single
> > + * memmap which has complete information.
> > + *
> > + * VIRT_HIGH_PCIE_MMIO is always greater than the last memmap entry and hence
> > + * full_virt_memmap is capable of holding both virt_memmap and
> > + * VIRT_HIGH_PCIE_MMIO entry.
> > + *
> > + * The values for these floating entries will be updated when top of RAM is
> > + * discovered.
> > + */
> > +static MemMapEntry full_virt_memmap[] = {
> > +    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 0 },
> > +};
> > +
> >   #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
> >   static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> > @@ -1444,7 +1460,20 @@ static void virt_machine_init(MachineState *machine)
> >               ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
> >       }
> > -    s->memmap = virt_memmap;
> > +    /*
> > +     * Initialize the floating values in full memory map
> > +     */
> > +    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].base = virt_high_pcie_memmap.base;
> > +    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].size = virt_high_pcie_memmap.size;
> > +
> > +    s->memmap = full_virt_memmap;
> > +    /*
> > +     * Copy the base virt_memmap entries to full memmap
> > +     */
> > +    for (i = 0; i < ARRAY_SIZE(virt_memmap); i++) {
> > +        s->memmap[i] = virt_memmap[i];
> > +    }
> > +
> 
> This change here kind of convinces me of the point I made earlier in patch 2:
> we can simplify gpex_pcie_init() to use just the RISCVVirtState as a parameter
> and get everything else from it.
> 
> It's also something for a follow-up. As for this patch:
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
Thanks Daniel. I agree. I can send another follow-up patch to simplify
gpex_pcie_init.

Thanks,
Sunil



