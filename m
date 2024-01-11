Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFB6C47077
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 03:56:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNmB5-0000EU-5u; Wed, 10 Jan 2024 22:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rNmB3-0000Ck-JH; Wed, 10 Jan 2024 22:56:21 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rNmB1-0003Hv-UD; Wed, 10 Jan 2024 22:56:21 -0500
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7cd4d77e2ebso1240978241.3; 
 Wed, 10 Jan 2024 19:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704945378; x=1705550178; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5u8iZUt0xzspJdtDx2KwRkuonkhiUyf8JF2IbRzzYs=;
 b=SodyO+wpv2y7IuYJTvJBPKzy1li21xgJAaouAe5NTsQNCHwXhOCPIYoDc8ud7i2gJe
 I5dcUPzTzmyzYPStTVtO6d/50jujaS2gWfE+ThNuhqvnrgxWW4Qsai9GQ3uMHOJHfMkp
 Jw9cfAzwzBVny7nuIVXRHLBa+Na/q5P9uzdXafD8oklFXWWSsAMRy9V8IweO3DwU1mQ/
 PJrjFcZ6sRFNzWQKEedkW28HbhqUHdxAYYG8/juV39l1m/Z5lZPs4unsYIPltcvUxHws
 0A4g4AVR+QrDVF8FeOwoLShBiePBqlyuSCJHRG0J0cn4ex2JHN1ck8x39zDEhBTw9AGl
 CaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704945378; x=1705550178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5u8iZUt0xzspJdtDx2KwRkuonkhiUyf8JF2IbRzzYs=;
 b=HtlcWGA39/DjmlZ0TOozJRkt5hNQAUiFCUUvAXlWO6vH9QtoBbW2LB02Y1/mqztw7r
 9qcklwpFZGDgJ/sUJMFP4Xe41HgaHIC4ga9krS+xVWMa3gBynKuZdBKySjCY0qHNt3im
 JWnghKhDlSc95GiOZNzNkaDBvRaOfuw6wqMbuIHPnOXsL+wfTuqvABYoy+h8mceekOcG
 a7qAWUkuahg3objo/uhdaiACprOLqp0DIOrcim2F9JwfwmpAPf46S4s0LXsjbnSZacQ0
 3ah1k56xCMRN5hQglpW102XGfCn0YWnlJBJUYlg4sTBUBqprvRwgI+v6oQBq71eStlwu
 HtVA==
X-Gm-Message-State: AOJu0Yx8fS0vEKdVuBzmdx/0ABIYIC9aMavySQCBK7QuGRXOf/HhZR+U
 4LaUE7Eo3Dygw2VUYjKNmB4kwDqV1nPA7VE5dnY=
X-Google-Smtp-Source: AGHT+IGeucXFfuLbLzkh3qcPug5s8iC0+7kY709Pv3wgyYOyc5hs3qQlccpEh45B9eay8bJNUUKEnZumCXwfemzsPyg=
X-Received: by 2002:a67:b44b:0:b0:468:115:4c23 with SMTP id
 c11-20020a67b44b000000b0046801154c23mr11421vsm.29.1704945378224; Wed, 10 Jan
 2024 19:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20240110163959.31291-1-rbradford@rivosinc.com>
In-Reply-To: <20240110163959.31291-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Jan 2024 13:55:51 +1000
Message-ID: <CAKmqyKPmMHvmuN3XkL4e9vxefpeCoEOdN-DeMVpkxQvATE7FWg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Check for 'A' extension on all atomic
 instructions
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

