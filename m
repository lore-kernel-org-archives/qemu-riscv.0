Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m39pF-00039u-Lv
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 00:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39pD-00034i-KN; Tue, 13 Jul 2021 00:15:15 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39pC-00080n-0S; Tue, 13 Jul 2021 00:15:15 -0400
Received: by mail-io1-xd31.google.com with SMTP id z26so13954507ioz.11;
 Mon, 12 Jul 2021 21:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f0Gcc6Yw9aAZlgu2mg36MyiSjMJuEw3yM0rUvFUqkbM=;
 b=d7kZg5a42vU+W3y5jMaKIE/4md7vt2DuKPStg5E1PAWYWZ+ru5qyJGiCFl8iv4BdGM
 cNbz7gVtVv756fRmHm5n3FXz2jhzD0Q+3GvRSVgDESplhe0lUkB3TKWSrwv9kVgUQ/g2
 OQfk365eekEKIrfr125baXx/wKxj3a78wAKVjl9c5kcCR8iI4AnTTryGtyGYK86aQaGq
 /bl6GXLUwJ/DaGR90cdMbHE/OtCoY78Ln4YWWofmpJh02uzxXC1ZRTk8mBelAWfwpVrC
 /vicFBxDn2Fb+9BT/fhUXtVbOErkEeqvZiBnrl/9lKd8nY5PDOuYWr6H7eLAGzMrVYSn
 a6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f0Gcc6Yw9aAZlgu2mg36MyiSjMJuEw3yM0rUvFUqkbM=;
 b=YX7SUPqLftD4obsk3NpoK0c0Az+RPvMCckY+bN3kvbHy9JegSGCv3pcM8A0l11vsFX
 Tzt+CGYWVFdMU7T794okovtvgmH7qTnir6OseVLsuAVDTzVMzSODRqQA/SBvuURl0IFF
 k3MmyLzspyblBxvVcWsgBU4Vgxv4YGcArOphDznqaSQqwP0fgXIUCr2UM42roRSx3emv
 Lrv4C2qi8uoXTngLOEMmIK1LVKqKW0y78ucCPKmDdXa1t/y0JNYOmYQ00eW74wFttA9u
 DdKTv9AREIeRNEKtTQzvM5jD1k4uhbW/atG7xErT6pvTWshnWoj/wV2yL7ME9oGu+nIc
 Oxbg==
X-Gm-Message-State: AOAM532KysQTnzGiKa6eP/TnNgV23Qyi2QpttmD0LX1FtFXy5/sYyHtk
 PQl6NaMvRTAh4w1gVu48cvp/bPEB5Spo5MZIAoI=
X-Google-Smtp-Source: ABdhPJwH7duu14OyoMVqzfKt0QGAU3nptD2OFke5FVzWiPquJsTRSIAPhUx1Q8l9PSa+F6yhK1mbyh2kNkPVlpYOrSo=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr1766224iov.42.1626149712882; 
 Mon, 12 Jul 2021 21:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-7-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-7-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 14:14:46 +1000
Message-ID: <CAKmqyKPo7ujHKnAnHyJE-ueoAN==X5gb5QAyC6AwZM5O-_2Ojw@mail.gmail.com>
Subject: Re: [PATCH 06/17] target/riscv: Use gpr_src in branches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Tue, 13 Jul 2021 04:15:16 -0000

On Fri, Jul 9, 2021 at 2:39 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Narrow the scope of t0 in trans_jalr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 6e736c9d0d..a603925637 100644
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
> -    gen_get_gpr(cpu_pc, a->rs1);
> -    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
> +    tcg_gen_addi_tl(cpu_pc, gpr_src(ctx, a->rs1), a->imm);
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
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
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

