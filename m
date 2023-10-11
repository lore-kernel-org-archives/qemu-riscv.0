Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF0ECD98E6
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 03:16:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPhZ-0001CW-Pb; Tue, 10 Oct 2023 23:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPhX-00019C-Dv; Tue, 10 Oct 2023 23:15:59 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPhG-0004KY-AE; Tue, 10 Oct 2023 23:15:54 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49a99c43624so2278785e0c.2; 
 Tue, 10 Oct 2023 20:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696994140; x=1697598940; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CK2nr1gMYTvHNX2Eq3ipPyn2oJ3wjGRpjJ84BzG4+8Q=;
 b=SwrFZ9hQSEUuUFKA3rzc+JQ5psqbnj7w5NJAJ0ZKVKLkDfjaloykJTbHKRalxy4NWD
 eMGGicjuWuHz8Z3NkKF+T7FkvSpOF5mE00gIOsCvKDZa/tjDEismUmivYjXixh3yl0eE
 K6soGuSFolegAts45/89ybs+JyT1NwMBIH9XOhMO0BGxR/BW904t7NE6xMY27RtzZXSO
 FHW56e00BUEUeYgQf1N3uavJSPC0ISkWIQNsI9I6g4TJFDKeT4aaFma6SsS3LGzd5+2a
 Xd7Ym1V2STM45eOB41bFZrO7j2p5+oiKuQXV38lhE+oYUC3qHRzCPsyRoAde3tF2+Ca8
 WLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696994140; x=1697598940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CK2nr1gMYTvHNX2Eq3ipPyn2oJ3wjGRpjJ84BzG4+8Q=;
 b=V/JB/1HaxnmaeRRsuUgOvvc8GKkUSIjq1SlzYvMgNXYCNuTeaw/0jLSwvYL2MGUXTu
 TG0vHvfHFqJzDC3dcLqT5DS/Wo/pYa4nOgZJIuGV8vC0k8e122tkzgqGsB1ymPVUKtzx
 NtxvcbFuYngzm1mzayWFq7rmnqybEz1ulP8eTsnppMnk8LyQmYr7RpCJ2O3ciivxbzNG
 BLMFJe9linp5B2Dye7kjfLLiVUhB5y1EB+lUStKCAKtj0M6DdFj2OBoVw4SnnI5hdgCv
 /40Qm8QIY2N1UnEwpGo77W20YdVeddejhcqIqny4ze+HeoLKweQpcTR8IghsKIOWZMPR
 Pj9Q==
X-Gm-Message-State: AOJu0YxfqJiJvBr6aVwydX+1hJgA9mmsDpHwcoTZA92uk/zye0NH0zsZ
 Sc3yvJZRKTnFshnteER9eDpUoAxzifiPRUGXaAg=
X-Google-Smtp-Source: AGHT+IFW5z8OzmsKppErqraSoHkZIgZ2suwYkw0Mb+d7eHuhFOH7DWd+wE1pTP3PVOfg3JfJv8+t//B857IrAr768lQ=
X-Received: by 2002:a1f:c905:0:b0:49a:466c:199e with SMTP id
 z5-20020a1fc905000000b0049a466c199emr14618684vkf.2.1696994140512; Tue, 10 Oct
 2023 20:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230925110747.534238-1-mchitale@ventanamicro.com>
In-Reply-To: <20230925110747.534238-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 13:15:13 +1000
Message-ID: <CAKmqyKOPAG_ocV8ZPW6jpGhZTsPHZp-AbEBVskp78_Ty91JXKg@mail.gmail.com>
Subject: Re: [PATCH] Add epmp to extensions list and rename it to smepmp
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Mon, Sep 25, 2023 at 9:08=E2=80=AFPM Mayuresh Chitale
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
> ---
>  target/riscv/cpu.c |  9 +++++----
>  target/riscv/cpu.h |  2 +-
>  target/riscv/csr.c |  6 +++---
>  target/riscv/pmp.c | 12 ++++++------
>  4 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index befa64528f..0fb01788e7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -126,6 +126,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -488,7 +489,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
> -    cpu->cfg.epmp =3D true;
> +    cpu->cfg.ext_smepmp =3D true;
>  }
>
>  static void rv32_imafcu_nommu_cpu_init(Object *obj)
> @@ -1198,12 +1199,12 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)
>          }
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
>          return;
>      }
>
> @@ -1560,7 +1561,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
>
>      /* ePMP 0.9.3 */

Can you remove this comment?

Alistair

> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de7e43126a..9b4b012896 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -434,6 +434,7 @@ struct RISCVCPUConfig {
>      bool ext_zvfh;
>      bool ext_zvfhmin;
>      bool ext_smaia;
> +    bool ext_smepmp;
>      bool ext_ssaia;
>      bool ext_sscofpmf;
>      bool rvv_ta_all_1s;
> @@ -468,7 +469,6 @@ struct RISCVCPUConfig {
>      uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
> -    bool epmp;
>      bool debug;
>      bool misa_w;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..d9ecc222e7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -519,9 +519,9 @@ static RISCVException pmp(CPURISCVState *env, int csr=
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
> @@ -4337,7 +4337,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
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
> index 1f5aca42e8..f498e414f0 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t =
pmp_index, uint8_t val)
>      if (pmp_index < MAX_RISCV_PMPS) {
>          bool locked =3D true;
>
> -        if (riscv_cpu_cfg(env)->epmp) {
> +        if (riscv_cpu_cfg(env)->ext_smepmp) {
>              /* mseccfg.RLB is set */
>              if (MSECCFG_RLB_ISSET(env)) {
>                  locked =3D false;
> @@ -243,7 +243,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState =
*env, target_ulong addr,
>  {
>      bool ret;
>
> -    if (riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>          if (MSECCFG_MMWP_ISSET(env)) {
>              /*
>               * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
> @@ -354,9 +354,9 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulo=
ng addr,
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
> @@ -381,7 +381,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulo=
ng addr,
>                   * If mseccfg.MML Bit set, do the enhanced pmp priv chec=
k
>                   */
>                  if (mode =3D=3D PRV_M) {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                      case 0:
>                      case 1:
>                      case 4:
> @@ -412,7 +412,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulo=
ng addr,
>                          g_assert_not_reached();
>                      }
>                  } else {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                      case 0:
>                      case 8:
>                      case 9:
> --
> 2.34.1
>
>

