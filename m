Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paNFX-0001gu-K5
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 15:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNFW-0001gM-9A
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:52:30 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNFU-0000Vt-EF
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:52:30 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 o19-20020a056820041300b005259de79accso487139oou.9
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678395146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aJP/8UhwqLwlTR+Ea3fPOlo4gTdlp9lrpPkUSB+Nhw0=;
 b=XaUPtgocj3NOiwetMao9ocrLM4H7JaT3YuOFT+J/kITvauyjafGMbgfuHPR/6j8tv5
 TFKK9xpyZGdR+68HEHkU6c1oTwC/26Bk9bJj/iD2CnZLP3VKvQeOCiO2Rlhl7rLGbQt+
 zKni9u/6buq6BOXMF2XxWQ+kzIf2zisIumG7VRJBCADkZD6S6xW/ph6uaJlPk8gTGTY3
 maRqujRWhzzgmV38bmGwdGXkGvtki6fzZNgO4AVQICyW3r7Jax5mKEy3vBxZvf7pteub
 ZUuTIGWx/pbXgQiZIPmDw/LofkC7tNk0AW4blnUodGGH9GarzmuOE3JF1CKyuSUTi3SW
 vHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aJP/8UhwqLwlTR+Ea3fPOlo4gTdlp9lrpPkUSB+Nhw0=;
 b=g/Tw0D7hQEnxYUvGCoLP9i0zyhv0g7Xq1jIoujs39IeYLNd1YObpN4zyaOsxDyyfAF
 l4MyuQ9c4QB1/1jIel0BlFTDqdqy2DWrlSWc1zceSD4k4rzYRw8P51V+iUiP4w6volzf
 knWWLxn3qBn5DeXQQn1pwkJOgV016GjFK4TFfa6zYI5+g/pwvfUBo6j5pMkbn/nQlazj
 aWsiXOUj9Od+sLOuslKsBt+8mN0lLstUQgbvSISayq6ZEDQGMO8ykvcWoFT+pb2FdRLV
 DR6EWGcHwFjHQM3Q4+b5MOZHkTG+/e79s0332gI37nAjGbeKW9NFqzNF11JsJp4B+eOi
 +I5w==
X-Gm-Message-State: AO0yUKUPauNIWsZHBflG9Vd3CaqdVXYk0kTVedYuNkZw9XQPoD/KqQF5
 KgfBewoc+bd2S0EY4kqbOC96Bw==
X-Google-Smtp-Source: AK7set99do1l/H2S0GcG4kHyzC+VNO4yyN7uoo298SU71fxx0fxmwroYoHsMxsN1utttbJSP/N1qzw==
X-Received: by 2002:a4a:b4ca:0:b0:525:2f4b:db55 with SMTP id
 g10-20020a4ab4ca000000b005252f4bdb55mr11437301ooo.4.1678395146601; 
 Thu, 09 Mar 2023 12:52:26 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a4aaa0e000000b00525ccc4caadsm119444oom.4.2023.03.09.12.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:52:26 -0800 (PST)
Message-ID: <c3923bd0-2e8b-f6cd-f753-cf4b9b1b4e86@ventanamicro.com>
Date: Thu, 9 Mar 2023 17:52:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] target/riscv: Avoid env_archcpu() when reading
 RISCVCPUConfig
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230309071329.45932-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 20:52:30 -0000



On 3/9/23 04:13, Weiwei Li wrote:
> Use riscv_cpu_cfg(env) instead of env_archcpu().cfg.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c |  9 ++++-----
>   target/riscv/csr.c        | 40 ++++++++++++---------------------------
>   target/riscv/gdbstub.c    |  4 ++--
>   3 files changed, 18 insertions(+), 35 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..e677255f87 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -314,7 +314,6 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>                                       int extirq, unsigned int extirq_def_prio,
>                                       uint64_t pending, uint8_t *iprio)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
>       int irq, best_irq = RISCV_EXCP_NONE;
>       unsigned int prio, best_prio = UINT_MAX;
>   
> @@ -323,7 +322,8 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>       }
>   
>       irq = ctz64(pending);
> -    if (!((extirq == IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_ssaia)) {
> +    if (!((extirq == IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
> +                                  riscv_cpu_cfg(env)->ext_ssaia)) {
>           return irq;
>       }
>   
> @@ -765,7 +765,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
>       bool use_background = false;
>       hwaddr ppn;
> -    RISCVCPU *cpu = env_archcpu(env);
>       int napot_bits = 0;
>       target_ulong napot_mask;
>   
> @@ -946,7 +945,7 @@ restart:
>   
>           if (riscv_cpu_sxl(env) == MXL_RV32) {
>               ppn = pte >> PTE_PPN_SHIFT;
> -        } else if (pbmte || cpu->cfg.ext_svnapot) {
> +        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
>               ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>           } else {
>               ppn = pte >> PTE_PPN_SHIFT;
> @@ -1043,7 +1042,7 @@ restart:
>                  benefit. */
>               target_ulong vpn = addr >> PGSHIFT;
>   
> -            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> +            if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
>                   napot_bits = ctzl(ppn) + 1;
>                   if ((i != (levels - 1)) || (napot_bits != 4)) {
>                       return TRANSLATE_FAIL;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ab566639e5..b453d8e8ca 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -88,9 +88,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>   
>   static RISCVException vs(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (cpu->cfg.ext_zve32f) {
> +    if (riscv_cpu_cfg(env)->ext_zve32f) {
>   #if !defined(CONFIG_USER_ONLY)
>           if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>               return RISCV_EXCP_ILLEGAL_INST;
> @@ -193,9 +191,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
>   
>   static RISCVException sscofpmf(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_sscofpmf) {
> +    if (!riscv_cpu_cfg(env)->ext_sscofpmf) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -310,9 +306,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>   
>   static RISCVException mstateen(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -321,9 +315,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
>   
>   static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -390,10 +382,9 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>   
>   static RISCVException sstc(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
>       bool hmode_check = false;
>   
> -    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -1170,27 +1161,21 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
>   static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    *val = cpu->cfg.mvendorid;
> +    *val = riscv_cpu_cfg(env)->mvendorid;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_marchid(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    *val = cpu->cfg.marchid;
> +    *val = riscv_cpu_cfg(env)->marchid;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_mimpid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    *val = cpu->cfg.mimpid;
> +    *val = riscv_cpu_cfg(env)->mimpid;
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -1232,9 +1217,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>   
>   static bool validate_vm(CPURISCVState *env, target_ulong vm)
>   {
> -    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> -
> -    return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> +    return (vm & 0xf) <=
> +           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
>   }
>   
>   static RISCVException write_mstatus(CPURISCVState *env, int csrno,
> @@ -1897,7 +1881,7 @@ static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
>   static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>   {
> -    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
>       uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
> @@ -1920,7 +1904,7 @@ static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
>   static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>                                        target_ulong val)
>   {
> -    RISCVCPUConfig *cfg = &env_archcpu(env)->cfg;
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
>       uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                       (cfg->ext_sstc ? MENVCFG_STCE : 0) |
>                       (cfg->ext_svadu ? MENVCFG_HADE : 0);
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 6048541606..b2e08f1979 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -129,7 +129,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>   
>   static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>   {
> -    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
>       if (n < 32) {
>           int i;
>           int cnt = 0;
> @@ -145,7 +145,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>   
>   static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
>   {
> -    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint16_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
>       if (n < 32) {
>           int i;
>           for (i = 0; i < vlenb; i += 8) {

