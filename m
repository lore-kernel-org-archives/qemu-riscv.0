Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F083C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 12:33:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvzY6-00067H-Bn; Thu, 26 Oct 2023 08:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvzY4-000660-MO
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:33:16 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvzY1-0000b9-OD
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:33:16 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-27d0a173e61so695796a91.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 05:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698323592; x=1698928392; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e+5c+7/hWqqP2V740qpPrOLE20Hrf2rzE26Q7mOJnQ0=;
 b=exv6zufdfc65HM2nmxJxkm6JXdc+YTs5N8rsw+jxV1R+5Xw72xi6w8VSfVLbWXVCb+
 mdVfGDXVYZekTS/hzJgk30PrP4nRw9KI1N+P+/WvLOYJCi6AkxC3r0G9qM6EiFXWrJ5T
 FgW7D/P/inrgBCEb21z33oDjwJHoSpiz+Qzp+O0zlwQcaChADrrgM/flT80Xojdkv9OI
 nVRjm71ftHuU+khQEuh4o74Hbvv6TsE61Nv2T6MCwDeiS83R+IPd8DoXbPUVmbmLrKNW
 jzmTs1fBdRwCMyJMgPKYZvD8ChtkY5Fs+3Z374nZfruXW0cwZKnhXw7XFd7JRL5CAJ0t
 XJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698323592; x=1698928392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+5c+7/hWqqP2V740qpPrOLE20Hrf2rzE26Q7mOJnQ0=;
 b=sv6I+1L9I2cdgSBgYHzK7sGlhdVo5UkzidtCmIWbEBrZDZTM2NB65ry+ih+RrdTY+8
 KQP60g/JGQJKCHALegB8Ghbqh6D5yySKWIufmwvSPTiMVX+K1MkdbhJispcb3ybYUSUv
 YaR7mszoDMVg8iEgtgkwVby0kMTUPDM79nSXAYZJkoJptkGOqjdTS8Vt48c0/KTF1mft
 MSoY5te9nJx1p152swWsm45o58qALIBiXDYl9pW7nlpkeZRIB77iGfsljQ0brfw3r/Kq
 6OY5QxfN8NV6ofbzKYyiPCH7v2r5shyuMOhjJWDqDhmYkdPyIw+LTHbQv0njIn/5CISc
 DAcQ==
X-Gm-Message-State: AOJu0Yz2MFCMJh8mVOjMyUIPFeckVI/bKG9eTQbGvjaC1dPL5Bxfc+D7
 0cca9Hs3y0v/1qMO23ZcaaAcAQ==
X-Google-Smtp-Source: AGHT+IGE/Clg5SSbfCY82GqQlbSBPfEuurZbe9/kAWk6wT+mYpL5dHNqKr5yU8eRfHSYuZwC+lXI9g==
X-Received: by 2002:a17:90b:2ec7:b0:27d:2ad2:4d9c with SMTP id
 ss7-20020a17090b2ec700b0027d2ad24d9cmr14170155pjb.35.1698323592214; 
 Thu, 26 Oct 2023 05:33:12 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78]) by smtp.gmail.com with ESMTPSA id
 n20-20020a17090ade9400b0027d1366d113sm1523395pjv.43.2023.10.26.05.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:33:11 -0700 (PDT)
Date: Thu, 26 Oct 2023 18:03:02 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v4 09/13] hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
Message-ID: <ZTpcfq+96YVE5WCl@sunil-laptop>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-10-sunilvl@ventanamicro.com>
 <20231026-5530c164173cd1859e9df666@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-5530c164173cd1859e9df666@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
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

On Thu, Oct 26, 2023 at 10:31:51AM +0200, Andrew Jones wrote:
> On Thu, Oct 26, 2023 at 01:37:09AM +0530, Sunil V L wrote:
> > MMU type information is available via MMU node in RHCT. Add this node in
> > RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  hw/riscv/virt-acpi-build.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > index ebe7062b9b..dc7c0213f5 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -159,6 +159,8 @@ static void build_rhct(GArray *table_data,
> >      size_t len, aligned_len;
> >      uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
> >      RISCVCPU *cpu = &s->soc[0].harts[0];
> > +    uint32_t mmu_offset = 0;
> > +    uint8_t satp_mode_max;
> >      char *isa;
> >  
> >      AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> > @@ -178,6 +180,10 @@ static void build_rhct(GArray *table_data,
> >          num_rhct_nodes++;
> >      }
> >  
> > +    if (cpu->cfg.satp_mode.supported != 0) {
> > +        num_rhct_nodes++;
> > +    }
> > +
> >      /* Number of RHCT nodes*/
> >      build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> >  
> > @@ -233,6 +239,26 @@ static void build_rhct(GArray *table_data,
> >          }
> >      }
> >  
> > +    /* MMU node structure */
> > +    if (cpu->cfg.satp_mode.supported != 0) {
> > +        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > +        mmu_offset = table_data->len - table.table_offset;
> > +        build_append_int_noprefix(table_data, 2, 2);    /* Type */
> > +        build_append_int_noprefix(table_data, 8, 2);    /* Length */
> > +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> > +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> > +        /* MMU Type */
> > +        if (satp_mode_max == VM_1_10_SV57) {
> > +            build_append_int_noprefix(table_data, 2, 1);    /* Sv57 */
> > +        } else if (satp_mode_max == VM_1_10_SV48) {
> > +            build_append_int_noprefix(table_data, 1, 1);    /* Sv48 */
> > +        } else if (satp_mode_max == VM_1_10_SV39) {
> > +            build_append_int_noprefix(table_data, 0, 1);    /* Sv39 */
> > +        } else {
> > +            assert(1);
> > +        }
> > +    }
> > +
> >      /* Hart Info Node */
> >      for (int i = 0; i < arch_ids->len; i++) {
> >          len = 16;
> > @@ -245,17 +271,26 @@ static void build_rhct(GArray *table_data,
> >              num_offsets++;
> >          }
> >  
> > +        if (mmu_offset) {
> > +            len += 4;
> > +            num_offsets++;
> > +        }
> > +
> >          build_append_int_noprefix(table_data, len, 2);
> >          build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
> >          /* Number of offsets */
> >          build_append_int_noprefix(table_data, num_offsets, 2);
> >          build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
> > -
> >          /* Offsets */
> >          build_append_int_noprefix(table_data, isa_offset, 4);
> > +        if (mmu_offset) {
> > +            build_append_int_noprefix(table_data, mmu_offset, 4);
> > +        }
> > +
> 
> In the previous version of this patch the MMU node was getting generated
> above the CMO node, so its offset was less than those of the CMO node,
> and why I recommended moving it up here. But, in this version, the MMU
> node is now getting generated after the CMO node, so moving this up
> means the offsets are still not in ascending order.
> 
Yeah, after changing here I realized MMU node type is logically better
to be created after cmo. So, I changed the creation order but forgot
reorder here. Will update in the next revision.

Thanks,
Sunil

