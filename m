Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F173DCDE008
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 02:43:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcwXN-0008AT-2S; Thu, 25 Jun 2026 22:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcwXK-00085F-1l
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 22:43:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcwXH-0006sc-9E
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 22:43:21 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-69531108f25so818445a12.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 19:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782441797; cv=none;
 d=google.com; s=arc-20260327;
 b=fbOS9j5jl65TOqvOI5RRoC0s+DWdxINsoXGOxfBm5cU59Ul59DIDMUE0hA8FFUoT04
 mbs0uFNurIDuh/PC1i5LFl4sBtUnaKkDhuOwxSVSeKbHftvwlDOtB1W+10zR/TrfP0mC
 JMGRztjC8DRpd0bGb5fnBlRcsHiFys22CXACeCI/YlYXEEwKIR0wm+GJli2lcew7CAbl
 K/ZfVo/+a50r1j0R8TbWy/8EpZs9XkYx3avwQY88ULWvOPzQjTxBiMSygb/7l2P4rNIL
 UJbi2aQ+1DW+jqsnq0rSYL+x4uC5UOIdW0Fy5V8wqRMuiB+imedvJM0zzuiQQm902Pm4
 jqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=43esxI9pVdBxQp9ERXXTTZ3uV/g2KXmFaB9fDn9bWLo=;
 fh=mOFwXTm9B+qV53yXtnSQeypvX6H/N6NQoVwFphwn4fY=;
 b=QfbqDHi1MAi9a+r+0cY+I9NyGtFW+QkdL92YFEVPOri4yW4MoTFAbZ2Evhv6vLofaz
 ndrKc4Z+ooSCBLgHfvPRO1QmqeeX9ONzmyfkt1uLGUKnR22ICvj6WHh3DiXP1k/ykqxo
 4ZDpS/vGLCuVfPBYSerN9nFLmSu1sgncgyH3JZFnDDWKfJ+vRwzg60RUEKfu/n4SnYHN
 StIS/wTp1Gdsxg4tB0QR+y1Ta8qsOaTZbiCKfYaZScJYGbChOKY8ff8s6Wkpjblq8/H2
 XprzU2EoZ7vHSnbfTB4Ylpwb9tJqwMmo99pjdKwz5jNn5jUXg7ZNts22piOKc8XYEkyL
 ML+g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782441797; x=1783046597; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43esxI9pVdBxQp9ERXXTTZ3uV/g2KXmFaB9fDn9bWLo=;
 b=Tm2U7Jz3zZFNe7WOILMEHOuyI/AGygXxWW+ApJHwmezPuB8IbGNlffGvam972zQB74
 tGtklcuxM8s3vPvlGIAPRMMyx18IYThcmBmwTZOAHffa7Pro2TPDOn30sPVenYK13MT7
 05UkOvVe22TzsTaMcW7VB0L+s/PQkSG3/aOXBrLUgoq6ELjMZ3RY6MN9A90gm/BOttZg
 5EncJSwVr7aY56HGwsnChBW8EkIJJt/2covNR9OvyIi+kcBT6kAT7VFbawDDFjlB8Ps3
 PFioXM2g8G6NezBdaeLi2LNwXW0TFFPpazPMDLmmd/NRy+TfuPEaYMj8/uVOlCixa0GE
 WrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782441797; x=1783046597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=43esxI9pVdBxQp9ERXXTTZ3uV/g2KXmFaB9fDn9bWLo=;
 b=iz/BTaDZ0GMl0NaEUOl9136E80QGb6qY8J98dmJpOHD1HZDoz0Kll3l+phFw1xzif8
 ATJW+xhNsd3Fwg24Y87IUcYYKG3Bx8+Q7m0fcfKPQRnyg8z3VBp/XhyOt30FAQR0KGDI
 GR0K0jwJ1jKOTk7bUafLZZxfy+6aXKxoK3LyzAsU0q/zzS7XlcsWNKheS4o9u4y7tXJE
 I6rz1s0CVSspIn6pkMkXETtTGPT/EQ6dLmyf8HB0SgUc361ZnPrvbwJ07sjbqwyvmwKw
 iERznT5YAmCY8ji4c2eqfweAj6uWYRSU/dNJm/WgitmIzi5DybiABNbL0q+VDBNkTeDH
 a4Eg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqpZfNt0a6UwVBQs/cN7SFWx6AP9zoGOcLQjr/4EDqnZOLyxLc7TuOFagCMiytUw7/um1PUcMQGkh3A@nongnu.org
X-Gm-Message-State: AOJu0YxiishwKVJT1zT071NIeW8PcUNdM3w5sNtwUyNMDIxGzjXxqNvl
 zFYnpkqOLXMWnoF86bj982qI0Je4lm50Np2eE8Vw7HS/qCOSvNhTSi76AI8BhEK2URIpKyBfd07
 c4ayr128H3q5pStyXvDuXOYtk8uG+ayQ=
X-Gm-Gg: AfdE7ckt8gFW9piYKQq9wao2gP0jtCKE28QO8vQGVDFfypc2rCKSsW+y95sh49OE6DJ
 +BEL37UwHJ7I6gMnde4Lbx4Z7lDAhO5uiIXoUMSU+arLBjMPWNWn3x8RRH51/F/1rCvCR6z9iIQ
 iMAFZVEsmZcDz/B215JbCYZvXqEF9LltXE7S3nC+gw1xicfgDYwmvcMk5vER+bXHCGzGGsE3zJC
 LV1yZzT107o4708JU3bnOEjql/w7kap+SKRT1TbXoeNuJTP9QR0TFfC3VEl4E0+dF9+iVZd3pN/
 ghnCcUmCq45H16+Y+ccdawvfqOg=
X-Received: by 2002:a17:906:e108:10b0:c12:29a3:e348 with SMTP id
 a640c23a62f3a-c1229a3eca4mr14479566b.27.1782441797138; Thu, 25 Jun 2026
 19:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260625210833.3294437-1-daniel.barboza@oss.qualcomm.com>
 <20260625210833.3294437-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260625210833.3294437-2-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 12:42:49 +1000
X-Gm-Features: AVVi8CddITHGUyNrtslg6isJ2_9Hlj3Fdcf_q-odT71nfhlFJkI3gJmf-nNALHY
Message-ID: <CAKmqyKPJq==XhCFv7ZEPoN=sTjgr636cusKECS88gmUQM_J3Lg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv/riscv-iommu: rename regs_rw to regs
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
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

On Fri, Jun 26, 2026 at 7:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The existing nomenclature can be misleading: regs_rw can cosplay as
> 'read and write' mask, in particular because we have regs_ro which is a
> read only mask.
>
> regs_rw is the current reg value, and all bits that aren't on the
> regs_ro mask is considered r/w bits.
>
> Rename regs_rw to 'regs' to be on par with the nomenclature other
> devices uses (e.g. cadence_gem).
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu-hpm.c |  4 ++--
>  hw/riscv/riscv-iommu.c     | 36 ++++++++++++++++++------------------
>  hw/riscv/riscv-iommu.h     | 26 +++++++++++++++-----------
>  3 files changed, 35 insertions(+), 31 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu-hpm.c b/hw/riscv/riscv-iommu-hpm.c
> index 5bf80a8db9..9bfef6db45 100644
> --- a/hw/riscv/riscv-iommu-hpm.c
> +++ b/hw/riscv/riscv-iommu-hpm.c
> @@ -60,8 +60,8 @@ static void hpm_incr_ctr(RISCVIOMMUState *s, uint32_t c=
tr_idx)
>      const uint32_t off =3D ctr_idx << 3;
>      uint64_t cntr_val;
>
> -    cntr_val =3D ldq_le_p(&s->regs_rw[RISCV_IOMMU_REG_IOHPMCTR_BASE + of=
f]);
> -    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_IOHPMCTR_BASE + off], cntr_val =
+ 1);
> +    cntr_val =3D ldq_le_p(&s->regs[RISCV_IOMMU_REG_IOHPMCTR_BASE + off])=
;
> +    stq_le_p(&s->regs[RISCV_IOMMU_REG_IOHPMCTR_BASE + off], cntr_val + 1=
);
>
>      trace_riscv_iommu_hpm_incr_ctr(cntr_val);
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index a500cb8440..30f16b999c 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2034,8 +2034,8 @@ static void riscv_iommu_process_cq_control(RISCVIOM=
MUState *s)
>          s->cq_mask =3D (2ULL << get_field(base, RISCV_IOMMU_CQB_LOG2SZ))=
 - 1;
>          s->cq_addr =3D PPN_PHYS(get_field(base, RISCV_IOMMU_CQB_PPN));
>          stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_CQT], ~s->cq_mask);
> -        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_CQH], 0);
> -        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_CQT], 0);
> +        stl_le_p(&s->regs[RISCV_IOMMU_REG_CQH], 0);
> +        stl_le_p(&s->regs[RISCV_IOMMU_REG_CQT], 0);
>          ctrl_set =3D RISCV_IOMMU_CQCSR_CQON;
>          ctrl_clr =3D RISCV_IOMMU_CQCSR_BUSY | RISCV_IOMMU_CQCSR_CQMF |
>                     RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_CMD_TO =
|
> @@ -2075,8 +2075,8 @@ static void riscv_iommu_process_fq_control(RISCVIOM=
MUState *s)
>          s->fq_mask =3D (2ULL << get_field(base, RISCV_IOMMU_FQB_LOG2SZ))=
 - 1;
>          s->fq_addr =3D PPN_PHYS(get_field(base, RISCV_IOMMU_FQB_PPN));
>          stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_FQH], ~s->fq_mask);
> -        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_FQH], 0);
> -        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_FQT], 0);
> +        stl_le_p(&s->regs[RISCV_IOMMU_REG_FQH], 0);
> +        stl_le_p(&s->regs[RISCV_IOMMU_REG_FQT], 0);
>          ctrl_set =3D RISCV_IOMMU_FQCSR_FQON;
>          ctrl_clr =3D RISCV_IOMMU_FQCSR_BUSY | RISCV_IOMMU_FQCSR_FQMF |
>              RISCV_IOMMU_FQCSR_FQOF;
> @@ -2105,8 +2105,8 @@ static void riscv_iommu_process_pq_control(RISCVIOM=
MUState *s)
>          s->pq_mask =3D (2ULL << get_field(base, RISCV_IOMMU_PQB_LOG2SZ))=
 - 1;
>          s->pq_addr =3D PPN_PHYS(get_field(base, RISCV_IOMMU_PQB_PPN));
>          stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_PQH], ~s->pq_mask);
> -        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_PQH], 0);
> -        stl_le_p(&s->regs_rw[RISCV_IOMMU_REG_PQT], 0);
> +        stl_le_p(&s->regs[RISCV_IOMMU_REG_PQH], 0);
> +        stl_le_p(&s->regs[RISCV_IOMMU_REG_PQT], 0);
>          ctrl_set =3D RISCV_IOMMU_PQCSR_PQON;
>          ctrl_clr =3D RISCV_IOMMU_PQCSR_BUSY | RISCV_IOMMU_PQCSR_PQMF |
>              RISCV_IOMMU_PQCSR_PQOF;
> @@ -2276,9 +2276,9 @@ static void riscv_iommu_write_reg_val(RISCVIOMMUSta=
te *s,
>  {
>      uint64_t ro =3D ldn_le_p(&s->regs_ro[reg_addr], size);
>      uint64_t wc =3D ldn_le_p(&s->regs_wc[reg_addr], size);
> -    uint64_t rw =3D ldn_le_p(&s->regs_rw[reg_addr], size);
> +    uint64_t curr_val =3D ldn_le_p(&s->regs[reg_addr], size);
>
> -    stn_le_p(dest, size, ((rw & ro) | (data & ~ro)) & ~(data & wc));
> +    stn_le_p(dest, size, ((curr_val & ro) | (data & ~ro)) & ~(data & wc)=
);
>  }
>
>  static MemTxResult riscv_iommu_mmio_write(void *opaque, hwaddr addr,
> @@ -2378,12 +2378,12 @@ static MemTxResult riscv_iommu_mmio_write(void *o=
paque, hwaddr addr,
>       * is set IOMMU behavior of additional writes to the register
>       * is UNSPECIFIED.
>       */
> -    riscv_iommu_write_reg_val(s, &s->regs_rw[addr], addr, size, data);
> +    riscv_iommu_write_reg_val(s, &s->regs[addr], addr, size, data);
>
>      /* Busy flag update, MSB 4-byte register. */
>      if (busy) {
> -        uint32_t rw =3D ldl_le_p(&s->regs_rw[regb]);
> -        stl_le_p(&s->regs_rw[regb], rw | busy);
> +        uint32_t rw =3D ldl_le_p(&s->regs[regb]);
> +        stl_le_p(&s->regs[regb], rw | busy);
>      }
>
>      /* Process HPM writes and update any internal state if needed. */
> @@ -2428,13 +2428,13 @@ static MemTxResult riscv_iommu_mmio_read(void *op=
aque, hwaddr addr,
>           * it's not dependent over the timer callback and is computed
>           * from cycle overflow.
>           */
> -        val =3D ldq_le_p(&s->regs_rw[addr]);
> +        val =3D ldq_le_p(&s->regs[addr]);
>          val |=3D (riscv_iommu_hpmcycle_read(s) & RISCV_IOMMU_IOHPMCYCLES=
_OVF)
>                     ? RISCV_IOMMU_IOCOUNTOVF_CY
>                     : 0;
>          ptr =3D (uint8_t *)&val + (addr & 3);
>      } else {
> -        ptr =3D &s->regs_rw[addr];
> +        ptr =3D &s->regs[addr];
>      }
>
>      val =3D ldn_le_p(ptr, size);
> @@ -2529,7 +2529,7 @@ static void riscv_iommu_instance_init(Object *obj)
>      s->cap |=3D RISCV_IOMMU_CAP_PD8;
>
>      /* register storage */
> -    s->regs_rw =3D g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
> +    s->regs =3D g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
>      s->regs_ro =3D g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
>      s->regs_wc =3D g_new0(uint8_t, RISCV_IOMMU_REG_SIZE);
>
> @@ -2554,7 +2554,7 @@ static void riscv_iommu_instance_finalize(Object *o=
bj)
>  {
>      RISCVIOMMUState *s =3D RISCV_IOMMU(obj);
>
> -    g_free(s->regs_rw);
> +    g_free(s->regs);
>      g_free(s->regs_ro);
>      g_free(s->regs_wc);
>
> @@ -2608,8 +2608,8 @@ static void riscv_iommu_realize(DeviceState *dev, E=
rror **errp)
>          "riscv-iommu-regs", RISCV_IOMMU_REG_SIZE);
>
>      /* Set power-on register state */
> -    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_CAP], s->cap);
> -    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_FCTL], 0);
> +    stq_le_p(&s->regs[RISCV_IOMMU_REG_CAP], s->cap);
> +    stq_le_p(&s->regs[RISCV_IOMMU_REG_FCTL], 0);
>      stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_FCTL],
>               ~(RISCV_IOMMU_FCTL_BE | RISCV_IOMMU_FCTL_WSI));
>      stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_DDTP],
> @@ -2634,7 +2634,7 @@ static void riscv_iommu_realize(DeviceState *dev, E=
rror **errp)
>          RISCV_IOMMU_PQCSR_BUSY);
>      stl_le_p(&s->regs_wc[RISCV_IOMMU_REG_IPSR], ~0);
>      stl_le_p(&s->regs_ro[RISCV_IOMMU_REG_ICVEC], 0);
> -    stq_le_p(&s->regs_rw[RISCV_IOMMU_REG_DDTP], s->ddtp);
> +    stq_le_p(&s->regs[RISCV_IOMMU_REG_DDTP], s->ddtp);
>      /* If debug registers enabled. */
>      if (s->cap & RISCV_IOMMU_CAP_DBG) {
>          stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_TR_REQ_IOVA], 0);
> diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
> index 2a9f6fccd5..a778e86fb7 100644
> --- a/hw/riscv/riscv-iommu.h
> +++ b/hw/riscv/riscv-iommu.h
> @@ -76,9 +76,13 @@ struct RISCVIOMMUState {
>
>      /* MMIO Hardware Interface */
>      MemoryRegion regs_mr;
> -    uint8_t *regs_rw;  /* register state (user write) */
> +    uint8_t *regs;  /* current register state */
>      uint8_t *regs_wc;  /* write-1-to-clear mask */
> -    uint8_t *regs_ro;  /* read-only mask */
> +    /*
> +     * read-only mask. NOTE: bits not present in this RO
> +     * mask are assumed to be read and write.
> +     */
> +    uint8_t *regs_ro;
>
>      QLIST_ENTRY(RISCVIOMMUState) iommus;
>      QLIST_HEAD(, RISCVIOMMUSpace) spaces;
> @@ -120,39 +124,39 @@ struct RISCVIOMMUContext {
>  static inline uint32_t riscv_iommu_reg_mod32(RISCVIOMMUState *s,
>      unsigned idx, uint32_t set, uint32_t clr)
>  {
> -    uint32_t val =3D ldl_le_p(s->regs_rw + idx);
> -    stl_le_p(s->regs_rw + idx, (val & ~clr) | set);
> +    uint32_t val =3D ldl_le_p(s->regs + idx);
> +    stl_le_p(s->regs + idx, (val & ~clr) | set);
>      return val;
>  }
>
>  static inline void riscv_iommu_reg_set32(RISCVIOMMUState *s, unsigned id=
x,
>                                           uint32_t set)
>  {
> -    stl_le_p(s->regs_rw + idx, set);
> +    stl_le_p(s->regs + idx, set);
>  }
>
>  static inline uint32_t riscv_iommu_reg_get32(RISCVIOMMUState *s, unsigne=
d idx)
>  {
> -    return ldl_le_p(s->regs_rw + idx);
> +    return ldl_le_p(s->regs + idx);
>  }
>
>  static inline uint64_t riscv_iommu_reg_mod64(RISCVIOMMUState *s, unsigne=
d idx,
>                                               uint64_t set, uint64_t clr)
>  {
> -    uint64_t val =3D ldq_le_p(s->regs_rw + idx);
> -    stq_le_p(s->regs_rw + idx, (val & ~clr) | set);
> +    uint64_t val =3D ldq_le_p(s->regs + idx);
> +    stq_le_p(s->regs + idx, (val & ~clr) | set);
>      return val;
>  }
>
>  static inline void riscv_iommu_reg_set64(RISCVIOMMUState *s, unsigned id=
x,
>                                           uint64_t set)
>  {
> -    stq_le_p(s->regs_rw + idx, set);
> +    stq_le_p(s->regs + idx, set);
>  }
>
>  static inline uint64_t riscv_iommu_reg_get64(RISCVIOMMUState *s,
> -    unsigned idx)
> +                                             unsigned idx)
>  {
> -    return ldq_le_p(s->regs_rw + idx);
> +    return ldq_le_p(s->regs + idx);
>  }
>  #endif
> --
> 2.43.0
>
>

