Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B60C001DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 12:55:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVtZm-0004S1-3W; Tue, 15 Aug 2023 08:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1qVtZi-0004QY-HS; Tue, 15 Aug 2023 08:55:06 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1qVtZg-0006oC-7W; Tue, 15 Aug 2023 08:55:06 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68872ca740bso185527b3a.2; 
 Tue, 15 Aug 2023 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692104101; x=1692708901;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2jmxTjtwkwdzk9jVI8+IfmWJHUzEfm8Y6kEBVsKAes=;
 b=Y48FxWtzLtd2hoMUnDqUYOwmlPZrm2Vgn6Vesys52+NK9I0PC36pMtYElrSwbGP/ZT
 Nb72CEfT+Wqm9YysNt0xq0sfqUNjLxyKbinWeINrhiNzEXJCky7R6HI5MqM6j6r95AxB
 mw5zwBdrDwNXdChbMUtoqGGmwJP/akt28sL0gcqn3UAcy5KKGJvV2piZVubKWklYPZDi
 AptIXqhO2ZQXw0oRBLCZQXY5+P5UNus07LfDRtT+ZyOBG/oUFDCe+c8yFLnqqiWRCgDw
 g8hY5U+xQaWdG7dI8M6QlCbjzndADmRVl86Hp2BaKuatOWK9u+g8mNrQwSbneSwc22hU
 n4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692104101; x=1692708901;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L2jmxTjtwkwdzk9jVI8+IfmWJHUzEfm8Y6kEBVsKAes=;
 b=LDPSHe5zslMKuI2uqvBR3O4mbvKgH6nGhqfzUBWIEuGq7oC7tEW0RsmqQsHQlx1PAh
 gkQVV65pVyTTtwjOy7rR8CW3Jlr210RLIgYLyH4A1EaPgSQ/GJQ1yvPkBJQjG3lC5HAf
 p1YYQwyMiamcejecSH36Bj5CY1lScSzqcsYhOpOM3ENAscHUqWTE0OMdFALwH29VzkY8
 /XJGXPR0J4uTbL6tcL9RB6Y7ARUsAKZcq7aGxU/GNsXBDsj8zAKO52yqyoY2hd5yu7fD
 Uo7WlXUg/0yc/0/HFIUVtEykWW1E023drAGGuBfvGagWYtTozikGWLTWbHjpgUgR72Er
 oz/g==
X-Gm-Message-State: AOJu0YyJ/b22II3k7khlcLU8bpIbxhbiadKrsJnppd65Tp5zYAqh0x2s
 dHT82PGO+K+rTgY5Aa1Wo4M=
X-Google-Smtp-Source: AGHT+IH6uKM8KppsBx2ceMrnjcqmBNFI83NWl2k3mVqSHrm3h+uPQDcXqLdvoC4uxJ4INVjaDm2eoQ==
X-Received: by 2002:a05:6a00:398a:b0:67a:a906:9edb with SMTP id
 fi10-20020a056a00398a00b0067aa9069edbmr14632499pfb.30.1692104100635; 
 Tue, 15 Aug 2023 05:55:00 -0700 (PDT)
Received: from localhost ([61.68.161.249]) by smtp.gmail.com with ESMTPSA id
 s11-20020a62e70b000000b0068746ab9aebsm9588787pfh.14.2023.08.15.05.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 05:55:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Aug 2023 22:54:54 +1000
Message-Id: <CUT4U9OHLOS1.P67WFTW3R24G@wheely>
Cc: <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>,
 <qemu-s390x@nongnu.org>
Subject: Re: [PATCH 07/24] target/ppc: Use tcg_gen_negsetcond_*
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Richard Henderson" <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
X-Mailer: aerc 0.15.2
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-8-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-8-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On Tue Aug 8, 2023 at 1:11 PM AEST, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  target/ppc/translate/fixedpoint-impl.c.inc | 6 ++++--
>  target/ppc/translate/vmx-impl.c.inc        | 8 +++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index f47f1a50e8..4ce02fd3a4 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -342,12 +342,14 @@ static bool do_set_bool_cond(DisasContext *ctx, arg=
_X_bi *a, bool neg, bool rev)
>      uint32_t mask =3D 0x08 >> (a->bi & 0x03);
>      TCGCond cond =3D rev ? TCG_COND_EQ : TCG_COND_NE;
>      TCGv temp =3D tcg_temp_new();
> +    TCGv zero =3D tcg_constant_tl(0);
> =20
>      tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
>      tcg_gen_andi_tl(temp, temp, mask);
> -    tcg_gen_setcondi_tl(cond, cpu_gpr[a->rt], temp, 0);
>      if (neg) {
> -        tcg_gen_neg_tl(cpu_gpr[a->rt], cpu_gpr[a->rt]);
> +        tcg_gen_negsetcond_tl(cond, cpu_gpr[a->rt], temp, zero);
> +    } else {
> +        tcg_gen_setcond_tl(cond, cpu_gpr[a->rt], temp, zero);
>      }
>      return true;
>  }
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
> index c8712dd7d8..6d7669aabd 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1341,8 +1341,7 @@ static bool trans_VCMPEQUQ(DisasContext *ctx, arg_V=
C *a)
>      tcg_gen_xor_i64(t1, t0, t1);
> =20
>      tcg_gen_or_i64(t1, t1, t2);
> -    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 0);
> -    tcg_gen_neg_i64(t1, t1);
> +    tcg_gen_negsetcond_i64(TCG_COND_EQ, t1, t1, tcg_constant_i64(0));
> =20
>      set_avr64(a->vrt, t1, true);
>      set_avr64(a->vrt, t1, false);
> @@ -1365,15 +1364,14 @@ static bool do_vcmpgtq(DisasContext *ctx, arg_VC =
*a, bool sign)
> =20
>      get_avr64(t0, a->vra, false);
>      get_avr64(t1, a->vrb, false);
> -    tcg_gen_setcond_i64(TCG_COND_GTU, t2, t0, t1);
> +    tcg_gen_negsetcond_i64(TCG_COND_GTU, t2, t0, t1);
> =20
>      get_avr64(t0, a->vra, true);
>      get_avr64(t1, a->vrb, true);
>      tcg_gen_movcond_i64(TCG_COND_EQ, t2, t0, t1, t2, tcg_constant_i64(0)=
);
> -    tcg_gen_setcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1);
> +    tcg_gen_negsetcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1=
);
> =20
>      tcg_gen_or_i64(t1, t1, t2);
> -    tcg_gen_neg_i64(t1, t1);
> =20
>      set_avr64(a->vrt, t1, true);
>      set_avr64(a->vrt, t1, false);


