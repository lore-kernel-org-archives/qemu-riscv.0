Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44A6CD6E7E
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 15:35:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqbDV-00027X-OB; Wed, 11 Oct 2023 11:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qqbDT-00023v-6T
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 11:33:43 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1qqbDR-0000pl-9n
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 11:33:42 -0400
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-66cfc96f475so9461236d6.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697038420; x=1697643220; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vd5uOGBwjoP3rEIL4Sv4d5uXmg5VvO+pHyrZOATd7XI=;
 b=GJSWpjxf/s9O8/57/Eaz896ZmJobVcQZqx+LtS1JTbczoM+NSrWx9XBxUD/Ffedgak
 FAL3vCMYwNI/lskg70yBQvHAPhGe/M+b6g/rW6EgbXM6FFa+9PCuukmSWNPhbStSlLE7
 UChANSsZ8+zZ6DuSCP9llBI41FBsK0G4sOGHbi89Ns/JGX+FwivQNwMuhMU9/6jez6o1
 9y7+Gw8UEdeDTK3jHb7gbop46TvGqlKyvGXIASHz7xHZnWoa49EiHK4INBZqh7/wrLtU
 2A7lY9SUE7NTHFJV0z2FznG6X6yi++MzrJtzWdw5DGsr4H8KCKKKSJ/Rmsan2E7vRQ4L
 ySHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697038420; x=1697643220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vd5uOGBwjoP3rEIL4Sv4d5uXmg5VvO+pHyrZOATd7XI=;
 b=nKTOQS69PH6mDASbBSw7/lSopbyC/Q2lFy7aBbYHHmlovrBFJJxHZ6TPcaHCvcdQXk
 zeFESMcLEzP7jXDFzpUjrDkqPbSCTInz2xvQP/faWZGlX6xAjk1RiTjywB61tm7rMKWt
 HyeDJUSts4NzrHL6m5tG45weVUTHlUTy7RXHCEtPipXzq6fuuYHzXrnNxvYBUm9hYwFA
 alvwRjanb5bwDUCuxcJojOtYryt3B38XLzl/tmVB8eWzBZnQpf6rgXDw0iLLlLm51DfG
 Mf/ixtBDgEdRL5Z6474SEsTBICYdeMpZDMG0Fag/Ng8obN3xpBR6iL7jDRX5c0weTfWI
 hQbQ==
X-Gm-Message-State: AOJu0Yx3y/CZDteYQU4jXC/5s/tgKF+5hKJX+sl8kU/9r/r/IbuwimdN
 M99LhjdnzLjlNfMpHwIDZEEMJrgHXZdT/qxWrzdSZg==
X-Google-Smtp-Source: AGHT+IElL8PSWnliwjPd+4YFvXMejZ8lo4udfIlQYFHoinYx6L8EFCw+TIeumke5y4tjWouVM0HJoYFZLn+JJGC7msI=
X-Received: by 2002:a05:6214:2506:b0:66d:fa0:ab2f with SMTP id
 gf6-20020a056214250600b0066d0fa0ab2fmr1025620qvb.18.1697038419677; Wed, 11
 Oct 2023 08:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230925110747.534238-1-mchitale@ventanamicro.com>
 <CAKmqyKOPAG_ocV8ZPW6jpGhZTsPHZp-AbEBVskp78_Ty91JXKg@mail.gmail.com>
In-Reply-To: <CAKmqyKOPAG_ocV8ZPW6jpGhZTsPHZp-AbEBVskp78_Ty91JXKg@mail.gmail.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 11 Oct 2023 21:03:03 +0530
Message-ID: <CAN37VV70VK+nFzXg+GK745G0B9CcZktM=K74yUXhSU29RrRosA@mail.gmail.com>
Subject: Re: [PATCH] Add epmp to extensions list and rename it to smepmp
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qv1-xf36.google.com
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

On Wed, Oct 11, 2023 at 8:45=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Mon, Sep 25, 2023 at 9:08=E2=80=AFPM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> >
> > From: Himanshu Chauhan <hchauhan@ventanamicro.com>
> >
> > Smepmp is a ratified extension which qemu refers to as epmp.
> > Rename epmp to smepmp and add it to extension list so that
> > it is added to the isa string.
> >
> > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c |  9 +++++----
> >  target/riscv/cpu.h |  2 +-
> >  target/riscv/csr.c |  6 +++---
> >  target/riscv/pmp.c | 12 ++++++------
> >  4 files changed, 15 insertions(+), 14 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index befa64528f..0fb01788e7 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -126,6 +126,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
> >      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> >      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
> >      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
> >      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
> >      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> > @@ -488,7 +489,7 @@ static void rv32_ibex_cpu_init(Object *obj)
> >  #ifndef CONFIG_USER_ONLY
> >      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >  #endif
> > -    cpu->cfg.epmp =3D true;
> > +    cpu->cfg.ext_smepmp =3D true;
> >  }
> >
> >  static void rv32_imafcu_nommu_cpu_init(Object *obj)
> > @@ -1198,12 +1199,12 @@ static void riscv_cpu_realize(DeviceState *dev,=
 Error **errp)
> >          }
> >      }
> >
> > -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> > +    if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
> >          /*
> >           * Enhanced PMP should only be available
> >           * on harts with PMP support
> >           */
> > -        error_setg(errp, "Invalid configuration: EPMP requires PMP sup=
port");
> > +        error_setg(errp, "Invalid configuration: Smepmp requires PMP s=
upport");
> >          return;
> >      }
> >
> > @@ -1560,7 +1561,7 @@ static Property riscv_cpu_extensions[] =3D {
> >      DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
> >
> >      /* ePMP 0.9.3 */
>
> Can you remove this comment?
Ok.
>
> Alistair
>
> > -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> > +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
> >      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> >      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index de7e43126a..9b4b012896 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -434,6 +434,7 @@ struct RISCVCPUConfig {
> >      bool ext_zvfh;
> >      bool ext_zvfhmin;
> >      bool ext_smaia;
> > +    bool ext_smepmp;
> >      bool ext_ssaia;
> >      bool ext_sscofpmf;
> >      bool rvv_ta_all_1s;
> > @@ -468,7 +469,6 @@ struct RISCVCPUConfig {
> >      uint16_t cboz_blocksize;
> >      bool mmu;
> >      bool pmp;
> > -    bool epmp;
> >      bool debug;
> >      bool misa_w;
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 4451bd1263..d9ecc222e7 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -519,9 +519,9 @@ static RISCVException pmp(CPURISCVState *env, int c=
srno)
> >      return RISCV_EXCP_ILLEGAL_INST;
> >  }
> >
> > -static RISCVException epmp(CPURISCVState *env, int csrno)
> > +static RISCVException smepmp(CPURISCVState *env, int csrno)
> >  {
> > -    if (riscv_cpu_cfg(env)->epmp) {
> > +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> >          return RISCV_EXCP_NONE;
> >      }
> >
> > @@ -4337,7 +4337,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
> >      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rm=
w_vsiph },
> >
> >      /* Physical Memory Protection */
> > -    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_msecc=
fg,
> > +    [CSR_MSECCFG]    =3D { "mseccfg", smepmp, read_mseccfg, write_msec=
cfg,
> >                           .min_priv_ver =3D PRIV_VERSION_1_11_0        =
   },
> >      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcf=
g  },
> >      [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcf=
g  },
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 1f5aca42e8..f498e414f0 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
> >      if (pmp_index < MAX_RISCV_PMPS) {
> >          bool locked =3D true;
> >
> > -        if (riscv_cpu_cfg(env)->epmp) {
> > +        if (riscv_cpu_cfg(env)->ext_smepmp) {
> >              /* mseccfg.RLB is set */
> >              if (MSECCFG_RLB_ISSET(env)) {
> >                  locked =3D false;
> > @@ -243,7 +243,7 @@ static bool pmp_hart_has_privs_default(CPURISCVStat=
e *env, target_ulong addr,
> >  {
> >      bool ret;
> >
> > -    if (riscv_cpu_cfg(env)->epmp) {
> > +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> >          if (MSECCFG_MMWP_ISSET(env)) {
> >              /*
> >               * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> > @@ -354,9 +354,9 @@ int pmp_hart_has_privs(CPURISCVState *env, target_u=
long addr,
> >
> >          /*
> >           * Convert the PMP permissions to match the truth table in the
> > -         * ePMP spec.
> > +         * Smepmp spec.
> >           */
> > -        const uint8_t epmp_operation =3D
> > +        const uint8_t smepmp_operation =3D
> >              ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> >              ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> >              (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> > @@ -381,7 +381,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_u=
long addr,
> >                   * If mseccfg.MML Bit set, do the enhanced pmp priv ch=
eck
> >                   */
> >                  if (mode =3D=3D PRV_M) {
> > -                    switch (epmp_operation) {
> > +                    switch (smepmp_operation) {
> >                      case 0:
> >                      case 1:
> >                      case 4:
> > @@ -412,7 +412,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_u=
long addr,
> >                          g_assert_not_reached();
> >                      }
> >                  } else {
> > -                    switch (epmp_operation) {
> > +                    switch (smepmp_operation) {
> >                      case 0:
> >                      case 8:
> >                      case 9:
> > --
> > 2.34.1
> >
> >

