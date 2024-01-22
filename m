Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766ECC47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 07:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRoJx-00056Y-Sg; Mon, 22 Jan 2024 02:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoJv-00056H-VD; Mon, 22 Jan 2024 02:02:12 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoJu-0002m3-68; Mon, 22 Jan 2024 02:02:11 -0500
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-4670a58b118so366000137.2; 
 Sun, 21 Jan 2024 23:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705906928; x=1706511728; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cN2hoztAJFFJlQ16bugpMmWhL6Xb4qCHMeOGgysFN6U=;
 b=YtBjn2fofkch3BHjSpdj170wxJEe7DijsWQWmOqU8ezGjM/GxYS6Btrd4S2BhwRT+Q
 bl9FwfB23Lt44iP/K7ybOPbYJXeOC2ObYfxdPTM5uDT/3akntKvkcFtaILROpcCLy567
 gf4PukFAxUfjmHLGZqgve9rFljorEq/3nNP4ecA0+/taA4/YOkLW4NZY/iWgAP4Z/4yf
 OxXW1jX7bYxs5yPuWHH7Po2m6qbdSd+bfzO7pwa6ihxxAFsC6jRF4bnVSaS+BIIHhFqp
 /0wn5fNAYJ9kGNu9kqzz0SgOXv/9xqUAHu1p0z8RF6Ms2WTFgao1MkMbanAkiSJOQqvH
 8RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705906928; x=1706511728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cN2hoztAJFFJlQ16bugpMmWhL6Xb4qCHMeOGgysFN6U=;
 b=LSUn8u7g3gnFIsPyy9BmYu0VbMr9TR2KhtBTBfvxzMegoy/fN0LJbz8zlk8u9T/4z7
 gl0XGerIDbyPOofMLzFKWGlC8PAZNEWCAPnT7UnEmUbslJTAkFF3biRBHR8yxy1IbmHU
 IE1pZdi5Y+SWNRQyI8wLcLr4Uh8CyILqmyjkJGikKcv6gYHSn6219hwppmL9vzMpiRnT
 WTELSYElN4x9zA8R8Lbksysu8lP4rmUGppbGdtFu/nGSc6xRikbgtPGt8V8Ev4Nj6gyK
 XX7Qt+IxJOSk+5HcnnLVWdhSGqvpzlKCAYTGD7165HfcTBx3NDSKBMUUL0jeVDY+oWdH
 /0Ew==
X-Gm-Message-State: AOJu0YyiseJDjeeOeIOKCcmNeGZ0jI6PEVmpVE0yI0deEI2gZwzUZkhL
 6Sh3FjRIpAIZe0J8zPuwz9tkEhVHTuwJrGZ5TfpphYp8kd6BpC8jtBFmbEAHugR14vl3qP12fDm
 +weXh3tY8GmF5lu0idcQS7qArl8Y=
X-Google-Smtp-Source: AGHT+IEc2xUM96aYrlBXdVzp1fWzYzMx5GupHJHFLvfGUr1ZLVE9q5himZUwm2NGNSAV8RYsKCfySVF4NiWDcbjGbmw=
X-Received: by 2002:a05:6102:2f2:b0:469:bf25:1e55 with SMTP id
 j18-20020a05610202f200b00469bf251e55mr102666vsj.0.1705906928657; Sun, 21 Jan
 2024 23:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
 <20240109102930.405323-6-me@deliversmonkey.space>
In-Reply-To: <20240109102930.405323-6-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 17:01:42 +1000
Message-ID: <CAKmqyKO8PKzPee8rQsSMX_wf753ayhgKkqSe1-2vRdghgnL7Xw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_POST=0.001, TVD_PH_BODY_META_ALL=1.587,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, Jan 9, 2024 at 9:33=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c     | 22 ++++++++++++++++------
>  target/riscv/vector_helper.c | 13 +++++++++++++
>  2 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 2c89d749c0..457de381c7 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -579,8 +579,10 @@ static TCGv get_address(DisasContext *ctx, int rs1, =
int imm)
>      TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
>
>      tcg_gen_addi_tl(addr, src1, imm);
> -    if (get_address_xl(ctx) =3D=3D MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
> +    if (ctx->addr_signed) {
> +        tcg_gen_sextract_tl(addr, addr, 0, ctx->addr_width);
> +    } else {
> +        tcg_gen_extract_tl(addr, addr, 0, ctx->addr_width);
>      }
>
>      return addr;
> @@ -593,8 +595,10 @@ static TCGv get_address_indexed(DisasContext *ctx, i=
nt rs1, TCGv offs)
>      TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
>
>      tcg_gen_add_tl(addr, src1, offs);
> -    if (get_xl(ctx) =3D=3D MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
> +    if (ctx->addr_signed) {
> +        tcg_gen_sextract_tl(addr, addr, 0, ctx->addr_width);
> +    } else {
> +        tcg_gen_extract_tl(addr, addr, 0, ctx->addr_width);
>      }
>      return addr;
>  }
> @@ -1179,8 +1183,14 @@ static void riscv_tr_init_disas_context(DisasConte=
xtBase *dcbase, CPUState *cs)
>      ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
>      ctx->address_xl =3D FIELD_EX32(tb_flags, TB_FLAGS, AXL);
>      ctx->cs =3D cs;
> -    ctx->addr_width =3D 0;
> -    ctx->addr_signed =3D false;
> +    if (get_xl(ctx) =3D=3D MXL_RV32) {
> +        ctx->addr_width =3D 32;
> +        ctx->addr_signed =3D false;
> +    } else {
> +        int pm_pmm =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_PMM);
> +        ctx->addr_width =3D 64 - riscv_pm_get_pmlen(pm_pmm);
> +        ctx->addr_signed =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEN=
D);
> +    }
>      ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero =3D tcg_constant_tl(0);
>      ctx->virt_inst_excp =3D false;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 8e7a8e80a0..ff1178723c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -94,6 +94,19 @@ static inline uint32_t vext_max_elems(uint32_t desc, u=
int32_t log2_esz)
>
>  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong =
addr)
>  {
> +    RISCVPmPmm pmm =3D riscv_pm_get_pmm(env);
> +    if (pmm =3D=3D PMM_FIELD_DISABLED) {
> +        return addr;
> +    }
> +    int pmlen =3D riscv_pm_get_pmlen(pmm);
> +    bool signext =3D riscv_cpu_virt_mem_enabled(env);
> +    addr =3D addr << pmlen;
> +    /* sign/zero extend masked address by N-1 bit */
> +    if (signext) {
> +        addr =3D (target_long)addr >> pmlen;
> +    } else {
> +        addr =3D addr >> pmlen;
> +    }
>      return addr;
>  }
>
> --
> 2.34.1
>
>

