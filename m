Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E100C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 13:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2tOT-0002Ss-LM; Tue, 14 Nov 2023 08:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2tOO-0002N2-BK
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 08:23:48 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2tOD-0000y5-SA
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 08:23:48 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc1e1e74beso50440165ad.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Nov 2023 05:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699968215; x=1700573015; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWILVPD+irM/Nn7ND6FQTnMUYsIg7wxVNkrRdqALoDs=;
 b=iTeLue8+4tp9IKoE7r/fCHHbj2BAazG2XSE6A4WcBDNDSqIctPmXmKu38cTTyf4gP3
 xRDzXpYn4AZ+7dfuSk5apXn3SKNmoHfi+CzC57QzjwrBfhv8Tv15WvDSojUVpmirRHJN
 OUKe4Re/3CK5YpWt2P5SR474reIflMZ7EzMNt/OajxgWB+NgwA/dvX/xNYTJAOtgev4V
 Viq3wKvLBQXfFhV1sz56W0+UpjKDu9wr2BqwrwzIqUgL6IwYinfOpGX6YJ9s9yGTBzmm
 W5o7LuG9fQix2L2xsRMEy5nPb2H18xa8hPpKKKnChhvtgP1r4zQOqaKLobMMqbJjrxHL
 vKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699968215; x=1700573015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DWILVPD+irM/Nn7ND6FQTnMUYsIg7wxVNkrRdqALoDs=;
 b=JEQ4DBlm/6fX5s0+VW2dVIlfierTUn/r222nnXToLjPVWVQ3A0Q1YIbXIEPoxoDh67
 xS8kp/iJyLkRoBiCbJC5sQKpbyaJpE3fC3LRR9qu7oXrYa4VzYxWexPGQitwKChwZIzO
 3oZnYE4ixApJUt79lwKKb2+KD8matrPJYuXRmPqaJDBQOcOMNBn5Nn4Poi2fBAAKQ3mo
 dxk4RG6NhjoO250ZOCp/8kMEF9gC2RHFNgFk1e4Q7ht0vty+IX9hE+GGUfo1av0+6YiO
 1rg66iVUeGCInpTuL9aXVZ5C3HVvi2PKt1RtPXtO2a7d9reKJ5bsO1mixVTdUnQhqPvY
 xa/w==
X-Gm-Message-State: AOJu0YxPDwu6VTb4ByLiSgy+N/xxBbAEfvlkc31cc2rrmH0Q465RxyYc
 9P9uAm/quqJ9cL7gFwDk7VHHdQ==
X-Google-Smtp-Source: AGHT+IGbK7GDlYWX7XPYKD8W/fsjZARvxx0T/TFhg8Aq8HHHEz1GOSO7LKv35raB2a4VhoNIBfBmlg==
X-Received: by 2002:a17:903:2a8c:b0:1ce:8e4:111 with SMTP id
 lv12-20020a1709032a8c00b001ce08e40111mr2962407plb.27.1699968215566; 
 Tue, 14 Nov 2023 05:23:35 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.148])
 by smtp.gmail.com with ESMTPSA id
 ji17-20020a170903325100b001c9c97beb9csm5654640plb.71.2023.11.14.05.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 05:23:35 -0800 (PST)
Message-ID: <dc9e8c57-e1b1-43ca-909b-a955f6910f49@ventanamicro.com>
Date: Tue, 14 Nov 2023 10:23:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] RISC-V: Add support for Ssdtso
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20231113095605.1131443-1-christoph.muellner@vrull.eu>
 <20231113095605.1131443-3-christoph.muellner@vrull.eu>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231113095605.1131443-3-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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



On 11/13/23 06:56, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> The Ssdtso extension introduces a DTSO field to the {m,s,h}envcfg
> register to enable TSO at run-time.  Building on top of Ztso support,
> this patch treates Ssdtso just like Ztso (always execute in TSO mode),

s/treates/treats

> which should be fine from a correctness perspective.
> 
> Similar like Ztso, this is expected to have little overhead on
> host machines that operate in TSO mode (e.g. x86).
> However, executing the TSO fences on guests without TSO, will
> have a negative performance impact, regardless if TSO is enabled
> in the guest or not (e.g. running a RV guest with Ssdtso and disabled
> DTSO bit on an aarch64 host).
> 
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c       | 2 ++
>   target/riscv/cpu_bits.h  | 3 +++
>   target/riscv/cpu_cfg.h   | 1 +
>   target/riscv/csr.c       | 9 ++++++---
>   target/riscv/translate.c | 2 +-
>   5 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b446e553b1..e01bc56471 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -149,6 +149,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> +    ISA_EXT_DATA_ENTRY(ssdtso, PRIV_VERSION_1_12_0, ext_ssdtso),
>       ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
>       ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> @@ -1308,6 +1309,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
>       MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
>       MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
> +    MULTI_EXT_CFG_BOOL("ssdtso", ext_ssdtso, false),
>       MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>   
>       MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ebd7917d49..166f1a879d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -751,6 +751,7 @@ typedef enum RISCVException {
>   #define MENVCFG_CBIE                       (3UL << 4)
>   #define MENVCFG_CBCFE                      BIT(6)
>   #define MENVCFG_CBZE                       BIT(7)
> +#define MENVCFG_DTSO                       BIT(8)
>   #define MENVCFG_ADUE                       (1ULL << 61)
>   #define MENVCFG_PBMTE                      (1ULL << 62)
>   #define MENVCFG_STCE                       (1ULL << 63)
> @@ -764,11 +765,13 @@ typedef enum RISCVException {
>   #define SENVCFG_CBIE                       MENVCFG_CBIE
>   #define SENVCFG_CBCFE                      MENVCFG_CBCFE
>   #define SENVCFG_CBZE                       MENVCFG_CBZE
> +#define SENVCFG_DTSO                       MENVCFG_DTSO
>   
>   #define HENVCFG_FIOM                       MENVCFG_FIOM
>   #define HENVCFG_CBIE                       MENVCFG_CBIE
>   #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>   #define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_DTSO                       MENVCFG_DTSO
>   #define HENVCFG_ADUE                       MENVCFG_ADUE
>   #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>   #define HENVCFG_STCE                       MENVCFG_STCE
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index a0f951d9c1..bdf0d2bbc4 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -72,6 +72,7 @@ struct RISCVCPUConfig {
>       bool ext_zihpm;
>       bool ext_ztso;
>       bool ext_smstateen;
> +    bool ext_ssdtso;
>       bool ext_sstc;
>       bool ext_svadu;
>       bool ext_svinval;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a53..ee40f01185 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2034,7 +2034,8 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>   {
>       const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
> -    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
> +    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
> +                    MENVCFG_CBZE | MENVCFG_DTSO;
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
> @@ -2084,7 +2085,8 @@ static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>   static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>   {
> -    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> +    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
> +                    SENVCFG_CBZE | SENVCFG_DTSO;
>       RISCVException ret;
>   
>       ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> @@ -2119,7 +2121,8 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>   static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>   {
> -    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
> +                    HENVCFG_CBZE | HENVCFG_DTSO;
>       RISCVException ret;
>   
>       ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index ab56051d6d..a9c2061099 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1196,7 +1196,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->cs = cs;
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> -    ctx->ztso = cpu->cfg.ext_ztso;
> +    ctx->ztso = cpu->cfg.ext_ztso || cpu->cfg.ext_ssdtso;
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>       ctx->zero = tcg_constant_tl(0);
>       ctx->virt_inst_excp = false;

