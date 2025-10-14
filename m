Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03934CCD187
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8XB1-00010K-6l; Tue, 14 Oct 2025 01:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XAn-0000wA-Tr
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:02:10 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XAl-0003N4-M0
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:02:09 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6399328ff1fso8431677a12.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 22:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760418126; x=1761022926; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kP4nw4aeVnWdqJirvH1XdVa0Ff5MAedwSZF1i/7me3w=;
 b=B6iEhnOhGHcmW54Ze4oInHkDJPro2A3BNH4uLSeRPlaingA8Dim4VVWPxMyBl2+STv
 fjq0eq80rlKkpmBUhDrE4fQrX+rbrsLAH+iGgn3QCFsZwCdm93E0pMFsEctcEhcNltqn
 qRk8HnBPC6PsNF09TxAJ2tGzZeR49zSA/EqS/3q+lIyDmoKc38q/x2IKcp/suVkIXi+J
 /qnT4ix17RL2l88qC4zbR6Zut/qI0xPESEckIyD0DyK7fezy+bvRVl5q/qC7yaS6zFI3
 BhwyHRFVsr2XbdiXiTZlbq2vzdCRqN1Pm3ZdxzF6hplQUE5tVGgKJRyVZ7pFALkNbyWd
 10yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760418126; x=1761022926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kP4nw4aeVnWdqJirvH1XdVa0Ff5MAedwSZF1i/7me3w=;
 b=VuDZJzisezoQr6LMavRzcbkcIRjuJnOzVU9kdxFWcT95SU37EOho7Da5FgsJ8I0ryX
 LLRhpfb/bipj200IJzeFeVAWLrwMbslJ9Xy20OOmZ0J4G+p/lVFzp+1uhVUQJbgB/X4C
 YS6W7hxpdUPkXuS524uLlYzmUPCCVc1SxIX/CFs+01Z8adyX3y4pKwhaDuJFjDuZnRxt
 xwm3FUAGqSpOyvaa7IUqhMSlPrnByjGIc6ZpqSOrLZEVcjDNh/NWUBOg7cTJlaV7nCKA
 qJ3A4zqAIKxxmkvXHXks36kEnwjMkxVOIYtX9gJO4AB4iK/17REI2W202MQHq9B5sH8s
 EVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz+lv+x3MyANTCdUz3k3DdxytnjQe3kZU7SWlrxtldMpDArphkLWDEuIq+Jo4oKHw7fo0UQZvMCwof@nongnu.org
X-Gm-Message-State: AOJu0YzWcLUAsxDrL0q8B+Cey4lwoyTXR0rsQTiNNJXpXXCCSarXTwV2
 C1qnmTgF+T/J9y2aoBNgxWhssrBlLKm99dnlpti9+/UrewV8Wc+8X4/vKkvdGo2cCAonUDIr4ON
 8oL373AlOugAaoA+UOpecgwRmfNrkq4E=
X-Gm-Gg: ASbGnctacr59f6uEo0Qr17/NSLQnpfi7dT0PPx/6BtZG22D83+qPcXnt7K3C0fkEDHw
 EF7mL+4xNyJW8F+ZxoD48etlYmt/uqHvZvnhxtAZMtznBPnKQIEGELhJaIISgz3HkaqyTwQ1UM1
 lqVYBBfczgCUj7rSl5Qk+vuqVOIyHdugO63mhEoVltJb+qvTac86gRr2gUrfW1A8jjLBOnC9rqx
 OQRv6P8lfNN86AGUPOcl4VXhiaxdyL256TdkWlLkKzNLRPj7kTM23nB
X-Google-Smtp-Source: AGHT+IE9dQlxKeCL+RboQi0kon2Ds9TunR9mbRughrMGFR5vnYmailnVTj/pLRjlYsET7DWmQJBD/DgAZq8dqzmA1jg=
X-Received: by 2002:a05:6402:27c7:b0:639:fc93:c0de with SMTP id
 4fb4d7f45d1cf-639fca34ac3mr15885003a12.23.1760418125844; Mon, 13 Oct 2025
 22:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-5-philmd@linaro.org>
In-Reply-To: <20251010155045.78220-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:01:39 +1000
X-Gm-Features: AS18NWAkvZR0oTVzbYgj3abCcxSC5IM4PcZfJRwzwW0qZ6JYfYXRfVVvDd73i7Q
Message-ID: <CAKmqyKNEPQr13gFNWa24t9c=n8MT4chy2aEDGS10SuXoV4Xfhg@mail.gmail.com>
Subject: Re: [PATCH 04/13] target/riscv: Conceal MO_TE within gen_inc()
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
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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
> All callers of gen_inc() set the MO_TE flag. Set it once in
> the callee.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_xthead.c.inc | 34 ++++++++++++----------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 754cb80e221..7e69906e5bf 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -568,6 +568,7 @@ static bool gen_load_inc(DisasContext *ctx, arg_th_me=
minc *a, MemOp memop,
>      TCGv rd =3D dest_gpr(ctx, a->rd);
>      TCGv rs1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
>
> +    memop |=3D MO_TE;
>      tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
>      tcg_gen_addi_tl(rs1, rs1, imm);
>      gen_set_gpr(ctx, a->rd, rd);
> @@ -588,6 +589,7 @@ static bool gen_store_inc(DisasContext *ctx, arg_th_m=
eminc *a, MemOp memop,
>      TCGv data =3D get_gpr(ctx, a->rd, EXT_NONE);
>      TCGv rs1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
>
> +    memop |=3D MO_TE;
>      tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
>      tcg_gen_addi_tl(rs1, rs1, imm);
>      gen_set_gpr(ctx, a->rs1, rs1);
> @@ -598,64 +600,64 @@ static bool trans_th_ldia(DisasContext *ctx, arg_th=
_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
>      REQUIRE_64BIT(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_SQ, false);
> +    return gen_load_inc(ctx, a, MO_SQ, false);
>  }
>
>  static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
>      REQUIRE_64BIT(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_SQ, true);
> +    return gen_load_inc(ctx, a, MO_SQ, true);
>  }
>
>  static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_SL, false);
> +    return gen_load_inc(ctx, a, MO_SL, false);
>  }
>
>  static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_SL, true);
> +    return gen_load_inc(ctx, a, MO_SL, true);
>  }
>
>  static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
>      REQUIRE_64BIT(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_UL, false);
> +    return gen_load_inc(ctx, a, MO_UL, false);
>  }
>
>  static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
>      REQUIRE_64BIT(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_UL, true);
> +    return gen_load_inc(ctx, a, MO_UL, true);
>  }
>
>  static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_SW, false);
> +    return gen_load_inc(ctx, a, MO_SW, false);
>  }
>
>  static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_SW, true);
> +    return gen_load_inc(ctx, a, MO_SW, true);
>  }
>
>  static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_UW, false);
> +    return gen_load_inc(ctx, a, MO_UW, false);
>  }
>
>  static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_load_inc(ctx, a, MO_TE | MO_UW, true);
> +    return gen_load_inc(ctx, a, MO_UW, true);
>  }
>
>  static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
> @@ -686,38 +688,38 @@ static bool trans_th_sdia(DisasContext *ctx, arg_th=
_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
>      REQUIRE_64BIT(ctx);
> -    return gen_store_inc(ctx, a, MO_TE | MO_SQ, false);
> +    return gen_store_inc(ctx, a, MO_SQ, false);
>  }
>
>  static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
>      REQUIRE_64BIT(ctx);
> -    return gen_store_inc(ctx, a, MO_TE | MO_SQ, true);
> +    return gen_store_inc(ctx, a, MO_SQ, true);
>  }
>
>  static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_store_inc(ctx, a, MO_TE | MO_SL, false);
> +    return gen_store_inc(ctx, a, MO_SL, false);
>  }
>
>  static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_store_inc(ctx, a, MO_TE | MO_SL, true);
> +    return gen_store_inc(ctx, a, MO_SL, true);
>  }
>
>  static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_store_inc(ctx, a, MO_TE | MO_SW, false);
> +    return gen_store_inc(ctx, a, MO_SW, false);
>  }
>
>  static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
>  {
>      REQUIRE_XTHEADMEMIDX(ctx);
> -    return gen_store_inc(ctx, a, MO_TE | MO_SW, true);
> +    return gen_store_inc(ctx, a, MO_SW, true);
>  }
>
>  static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
> --
> 2.51.0
>
>

