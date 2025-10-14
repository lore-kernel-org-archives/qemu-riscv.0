Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70C6CCD187
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:08:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8XGj-0005qN-Oh; Tue, 14 Oct 2025 01:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XGi-0005pv-6y
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:08:16 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XGf-000430-P7
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:08:15 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so9952269a12.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 22:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760418492; x=1761023292; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCFg8GQZ8N7TRGfFDC1CbUF45/hppBTzTrcEYziz9ec=;
 b=IjR48bRETIjiSZ2bhE4cyC+ZPN1WYnpFOEeXW+am8Wr+XbaC7n3Pq14Urt+z2soEGe
 FE78ofGyvGU/uf7H8WNJjKIePldVI7SHUnrCiA4A5SJoX7OaKBw2aacZbI1Ye5OJXYwS
 LZphafkD9ygTC8+KHvsLBAqVV7eJGk9MXROvTy8wOXaUhkTqLyNOZtycRMhVJMeHHiHQ
 kUkmFJ5Wl9LMIZMh1+78MQGLdnyyAG71pgpGSar4U9r7/XQKBtJQIR6gtq0W4msas68c
 kdVCmVSZjgKkKi97Sc+AgyjwwZJX2Z63fHejiv0qL3z0uvZRX7/BA3ra/LL0Dk9tVQGt
 lJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760418492; x=1761023292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCFg8GQZ8N7TRGfFDC1CbUF45/hppBTzTrcEYziz9ec=;
 b=Rvdvctphe3xydZQEbcOotCX4yQIW+wlGbjT0vd4uy6T66RGOb4HjJoC7I63RDTrtg7
 AwtLE56U6oy9aO7l7RcMEI+aWgWvDXWNfVliyx3MPMRiGt/TzHE6RVHAtXd7H+8HzGol
 //7+fAlHo9O2G54HSu8q8GYIn2k3S10t1JF/5AH4KhomFOEXbdsoyT2blEaaq4yCWmRe
 ELF4+eLWyZiMgkVEDWudvgFkVnaz0O9l2VhsQUDyRwD6keRgUM30UO+nsGdhk/kKU+Uz
 CcEWrFa77Dkrk04KT/0pLfP+FGvAa+FEom1VovvN3SqTYf4zR5NXNXrF/3T37ki3SOdT
 HXXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3/Nhowui0DkmHeVLlA6/Fa9yM7rctROXfvAfkjvW+CXevlhNuVuJ+ZYpEnnhR3RJvp3U4vrnaChGB@nongnu.org
X-Gm-Message-State: AOJu0Yx9VllWfXI7KnPSTb8oXT49sNZlcn7du+c+vIkz2HkmEQHOM9nZ
 a8YjNn9Bn3AcJad4pzEZn+l1N4KOOtM6X1pJDK9UdZVYzaGh3+qmfcHY+M8HPAKA7r2ghhxWWnt
 bczhm1Mt2j7p9b8jvnWO9EZvSGC8tl4g=
X-Gm-Gg: ASbGnctJ07RSvKAMURDtIUdcvd7A580WFysfLh52S76hmJpOH8a9zOltBl/d4frp/04
 xQg4rmVohsqPnjkqTlA6WTg8SFk0nWoC+iS0DMd8sWxuXgTFtRd//1MOsM4U5Qs58/V4UgqPOMV
 9C10N5YjZMB0QVF5ouCEHBKE2UJs623mWepQa3KaZ5ECgtWKccG2JhEryvKpM4NzkExi6s1OMNB
 8ExgZQr1v1nNJTqQv2dtz7wHCxRByzgEt+R90+/U6IiHD27Eu+D0aO1eSo1x9XO6+U=
X-Google-Smtp-Source: AGHT+IEmPgBglgbIHrm5TjBPcDrnmGPMrBZgx69WIInCIPHgU3/sQrUa0pcPQUGq0S58C5hmIo0e44Xs/tQmUILQ7U8=
X-Received: by 2002:aa7:d859:0:b0:62f:386d:aedb with SMTP id
 4fb4d7f45d1cf-639d5c75ccbmr15781004a12.36.1760418491943; Mon, 13 Oct 2025
 22:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-10-philmd@linaro.org>
In-Reply-To: <20251010155045.78220-10-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:07:45 +1000
X-Gm-Features: AS18NWAC0HmOkOTJ_8CJMIHcP-auKC22syij_2RnEY6lDjNh_h3nQWeH1pOpEII
Message-ID: <CAKmqyKN8fPV-sZBC8gS_VB2PctSS+oqQ496y1H9Aqv9udvadCw@mail.gmail.com>
Subject: Re: [PATCH 09/13] target/riscv: Conceal MO_TE within gen_cmpxchg*()
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
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Oct 11, 2025 at 1:55=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> All callers of gen_cmpxchg() / gen_cmpxchg64() set the MO_TE flag.
> Set it once in the callees.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                    | 1 +
>  target/riscv/insn_trans/trans_rvzabha.c.inc | 2 +-
>  target/riscv/insn_trans/trans_rvzacas.c.inc | 7 ++++---
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 94af9853cfe..2e6f39aa02d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1156,6 +1156,7 @@ static bool gen_cmpxchg(DisasContext *ctx, arg_atom=
ic *a, MemOp mop)
>      TCGv src1 =3D get_address(ctx, a->rs1, 0);
>      TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
>
> +    mop |=3D MO_TE;
>      decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>      tcg_gen_atomic_cmpxchg_tl(dest, src1, dest, src2, ctx->mem_idx, mop)=
;
>
> diff --git a/target/riscv/insn_trans/trans_rvzabha.c.inc b/target/riscv/i=
nsn_trans/trans_rvzabha.c.inc
> index c1f99b65f09..302c63f2a3d 100644
> --- a/target/riscv/insn_trans/trans_rvzabha.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzabha.c.inc
> @@ -141,5 +141,5 @@ static bool trans_amocas_h(DisasContext *ctx, arg_amo=
cas_h *a)
>  {
>      REQUIRE_ZACAS(ctx);
>      REQUIRE_ZABHA(ctx);
> -    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TE | MO_SW);
> +    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_SW);
>  }
> diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc b/target/riscv/i=
nsn_trans/trans_rvzacas.c.inc
> index 5e7c7c92b72..d850b142642 100644
> --- a/target/riscv/insn_trans/trans_rvzacas.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
> @@ -25,7 +25,7 @@
>  static bool trans_amocas_w(DisasContext *ctx, arg_amocas_w *a)
>  {
>      REQUIRE_ZACAS(ctx);
> -    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TE | MO_SL);
> +    return gen_cmpxchg(ctx, a, MO_ALIGN | MO_SL);
>  }
>
>  static TCGv_i64 get_gpr_pair(DisasContext *ctx, int reg_num)
> @@ -76,6 +76,7 @@ static bool gen_cmpxchg64(DisasContext *ctx, arg_atomic=
 *a, MemOp mop)
>      TCGv src1 =3D get_address(ctx, a->rs1, 0);
>      TCGv_i64 src2 =3D get_gpr_pair(ctx, a->rs2);
>
> +    mop |=3D MO_TE;
>      decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>      tcg_gen_atomic_cmpxchg_i64(dest, src1, dest, src2, ctx->mem_idx, mop=
);
>
> @@ -88,10 +89,10 @@ static bool trans_amocas_d(DisasContext *ctx, arg_amo=
cas_d *a)
>      REQUIRE_ZACAS(ctx);
>      switch (get_ol(ctx)) {
>      case MXL_RV32:
> -        return gen_cmpxchg64(ctx, a, MO_ALIGN | MO_TE | MO_UQ);
> +        return gen_cmpxchg64(ctx, a, MO_ALIGN | MO_UQ);
>      case MXL_RV64:
>      case MXL_RV128:
> -        return gen_cmpxchg(ctx, a, MO_ALIGN | MO_TE | MO_UQ);
> +        return gen_cmpxchg(ctx, a, MO_ALIGN | MO_UQ);
>      default:
>          g_assert_not_reached();
>      }
> --
> 2.51.0
>
>

