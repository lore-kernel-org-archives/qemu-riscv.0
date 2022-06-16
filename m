Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1jVP-0001QC-7L
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 03:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jVN-0001Pt-Hf; Thu, 16 Jun 2022 03:01:25 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jVL-0002ll-J1; Thu, 16 Jun 2022 03:01:25 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gd1so676333pjb.2;
 Thu, 16 Jun 2022 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tKpzASoEpaA6k5aE+Epp5cctzjlrTs6wloYw16NNys=;
 b=PULQE4OHGH+zoBsLQn+Yp5fpN/GsJ/T5TZkQiGfzXAKrQhAa4KlUPhdR90loT9bQdP
 o5t+mdccrtNiHLrorNj1XFdBulvB/2U8PmXxAypk7D94da1vyx3lhPgyBaI+lBcuwTt7
 EAm4LatVXgLW8qW+G6VZqYn40YOymKz102SrfI2sHe5fG9arr9g2LNrtEHA7NWB33haE
 a9aPYeWW1tFw5g2vjt0uXR/SHQWyJdH2wEeFdWWY43N888ZMBwacjQr0yiH4r0kxcU2A
 uL5v7bDBMDKtGq/iRY6kpXML/GONXO4LmFjPp5V4CO60ip5RRrczvZNvrpby9SUzi0YA
 s+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tKpzASoEpaA6k5aE+Epp5cctzjlrTs6wloYw16NNys=;
 b=hptfZhEB71c/vWunxGStkGCLurIJ1XNrg3oVNX2CtCesh7bSniOkfAloEHuxdOrk1Q
 P8zSGrbp6vMzixPi37VWaNn+pd0qNaNLwc/+llF8+Wp8OnW9LtgL3t4R7NPmWW/craPW
 byGD1bShQn2IhQpQuUvX3pgto8Pvl80+ZUIWVW2/1eiN3Fku7G9sbY9ltN/NB7t9UMHM
 pkv93v8EoSUIhYTUq4ODf3E1MA8L9Em9H5FqHa6kLfXakpZV/7QEI9kqSQ+MNDfIrKe5
 0fJlw0jpEsHNaN6F/plBUHboYzVFDxHVcOrOY9KrzQ9ixKvOaBmqoxniW0MgqZfqWTcQ
 ejhw==
X-Gm-Message-State: AJIora+U3rugnbwFMWs0WzK+jbfMGH1cau3TPrFIIMhw6oetvCosNKUt
 kMvUw4JQ4/IkNfv99s322zizJLCNsOu/zarqLcQ=
X-Google-Smtp-Source: AGRyM1sTggQmrh6LqhDKQ0UsxKtRUO3THs6cFMJAv35fFNFXAGmGXiDWecby95+r/x9BWfIbWEwfzs7plvdeOwJoABc=
X-Received: by 2002:a17:90b:3e85:b0:1e8:8f2f:bd2f with SMTP id
 rj5-20020a17090b3e8500b001e88f2fbd2fmr3528967pjb.120.1655362881808; Thu, 16
 Jun 2022 00:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-3-mchitale@ventanamicro.com>
In-Reply-To: <20220603160425.3667456-3-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 17:00:55 +1000
Message-ID: <CAKmqyKPF7L1UprKtV=nOo+fUtwD47FOhgUoQ-k-f6hsHh8jpgw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/4] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jun 2022 07:01:26 -0000

On Sat, Jun 4, 2022 at 2:16 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Accesses to henvcfg, henvcfgh and senvcfg are allowed
> only if corresponding bit in mstateen0/hstateen0 is
> enabled. Otherwise an illegal instruction trap is
> generated.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 324fefce59..ae91ae1f7e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>  }
>
>  /* Predicates */
> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    bool virt = riscv_cpu_virt_enabled(env);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    if (!(env->mstateen[0] & 1UL << bit)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (virt) {
> +        if (!(env->hstateen[0] & 1UL << bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    if (mode == PRV_U) {
> +        if (!(env->sstateen[0] & 1UL << bit)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    }
> +#endif
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -1557,6 +1588,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>  static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>      *val = env->senvcfg;
>      return RISCV_EXCP_NONE;
>  }
> @@ -1565,15 +1603,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
>      uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> +    RISCVException ret;
>
> -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>
> +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>      *val = env->henvcfg;
>      return RISCV_EXCP_NONE;
>  }
> @@ -1582,6 +1632,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
>      uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>
>      if (riscv_cpu_mxl(env) == MXL_RV64) {
>          mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> @@ -1595,6 +1651,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>  static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>      *val = env->henvcfg >> 32;
>      return RISCV_EXCP_NONE;
>  }
> @@ -1604,9 +1667,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>  {
>      uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>      uint64_t valh = (uint64_t)val << 32;
> +    RISCVException ret;
>
> -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> +    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>
> +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -1628,7 +1696,8 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
>                                       target_ulong new_val)
>  {
>      uint64_t *reg;
> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> +                       (1UL << SMSTATEEN0_HSENVCFG);
>
>      reg = &env->mstateen[csrno - CSR_MSTATEEN0];
>      write_smstateen(env, reg, wr_mask, new_val);
> @@ -1649,7 +1718,8 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
>  {
>      uint64_t *reg;
>      uint64_t val;
> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> +                       (1UL << SMSTATEEN0_HSENVCFG);
>
>      reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
>      val = (uint64_t)new_val << 32;
> @@ -1671,7 +1741,8 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
>                                       target_ulong new_val)
>  {
>      uint64_t *reg;
> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> +                       (1UL << SMSTATEEN0_HSENVCFG);
>      int index = csrno - CSR_HSTATEEN0;
>
>      reg = &env->hstateen[index];
> @@ -1694,8 +1765,9 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
>  {
>      uint64_t *reg;
>      uint64_t val;
> -    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
>      int index = csrno - CSR_HSTATEEN0H;
> +    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> +                       (1UL << SMSTATEEN0_HSENVCFG);
>
>      reg = &env->hstateen[index];
>      val = (uint64_t)new_val << 32;
> --
> 2.25.1
>
>

