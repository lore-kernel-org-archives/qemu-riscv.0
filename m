Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1jOt-0006EE-Pb
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 02:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jOr-0006Da-R6; Thu, 16 Jun 2022 02:54:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1jOq-0001Rg-2x; Thu, 16 Jun 2022 02:54:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id f65so435450pgc.7;
 Wed, 15 Jun 2022 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aW/H9+rcL9yD9dEYA0UK+MouGrbc2CJD8dH5NkkDYZQ=;
 b=krNfjAFknefazKy+Nxo8H+ctz+7ifwypVqDsErrtJ0M4fkrAcKLL0RPcdNu//cmW68
 +uaLAhZs6QpK3o13agXPirDh/fcvkr5S6dXv/x87OPYpZqvyGRXN17f1d4ldyL8Jvn9T
 Yc14mlLhdFuKwoLJn29uPa/dFimUJGDRJ+bzCs5mp2QKRKhNg2Wx6i8qTXmCD9PwvqZn
 SlLCi1hmGm1Tmn8ZzCflUla/PdmjmmMYdbjzzgjWfmYWsYmcRHQ3wDow9O3B6A2mu3DO
 UY1Z5vBWX5QRmJTncdykZdK+p38dcUs+Y4ELgDmfdDrYHvmqVmHNgteU5+HZKdbRPRod
 qrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aW/H9+rcL9yD9dEYA0UK+MouGrbc2CJD8dH5NkkDYZQ=;
 b=TvXHbX1X9JsfwLM/cWyg3D2hO8ElDnC2E/EzbspOqomuTiE2VepwslLtoYCKqzazLM
 NhMVCqC9ybG/guoSV2jRqjapK8dnxb/jtyZt45rFUYFlIXi1nCaCQbV4Dd4x8I6d/4bZ
 wXvNxFFA1Ujc1xP8+1ZNlTR64yIOnNURLu1ZpcBef5kLznYqHvKbOGmev7xtBL/Vl4gd
 HSGmqruVJ5y25GsRePzCbNco2SkuNZnOUrQFd2bNfzHpsv8/wDEfuVds3e9BR/ar9CQ3
 1tdbeqgzv9UtLiP+EJZ5oW6Tnoa/xiRw2JQD4Z8h/HIg9fVkWSWrVs7aFnOo+sJC4xn5
 /pQA==
X-Gm-Message-State: AJIora81Ah8KaSyXVLb0i5uOt9EpmCqepyPAI93WlmJcBqqOgBsttBDN
 ZjnYJyGXS9dwA6aCbOR0/NpChqAKJxP+W3KBxdg=
X-Google-Smtp-Source: AGRyM1tWaXbL0bnH08V9h5HGHh5fOl+XOCKUqRLiJuqch7MZtgpTnGxFpSTO3cAuQWuSl5VW54phOLluC4hTcsv459c=
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr3185357pgq.366.1655362478344; Wed, 15
 Jun 2022 23:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-3-mchitale@ventanamicro.com>
In-Reply-To: <20220603160425.3667456-3-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 16:54:11 +1000
Message-ID: <CAKmqyKNTKgSfLdZp4QSATi8mdmfV4YQ_n_+_6DPaMDQbAWRHMg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/4] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Thu, 16 Jun 2022 06:54:42 -0000

On Sat, Jun 4, 2022 at 2:16 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Accesses to henvcfg, henvcfgh and senvcfg are allowed
> only if corresponding bit in mstateen0/hstateen0 is
> enabled. Otherwise an illegal instruction trap is
> generated.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
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

Couldn't this be part of the original permission check so we don't
need a second check?

Alistair

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

