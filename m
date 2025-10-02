Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185FBCAC5B0
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 05:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4BYP-0006Zy-Pj; Thu, 02 Oct 2025 01:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4BY7-0006ZD-FY
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 01:08:17 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4BXy-0003kz-Cf
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 01:08:14 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-636255b92c9so973148a12.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 22:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759381677; x=1759986477; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSOUcqp2IlrIvHA8jMOKMPae7kynR4QEp3SeGZrNH6w=;
 b=dXovyZQQ5OprmJC0nnB0Qug5hGACccfST3vVQPCcIVWECxHdg3Pnb5BV//p5IgsWX3
 In4seiS68wFtH5rc3HzUYiSHcaQSEFR/cUYluuSCi3YlxKwXn32ZHwtNgNfajQRM4PJj
 OEhgyUt8OOzfXAxC3gcP1CKw1d3S1rCYIOYFqNGHVehnfiYj5HefDXE/vViVNaEJxupu
 mvwS9PtPGMO+0950NmxHt6QeX7wPyE9G+Ck+qQ3+uAIJnbqKagB2Bs9Mi7616XTv5Lvy
 4He2KFfuHzc2UpOyQSqL4hIfZk4yMfoE/NNBGlJzBiDGWL72g1Airp5aT9Dcp9nFXpjn
 UYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759381677; x=1759986477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSOUcqp2IlrIvHA8jMOKMPae7kynR4QEp3SeGZrNH6w=;
 b=qCPx72PBxeO09mKt96Vi5WsjbAqjdoytI6Vzs4DMe8bROxzToLn0VJ0OqtvogeMajj
 QLdNJ/U5nIYgvY1rIleHAk6vSivsyhJhb+9qsNVLqlUfqk7aS5preVa9ZYSqC0D34tgy
 0vZ+HDTJ2ToxYPLg+QhisOe6QQc0PiPb1kmZEvzA4zcUboJ8xk/WGFW+k17Omou4R4+Z
 FO8p716JilYlK1fyvqRA+0AanCkaX1jXbqPAlS3OYKu9A8phfc61R2YdlvWe77jUMMe6
 ob5Wk5lhR41V2YsZMkmBBwFsgUt6ijfZT8R8SMKHY03e78C7RKELCDdDY+i/CXpjx1o6
 y+tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH3Q/4Xbp/Qn+2ZDqidls6Qg2EJ6ABVmWtXgT8NlFgNXq/ywOdv1x99TyYats/0aaoRPRTZ2nvvbPf@nongnu.org
X-Gm-Message-State: AOJu0Yz7LTvX15nM7hIy1vKo0olQ/LVxU8jHkJNc4y+kOiftEa0TYUaU
 K5rhpsd+iz2mplQNBwECYPss/nARUaG6SEFgpC0/Hdi4WtD+/f7e5hnjywefU6UJbeNSI2klWrC
 10nN/MQa4rOYHMOLNnDEghcWvsBSRnsk=
X-Gm-Gg: ASbGncu9RM4tHsowJoOzYLD5CKlJVNY5gZTdB9rWLSYJV1I/AFkkmDq4WjKAK1vFOPo
 V433doQ4DHWXEkL9s02eZjtN2RZ1mOg04BqO1X369Sur25y6bVyknI1fz2+FzQnMnMk1Y+rimp/
 0M7M9m0a1flkCP6+AvNqdtKXSykyrzTpLz8HQbImrX6GO+PQGl9d0hSZ9d9WnY8gwtY4l2qmjkU
 h0ODa/dEHAdWBOm5pmZCZvGuIXDW74+ZdjTZhhJfjIppSjrISMJChhXSltp6w==
X-Google-Smtp-Source: AGHT+IGbPbj4c0hWe6rckwwTwn4p9XtFbIOSiMHR+O74Jl7CyLyWE/cFBAXCXAcwNA1z6jnG/UR8LPnDKSqRCgE/vL8=
X-Received: by 2002:a17:907:2d20:b0:b07:e3a8:5194 with SMTP id
 a640c23a62f3a-b46e515e0a5mr678873866b.22.1759381676627; Wed, 01 Oct 2025
 22:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250913041233.972870-1-guoren@kernel.org>
In-Reply-To: <20250913041233.972870-1-guoren@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Oct 2025 15:07:30 +1000
X-Gm-Features: AS18NWAy2EuzbdPxno_KxqHV52AiiHglsi8I-G57995-DuZlLz-NrMvn4oHwLXQ
Message-ID: <CAKmqyKOLjbAKFmJeb2MAznHES1=pn224i-8r9yKSC+-gu0UZug@mail.gmail.com>
Subject: Re: [PATCH V3] hw/riscv/riscv-iommu: Fixup PDT Nested Walk
To: guoren@kernel.org
Cc: zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, 
 alistair.francis@wdc.com, seb@rivosinc.com, tjeznach@rivosinc.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Nutty Liu <liujingqi@lanxincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

On Sat, Sep 13, 2025 at 2:15=E2=80=AFPM <guoren@kernel.org> wrote:
>
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>
> Current implementation is wrong when iohgatp !=3D bare. The RISC-V
> IOMMU specification has defined that the PDT is based on GPA, not
> SPA. So this patch fixes the problem, making PDT walk correctly
> when the G-stage table walk is enabled.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Cc: qemu-stable@nongnu.org
> Cc: Sebastien Boeuf <seb@rivosinc.com>
> Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
> Reviewed-by: Weiwei Li <liwei1518@gmail.com>
> Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes in V3:
>  - Fixup inner non-leaf walking for 4KB-align.
>  - Add two Reviewed-by tags.
>
> Changes in V2:
>  - Remove nested param to make patch clearer.
> ---
>  hw/riscv/riscv-iommu.c | 141 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 139 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 96a7fbdefcf3..ddb5236f55d1 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -866,6 +866,143 @@ static bool riscv_iommu_validate_process_ctx(RISCVI=
OMMUState *s,
>      return true;
>  }
>
> +/**
> + * pdt_memory_read: PDT wrapper of dma_memory_read.
> + *
> + * @s: IOMMU Device State
> + * @ctx: Device Translation Context with devid and pasid set
> + * @addr: address within that address space
> + * @buf: buffer with the data transferred
> + * @len: length of the data transferred
> + * @attrs: memory transaction attributes
> + */
> +static MemTxResult pdt_memory_read(RISCVIOMMUState *s,
> +                                   RISCVIOMMUContext *ctx,
> +                                   dma_addr_t addr,
> +                                   void *buf, dma_addr_t len,
> +                                   MemTxAttrs attrs)
> +{
> +    uint64_t gatp_mode, pte;
> +    struct {
> +        unsigned char step;
> +        unsigned char levels;
> +        unsigned char ptidxbits;
> +        unsigned char ptesize;
> +    } sc;
> +    MemTxResult ret;
> +    dma_addr_t base =3D addr;
> +
> +    /* G stages translation mode */
> +    gatp_mode =3D get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
> +    if (gatp_mode =3D=3D RISCV_IOMMU_DC_IOHGATP_MODE_BARE)
> +        goto out;
> +
> +    /* G stages translation tables root pointer */
> +    base =3D PPN_PHYS(get_field(ctx->gatp, RISCV_IOMMU_ATP_PPN_FIELD));
> +
> +    /* Start at step 0 */
> +    sc.step =3D 0;
> +
> +    if (s->fctl & RISCV_IOMMU_FCTL_GXL) {
> +        /* 32bit mode for GXL =3D=3D 1 */
> +        switch (gatp_mode) {
> +        case RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4:
> +            if (!(s->cap & RISCV_IOMMU_CAP_SV32X4)) {
> +                return MEMTX_ACCESS_ERROR;
> +            }
> +            sc.levels    =3D 2;
> +            sc.ptidxbits =3D 10;
> +            sc.ptesize   =3D 4;
> +            break;
> +        default:
> +            return MEMTX_ACCESS_ERROR;
> +        }
> +    } else {
> +        /* 64bit mode for GXL =3D=3D 0 */
> +        switch (gatp_mode) {
> +        case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
> +            if (!(s->cap & RISCV_IOMMU_CAP_SV39X4)) {
> +                return MEMTX_ACCESS_ERROR;
> +            }
> +            sc.levels    =3D 3;
> +            sc.ptidxbits =3D 9;
> +            sc.ptesize   =3D 8;
> +            break;
> +        case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
> +            if (!(s->cap & RISCV_IOMMU_CAP_SV48X4)) {
> +                return MEMTX_ACCESS_ERROR;
> +            }
> +            sc.levels    =3D 4;
> +            sc.ptidxbits =3D 9;
> +            sc.ptesize   =3D 8;
> +            break;
> +        case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
> +            if (!(s->cap & RISCV_IOMMU_CAP_SV57X4)) {
> +                return MEMTX_ACCESS_ERROR;
> +            }
> +            sc.levels    =3D 5;
> +            sc.ptidxbits =3D 9;
> +            sc.ptesize   =3D 8;
> +            break;
> +        default:
> +            return MEMTX_ACCESS_ERROR;
> +        }
> +    }
> +
> +    do {
> +        const unsigned va_bits =3D (sc.step ? 0 : 2) + sc.ptidxbits;
> +        const unsigned va_skip =3D TARGET_PAGE_BITS + sc.ptidxbits *
> +                                 (sc.levels - 1 - sc.step);
> +        const unsigned idx =3D (addr >> va_skip) & ((1 << va_bits) - 1);
> +        const dma_addr_t pte_addr =3D base + idx * sc.ptesize;
> +
> +        /* Address range check before first level lookup */
> +        if (!sc.step) {
> +            const uint64_t va_mask =3D (1ULL << (va_skip + va_bits)) - 1=
;
> +            if ((addr & va_mask) !=3D addr) {
> +                return MEMTX_ACCESS_ERROR;
> +            }
> +        }
> +
> +        /* Read page table entry */
> +        if (sc.ptesize =3D=3D 4) {
> +            uint32_t pte32 =3D 0;
> +            ret =3D ldl_le_dma(s->target_as, pte_addr, &pte32, attrs);
> +            pte =3D pte32;
> +        } else {
> +            ret =3D ldq_le_dma(s->target_as, pte_addr, &pte, attrs);
> +        }
> +        if (ret !=3D MEMTX_OK)
> +            return ret;
> +
> +        sc.step++;
> +        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
> +
> +        if (!(pte & PTE_V)) {
> +            return MEMTX_ACCESS_ERROR; /* Invalid PTE */
> +        } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
> +            base =3D PPN_PHYS(ppn); /* Inner PTE, continue walking */
> +        } else if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D PTE_W) {
> +            return MEMTX_ACCESS_ERROR; /* Reserved leaf PTE flags: PTE_W=
 */
> +        } else if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D (PTE_W | PTE_X=
)) {
> +            return MEMTX_ACCESS_ERROR; /* Reserved leaf PTE flags: PTE_W=
 + PTE_X */
> +        } else if (ppn & ((1ULL << (va_skip - TARGET_PAGE_BITS)) - 1)) {
> +            return MEMTX_ACCESS_ERROR; /* Misaligned PPN */
> +        } else {
> +            /* Leaf PTE, translation completed. */
> +            base =3D PPN_PHYS(ppn) | (addr & ((1ULL << va_skip) - 1));
> +            break;
> +        }
> +
> +        if (sc.step =3D=3D sc.levels) {
> +            return MEMTX_ACCESS_ERROR; /* Can't find leaf PTE */
> +        }
> +    } while (1);
> +
> +out:
> +    return dma_memory_read(s->target_as, base, buf, len, attrs);
> +}
> +
>  /*
>   * RISC-V IOMMU Device Context Loopkup - Device Directory Tree Walk
>   *
> @@ -1038,7 +1175,7 @@ static int riscv_iommu_ctx_fetch(RISCVIOMMUState *s=
, RISCVIOMMUContext *ctx)
>           */
>          const int split =3D depth * 9 + 8;
>          addr |=3D ((ctx->process_id >> split) << 3) & ~TARGET_PAGE_MASK;
> -        if (dma_memory_read(s->target_as, addr, &de, sizeof(de),
> +        if (pdt_memory_read(s, ctx, addr, &de, sizeof(de),
>                              MEMTXATTRS_UNSPECIFIED) !=3D MEMTX_OK) {
>              return RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT;
>          }
> @@ -1053,7 +1190,7 @@ static int riscv_iommu_ctx_fetch(RISCVIOMMUState *s=
, RISCVIOMMUContext *ctx)
>
>      /* Leaf entry in PDT */
>      addr |=3D (ctx->process_id << 4) & ~TARGET_PAGE_MASK;
> -    if (dma_memory_read(s->target_as, addr, &dc.ta, sizeof(uint64_t) * 2=
,
> +    if (pdt_memory_read(s, ctx, addr, &dc.ta, sizeof(uint64_t) * 2,
>                          MEMTXATTRS_UNSPECIFIED) !=3D MEMTX_OK) {
>          return RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT;
>      }
> --
> 2.40.1
>
>

