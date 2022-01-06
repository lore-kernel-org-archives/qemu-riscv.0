Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5I3P-00032I-Ju
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 20:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5I3M-00031M-8C; Wed, 05 Jan 2022 20:58:56 -0500
Received: from [2607:f8b0:4864:20::42f] (port=44871
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n5I3F-0007zc-LU; Wed, 05 Jan 2022 20:58:55 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t187so1234185pfb.11;
 Wed, 05 Jan 2022 17:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=elLvJPc1jxdTJuJvA24XNv07jTMdBgoO7bjiITVIIzw=;
 b=MSpZJOodQzYImccZ+LKy6y1FsErELi/bgHgVqnNDFGKb/VdJDcQLvDdbEa2VsVYa9p
 O+OzmauatbAPdVcMCdUR/tzWsdkXs7QQPPnOgSEzKe2nLoMz/L7mcBOi2BMeQOvyViKT
 j4teD/fYTrhBAI8rtpueBfkrChsSBxxlEIwSDX9dkTyEnd+wbqxcuDoSLi3Q28FUI7vN
 YCbpH+LEjk7iL9W+wvN2NKn05gBh7co62XvKfOEZT7aAUaA+Ce+T66NQyNUQT3mZtsef
 J2z+RotgtaRt6dlnsiBqswp8aezwQ/Lcj9F8xDiXh69drSa8y+tAUOERgRmY7S7PY4vT
 hcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=elLvJPc1jxdTJuJvA24XNv07jTMdBgoO7bjiITVIIzw=;
 b=Ow710kfo4WYTKLvRojiNYVKOD3ey/r9ygpKeyZd4tOZKmTYHVIKDu0ZYwDmQ5Pst6t
 eJiUnPUqJ0eVK9Lb8IVXEw0GcZ6EmzXKbEMxJZWgXYqurdEk1JavRIvQ/UO+FLocN7D+
 lVnYmjyjL59QctdrFkI/cWWuw6CWKbXVrdMYjJpcmHeACkwDqqp3dpoteWBLWtkf9SiT
 D3N/M7uxKwGdCf9oecIXmJMjgnwNbhd5r3tEadd0tQxBaqrQXG6Ebq10sgUJDU5i8g8I
 ro/uDHK0Alr6isyuQEX/33EgHORML0j04fdy4XvvxE2m8Q2Fq6DLYMVZoKT/3xdYDNLm
 uOcw==
X-Gm-Message-State: AOAM531jsmGQh4BM4cmjG5YH8NR1Yrwg+cT7nDjRlNtkXq7Ige4MFvvk
 ttExMksla4UV7R6wMbZ1pVMqPobYMOmtGCxedUQ=
X-Google-Smtp-Source: ABdhPJwlQGaG7XZuIM7Y0W5c+zgMd//Ow3RUpMryjvhYPUtOObhqCHWipCLVa1pSHDqxn2ke9J8kZe6t3EN3NRg8eYo=
X-Received: by 2002:a63:9207:: with SMTP id o7mr50284091pgd.430.1641434327739; 
 Wed, 05 Jan 2022 17:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211213163834.170504-18-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211213163834.170504-18-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 11:58:17 +1000
Message-ID: <CAKmqyKP9bxvwZXdnFs5G_y0QoGbc9Yxz1JfUz9gO4KhsMu=fSg@mail.gmail.com>
Subject: Re: [PATCH v7 17/18] target/riscv: modification of the trans_csrxx
 for 128-bit support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jan 2022 01:58:56 -0000

On Tue, Dec 14, 2021 at 2:48 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> As opposed to the gen_arith and gen_shift generation helpers, the csr ins=
ns
> do not have a common prototype, so the choice to generate 32/64 or 128-bi=
t
> helper calls is done in the trans_csrxx functions.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 205 ++++++++++++++++++------
>  1 file changed, 160 insertions(+), 45 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index ca354130ec..3a0ae28fef 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -881,20 +881,78 @@ static bool do_csrrw(DisasContext *ctx, int rd, int=
 rc, TCGv src, TCGv mask)
>      return do_csr_post(ctx);
>  }
>
> +static bool do_csrr_i128(DisasContext *ctx, int rd, int rc)
> +{
> +    TCGv destl =3D dest_gpr(ctx, rd);
> +    TCGv desth =3D dest_gprh(ctx, rd);
> +    TCGv_i32 csr =3D tcg_constant_i32(rc);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrr_i128(destl, cpu_env, csr);
> +    tcg_gen_ld_tl(desth, cpu_env, offsetof(CPURISCVState, retxh));
> +    gen_set_gpr128(ctx, rd, destl, desth);
> +    return do_csr_post(ctx);
> +}
> +
> +static bool do_csrw_i128(DisasContext *ctx, int rc, TCGv srcl, TCGv srch=
)
> +{
> +    TCGv_i32 csr =3D tcg_constant_i32(rc);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrw_i128(cpu_env, csr, srcl, srch);
> +    return do_csr_post(ctx);
> +}
> +
> +static bool do_csrrw_i128(DisasContext *ctx, int rd, int rc,
> +                          TCGv srcl, TCGv srch, TCGv maskl, TCGv maskh)
> +{
> +    TCGv destl =3D dest_gpr(ctx, rd);
> +    TCGv desth =3D dest_gprh(ctx, rd);
> +    TCGv_i32 csr =3D tcg_constant_i32(rc);
> +
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
> +    gen_helper_csrrw_i128(destl, cpu_env, csr, srcl, srch, maskl, maskh)=
;
> +    tcg_gen_ld_tl(desth, cpu_env, offsetof(CPURISCVState, retxh));
> +    gen_set_gpr128(ctx, rd, destl, desth);
> +    return do_csr_post(ctx);
> +}
> +
>  static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>  {
> -    TCGv src =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -
> -    /*
> -     * If rd =3D=3D 0, the insn shall not read the csr, nor cause any of=
 the
> -     * side effects that might occur on a csr read.
> -     */
> -    if (a->rd =3D=3D 0) {
> -        return do_csrw(ctx, a->csr, src);
> +    if (get_xl(ctx) < MXL_RV128) {
> +        TCGv src =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +        /*
> +         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
> +         * side effects that might occur on a csr read.
> +         */
> +        if (a->rd =3D=3D 0) {
> +            return do_csrw(ctx, a->csr, src);
> +        }
> +
> +        TCGv mask =3D tcg_constant_tl(-1);
> +        return do_csrrw(ctx, a->rd, a->csr, src, mask);
> +    } else {
> +        TCGv srcl =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +        TCGv srch =3D get_gprh(ctx, a->rs1);
> +
> +        /*
> +         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
> +         * side effects that might occur on a csr read.
> +         */
> +        if (a->rd =3D=3D 0) {
> +            return do_csrw_i128(ctx, a->csr, srcl, srch);
> +        }
> +
> +        TCGv mask =3D tcg_constant_tl(-1);
> +        return do_csrrw_i128(ctx, a->rd, a->csr, srcl, srch, mask, mask)=
;
>      }
> -
> -    TCGv mask =3D tcg_constant_tl(-1);
> -    return do_csrrw(ctx, a->rd, a->csr, src, mask);
>  }
>
>  static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
> @@ -906,13 +964,24 @@ static bool trans_csrrs(DisasContext *ctx, arg_csrr=
s *a)
>       * a zero value, the instruction will still attempt to write the
>       * unmodified value back to the csr and will cause side effects.
>       */
> -    if (a->rs1 =3D=3D 0) {
> -        return do_csrr(ctx, a->rd, a->csr);
> +    if (get_xl(ctx) < MXL_RV128) {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv ones =3D tcg_constant_tl(-1);
> +        TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> +        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
> +    } else {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr_i128(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv ones =3D tcg_constant_tl(-1);
> +        TCGv maskl =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> +        TCGv maskh =3D get_gprh(ctx, a->rs1);
> +        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, maskl, mask=
h);
>      }
> -
> -    TCGv ones =3D tcg_constant_tl(-1);
> -    TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> -    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
>  }
>
>  static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
> @@ -924,28 +993,54 @@ static bool trans_csrrc(DisasContext *ctx, arg_csrr=
c *a)
>       * a zero value, the instruction will still attempt to write the
>       * unmodified value back to the csr and will cause side effects.
>       */
> -    if (a->rs1 =3D=3D 0) {
> -        return do_csrr(ctx, a->rd, a->csr);
> +    if (get_xl(ctx) < MXL_RV128) {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> +        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
> +    } else {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr_i128(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv maskl =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> +        TCGv maskh =3D get_gprh(ctx, a->rs1);
> +        return do_csrrw_i128(ctx, a->rd, a->csr,
> +                             ctx->zero, ctx->zero, maskl, maskh);
>      }
> -
> -    TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> -    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
>  }
>
>  static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
>  {
> -    TCGv src =3D tcg_constant_tl(a->rs1);
> -
> -    /*
> -     * If rd =3D=3D 0, the insn shall not read the csr, nor cause any of=
 the
> -     * side effects that might occur on a csr read.
> -     */
> -    if (a->rd =3D=3D 0) {
> -        return do_csrw(ctx, a->csr, src);
> +    if (get_xl(ctx) < MXL_RV128) {
> +        TCGv src =3D tcg_constant_tl(a->rs1);
> +
> +        /*
> +         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
> +         * side effects that might occur on a csr read.
> +         */
> +        if (a->rd =3D=3D 0) {
> +            return do_csrw(ctx, a->csr, src);
> +        }
> +
> +        TCGv mask =3D tcg_constant_tl(-1);
> +        return do_csrrw(ctx, a->rd, a->csr, src, mask);
> +    } else {
> +        TCGv src =3D tcg_constant_tl(a->rs1);
> +
> +        /*
> +         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
> +         * side effects that might occur on a csr read.
> +         */
> +        if (a->rd =3D=3D 0) {
> +            return do_csrw_i128(ctx, a->csr, src, ctx->zero);
> +        }
> +
> +        TCGv mask =3D tcg_constant_tl(-1);
> +        return do_csrrw_i128(ctx, a->rd, a->csr, src, ctx->zero, mask, m=
ask);
>      }
> -
> -    TCGv mask =3D tcg_constant_tl(-1);
> -    return do_csrrw(ctx, a->rd, a->csr, src, mask);
>  }
>
>  static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
> @@ -957,16 +1052,26 @@ static bool trans_csrrsi(DisasContext *ctx, arg_cs=
rrsi *a)
>       * a zero value, the instruction will still attempt to write the
>       * unmodified value back to the csr and will cause side effects.
>       */
> -    if (a->rs1 =3D=3D 0) {
> -        return do_csrr(ctx, a->rd, a->csr);
> +    if (get_xl(ctx) < MXL_RV128) {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv ones =3D tcg_constant_tl(-1);
> +        TCGv mask =3D tcg_constant_tl(a->rs1);
> +        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
> +    } else {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr_i128(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv ones =3D tcg_constant_tl(-1);
> +        TCGv mask =3D tcg_constant_tl(a->rs1);
> +        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, mask, ctx->=
zero);
>      }
> -
> -    TCGv ones =3D tcg_constant_tl(-1);
> -    TCGv mask =3D tcg_constant_tl(a->rs1);
> -    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
>  }
>
> -static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
> +static bool trans_csrrci(DisasContext *ctx, arg_csrrci * a)
>  {
>      /*
>       * If rs1 =3D=3D 0, the insn shall not write to the csr at all, nor
> @@ -975,10 +1080,20 @@ static bool trans_csrrci(DisasContext *ctx, arg_cs=
rrci *a)
>       * a zero value, the instruction will still attempt to write the
>       * unmodified value back to the csr and will cause side effects.
>       */
> -    if (a->rs1 =3D=3D 0) {
> -        return do_csrr(ctx, a->rd, a->csr);
> +    if (get_xl(ctx) < MXL_RV128) {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv mask =3D tcg_constant_tl(a->rs1);
> +        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
> +    } else {
> +        if (a->rs1 =3D=3D 0) {
> +            return do_csrr_i128(ctx, a->rd, a->csr);
> +        }
> +
> +        TCGv mask =3D tcg_constant_tl(a->rs1);
> +        return do_csrrw_i128(ctx, a->rd, a->csr,
> +                             ctx->zero, ctx->zero, mask, ctx->zero);
>      }
> -
> -    TCGv mask =3D tcg_constant_tl(a->rs1);
> -    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
>  }
> --
> 2.34.1
>
>

