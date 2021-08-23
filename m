Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI3Jf-00053M-BZ
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 02:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3Ja-00050e-F5; Mon, 23 Aug 2021 02:20:10 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:39874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3JY-0008Lj-1B; Mon, 23 Aug 2021 02:20:09 -0400
Received: by mail-il1-x134.google.com with SMTP id y3so16052083ilm.6;
 Sun, 22 Aug 2021 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9W/+7GwbqEdr4yMvqQ0YdKXz10ve1/5kqj2FztK8/ws=;
 b=C2IUARBqOHpoJ64rHBPtzCnwEYPLg+er8iFHChwbetXMGYRQyXUlbYzY6XDQk1bs/s
 KFj7eVNRwjRJfJhOqtlAoNPEdW08dpKglmKr9EEcZwyybw1HVP5EP+jkIZDjETImy+59
 UScNPen8ID1haWh2xVLqvZlyroatXOqB2U9+JbWzJ3Jh4wpDJT4n5OVSDViyoR1UmpP1
 K4XYmCkp6a5UQU3iFP5Nz+JDG6w+V+j15yfACcMGKxISulHlkE+UGmELPOl7JiCP660C
 I2IPYJ+Pp4Agkr5Qvlq79fpKIdQMFlABG6qLk0W8jfFPH9I1mcEaQo4U4/LkyqeZzZr2
 IXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9W/+7GwbqEdr4yMvqQ0YdKXz10ve1/5kqj2FztK8/ws=;
 b=al0U/Cs6uzYOfguEDhdI/Kc1WLrFmFR0dICrCShPBucEQEjwCLo0OJ3hNpD3K2RvS4
 PJljngNiEjPkkIx9NleZiHpG3rCz827yqS5SrHJAFKcGxIyc2fNE/JukKnzoOKeXiu5o
 93andr5dVUhGginWGpcqoQs10xjyrLDKg6k5fbhEl99LUFrJdqab2s5HjcJi+1LnmorF
 0XueX5oYQ9BtKV2tcxoPIAH73ZJ97xwGjlrgg87V+jFNCIc6KKuGaw6ZnXKGmHqyJ0+b
 mYdUp/k2MixgjXdsES5Ru9u3HEc84GoYMG8jiERxgAdqJz22j36XOmTbueWXltkDhYgz
 mSlw==
X-Gm-Message-State: AOAM531epcKdi4AhYZLIqffcOqPsv9E0GW7FrCzhYBNDOZDaRL3CmpVl
 Vo5tufFolb2fIRdKygz7dsBEqNsAR2t74ySM4qQ=
X-Google-Smtp-Source: ABdhPJyLjaVfRHukkmcsYLNkfBtwpscHWrKzulOBOZ0jFUAAzxH88MFos243Rmxb6ccpMRG9NaG2eshDHxvRLRKzOK8=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr21859957ilo.267.1629699606588; 
 Sun, 22 Aug 2021 23:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-14-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-14-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:19:40 +1000
Message-ID: <CAKmqyKNtYjZW8c1Ya2WFU5jjSmJGww3QLbEuVBzFyq-X+NZ6Ug@mail.gmail.com>
Subject: Re: [PATCH v4 13/21] target/riscv: Use get_gpr in branches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 06:20:12 -0000

On Sat, Aug 21, 2021 at 3:58 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Narrow the scope of t0 in trans_jalr.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index e25f64c45a..af3e0bc0e6 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -54,24 +54,25 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
>
>  static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>  {
> -    /* no chaining with JALR */
>      TCGLabel *misaligned = NULL;
> -    TCGv t0 = tcg_temp_new();
>
> -
> -    gen_get_gpr(ctx, cpu_pc, a->rs1);
> -    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
> +    tcg_gen_addi_tl(cpu_pc, get_gpr(ctx, a->rs1, EXT_NONE), a->imm);
>      tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>
>      if (!has_ext(ctx, RVC)) {
> +        TCGv t0 = tcg_temp_new();
> +
>          misaligned = gen_new_label();
>          tcg_gen_andi_tl(t0, cpu_pc, 0x2);
>          tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
> +        tcg_temp_free(t0);
>      }
>
>      if (a->rd != 0) {
>          tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
>      }
> +
> +    /* No chaining with JALR. */
>      lookup_and_goto_ptr(ctx);
>
>      if (misaligned) {
> @@ -80,21 +81,18 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>      }
>      ctx->base.is_jmp = DISAS_NORETURN;
>
> -    tcg_temp_free(t0);
>      return true;
>  }
>
>  static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>  {
>      TCGLabel *l = gen_new_label();
> -    TCGv source1, source2;
> -    source1 = tcg_temp_new();
> -    source2 = tcg_temp_new();
> -    gen_get_gpr(ctx, source1, a->rs1);
> -    gen_get_gpr(ctx, source2, a->rs2);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
>
> -    tcg_gen_brcond_tl(cond, source1, source2, l);
> +    tcg_gen_brcond_tl(cond, src1, src2, l);
>      gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
> +
>      gen_set_label(l); /* branch taken */
>
>      if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
> @@ -105,9 +103,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>      }
>      ctx->base.is_jmp = DISAS_NORETURN;
>
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -
>      return true;
>  }
>
> --
> 2.25.1
>
>

