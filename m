Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAABFC47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 06:16:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNoMd-0005FE-VS; Thu, 11 Jan 2024 01:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rNoMb-0005Ed-IR; Thu, 11 Jan 2024 01:16:25 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rNoMZ-0001Ls-W4; Thu, 11 Jan 2024 01:16:25 -0500
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7cc94f8756aso1434121241.0; 
 Wed, 10 Jan 2024 22:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704953782; x=1705558582; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojsK7vGTDBiMaisD8KNJOYHKXXDGZM9lgXsi63UiUEc=;
 b=hLxYRS/oMXfXAXkvMTrEUgSDy0i0XBuLGMs8x6ge1AbUdSkR1fkJOLanRsUlCIQr5l
 P7bTxsfWmZAaa55a8jqMBsLz6o3Nm1MtSaGxxAYm/16rqEQxggDxRXcN0HPqMyL0mhB0
 8xmbB7gc89aeQda2xoH2Tn2vKqA7sbEUzYtRPRULF93jdoQWVbRIMLtN0KtvfMtCXsUN
 Bm+UDgCAP5I8HXjP8bl0vvVkd+8YMbMjzA/RjzP1B6FdlBNAZB2+iJDSIHOLi7u7kbGO
 8q6ksFhHJ9GjpBvK51qe+yAcGCFoMQ5xsl+lxg4C8pAs3X8qgw1EcqLqRpnkphRrMKiE
 h+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704953782; x=1705558582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojsK7vGTDBiMaisD8KNJOYHKXXDGZM9lgXsi63UiUEc=;
 b=aASkiTGNzeFU/6o6DF9Oc1NPksO0aO2Yx5VZG4hUawYwN3nXkiz7ih/scy0x2EqRgY
 OeyrWlH1fmzyD17QXS7+o7bP5jyOTHpBQ9XrofcUzn0Ow2AzUoLHDVrC81i4ew7nyRuL
 yDbp9JcVrkzbadvrbVKTGxBGjt3GNRivwqemtgeziLTlOK9ZiLAZv58AWw2e44QQNx3B
 2qrZFER1sBUj0gPRfYb90k5m3o+TNqySOxyJhfQDCKt2ZojwfiDceWeJ1T81UI3SD0Lb
 vzos3/xHA6iimtzx9/jNo3wDm/k/x46mspyAzSXvF5p1TaMZmOh8eiQvEJODyDsJQ8hu
 TM1g==
X-Gm-Message-State: AOJu0Yzr0o8UCXTw+EQvMz8eGV1F/d06kDqphzMf6VEYfUdY08yypZhM
 kVECZgpAWX29RRRXXCOVNwMjCeqzgSPArxO6ees=
X-Google-Smtp-Source: AGHT+IHYri+jplGAdTWBREQJMJj9g2GABzbyVU3Mp4jhI8Byf32A+zapLyZF9dLOGsmmu9oc843Cot6ggB0ssSbkPDM=
X-Received: by 2002:a67:fc09:0:b0:467:cbc6:fa1 with SMTP id
 o9-20020a67fc09000000b00467cbc60fa1mr120971vsq.0.1704953782543; Wed, 10 Jan
 2024 22:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20240110163959.31291-1-rbradford@rivosinc.com>
In-Reply-To: <20240110163959.31291-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Jan 2024 16:15:56 +1000
Message-ID: <CAKmqyKO54ohZcQdgB3TFahRdCFm9wtBBKK-fPOguHWGp37SoXQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Check for 'A' extension on all atomic
 instructions
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jan 11, 2024 at 3:44=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> Add requirement that 'A' is enabled for all atomic instructions that
> lack the check. This makes the 64-bit versions consistent with the
> 32-bit versions in the same file.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rva.c.inc | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
> index 5f194a447b..f0368de3e4 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -163,65 +163,76 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_=
amomaxu_w *a)
>  static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_lr(ctx, a, MO_ALIGN | MO_TEUQ);
>  }
>
>  static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_sc(ctx, a, (MO_ALIGN | MO_TEUQ));
>  }
>
>  static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ)=
);
>  }
>
>  static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TEUQ));
>  }
>
>  static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TEUQ));
>  }
>
>  static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TEUQ));
>  }
>
>  static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
EUQ));
>  }
>
>  static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
>
>  static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
>
>  static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
>
>  static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
>  {
>      REQUIRE_64BIT(ctx);
> +    REQUIRE_EXT(ctx, RVA);
>      return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TEUQ));
>  }
> --
> 2.43.0
>
>

