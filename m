Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tL4-0000Py-Vi
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 00:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tL3-0000M6-B3; Thu, 15 Jul 2021 00:51:09 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tL1-0004xJ-El; Thu, 15 Jul 2021 00:51:09 -0400
Received: by mail-il1-x129.google.com with SMTP id e13so3853133ilc.1;
 Wed, 14 Jul 2021 21:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IjMedeS7v8IgWK2YLSe7P4nqL1xUyJvQDxrCfBaL+xU=;
 b=UJNwLetXPRKnzp87wUBSX53ZFGYGs/pAAbhvafwtjahqu9fHFuX/XLdaCyO5pKM6Lw
 j/BqYQkFIjHLgFOYaUdvSQjFiuweY0LrWAzntzhFsKmjxfZEVnPF5jTQguss3K5Lz4Ca
 Sowe0Qs41fgIr8+aeNU4JujoaXhE76rTgo39rQJp4NjjFZSGzF9i/FHJHL+D7rKnYWib
 cldh2DaJdIH+dhW4+U3XU7w4U9AGHk3LHgqtfmXYGmtv4pwx39yfrope2b9XwA0bS/6I
 b5AbxRpuAnWdWU7txYXQKBRJjdWRviRjVRiquxbR0ygmEWhaMh+vNDH/0ejspToGH8gV
 V5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IjMedeS7v8IgWK2YLSe7P4nqL1xUyJvQDxrCfBaL+xU=;
 b=s16R7q303g+J7KGw0Z8BcuHUEuOu3xc2O9BvjsFBRlcoEYH8V/pSCDRSvk2k1hso4E
 aEWIWT9Utccst2iZ+SFZd0q7D6OE+juBoYAnGq65GVGn41WyOkYcRw1f1pjJTupfzwCg
 gupCpbGFrhiWRpQ0ioL19VmBc1wPAZZksNn27uWsOwIXWWIcJBOB85rBb8Gu8S4QkumF
 88DT0By2O0e7PCrpw7xD6HEmfsYPEho1n16+zNc7cb8zoku/z8hh9TOOWQOESo9kmjTL
 JGbXrM04zyUoq+TZ9bigFOZxFtoruAcl5vZTocMNLdk3VOrqt4oDwpE8grWy4E7kRV/k
 LFmQ==
X-Gm-Message-State: AOAM533vIMn0iDZH7S7Trg8Ht618F0jrEgTPImuMxvF8JYGmreEonAGq
 qBRlwWuc+Q51x17brDZDisgxrfNmRKZ8vUwA67Q=
X-Google-Smtp-Source: ABdhPJwKR4nrqjpVVE9RpyRjDUhFNB2o49HgbuBtt7da2tIFSjD1Cqdvf0hSBn9yIv176Si9L8WZc+7OSQdu17iuZvg=
X-Received: by 2002:a05:6e02:1d8d:: with SMTP id
 h13mr1275658ila.40.1626324665902; 
 Wed, 14 Jul 2021 21:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-11-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-11-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 14:50:39 +1000
Message-ID: <CAKmqyKOZ7dtKbcxP3dWxFM67U81ErVi5ugHB8RzqRYjbHA7K6g@mail.gmail.com>
Subject: Re: [PATCH 10/17] target/riscv: Use gpr_{src,dst} for RVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 04:51:09 -0000

On Fri, Jul 9, 2021 at 2:39 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rva.c.inc | 42 +++++++++----------------
>  1 file changed, 14 insertions(+), 28 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index ab2ec4f0a5..5bb5bbd09c 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -18,11 +18,11 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
> +static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
> -    TCGv src1 = tcg_temp_new();
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +
>      /* Put addr in load_res, data in load_val.  */
> -    gen_get_gpr(src1, a->rs1);
>      if (a->rl) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      }
> @@ -33,30 +33,26 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      tcg_gen_mov_tl(load_res, src1);
>      gen_set_gpr(a->rd, load_val);
>
> -    tcg_temp_free(src1);
>      return true;
>  }
>
> -static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
> +static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>  {
> -    TCGv src1 = tcg_temp_new();
> -    TCGv src2 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
>      TCGLabel *l1 = gen_new_label();
>      TCGLabel *l2 = gen_new_label();
>
> -    gen_get_gpr(src1, a->rs1);
>      tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
>
> -    gen_get_gpr(src2, a->rs2);
>      /*
>       * Note that the TCG atomic primitives are SC,
>       * so we can ignore AQ/RL along this path.
>       */
> -    tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
> +    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
>                                ctx->mem_idx, mop);
> -    tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
> -    gen_set_gpr(a->rd, dat);
> +    tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
>      tcg_gen_br(l2);
>
>      gen_set_label(l1);
> @@ -65,8 +61,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       * provide the memory barrier implied by AQ/RL.
>       */
>      tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
> -    tcg_gen_movi_tl(dat, 1);
> -    gen_set_gpr(a->rd, dat);
> +    tcg_gen_movi_tl(dest, 1);
>
>      gen_set_label(l2);
>      /*
> @@ -75,9 +70,6 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       */
>      tcg_gen_movi_tl(load_res, -1);
>
> -    tcg_temp_free(dat);
> -    tcg_temp_free(src1);
> -    tcg_temp_free(src2);
>      return true;
>  }
>
> @@ -85,17 +77,11 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>                      void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
>                      MemOp mop)
>  {
> -    TCGv src1 = tcg_temp_new();
> -    TCGv src2 = tcg_temp_new();
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
>
> -    gen_get_gpr(src1, a->rs1);
> -    gen_get_gpr(src2, a->rs2);
> -
> -    (*func)(src2, src1, src2, ctx->mem_idx, mop);
> -
> -    gen_set_gpr(a->rd, src2);
> -    tcg_temp_free(src1);
> -    tcg_temp_free(src2);
> +    (*func)(dest, src1, src2, ctx->mem_idx, mop);
>      return true;
>  }
>
> --
> 2.25.1
>
>

