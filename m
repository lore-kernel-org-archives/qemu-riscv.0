Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tJb-000749-8S
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 00:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tJa-00073m-2R; Thu, 15 Jul 2021 00:49:38 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tJX-0003bV-Ry; Thu, 15 Jul 2021 00:49:37 -0400
Received: by mail-il1-x12d.google.com with SMTP id b6so3828754iln.12;
 Wed, 14 Jul 2021 21:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zEnTSQZ9xL2sljjpgyxutCwixfXGMkto0/nmeDwiJvk=;
 b=PiiApamr7ULYtpefdQdu1JIB3mHP7m2AUIL3ywPmcJRJSVuJ4kkOc0NHK8Tc51DPzK
 I02kNUZgGKQaVY4k/OVrkDnpeR0lSykjUKv8FvG/m2xebupBots0hDu//jofOGaXjnBq
 fFjyhlamKyXLcEPF+YX677q1dwARIH2KHBtjg1tQ2P2Z7vP60M3KiKUkW+PZXapzNN4J
 EL+spPp/Y7+rgLszyK8sfj9O3MFHo4C7Oxo0Di/QHqtb+9lZrn5o+jxhQjUtTGpVgBQo
 gbkQCArFOeg5dd3iUdKvBAl/PlDBVlIbfybxncQHg/g+TsEauLKYsjO1IWEU/Kd6wXSe
 OhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zEnTSQZ9xL2sljjpgyxutCwixfXGMkto0/nmeDwiJvk=;
 b=STzqrknJfS0+MuApU/eR0wc5UHKLilPJZTIV++uhfvnzpzc4yzSUfF68BL7HaeIsT0
 6VkyAbcazjdYYXnmAVSrlloV9eH/1AjGFUfyc5cTz//FfcvQeZLc0iBGzt/fd6edxma3
 S+YHmh4pjzO2REAAx90vEvH2/+7lI7Pc3AkiUKpA14PAeDgYMfecHsQNKkqYYWOJBTQM
 3BikEU71mHBivaZN8G74T5AVvRv+kxHJLiSuVvOwlMA/hsv/EiNaRuyJJqAUCpbHm+CR
 ogz7lqDQAxuEcgikjWhI8pMKObTjOfZediBxAVyipgyvxYdQcMe2eqvUYZ8bV7z5hvUZ
 EImg==
X-Gm-Message-State: AOAM533jhxGMg+g9Q2hH+1USBrJhM2PMY7Z3pI7KAuxGbxL+xx/HUUoo
 h/ObuctlDz9wvvEVvR6TwWqtoXOz1t7Rjs3utYE=
X-Google-Smtp-Source: ABdhPJyvPduaxnHQ6+xrniIn2a7LbG75ZRIOozCn4VC7Uf1Y2TSs6giRaynDaGrJXaE2VqU5WpqN7TSURuhsPERpjF4=
X-Received: by 2002:a92:c907:: with SMTP id t7mr1223938ilp.267.1626324573918; 
 Wed, 14 Jul 2021 21:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-9-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 14:49:07 +1000
Message-ID: <CAKmqyKPPHemj+a5qEWQSSknWBfpbm2qsYhQcMu4sx4j5fCNJyQ@mail.gmail.com>
Subject: Re: [PATCH 08/17] target/riscv: Use gpr_{src,
 dst} for word shift operations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 04:49:38 -0000

On Fri, Jul 9, 2021 at 2:35 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For trans_sllw, we can just use gen_shiftw.  The others use
> various tricks to reduce the tcg operation count.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 82 ++++++++++---------------
>  1 file changed, 31 insertions(+), 51 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index a422dc9ef4..840187a4d6 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -352,24 +352,23 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
>  static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    TCGv t = tcg_temp_new();
> -    gen_get_gpr(t, a->rs1);
> -    tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
> -    /* sign-extend for W instructions */
> -    tcg_gen_ext32s_tl(t, t);
> -    gen_set_gpr(a->rd, t);
> -    tcg_temp_free(t);
> +
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +
> +    tcg_gen_extract_tl(dest, src1, a->shamt, 32 - a->shamt);
> +    tcg_gen_ext32s_tl(dest, dest);
>      return true;
>  }
>
>  static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    TCGv t = tcg_temp_new();
> -    gen_get_gpr(t, a->rs1);
> -    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
> -    gen_set_gpr(a->rd, t);
> -    tcg_temp_free(t);
> +
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +
> +    tcg_gen_sextract_tl(dest, src1, a->shamt, 32 - a->shamt);
>      return true;
>  }
>
> @@ -388,64 +387,45 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
>  static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
> -
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> -
> -    tcg_gen_andi_tl(source2, source2, 0x1F);
> -    tcg_gen_shl_tl(source1, source1, source2);
> -
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> -    return true;
> +    return gen_shiftw(ctx, a, tcg_gen_shl_tl);
>  }
>
>  static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
> +    TCGv ext2 = tcg_temp_new();
>
> -    /* clear upper 32 */
> -    tcg_gen_ext32u_tl(source1, source1);
> -    tcg_gen_andi_tl(source2, source2, 0x1F);
> -    tcg_gen_shr_tl(source1, source1, source2);
> +    tcg_gen_andi_tl(ext2, src2, 31);
> +    tcg_gen_ext32u_tl(dest, src1);
> +    tcg_gen_shr_tl(dest, dest, ext2);
> +    tcg_gen_ext32s_tl(dest, dest);
>
> -    tcg_gen_ext32s_tl(source1, source1);
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    tcg_temp_free(ext2);
>      return true;
>  }
>
>  static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2 = tcg_temp_new();
>
> -    gen_get_gpr(source1, a->rs1);
> -    gen_get_gpr(source2, a->rs2);
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src(ctx, a->rs1);
> +    TCGv src2 = gpr_src(ctx, a->rs2);
> +    TCGv ext2 = tcg_temp_new();
>
> +    tcg_gen_andi_tl(ext2, src2, 31);
>      /*
> -     * first, trick to get it to act like working on 32 bits (get rid of
> -     * upper 32, sign extend to fill space)
> +     * First, trick to get it to act like working on 32 bits
> +     * (get rid of upper 32, sign extend to fill space)
>       */
> -    tcg_gen_ext32s_tl(source1, source1);
> -    tcg_gen_andi_tl(source2, source2, 0x1F);
> -    tcg_gen_sar_tl(source1, source1, source2);
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    tcg_temp_free(source2);
> +    tcg_gen_ext32s_tl(dest, src1);
> +    tcg_gen_sar_tl(dest, dest, ext2);
>
> +    tcg_temp_free(ext2);
>      return true;
>  }
>
> --
> 2.25.1
>
>

