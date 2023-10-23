Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027D5C0032E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:11:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qukPa-000797-4p; Sun, 22 Oct 2023 22:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukPY-00078q-Il; Sun, 22 Oct 2023 22:11:20 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukPW-00006p-Bb; Sun, 22 Oct 2023 22:11:20 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-49b289adca9so990954e0c.3; 
 Sun, 22 Oct 2023 19:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698027077; x=1698631877; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HzMji1t22696VtL+3BK/jLCQMowgG2gT8gy70K16jo=;
 b=byPmh6rCCafPQe3W6eDnfF7ab39bs4zP34zwbniKzPS36VDtNtoJvP9D8YHY9Iir2w
 FNGlVUdh4EzAHjK9C+ZHX65rtLcQtwj9JMQvU3GfSgCL8NEBYpTSIQHFVtzGwXV0vJH3
 8vQXT1Yv9lEUYbevgMcFwEIBSQgnJiipJrky+6ubfSoevtJ1HvGhxuukirNSaRSNJZr3
 wT2SUFzu7dmWLI0at5Aq6TjLAr88dz5L8VQ9Hjw5Yi/uIkmR4mjCrapqwdLLC9otC2CY
 q0WAN1Ide11MBPNnfCIaR+FzCr9jjW6Y35tvAuzb5fVCbDL3aA6SNYWLXSCewcpNZdN1
 8WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698027077; x=1698631877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HzMji1t22696VtL+3BK/jLCQMowgG2gT8gy70K16jo=;
 b=iTFOeSUtj6qFhkcfpFpPR2Gi/HTJ/mxnNoV3PfnEdbIauJrI7VRP2IJ4NTXydmqYVV
 Nckx7bM1UnPi+ypDUpUVCNtyOv12mP1qD3dQPQEOxzljQYg6I+UsEeHcRWNfhZG0zCJl
 hiYk15tBhJPnzgJX8E8gt5pqp9Wv2lXtYmK+gEmEMjbI3bROo8Oyv5/uG+YRVtelVCyO
 f9zHv9tTtQutiDhD/kEj154i8/SZz6BFgyzkAYP1JwkhNrK2QmkLCX1yI/Le7i/MATVX
 gduKZta+BSslS+p0ka56z9WJzG41teYHOWcTG3WU+2h/rgWZWhLJzIeX1OSomlf15Tp6
 6ceA==
X-Gm-Message-State: AOJu0Yz0rxr48vEr8BADYEy/pGPT/PRhJMTA55sYVgh1DJvSUJprR43f
 1aCS1TxvT8+y59ULrJQuVShIS/FmsWpENvUuwGU=
X-Google-Smtp-Source: AGHT+IGPUZ327hd921rktskAppnin2cQkhYUMkp11sB8vj6Hrz9paeGoetSWicKQ6NTLhHQN9OjaekdNKOrpBM6YOk0=
X-Received: by 2002:a1f:2347:0:b0:4a4:156e:6bd9 with SMTP id
 j68-20020a1f2347000000b004a4156e6bd9mr6434805vkj.5.1698027076703; Sun, 22 Oct
 2023 19:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231019065546.1431579-1-mchitale@ventanamicro.com>
In-Reply-To: <20231019065546.1431579-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:10:50 +1000
Message-ID: <CAKmqyKOSNnNu9B5Q-O4zY6z_KTSqf4-K03Z7UvLQMv9EVKrS+w@mail.gmail.com>
Subject: Re: [PATCH v2] Add epmp to extensions list and rename it to smepmp
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Thu, Oct 19, 2023 at 4:56=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> From: Himanshu Chauhan <hchauhan@ventanamicro.com>
>
> Smepmp is a ratified extension which qemu refers to as epmp.
> Rename epmp to smepmp and add it to extension list so that
> it is added to the isa string.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in v2:
> =3D=3D=3D=3D
> - Rebase on latest riscv-to-apply.next
> - Remove ePMP version comment
>
>  target/riscv/cpu.c         |  8 +++-----
>  target/riscv/cpu_cfg.h     |  2 +-
>  target/riscv/csr.c         |  6 +++---
>  target/riscv/pmp.c         | 12 ++++++------
>  target/riscv/tcg/tcg-cpu.c |  4 ++--
>  5 files changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2f98ce56e06..dad167833cc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -133,7 +133,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> -    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, epmp),
> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>      ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>      ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>      ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> @@ -599,12 +599,11 @@ static void rv32_ibex_cpu_init(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
> -    cpu->cfg.epmp =3D true;
> -
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
> +    cpu->cfg.ext_smepmp =3D true;
>  }
>
>  static void rv32_imafcu_nommu_cpu_init(Object *obj)
> @@ -1257,6 +1256,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
>      MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>
> +    MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
>      MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
>      MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
>      MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
> @@ -1322,8 +1322,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[=
] =3D {
>
>  /* These are experimental so mark with 'x-' */
>  const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
> -    /* ePMP 0.9.3 */
> -    MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
>      MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
>      MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 208cac1c7c9..e7ce977189c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -102,6 +102,7 @@ struct RISCVCPUConfig {
>      bool ext_smaia;
>      bool ext_ssaia;
>      bool ext_sscofpmf;
> +    bool ext_smepmp;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
>
> @@ -134,7 +135,6 @@ struct RISCVCPUConfig {
>      uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
> -    bool epmp;
>      bool debug;
>      bool misa_w;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a5be1c202c3..f4e0a3962f0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -524,9 +524,9 @@ static RISCVException pmp(CPURISCVState *env, int csr=
no)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> -static RISCVException epmp(CPURISCVState *env, int csrno)
> +static RISCVException smepmp(CPURISCVState *env, int csrno)
>  {
> -    if (riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>          return RISCV_EXCP_NONE;
>      }
>
> @@ -4762,7 +4762,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
>
>      /* Physical Memory Protection */
> -    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
,
> +    [CSR_MSECCFG]    =3D { "mseccfg", smepmp, read_mseccfg, write_mseccf=
g,
>                           .min_priv_ver =3D PRIV_VERSION_1_11_0          =
 },
>      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
>      [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg =
 },
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 5e60c26031b..21d2489e27e 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -91,7 +91,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t =
pmp_index, uint8_t val)
>      if (pmp_index < MAX_RISCV_PMPS) {
>          bool locked =3D true;
>
> -        if (riscv_cpu_cfg(env)->epmp) {
> +        if (riscv_cpu_cfg(env)->ext_smepmp) {
>              /* mseccfg.RLB is set */
>              if (MSECCFG_RLB_ISSET(env)) {
>                  locked =3D false;
> @@ -340,9 +340,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>
>          /*
>           * Convert the PMP permissions to match the truth table in the
> -         * ePMP spec.
> +         * Smepmp spec.
>           */
> -        const uint8_t epmp_operation =3D
> +        const uint8_t smepmp_operation =3D
>              ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
>              ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
>              (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> @@ -367,7 +367,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>                   * If mseccfg.MML Bit set, do the enhanced pmp priv chec=
k
>                   */
>                  if (mode =3D=3D PRV_M) {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                      case 0:
>                      case 1:
>                      case 4:
> @@ -398,7 +398,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>                          g_assert_not_reached();
>                      }
>                  } else {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                      case 0:
>                      case 8:
>                      case 9:
> @@ -574,7 +574,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulo=
ng val)
>          }
>      }
>
> -    if (riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>          /* Sticky bits */
>          val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
>          if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index bbce254ee13..fce58d4375a 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -591,12 +591,12 @@ static bool tcg_cpu_realize(CPUState *cs, Error **e=
rrp)
>          return false;
>      }
>
> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> +    if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>          /*
>           * Enhanced PMP should only be available
>           * on harts with PMP support
>           */
> -        error_setg(errp, "Invalid configuration: EPMP requires PMP suppo=
rt");
> +        error_setg(errp, "Invalid configuration: Smepmp requires PMP sup=
port");
>          return false;
>      }
>
> --
> 2.34.1
>
>

