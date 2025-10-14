Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE12DCCD187
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:04:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8XC7-0001eg-JO; Tue, 14 Oct 2025 01:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XC6-0001az-FA
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:03:30 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XC3-0003R5-UF
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:03:30 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b3dbf11fa9eso807306966b.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 22:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760418206; x=1761023006; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Etpszexd14goBjk7gJj1VRfmUOLEwSwKCvC9Azf9fAA=;
 b=aMIBZVn7xquj+QoLaZolsp18sfk9MtTQFLVhNJQX0pPW9XECuSCGI/S3WEAlcr9zI7
 MrHRQoNXWw7ArvcHQBEFFpdgOv+Z6lW3m7jWMkkvJcLrpizLCYZZqWsZVniIwKvM9f42
 aKOdKXAl5bHYHZX7ahPoCCzAzEhJQ/VLw69LZ8kQeB0RfEH/uXYgJbh76mE/byRnaQeA
 mDyqQ8PwEWIWfeCQJr2UjYt1A/eMaqHrfVsSPpASOdqvlWmh624mhN2UQeHKWHTCLEdm
 PzyyIDx1BdILCe595uwYg80CpOA8qg3up9lAm4MFabMqYYtp9bk7CjgPdfzqs6X70jGj
 kb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760418206; x=1761023006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Etpszexd14goBjk7gJj1VRfmUOLEwSwKCvC9Azf9fAA=;
 b=V3sy34ysGp5kckKGX0k82UqJOUgIMbNW/rQeEa27QvXiLzZWuMIPMqb+txQnf3FDMQ
 5T/lIqOkBdW7isl5S9xUEClDZsNh2b/bG/5TQOxgfO41w/45CYbcwSM27qbj+6zheXQp
 NkBusej2zny0BtcJOVoIaXbgrjnUcU32NI1Iw5b9eWdrfg6ywdhOpP86LRo6qtbLXKOX
 cyd5bO9YYrG83BQ5G9Tl3ewAuHG8WMLKBIDdEUq/Nd5VYAhIwlhl9sroTU1RIRHpYNCW
 2RMngRFPp8hlAEiWxofQBc7xd2lv0P0ReHKxilwGT1ZZ1ktIg1ushSK8e9gVDVVrE2Cf
 m5dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq0dA4hpvt+wC2g0SMo4ufoKEC+DJy63O4YWZ6pF2L30APNdEZivwa080GP3AXSAZEQhN4SOhcg+Mh@nongnu.org
X-Gm-Message-State: AOJu0Yz8E4Yq4buJTRvrwFPOa/gGmWmySaOjSrKhT2Fuhmd7/OPa8QPE
 m06CjXNPknJ2LNBnUsvFoaS8g3/wk+2KX3IFd0mpDO6S1jlfn4qgNCqqo2Vv0kOzw5Hcn41e49I
 txH23VeVrwEv806+Wdy3Wo8EcRzX0XzQ=
X-Gm-Gg: ASbGnctS86I0opq3p6kRupaHCOXOyWKyGz+9g4IH7pDppKXNcDwPqj0O87z0kwGg/6D
 j++1VXBLOqY/eumKnSGOqpwskD0f4zujuvI/YzZR8kqs/r7bEdsvi5wrld9XclUbw/D028iyDIj
 mGSKuWe+zoZ1r/KxV5RmsXgrDrF8kIFNEtvN3N/1zOk0yx546aFULWt8CYSEPMh/uFZRDmKUi/k
 gQEQ4rHWFM51jma1tiaY2x0kDyJqR3mfOSSvP/D7sr6LoT76aog6xA+qXYvQBF3MNI=
X-Google-Smtp-Source: AGHT+IFP5fqthFzg+hLrlJHwLsRwXxqeRofGYLNnOCIwVlhtrU5ZmllSHQHKgqlAnZhj9zLyQb9M4tZWordksUlAryI=
X-Received: by 2002:a17:907:7ba4:b0:b3e:c7d5:4cbb with SMTP id
 a640c23a62f3a-b50ac2cf050mr2197439066b.35.1760418205724; Mon, 13 Oct 2025
 22:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-6-philmd@linaro.org>
In-Reply-To: <20251010155045.78220-6-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:02:58 +1000
X-Gm-Features: AS18NWABaSKtBYqxZiUp5o8DbXxPN6paWpLUDRyk7aMoVZVxxJktSwpYdj1Gw6k
Message-ID: <CAKmqyKMkRafPn1jUAEBj0QREm2ydEQ+S_H0x0UMRWHQG6zjqCg@mail.gmail.com>
Subject: Re: [PATCH 05/13] target/riscv: Conceal MO_TE within gen_load() /
 gen_store()
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
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x634.google.com
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

On Sat, Oct 11, 2025 at 1:57=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> All callers of gen_load() / gen_store() set the MO_TE flag.
> Set it once in the callees.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc   | 24 ++++++++++++-----------
>  target/riscv/insn_trans/trans_rvzce.c.inc |  6 +++---
>  2 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 8194ea5073e..8db3e78baab 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -404,6 +404,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, Me=
mOp memop)
>  {
>      bool out;
>
> +    memop |=3D MO_TE;
>      if (ctx->cfg_ptr->ext_zama16b) {
>          memop |=3D MO_ATOM_WITHIN16;
>      }
> @@ -428,24 +429,24 @@ static bool trans_lb(DisasContext *ctx, arg_lb *a)
>
>  static bool trans_lh(DisasContext *ctx, arg_lh *a)
>  {
> -    return gen_load(ctx, a, MO_TE | MO_SW);
> +    return gen_load(ctx, a, MO_SW);
>  }
>
>  static bool trans_lw(DisasContext *ctx, arg_lw *a)
>  {
> -    return gen_load(ctx, a, MO_TE | MO_SL);
> +    return gen_load(ctx, a, MO_SL);
>  }
>
>  static bool trans_ld(DisasContext *ctx, arg_ld *a)
>  {
>      REQUIRE_64_OR_128BIT(ctx);
> -    return gen_load(ctx, a, MO_TE | MO_SQ);
> +    return gen_load(ctx, a, MO_SQ);
>  }
>
>  static bool trans_lq(DisasContext *ctx, arg_lq *a)
>  {
>      REQUIRE_128BIT(ctx);
> -    return gen_load(ctx, a, MO_TE | MO_UO);
> +    return gen_load(ctx, a, MO_UO);
>  }
>
>  static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
> @@ -455,19 +456,19 @@ static bool trans_lbu(DisasContext *ctx, arg_lbu *a=
)
>
>  static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>  {
> -    return gen_load(ctx, a, MO_TE | MO_UW);
> +    return gen_load(ctx, a, MO_UW);
>  }
>
>  static bool trans_lwu(DisasContext *ctx, arg_lwu *a)
>  {
>      REQUIRE_64_OR_128BIT(ctx);
> -    return gen_load(ctx, a, MO_TE | MO_UL);
> +    return gen_load(ctx, a, MO_UL);
>  }
>
>  static bool trans_ldu(DisasContext *ctx, arg_ldu *a)
>  {
>      REQUIRE_128BIT(ctx);
> -    return gen_load(ctx, a, MO_TE | MO_UQ);
> +    return gen_load(ctx, a, MO_UQ);
>  }
>
>  static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
> @@ -507,6 +508,7 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb =
*a, MemOp memop)
>
>  static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
> +    memop |=3D MO_TE;
>      if (ctx->cfg_ptr->ext_zama16b) {
>          memop |=3D MO_ATOM_WITHIN16;
>      }
> @@ -525,24 +527,24 @@ static bool trans_sb(DisasContext *ctx, arg_sb *a)
>
>  static bool trans_sh(DisasContext *ctx, arg_sh *a)
>  {
> -    return gen_store(ctx, a, MO_TE | MO_SW);
> +    return gen_store(ctx, a, MO_SW);
>  }
>
>  static bool trans_sw(DisasContext *ctx, arg_sw *a)
>  {
> -    return gen_store(ctx, a, MO_TE | MO_SL);
> +    return gen_store(ctx, a, MO_SL);
>  }
>
>  static bool trans_sd(DisasContext *ctx, arg_sd *a)
>  {
>      REQUIRE_64_OR_128BIT(ctx);
> -    return gen_store(ctx, a, MO_TE | MO_UQ);
> +    return gen_store(ctx, a, MO_UQ);
>  }
>
>  static bool trans_sq(DisasContext *ctx, arg_sq *a)
>  {
>      REQUIRE_128BIT(ctx);
> -    return gen_store(ctx, a, MO_TE | MO_UO);
> +    return gen_store(ctx, a, MO_UO);
>  }
>
>  static bool trans_addd(DisasContext *ctx, arg_addd *a)
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ins=
n_trans/trans_rvzce.c.inc
> index d1301794324..c8dc102c8e3 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu =
*a)
>  static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_TE | MO_UW);
> +    return gen_load(ctx, a, MO_UW);
>  }
>
>  static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_TE | MO_SW);
> +    return gen_load(ctx, a, MO_SW);
>  }
>
>  static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
> @@ -106,7 +106,7 @@ static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a=
)
>  static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_store(ctx, a, MO_TE | MO_UW);
> +    return gen_store(ctx, a, MO_UW);
>  }
>
>  #define X_S0    8
> --
> 2.51.0
>
>

