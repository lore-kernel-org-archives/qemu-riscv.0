Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osuJT-0007uO-PY
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 18:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osuJP-0007su-JX; Wed, 09 Nov 2022 18:16:54 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1osuJJ-0000aG-J1; Wed, 09 Nov 2022 18:16:49 -0500
Received: by mail-pf1-x429.google.com with SMTP id y13so147930pfp.7;
 Wed, 09 Nov 2022 15:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/5Ajgr8bEK2Fi1QYKyJLl0MR5fxbyi+cR57Kh2ovmz8=;
 b=QPywdRX14Ag/8fV4WI7L/HPGJ35I+R7Ckffx1+y33yY6uBJerz6wuZ8BgSuUzAncXW
 hjEC5yxQI3b0CSOxywUz9DWQ3bTyOca2H15Dsh9Nv75GDX2Zj55KxlEplkoPp4zXaEpg
 AX861kat/bXlztW/PIDl16m5dEGE/pBQiLCYAQkmjVh3aC/RVR/dIY+7EKChLOtaeZbe
 dtoL2PmM+N2eQ2GU2KaoZUowCXNW/EPCv5WPLJRBCfJe3IT7EPxXNAr7VLTa2RZ05wUD
 FhB9wCqUvgplj+W0o+RTKRQN+TUHppXls0l8IVFOIIMz9tXuu2Yyds2vyjk9D8IXwfoP
 CzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/5Ajgr8bEK2Fi1QYKyJLl0MR5fxbyi+cR57Kh2ovmz8=;
 b=d201Sd6ysrMSAsMidF9aPSaFYN7WhBnAoyNPW0K+DA3o0U8SukeFXJf0G2Z+d8G2ci
 SbfcVIUXYIOjw8hrNv75pdcLcn47+sPwcHWIHEqMl/dfh1GeM+3RJxEFiLAU3zwybOze
 sX684VK+mSznEs5F0PajBZKAxrwkVEbZ8TRrAZcXhkmZVnBofZgoNcVp4KfeIHLESmSG
 ysC/gxPvA3vEr3ubZQkpRxdL9e+56D5gfl0EqWQKe9r7KXVeYiIn6BsC3FZfEJDtgs4k
 VQxSOg0ggrixKYabveOjPeAaxWLRBrw1znmrn2SrpsIEQt6zXe7UNylnZPnGEiPVUGNy
 Z1fQ==
X-Gm-Message-State: ACrzQf1VnVKeD4j7WK6qGawdadrhQMv4fItSM75tlegcUIbJePCt2Nkx
 KS4hQmeO1w7+99aKkpArFxUvojk5K9b8WGQQvPo=
X-Google-Smtp-Source: AMsMyM7Wi6f1wrSBO/1m98GSqBzO8LeaZOVfevNtbeeB/IJ++cQEgfOpvCYw6kM768GU79zCzHp/eMUza68y8BW2TNQ=
X-Received: by 2002:a05:6a00:1a94:b0:56d:267e:a200 with SMTP id
 e20-20020a056a001a9400b0056d267ea200mr60074947pfv.13.1668035800594; Wed, 09
 Nov 2022 15:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-2-mchitale@ventanamicro.com>
In-Reply-To: <20221016124726.102129-2-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 09:16:14 +1000
Message-ID: <CAKmqyKMXns78zcgm806DBvdNo=nzV3rWaGvH=TVNAWt_gmsN3w@mail.gmail.com>
Subject: Re: [PATCH v11 1/5] target/riscv: Add smstateen support
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Wed, 09 Nov 2022 23:16:54 -0000

On Sun, Oct 16, 2022 at 10:51 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Smstateen extension specifies a mechanism to close
> the potential covert channels that could cause security issues.
>
> This patch adds the CSRs defined in the specification and
> the corresponding predicates and read/write functions.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h      |   4 +
>  target/riscv/cpu_bits.h |  37 +++++
>  target/riscv/csr.c      | 316 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/machine.c  |  21 +++
>  4 files changed, 378 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a9e25053f..040ed13675 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -366,6 +366,9 @@ struct CPUArchState {
>
>      /* CSRs for execution enviornment configuration */
>      uint64_t menvcfg;
> +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
>      target_ulong senvcfg;
>      uint64_t henvcfg;
>  #endif
> @@ -441,6 +444,7 @@ struct RISCVCPUConfig {
>      bool ext_ifencei;
>      bool ext_icsr;
>      bool ext_zihintpause;
> +    bool ext_smstateen;
>      bool ext_sstc;
>      bool ext_svinval;
>      bool ext_svnapot;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index d8f5f0abed..8b0d7e20ea 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -197,6 +197,12 @@
>  /* Supervisor Configuration CSRs */
>  #define CSR_SENVCFG         0x10A
>
> +/* Supervisor state CSRs */
> +#define CSR_SSTATEEN0       0x10C
> +#define CSR_SSTATEEN1       0x10D
> +#define CSR_SSTATEEN2       0x10E
> +#define CSR_SSTATEEN3       0x10F
> +
>  /* Supervisor Trap Handling */
>  #define CSR_SSCRATCH        0x140
>  #define CSR_SEPC            0x141
> @@ -244,6 +250,16 @@
>  #define CSR_HENVCFG         0x60A
>  #define CSR_HENVCFGH        0x61A
>
> +/* Hypervisor state CSRs */
> +#define CSR_HSTATEEN0       0x60C
> +#define CSR_HSTATEEN0H      0x61C
> +#define CSR_HSTATEEN1       0x60D
> +#define CSR_HSTATEEN1H      0x61D
> +#define CSR_HSTATEEN2       0x60E
> +#define CSR_HSTATEEN2H      0x61E
> +#define CSR_HSTATEEN3       0x60F
> +#define CSR_HSTATEEN3H      0x61F
> +
>  /* Virtual CSRs */
>  #define CSR_VSSTATUS        0x200
>  #define CSR_VSIE            0x204
> @@ -289,6 +305,27 @@
>  #define CSR_MENVCFG         0x30A
>  #define CSR_MENVCFGH        0x31A
>
> +/* Machine state CSRs */
> +#define CSR_MSTATEEN0       0x30C
> +#define CSR_MSTATEEN0H      0x31C
> +#define CSR_MSTATEEN1       0x30D
> +#define CSR_MSTATEEN1H      0x31D
> +#define CSR_MSTATEEN2       0x30E
> +#define CSR_MSTATEEN2H      0x31E
> +#define CSR_MSTATEEN3       0x30F
> +#define CSR_MSTATEEN3H      0x31F
> +
> +/* Common defines for all smstateen */
> +#define SMSTATEEN_MAX_COUNT 4
> +#define SMSTATEEN0_CS       (1ULL << 0)
> +#define SMSTATEEN0_FCSR     (1ULL << 1)
> +#define SMSTATEEN0_HSCONTXT (1ULL << 57)
> +#define SMSTATEEN0_IMSIC    (1ULL << 58)
> +#define SMSTATEEN0_AIA      (1ULL << 59)
> +#define SMSTATEEN0_SVSLCT   (1ULL << 60)
> +#define SMSTATEEN0_HSENVCFG (1ULL << 62)
> +#define SMSTATEEN_STATEEN   (1ULL << 63)
> +
>  /* Enhanced Physical Memory Protection (ePMP) */
>  #define CSR_MSECCFG         0x747
>  #define CSR_MSECCFGH        0x757
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..c861424e85 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -283,6 +283,72 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>      return umode(env, csrno);
>  }
>
> +static RISCVException mstateen(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return any(env, csrno);
> +}
> +
> +static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv < PRV_M) {
> +        if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    }
> +
> +    return hmode(env, csrno);
> +}
> +
> +static RISCVException hstateen(CPURISCVState *env, int csrno)
> +{
> +    return hstateen_pred(env, csrno, CSR_HSTATEEN0);
> +}
> +
> +static RISCVException hstateenh(CPURISCVState *env, int csrno)
> +{
> +    return hstateen_pred(env, csrno, CSR_HSTATEEN0H);
> +}
> +
> +static RISCVException sstateen(CPURISCVState *env, int csrno)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    int index = csrno - CSR_SSTATEEN0;
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv < PRV_M) {
> +        if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +
> +        if (virt) {
> +            if (!(env->hstateen[index] & SMSTATEEN_STATEEN)) {
> +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +            }
> +        }
> +    }
> +
> +    return smode(env, csrno);
> +}
> +
>  /* Checks if PointerMasking registers could be accessed */
>  static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>  {
> @@ -1861,6 +1927,197 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mstateen(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->mstateen[csrno - CSR_MSTATEEN0];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateen(CPURISCVState *env, int csrno,
> +                                     uint64_t wr_mask, target_ulong new_val)
> +{
> +    uint64_t *reg;
> +
> +    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +
> +    return write_mstateen(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_mstateen_1_3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
> +}
> +
> +static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
> +                                      target_ulong *val)
> +{
> +    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
> +                                      uint64_t wr_mask, target_ulong new_val)
> +{
> +    uint64_t *reg, val;
> +
> +    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> +    val = (uint64_t)new_val << 32;
> +    val |= *reg & 0xFFFFFFFF;
> +    *reg = (*reg & ~wr_mask) | (val & wr_mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +
> +    return write_mstateenh(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_mstateenh_1_3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
> +}
> +
> +static RISCVException read_hstateen(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    int index = csrno - CSR_HSTATEEN0;
> +
> +    *val = env->hstateen[index] & env->mstateen[index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateen(CPURISCVState *env, int csrno,
> +                                     uint64_t mask, target_ulong new_val)
> +{
> +    int index = csrno - CSR_HSTATEEN0;
> +    uint64_t *reg, wr_mask;
> +
> +    reg = &env->hstateen[index];
> +    wr_mask = env->mstateen[index] & mask;
> +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +
> +    return write_hstateen(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_hstateen_1_3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_hstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
> +}
> +
> +static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
> +                                     target_ulong *val)
> +{
> +    int index = csrno - CSR_HSTATEEN0H;
> +
> +    *val = (env->hstateen[index] >> 32) & (env->mstateen[index] >> 32);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
> +                                      uint64_t mask, target_ulong new_val)
> +{
> +    int index = csrno - CSR_HSTATEEN0H;
> +    uint64_t *reg, wr_mask, val;
> +
> +    reg = &env->hstateen[index];
> +    val = (uint64_t)new_val << 32;
> +    val |= *reg & 0xFFFFFFFF;
> +    wr_mask = env->mstateen[index] & mask;
> +    *reg = (*reg & ~wr_mask) | (val & wr_mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
> +                                       target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +
> +    return write_hstateenh(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_hstateenh_1_3(CPURISCVState *env, int csrno,
> +                                       target_ulong new_val)
> +{
> +    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN, new_val);
> +}
> +
> +static RISCVException read_sstateen(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    int index = csrno - CSR_SSTATEEN0;
> +
> +    *val = env->sstateen[index] & env->mstateen[index];
> +    if (virt) {
> +        *val &= env->hstateen[index];
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_sstateen(CPURISCVState *env, int csrno,
> +                                     uint64_t mask, target_ulong new_val)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    int index = csrno - CSR_SSTATEEN0;
> +    uint64_t wr_mask;
> +    uint64_t *reg;
> +
> +    wr_mask = env->mstateen[index] & mask;
> +    if (virt) {
> +        wr_mask &= env->hstateen[index];
> +    }
> +
> +    reg = &env->sstateen[index];
> +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> +
> +    return write_sstateen(env, csrno, wr_mask, new_val);
> +}
> +
> +static RISCVException write_sstateen_1_3(CPURISCVState *env, int csrno,
> +                                      target_ulong new_val)
> +{
> +    return write_sstateen(env, csrno, SMSTATEEN_STATEEN, new_val);
> +}
> +
>  static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>                                  uint64_t *ret_val,
>                                  uint64_t new_val, uint64_t wr_mask)
> @@ -3744,6 +4001,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
>                         .min_priv_ver = PRIV_VERSION_1_12_0              },
>
> +    /* Smstateen extension CSRs */
> +    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen, write_mstateen0,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
> +                          write_mstateen0h,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
> +                        write_mstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
> +                         write_mstateenh_1_3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
> +                        write_mstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
> +                         write_mstateenh_1_3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
> +                        write_mstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
> +                         write_mstateenh_1_3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen, write_hstateen0,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN0H] = { "hstateen0h", hstateenh, read_hstateenh,
> +                         write_hstateen0h,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
> +                        write_hstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN1H] = { "hstateen1h", hstateenh, read_hstateenh,
> +                         write_hstateenh_1_3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
> +                        write_hstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN2H] = { "hstateen2h", hstateenh, read_hstateenh,
> +                         write_hstateenh_1_3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
> +                        write_hstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_HSTATEEN3H] = { "hstateen3h", hstateenh, read_hstateenh,
> +                         write_hstateenh_1_3,
> +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen, write_sstateen0,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
> +                        write_sstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
> +                        write_sstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
> +                        write_sstateen_1_3,
> +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> +
>      /* Supervisor Trap Setup */
>      [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus,
>                           NULL,                read_sstatus_i128               },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c2a94a82b3..e687f9fce0 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -253,6 +253,26 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
>      return 0;
>  }
>
> +static bool smstateen_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +
> +    return cpu->cfg.ext_smstateen;
> +}
> +
> +static const VMStateDescription vmstate_smstateen = {
> +    .name = "cpu/smtateen",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = smstateen_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static bool envcfg_needed(void *opaque)
>  {
>      RISCVCPU *cpu = opaque;
> @@ -364,6 +384,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_kvmtimer,
>          &vmstate_envcfg,
>          &vmstate_debug,
> +        &vmstate_smstateen,
>          NULL
>      }
>  };
> --
> 2.25.1
>
>

