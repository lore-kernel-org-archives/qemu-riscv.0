Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83942C7EE37
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 19:47:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6ceA-0003Ie-Ap; Tue, 06 Jun 2023 15:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1q6ce5-0003Gm-JJ
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 15:47:11 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1q6ce3-00007L-JX
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 15:47:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b075e13a5eso57301375ad.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 12:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686080816; x=1688672816; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NV+OZMs6D87G1r9TAbScVDoH7fAKIH759q80yM8yV0I=;
 b=uWTj7WMW2Jdt5l1XhC4fJHAwmb6AnKyab0UxmzhrycJx9OcVI4OyGZgP6wiUGaaFMv
 SH1yrWZulYIkBb+sTUFwkLIDt0eB5QDANRrgBF/0t521+NPYlOQOR+RSpNXDUiXQoWWl
 w1BaJ938X135m4ZYuCY4oQbeLQ/t8Hwg4lt0AlqKokmSM+R6fy8ctkWLumoOXQSaKTiX
 MnY+SBZYSwzEJfKzsswseaKLOJ/oTZ0kY6WfAbkGR9HGZ4xJQELYd4zJWPmZbwq80iLh
 Zzq6EwmXDyK2gbBQNYf+8QavIrev0UpyfR4rxb7EZUYtlSGAlUjF9gLpobjHUgGN3zet
 v3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686080816; x=1688672816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NV+OZMs6D87G1r9TAbScVDoH7fAKIH759q80yM8yV0I=;
 b=WoidowMLUZ+8NmfO3AZkIlO/yDvhF46y4JJ3mpVoTdX7EKb08Dbo+RgZt1CMn4dwDc
 suViN6Ld5LnpFFcK6fjk6SAYl7iWtcDoY3fVPFQIlqw4A5E36x5Y5vD4umQDquHIYYfv
 BqI6UbKYDo64tEhF2h6Rg/EH0Q/ylBg7HIG+5bHURtu8IPTe+9662dRnwXoNG3/sx5Va
 pxXoBPynbbisKeEgUPJQFzQTz2JdGqfhWhUr/4VQJAte7KTzUfdGGepU74/k3pE410AG
 HWoW2OdA2IiNp6Qr1efdB7nRj764+CA2IfjjfrxlyYbBoIVDTqaadYERPdiRHm64m4e1
 CyVg==
X-Gm-Message-State: AC+VfDxxSZ4tYHPAI80lzLuggazZlq7MhYI7BFB8fSPgiO++iFk13UCx
 42OzeeJJ/EpWnEOIg4z5tQuVgfP46AbgMJeT6Xk8hg==
X-Google-Smtp-Source: ACHHUZ5aySdyvCSaWy7KHe8kX6c+uWcaxxh6XI7QfluJt7LlVobJidfPqLwdFCF3VkqkPXt0ns2Q/TVfZwYB6Xz7P4U=
X-Received: by 2002:a17:902:be14:b0:1b1:b111:dfe8 with SMTP id
 r20-20020a170902be1400b001b1b111dfe8mr3062734pls.66.1686080815794; Tue, 06
 Jun 2023 12:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230606113812.519723-1-hchauhan@ventanamicro.com>
In-Reply-To: <20230606113812.519723-1-hchauhan@ventanamicro.com>
From: =?UTF-8?B?TG/Dr2MgTGVmb3J0?= <loic@rivosinc.com>
Date: Tue, 6 Jun 2023 21:46:45 +0200
Message-ID: <CAGKm2NJGGF-ROU_Js8-pv5xsCadN=vPOAD4EXWnMiveEbu931A@mail.gmail.com>
Subject: Re: [PATCH] Add epmp to extensions list and rename it to smepmp
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=loic@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 6, 2023 at 1:39=E2=80=AFPM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Smepmp is a ratified extension which qemu refers to as epmp.
> Rename epmp to smepmp and add it to extension list so that
> it is added to the isa string.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/cpu.c     |  9 +++++----
>  target/riscv/cpu_cfg.h |  2 +-
>  target/riscv/csr.c     |  6 +++---
>  target/riscv/pmp.c     | 12 ++++++------
>  4 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..cf3d1c3207 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,6 +127,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -547,7 +548,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>  #endif
> -    cpu->cfg.epmp =3D true;
> +    cpu->cfg.ext_smepmp =3D true;
>
Should also update Ibex CPU to priv level 1.12 otherwise Smepmp will
be disabled since it is now declared PRIV_VERSION_1_12_0 in
isa_edata_arr.

>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_ifencei =3D true;
> @@ -1336,12 +1337,12 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)
>          return;
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
> +        error_setg(errp, "Invalid configuration: SMEPMP requires PMP sup=
port");
>          return;
>      }
Nitpick: the spec uses "Smepmp", not "SMEPMP".

>
> @@ -1676,7 +1677,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>
>      /* ePMP 0.9.3 */
> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>      DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>
You missed the comment update but maybe just move the definition next
to pmp and drop the comment since it's now ratified?

> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..d79b022e35 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -87,6 +87,7 @@ struct RISCVCPUConfig {
>      bool ext_zvfh;
>      bool ext_zvfhmin;
>      bool ext_smaia;
> +    bool ext_smepmp;
>      bool ext_ssaia;
>      bool ext_sscofpmf;
>      bool rvv_ta_all_1s;
> @@ -121,7 +122,6 @@ struct RISCVCPUConfig {
>      uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
> -    bool epmp;
>      bool debug;
>      bool misa_w;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 58499b5afc..d9bc591348 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -523,9 +523,9 @@ static RISCVException pmp(CPURISCVState *env, int csr=
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
> @@ -4356,7 +4356,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
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
> index 418738afd8..18246e1737 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -87,7 +87,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t =
pmp_index, uint8_t val)
>      if (pmp_index < MAX_RISCV_PMPS) {
>          bool locked =3D true;
>
> -        if (riscv_cpu_cfg(env)->epmp) {
> +        if (riscv_cpu_cfg(env)->ext_smepmp) {
>              /* mseccfg.RLB is set */
>              if (MSECCFG_RLB_ISSET(env)) {
>                  locked =3D false;
> @@ -337,9 +337,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>
>          /*
>           * Convert the PMP permissions to match the truth table in the
> -         * ePMP spec.
> +         * SMEPMP spec.
>           */
Smepmp

> -        const uint8_t epmp_operation =3D
> +        const uint8_t smepmp_operation =3D
>              ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
>              ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
>              (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> @@ -364,7 +364,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
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
> @@ -395,7 +395,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>                          g_assert_not_reached();
>                      }
>                  } else {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                      case 0:
>                      case 8:
>                      case 9:
> @@ -576,7 +576,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulo=
ng val)
>          }
>      }
>
> -    if (riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>          /* Sticky bits */
>          val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
>          if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
> --
> 2.34.1
>
>

