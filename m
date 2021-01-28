Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5Eiv-0005m5-O8
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jan 2021 16:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5Eip-0005kU-Bj; Thu, 28 Jan 2021 16:21:01 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5Ein-0007lg-Ew; Thu, 28 Jan 2021 16:20:59 -0500
Received: by mail-il1-x129.google.com with SMTP id c20so6625190ilj.13;
 Thu, 28 Jan 2021 13:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JsrRsRRKepYD2NtHhgLW5g/eYPDNr8MP5spqzP2uO3Q=;
 b=XjygS8JfoJ4rnbfXXfv7EWlvT2bCxS2sBLadLQwq+DhyO1vHt24KeM+ER1THHt6IVq
 MQPOCCRDui1tS5LclmkaVs/+vmyO6QOBBunkTTEGS+Qv3qvN67YPyLYHXJlNqn1ktU3Q
 pzVyu+dvnh8nVlsG3l3Jjis1IKLz4nsTw43FqekI3799uDKHC+qxTTSk4czkE/6VzkMt
 jQNtkSoHmej8MPHOYwCPJmMKXY4YsQTpm62aS/0TjiDXZZeXDYWGER91hY9yO/iof7V7
 Mha4iRF4qZlYTVcJMDJkHWvzh9vQPLzBnDLg7YOnTTPWKS2eD43udAPi/PiryAx5ahdI
 mNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JsrRsRRKepYD2NtHhgLW5g/eYPDNr8MP5spqzP2uO3Q=;
 b=Wphg5PMbZr3udNNiEY7yhg4ZXLE6fYbgxbtqHBvmagJ1jGwDFLZ3Sfzu4kc9GWkTts
 1JC5utxDI8UrPIPpCZFM1A913/JBFHbvEW1l98wp33u4N/Y3VnTgCbbiNkNoXDwycIEE
 Qe69mr+8qc5HC+P3vBG8A4dvUKN2+Cghfjc/XUdAXTxfLyctui7zJx7UGVWkNGaW1iT1
 S63U7dTEGMhdmFEbebSMm5JGVIQwkIjTUCdpHIzO+jJPqIlS8tEwU8q4ex3wtaiRg1nX
 s1jBp1vvUqNJqx6ws42tPrQO7+gmepmiDdQN9c2IGlVsAedtlsQuPsFWRKzNjiOZoS0E
 YGmQ==
X-Gm-Message-State: AOAM5301xBvNihbpqX/szvxoM1WJhk9Y9o2GvkZJJCyo832RfB06stMg
 ek7AXrk2xKvyd244t5sVJg8Rg5a8gJyD94K9GlM=
X-Google-Smtp-Source: ABdhPJyKDcW1R9MHzAtSyyl3DOvfyGgobTbqJis60TV7/VJ1pi9T9fc8fxsHnBtuiDgKcxs5Sbt3uT6kyBzx480DfuI=
X-Received: by 2002:a05:6e02:218f:: with SMTP id
 j15mr865088ila.40.1611868855977; 
 Thu, 28 Jan 2021 13:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-37-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-37-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Jan 2021 13:20:29 -0800
Message-ID: <CAKmqyKP4k+Lz8vzEvndnmMR+mq5vfD-vWxgGJicLbaAMpPcd3w@mail.gmail.com>
Subject: Re: [PATCH v6 36/72] target/riscv: rvv-1.0: floating-point move
 instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 28 Jan 2021 21:21:02 -0000

On Tue, Jan 12, 2021 at 2:16 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> NaN-boxed the scalar floating-point register based on RVV 1.0's rules.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 1839fc0a56b..7ac7d6a2b92 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2691,9 +2691,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>          require_rvf(s) &&
>          vext_check_isa_ill(s) &&
>          require_align(a->rd, s->lmul)) {
> +        TCGv_i64 t1;
> +
>          if (s->vl_eq_vlmax) {
> +            t1 = tcg_temp_new_i64();
> +            /* NaN-box f[rs1] */
> +            do_nanbox(s, t1, cpu_fpr[a->rs1]);
> +
>              tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
> -                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
> +                                 MAXSZ(s), MAXSZ(s), t1);
>              mark_vs_dirty(s);
>          } else {
>              TCGv_ptr dest;
> @@ -2707,16 +2713,22 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>              TCGLabel *over = gen_new_label();
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
> +            t1 = tcg_temp_new_i64();
> +            /* NaN-box f[rs1] */
> +            do_nanbox(s, t1, cpu_fpr[a->rs1]);
> +
>              dest = tcg_temp_new_ptr();
>              desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
>              tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
> -            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
> +
> +            fns[s->sew - 1](dest, t1, cpu_env, desc);
>
>              tcg_temp_free_ptr(dest);
>              tcg_temp_free_i32(desc);
>              mark_vs_dirty(s);
>              gen_set_label(over);
>          }
> +        tcg_temp_free_i64(t1);
>          return true;
>      }
>      return false;
> --
> 2.17.1
>
>

