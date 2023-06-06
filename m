Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBF1C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6XTx-0003Jd-ND; Tue, 06 Jun 2023 10:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6XTt-0003Gz-4I
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:16:17 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6XTr-0006TZ-6H
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:16:16 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-19f22575d89so3387742fac.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686060974; x=1688652974;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vLtExC+Ko+jKEwW3AfIDuf2P237VUvIOZLryabTIJuc=;
 b=PmUCdShmpAlCGcqig3AwkaD8aDwqVSjhbf27TLRluzD43nnhIZMSw6heIoZU1XzOCN
 RPYb1FAtWmJYUsQ9S0UeJs51QNjZdMAc65xQdI2k2Uw38YuWElWV1uDcyH5f/8VhbSCP
 Z4cMQZejI93xB694EsCzvq621l9Ns8tIKFaqMo58vBIynZt7jMtQv8jzxk4KFGxaD1/S
 0856Q/NXoWbhEROfs6lLVSkdZfqmpC4AMP/NfRJkvi/M0iV47S2PDDd4CC5Mro3arSxM
 IMjlPLMS+wZk7Jtxxb1Nn+6Bp8ME4CBE4oBupDK3J1DtefB/XxZZm58tfoQN8B9tE0Ne
 Efmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060974; x=1688652974;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLtExC+Ko+jKEwW3AfIDuf2P237VUvIOZLryabTIJuc=;
 b=Gz2wDUo62cQLAZrWNO+vD8tNrzjiTb7BgQmR6wctNMmRwW10C0Ea8qUtXi7QGLMwFA
 BRiJrVgeyxql7EaSIhOi2u0M6roHCoPUPw5tuv+Do2fKIKdWCkrefgz4NskQJR8v7+px
 MU3zG3IHzSAqDY/hdgkeDqarTxvi1mhLyUysGkZREAF/ug2/Q0VtW+HkOK4z0xTRNp6t
 i+u61GhSEJQXXrePRgaQ9OaKJw87USlOgzSbuK2M2V6sCaDjmEjl6QcM66pJw/9li+SE
 1Ro1bsaiWS+/46mP+Mqw1d9u0dA5D1zwcojLtswij+4Mo7ttBGOEESLqZpCRXX0ZbhrX
 fSQw==
X-Gm-Message-State: AC+VfDynuyH93M1wb2HhCnUFWxnMY2h+0FcrgnKDbY52WIqvBwmfkV6N
 4PufVOuok+blkOKxxwdZgWvBSSniVFFR3jcO6/M=
X-Google-Smtp-Source: ACHHUZ7IqDxVkcFf1kLVc0JxY8RJFXd9qJybyGB+O3RV1TpTehk+ZmM4ETpnZSeWjFn9iFrgeS6zCw==
X-Received: by 2002:a05:6870:4ec:b0:18e:a4b9:8388 with SMTP id
 u44-20020a05687004ec00b0018ea4b98388mr1167636oam.48.1686060973779; 
 Tue, 06 Jun 2023 07:16:13 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056871054100b0019e4fe93d72sm4775525oal.42.2023.06.06.07.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:16:13 -0700 (PDT)
Message-ID: <b3013d96-f27d-5019-6e3f-98ce55ab9adf@ventanamicro.com>
Date: Tue, 6 Jun 2023 11:16:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Add epmp to extensions list and rename it to smepmp
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230606113812.519723-1-hchauhan@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230606113812.519723-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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



On 6/6/23 08:38, Himanshu Chauhan wrote:
> Smepmp is a ratified extension which qemu refers to as epmp.
> Rename epmp to smepmp and add it to extension list so that
> it is added to the isa string.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c     |  9 +++++----
>   target/riscv/cpu_cfg.h |  2 +-
>   target/riscv/csr.c     |  6 +++---
>   target/riscv/pmp.c     | 12 ++++++------
>   4 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..cf3d1c3207 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,6 +127,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>       ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>       ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -547,7 +548,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
>   #endif
> -    cpu->cfg.epmp = true;
> +    cpu->cfg.ext_smepmp = true;
>   
>       /* inherited from parent obj via riscv_cpu_init() */
>       cpu->cfg.ext_ifencei = true;
> @@ -1336,12 +1337,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> +    if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
>            * on harts with PMP support
>            */
> -        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> +        error_setg(errp, "Invalid configuration: SMEPMP requires PMP support");
>           return;
>       }
>   
> @@ -1676,7 +1677,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>   
>       /* ePMP 0.9.3 */
> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>   
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..d79b022e35 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -87,6 +87,7 @@ struct RISCVCPUConfig {
>       bool ext_zvfh;
>       bool ext_zvfhmin;
>       bool ext_smaia;
> +    bool ext_smepmp;
>       bool ext_ssaia;
>       bool ext_sscofpmf;
>       bool rvv_ta_all_1s;
> @@ -121,7 +122,6 @@ struct RISCVCPUConfig {
>       uint16_t cboz_blocksize;
>       bool mmu;
>       bool pmp;
> -    bool epmp;
>       bool debug;
>       bool misa_w;
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 58499b5afc..d9bc591348 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -523,9 +523,9 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
>       return RISCV_EXCP_ILLEGAL_INST;
>   }
>   
> -static RISCVException epmp(CPURISCVState *env, int csrno)
> +static RISCVException smepmp(CPURISCVState *env, int csrno)
>   {
> -    if (riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>           return RISCV_EXCP_NONE;
>       }
>   
> @@ -4356,7 +4356,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
>   
>       /* Physical Memory Protection */
> -    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
> +    [CSR_MSECCFG]    = { "mseccfg", smepmp, read_mseccfg, write_mseccfg,
>                            .min_priv_ver = PRIV_VERSION_1_11_0           },
>       [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
>       [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 418738afd8..18246e1737 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -87,7 +87,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>       if (pmp_index < MAX_RISCV_PMPS) {
>           bool locked = true;
>   
> -        if (riscv_cpu_cfg(env)->epmp) {
> +        if (riscv_cpu_cfg(env)->ext_smepmp) {
>               /* mseccfg.RLB is set */
>               if (MSECCFG_RLB_ISSET(env)) {
>                   locked = false;
> @@ -337,9 +337,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>   
>           /*
>            * Convert the PMP permissions to match the truth table in the
> -         * ePMP spec.
> +         * SMEPMP spec.
>            */
> -        const uint8_t epmp_operation =
> +        const uint8_t smepmp_operation =
>               ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
>               ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
>               (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> @@ -364,7 +364,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                    * If mseccfg.MML Bit set, do the enhanced pmp priv check
>                    */
>                   if (mode == PRV_M) {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                       case 0:
>                       case 1:
>                       case 4:
> @@ -395,7 +395,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                           g_assert_not_reached();
>                       }
>                   } else {
> -                    switch (epmp_operation) {
> +                    switch (smepmp_operation) {
>                       case 0:
>                       case 8:
>                       case 9:
> @@ -576,7 +576,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
>           }
>       }
>   
> -    if (riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
>           /* Sticky bits */
>           val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
>           if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {

