Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC39CCD187
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:06:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8XEg-0004h3-QH; Tue, 14 Oct 2025 01:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XEe-0004fY-A5
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:06:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XEb-0003ui-E2
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:06:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61feb87fe26so7767865a12.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 22:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760418364; x=1761023164; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIoFLOpP+VU25GuJ2Zj7/OjFD1+eeWAQjBmMOslDOGE=;
 b=BT39UpYcpyzg5k0Rn80OffjcExHAE1QkbFnD+lZ7f4oaEoC+cIK0BOP2kPKh5fb8h1
 LCsTjsjhWkyYysr9K1oFlGerp3IgLOJXXIEVON331d2COFLduilo/Pnzaurq6+mKAcWA
 gpbvm4RVPqiwwQx23T71ibqV/jD7RhtsREnOr0PGchH5Sj6+aKmna0bAuBKMzlQwbrXw
 dqVhNdp3oLkHjn45soYU5gaiXXyCLp96RVwARUbIAOz+tXC4NGcZfyAO1ox3knkN3Tq4
 kvLKLf2nwbfauKm/MoBjaabVZy77ranQSOPnamIr8MyGYvRW4gAc52e2VLrbMty23356
 2hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760418364; x=1761023164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIoFLOpP+VU25GuJ2Zj7/OjFD1+eeWAQjBmMOslDOGE=;
 b=Fk9BKF9fEPi7PdOnuNu/Z4MY9801RCTFIef1b3d5XuBm4KGXp9MeoDoNQFFFLOtvok
 DhvTx/UbI9D/poMBgRs84z9d83boSsneK+sxOmGxt7QLbPLRqSAa+q6VL1PHCHdopxrx
 y1RX9KckLWhks51M3VRDDosl1IRijH+oSX6vj/aOJ48S/b9H7xgunpvGX1J6fx3TZ9bk
 RkFv7vsdpWmqq/jQwGdyM3edGILhsV+tMHSs4r0cSh/uXS233DuRWhPtFtarITKtXGBo
 5L1Fh+BV79yeCdlW5OxL3ryaaWKzK/bZvs91fnsjs0+CJfQjAS0YHo39LJ0aospmkKMx
 s/kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW362mwiF74m4nK0gqT5Ga7Ik7tYoPxDbXx/5iDE/8UmlCzqT+XI0F2XqNlM3/6fg7t7ZmZKk0Bhfj2@nongnu.org
X-Gm-Message-State: AOJu0Yy5CGgwrL/hOnloZU7yfAZUotx/WR26IxhzVipqZ82RF3j0Gq3y
 m/KgmJbPiG85oX/wsgV7Be+PSYg1EyyPRlfMbqahBM0OrYnI9dKn3O7OkskR5vuCAVB2Gwcl5V0
 UeeeQ1eWYZ3gga/bfLtY3lMbEsWeTYY8=
X-Gm-Gg: ASbGnctWpSeVm/PR8gPCMpK1kDqeLMhDf0wWJ5Cs4Sh5KCEOAwgvUJuKHIcT/KPksGw
 OjJcw0stHTWKT8UY5QxPfO+dOAFnvYmqRkPmPRrr7sGaro68oqbFJ02tXwwznyH/tZYEqABaLQT
 hP9+W/9Sz76BMIHtEEzrOlahHdJ80AxD8zVdWkwhn9kDsbt4eeVTR3pdiLDrwYyDD+3iNTq+H69
 sPXr4yRgSgtKRzwqT8F85cG0yMQq5pIqRmpa6CkXFFvi2PBJZDByztj
X-Google-Smtp-Source: AGHT+IGvkDZRgru9vmf/dxiD6w4vaUQ+cPRi/msEdmIpj4APkdzWEFlIC2U3FXjlQ6cG75m3AwttTBsBSkO+JE+mGvY=
X-Received: by 2002:a05:6402:1456:b0:63a:3e7:49e4 with SMTP id
 4fb4d7f45d1cf-63a03e75ebamr18458168a12.16.1760418363595; Mon, 13 Oct 2025
 22:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-8-philmd@linaro.org>
In-Reply-To: <20251010155045.78220-8-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:05:37 +1000
X-Gm-Features: AS18NWCWdJQkaJ5I6x6QAm1-qa-hH0ELj0f4nOhmovwxnMAQl-mAo6W1I5wwhOI
Message-ID: <CAKmqyKP0To_qOkV9c2SW39=--SJTZHimsqDtdYz8qk4jAXqp0A@mail.gmail.com>
Subject: Re: [PATCH 07/13] target/riscv: Conceal MO_TE within gen_fload_idx()
 / gen_fstore_idx()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Christoph Muellner <christoph.muellner@vrull.eu>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anton Johansson <anjo@rev.ng>, Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 11, 2025 at 1:53=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> All callers of gen_fload_idx() / gen_fstore_idx() set the MO_TE flag.
> Set it once in the callees.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_xthead.c.inc | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 70c563664ab..859cbc26cb2 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -349,6 +349,7 @@ static bool gen_fload_idx(DisasContext *ctx, arg_th_m=
emidx *a, MemOp memop,
>      TCGv_i64 rd =3D cpu_fpr[a->rd];
>      TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
>
> +    memop |=3D MO_TE;
>      tcg_gen_qemu_ld_i64(rd, addr, ctx->mem_idx, memop);
>      if ((memop & MO_SIZE) =3D=3D MO_32) {
>          gen_nanbox_s(rd, rd);
> @@ -369,6 +370,7 @@ static bool gen_fstore_idx(DisasContext *ctx, arg_th_=
memidx *a, MemOp memop,
>      TCGv_i64 rd =3D cpu_fpr[a->rd];
>      TCGv addr =3D get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, z=
ext_offs);
>
> +    memop |=3D MO_TE;
>      tcg_gen_qemu_st_i64(rd, addr, ctx->mem_idx, memop);
>
>      return true;
> @@ -379,7 +381,7 @@ static bool trans_th_flrd(DisasContext *ctx, arg_th_m=
emidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    return gen_fload_idx(ctx, a, MO_TE | MO_UQ, false);
> +    return gen_fload_idx(ctx, a, MO_UQ, false);
>  }
>
>  static bool trans_th_flrw(DisasContext *ctx, arg_th_memidx *a)
> @@ -387,7 +389,7 @@ static bool trans_th_flrw(DisasContext *ctx, arg_th_m=
emidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    return gen_fload_idx(ctx, a, MO_TE | MO_UL, false);
> +    return gen_fload_idx(ctx, a, MO_UL, false);
>  }
>
>  static bool trans_th_flurd(DisasContext *ctx, arg_th_memidx *a)
> @@ -395,7 +397,7 @@ static bool trans_th_flurd(DisasContext *ctx, arg_th_=
memidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    return gen_fload_idx(ctx, a, MO_TE | MO_UQ, true);
> +    return gen_fload_idx(ctx, a, MO_UQ, true);
>  }
>
>  static bool trans_th_flurw(DisasContext *ctx, arg_th_memidx *a)
> @@ -403,7 +405,7 @@ static bool trans_th_flurw(DisasContext *ctx, arg_th_=
memidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    return gen_fload_idx(ctx, a, MO_TE | MO_UL, true);
> +    return gen_fload_idx(ctx, a, MO_UL, true);
>  }
>
>  static bool trans_th_fsrd(DisasContext *ctx, arg_th_memidx *a)
> @@ -411,7 +413,7 @@ static bool trans_th_fsrd(DisasContext *ctx, arg_th_m=
emidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    return gen_fstore_idx(ctx, a, MO_TE | MO_UQ, false);
> +    return gen_fstore_idx(ctx, a, MO_UQ, false);
>  }
>
>  static bool trans_th_fsrw(DisasContext *ctx, arg_th_memidx *a)
> @@ -419,7 +421,7 @@ static bool trans_th_fsrw(DisasContext *ctx, arg_th_m=
emidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    return gen_fstore_idx(ctx, a, MO_TE | MO_UL, false);
> +    return gen_fstore_idx(ctx, a, MO_UL, false);
>  }
>
>  static bool trans_th_fsurd(DisasContext *ctx, arg_th_memidx *a)
> @@ -427,7 +429,7 @@ static bool trans_th_fsurd(DisasContext *ctx, arg_th_=
memidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> -    return gen_fstore_idx(ctx, a, MO_TE | MO_UQ, true);
> +    return gen_fstore_idx(ctx, a, MO_UQ, true);
>  }
>
>  static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
> @@ -435,7 +437,7 @@ static bool trans_th_fsurw(DisasContext *ctx, arg_th_=
memidx *a)
>      REQUIRE_XTHEADFMEMIDX(ctx);
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
> -    return gen_fstore_idx(ctx, a, MO_TE | MO_UL, true);
> +    return gen_fstore_idx(ctx, a, MO_UL, true);
>  }
>
>  /* XTheadFmv */
> --
> 2.51.0
>
>

