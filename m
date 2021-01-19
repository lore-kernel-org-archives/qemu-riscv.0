Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wF4-0002av-Fs
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wEx-0002VM-3W; Tue, 19 Jan 2021 14:00:32 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wEq-0004vw-9K; Tue, 19 Jan 2021 14:00:29 -0500
Received: by mail-io1-xd2e.google.com with SMTP id e22so18084168iog.6;
 Tue, 19 Jan 2021 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpfK8pdy9bJY8DlDmdScyKoWT/dgackRWkHMfBU9ywQ=;
 b=C8LH0QNfebgYuI3E/8AH/msVrXCdcqN06KgUZYKpR31YF62Qr7O4DJfmfLZQ9x3BGD
 6wi0O84sKrDKCg47gdvB9d0rq+3kcoU6hwf6gnZOURMZuPSK7Dkmwp9/C2CumglxjNEv
 8jJ1fj6PteNkwZqg5Re3lrOTdJ8cq4NpPw7Ne42rfUSd/fRCbJ7dgha0X9sfCtaSnheV
 5s6wZ0vCozcKz0JUkYjWE0r+9hbY4mScU46NIhnnSq6CvAbSSZH/riUz9PICBdcYZpRx
 reXLkz1TAHzXaf4Lmd0VJ4w47sYAglDJbPP/wawoXdoiMs2kFPaMWqdYiLQSxg/YUpJY
 6NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpfK8pdy9bJY8DlDmdScyKoWT/dgackRWkHMfBU9ywQ=;
 b=feHSse5kSQ42V5oZrOK3wavvmPkk2Bdsy6XZBAeK3XsC0Q6r7W+tuR6wc+L1IhZwyn
 SZQEZ2DhEoj5+Of+TsUONafVSMVL0gfEY/WuWUtQNBgaXwvs46wvnVboq3R9J7EuCPTA
 Bqe/NihjNp3PhbghvzGaXXA656g104b1b+Xkyv2WuJRD4Yaw1jy40rbm5PgWwv1xVzbt
 /Rp57K8f0M8TbCCi7+6SfU4Nid4bTmpi4HuABacSLSGdP1G/3TkhTV6YQEKO+fXyifL9
 Fqe+8CgNFlv9beSij8IUWQ+OcUhxKUa69uhOHh/L1iTCQqdQZkRzWxRI49GbPsWC0nNa
 BeEA==
X-Gm-Message-State: AOAM5315mUnrXzAWSJhSE5CLRJ6kdR395mQrGMXYrevIKKEpT+sMVm6m
 +jajx9UbEsD6I1RvzhwBk3wgwlTA3ZZ/G5w4ef43XEqBeRQ=
X-Google-Smtp-Source: ABdhPJwtxvPxfFgHCdS04138MTGeTwRsMQoHf7whnDgiZyGfk2SAhKnp6/mVtiDNe5G+daaSKeCfex8xn5slYApGyV8=
X-Received: by 2002:a5d:8909:: with SMTP id b9mr4030663ion.175.1611082822810; 
 Tue, 19 Jan 2021 11:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-18-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-18-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 10:59:56 -0800
Message-ID: <CAKmqyKMFgh0NQQgmrV9-+AMyCmABXY4JOfb90RzkDXpEipO3GA@mail.gmail.com>
Subject: Re: [PATCH v6 17/72] target/riscv: rvv-1.0: configure instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2021 19:00:33 -0000

On Tue, Jan 12, 2021 at 2:06 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 53 +++++++++----------------
>  target/riscv/vector_helper.c            | 14 ++++++-
>  2 files changed, 31 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index ccfa93cf2f8..a3732e76e09 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -132,28 +132,29 @@ static bool require_noover_seg(const int8_t dst, const int8_t nf,
>      return !is_overlapped(dst, nf, src, 1);
>  }
>
> -static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
> +static bool do_vsetvl(DisasContext *ctx, int rd, int rs1, TCGv s2)
>  {
> -    TCGv s1, s2, dst;
> +    TCGv s1, dst;
>
>      if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
>          return false;
>      }
>
> -    s2 = tcg_temp_new();
>      dst = tcg_temp_new();
>
> -    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
> -    if (a->rs1 == 0) {
> +    if (rd == 0 && rs1 == 0) {
> +        s1 = tcg_temp_new();
> +        tcg_gen_mov_tl(s1, cpu_vl);
> +    } else if (rs1 == 0) {
>          /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
>          s1 = tcg_const_tl(RV_VLEN_MAX);
>      } else {
>          s1 = tcg_temp_new();
> -        gen_get_gpr(s1, a->rs1);
> +        gen_get_gpr(s1, rs1);
>      }
> -    gen_get_gpr(s2, a->rs2);
> +
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
> -    gen_set_gpr(a->rd, dst);
> +    gen_set_gpr(rd, dst);
>      mark_vs_dirty(ctx);
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
>      lookup_and_goto_ptr(ctx);
> @@ -165,35 +166,17 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>      return true;
>  }
>
> -static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
> +static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>  {
> -    TCGv s1, s2, dst;
> -
> -    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
> -        return false;
> -    }
> -
> -    s2 = tcg_const_tl(a->zimm);
> -    dst = tcg_temp_new();
> -
> -    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
> -    if (a->rs1 == 0) {
> -        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
> -        s1 = tcg_const_tl(RV_VLEN_MAX);
> -    } else {
> -        s1 = tcg_temp_new();
> -        gen_get_gpr(s1, a->rs1);
> -    }
> -    gen_helper_vsetvl(dst, cpu_env, s1, s2);
> -    gen_set_gpr(a->rd, dst);
> -    mark_vs_dirty(ctx);
> -    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
> -    ctx->base.is_jmp = DISAS_NORETURN;
> +    TCGv s2 = tcg_temp_new();
> +    gen_get_gpr(s2, a->rs2);
> +    return do_vsetvl(ctx, a->rd, a->rs1, s2);
> +}
>
> -    tcg_temp_free(s1);
> -    tcg_temp_free(s2);
> -    tcg_temp_free(dst);
> -    return true;
> +static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
> +{
> +    TCGv s2 = tcg_const_tl(a->zimm);
> +    return do_vsetvl(ctx, a->rd, a->rs1, s2);
>  }
>
>  /* vector register offset from env */
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 89aa7cbf73f..61917d34ffe 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -31,12 +31,24 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>  {
>      int vlmax, vl;
>      RISCVCPU *cpu = env_archcpu(env);
> +    uint64_t lmul = FIELD_EX64(s2, VTYPE, VLMUL);
>      uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
>      uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
>      bool vill = FIELD_EX64(s2, VTYPE, VILL);
>      target_ulong reserved = FIELD_EX64(s2, VTYPE, RESERVED);
>
> -    if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
> +    if (lmul & 4) {
> +        /* Fractional LMUL. */
> +        if (lmul == 4 ||
> +            cpu->cfg.elen >> (8 - lmul) < sew) {
> +            vill = true;
> +        }
> +    }
> +
> +    if ((sew > cpu->cfg.elen)
> +        || vill
> +        || (ediv != 0)
> +        || (reserved != 0)) {
>          /* only set vill bit. */
>          env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
>          env->vl = 0;
> --
> 2.17.1
>
>

