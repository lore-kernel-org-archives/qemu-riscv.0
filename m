Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1owtqy-0001Be-Rm
	for mharc-qemu-riscv@gnu.org; Sun, 20 Nov 2022 18:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtqx-0001BF-9D; Sun, 20 Nov 2022 18:35:59 -0500
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1owtqu-0003XG-4F; Sun, 20 Nov 2022 18:35:58 -0500
Received: by mail-ua1-x92e.google.com with SMTP id s16so933342uaq.12;
 Sun, 20 Nov 2022 15:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LHqEGr3sz58ePSttMR3vEQdMMqcRjIG75xfKL9omUuc=;
 b=ejaLKF1HKkyCJl+E+5z92yQuGp0DjIOmGoJEznfe+dwL85XE6tAkIWMbptFSu+Edkr
 4K4Ch8go7AkT+t+zy+Jca7I274xEzbOma99/klUCTuQ/fesULDpUxQ67fIb8c3IaJ7H+
 dqJNCbH6Pl+CD47wtU8cWCNFU0OpKeKFGeYq2cLwJfSqMZrhdT3SVN5eqW2VdKil4pMK
 7ydXK5ZAC7JTd8ngnw1gVSsfK6bD3UoC5MiC7BnIEAVsOJPpJQldiBmFEFGFRctITwod
 4TbSc9cV8WUwAT/EunwjuFFDxaIjk5rTqHoyol2c7/SFACV+KIIxLgR05RtogdujHaca
 OD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHqEGr3sz58ePSttMR3vEQdMMqcRjIG75xfKL9omUuc=;
 b=Rqlr+IXeo5GLW7r+F0pgDXURrhVZjgcPSaqhV7YYiuB+smquMYyYdTSqCI52n2ujZp
 JMif8JR0FBjVYv+omduZkSDcvp/s/enKHVwx7STRR9ohMN49kr4qgDmg6uptvhHKy48W
 +/DBdjjUMBPQ15wpFtYLxVbrdI3aWYqQrxot7Um/j9sxEGQWjNv6T/9Vz+6jpHYPcHov
 TUFD9m9izkwGLpb5hYUl8wukJUFC4EG+Av2AL+RGcST9x7p6p0a0rKiEN/8FpXU6vH+C
 nmbSdTPycWBOmnW/lXAMXVw0w40LajTebY0aykAsZUqNx80b+YkDX5hKdjf2PpvL7l6a
 9FuQ==
X-Gm-Message-State: ANoB5pnw+TPuS7ZaGhRMG2bAu2zXghoV7Tr122++PZqT2NguX8fqqbqi
 Nfwet+BedVP3O7CE28Z7Xa6byDMoUTYrUZpXJ2YVfMw5N39f1w==
X-Google-Smtp-Source: AA0mqf6Vuq/GVwgoEelq4Qozgrajpl7TOLRW00cPQwO0YNKUDs9sKpRNutkU2rLOkdKXadJU5yY+N9Tn5mA5Fhg2iwI=
X-Received: by 2002:ab0:2a53:0:b0:3d8:d599:ef49 with SMTP id
 p19-20020ab02a53000000b003d8d599ef49mr8026146uar.96.1668987354597; Sun, 20
 Nov 2022 15:35:54 -0800 (PST)
MIME-Version: 1.0
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
 <20221016124726.102129-5-mchitale@ventanamicro.com>
In-Reply-To: <20221016124726.102129-5-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 09:35:28 +1000
Message-ID: <CAKmqyKO+HQ7dtGQwaJFG481vkyMfX-tXrux2rmrGkfAz54dBbQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/5] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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
X-List-Received-Date: Sun, 20 Nov 2022 23:35:59 -0000

On Sun, Oct 16, 2022 at 11:09 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> If smstateen is implemented and sstateen0.fcsr is clear then the floating point
> operations must return illegal instruction exception or virtual instruction
> trap, if relevant.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>  target/riscv/csr.c                        | 23 ++++++++++++
>  target/riscv/insn_trans/trans_rvf.c.inc   | 43 +++++++++++++++++++++--
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++
>  3 files changed, 75 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 71236f2b5d..8b25f885ec 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -84,6 +84,10 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>          !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> +    }
>  #endif
>      return RISCV_EXCP_NONE;
>  }
> @@ -2023,6 +2027,9 @@ static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                        target_ulong new_val)
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
>
>      return write_mstateen(env, csrno, wr_mask, new_val);
>  }
> @@ -2059,6 +2066,10 @@ static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_mstateenh(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2096,6 +2107,10 @@ static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_hstateen(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2135,6 +2150,10 @@ static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_hstateenh(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2182,6 +2201,10 @@ static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>  {
>      uint64_t wr_mask = SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |= SMSTATEEN0_FCSR;
> +    }
> +
>      return write_sstateen(env, csrno, wr_mask, new_val);
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index a1d3eb52ad..93657680c6 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,9 +24,46 @@
>              return false; \
>  } while (0)
>
> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> +#ifndef CONFIG_USER_ONLY
> +static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
> +{
> +    CPUState *cpu = ctx->cs;
> +    CPURISCVState *env = cpu->env_ptr;
> +    uint64_t stateen = env->mstateen[index];

Sorry I missed this the first time around. You can't access env here

Richard pointed it out here:
https://patchwork.kernel.org/project/qemu-devel/patch/20221117070316.58447-8-liweiwei@iscas.ac.cn/#25095773

I'm going to drop this patch and patch v5

Alistair

