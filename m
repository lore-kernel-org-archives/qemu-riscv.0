Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE443C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2N5O-0006LZ-SY; Thu, 25 May 2023 22:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2N5N-0006LL-Os; Thu, 25 May 2023 22:21:45 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2N5L-0006HQ-Vo; Thu, 25 May 2023 22:21:45 -0400
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4395361b74dso42971137.1; 
 Thu, 25 May 2023 19:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685067702; x=1687659702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bt4uUdIUVJbRpYlPA8bg3pUKGKebRE5iX4xZEBUVDoM=;
 b=MbxlaxwJwArQqHxe3dsn61uBRUV+JpkVfIEc350IXtdl1QfmvQilffa8Rcm7bwi8ue
 jUCZkFBh6a240XigOAeGmlmFPPDNjPIECZST5AndPKiJCbtd5NFESNdSCAFbr9lqi8R2
 9Me+A/St2GFTXjYBNyEIeX+zE/Fd/YvFGp/Ajwb44pwn+QWEyuc6nbMn8iS6BBm2oV3J
 HK3eMVvDHRXx2H/nGJAn0o0PskBLf4MDNrbx5BhsMQavg0nt5W6O6MahFHVnPKYlMdzd
 g8PzcdlURk35YJPaQzpL7IAIOajMsUwBklggNQ1ccA9+1rbyHR9JDMMBnm/NZ+ZvEKhg
 NZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685067702; x=1687659702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bt4uUdIUVJbRpYlPA8bg3pUKGKebRE5iX4xZEBUVDoM=;
 b=GFniLLV2IFXBflr5zS6oGFBi52uaPGgBkK1yxGp+Zm3J6znpF+LqllPZGE5M/+cVNW
 YQuPveRHYzIl3Olyg7NadQ0sj3wGU4kmpnuw0vk9aaY8BxtM+pSWEaI3vPK68HRMBQ7/
 QAmekP4wa98Yq/h9ptp/DYS/EUgjvztcN/8SWlXFwBZEUa93t5b39WKHXTAOqanpKEWW
 JMKgv5TauWVdbvTmR/NeiqagRlLhq3jk6KxdFemTwcTEZ8gJagYEUHKtkjICF6oF+cdT
 YPKnz8Pq1srWFMhWavHi+xksYSWXlgBRpEpnNEXpLrgakCtuDhn8xTB3p3lHielkuZi0
 HkKA==
X-Gm-Message-State: AC+VfDwZjeSPaMmYa0az7U/Y0h8rKJy06CM5IMg9AHu+xYi/js83obcs
 Ztj16Z+O1ewjd9vWZDKRp3q3UXKZlIoQqh9BrbEe34Gv4Q+RscR8
X-Google-Smtp-Source: ACHHUZ6iDejvAgZ/Fhm3WKav2+s5abl6sDOnxfamhvkvaA6iVZzScGvEP6sd7vpBg4B09nK+vPJY9v/+D5InkBfc+ys=
X-Received: by 2002:a05:6102:419:b0:437:dc96:5e5b with SMTP id
 d25-20020a056102041900b00437dc965e5bmr103290vsq.27.1685067702220; Thu, 25 May
 2023 19:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 12:21:16 +1000
Message-ID: <CAKmqyKPfJVa=+ER=6wEAD_M4-LY6=xGgtwxzi-0TZzaH0JKOxg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] target/riscv: Change gen_set_pc_imm to
 gen_update_pc
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Wed, May 24, 2023 at 12:08=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Reduce reliance on absolute values(by passing pc difference) to
> prepare for PC-relative translation.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_privileged.c.inc |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc        |  6 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc        |  4 ++--
>  target/riscv/insn_trans/trans_rvzawrs.c.inc    |  2 +-
>  target/riscv/insn_trans/trans_xthead.c.inc     |  2 +-
>  target/riscv/translate.c                       | 10 +++++-----
>  6 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
> index 7c2837194c..3760fb4393 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -112,7 +112,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>  {
>  #ifndef CONFIG_USER_ONLY
>      decode_save_opc(ctx);
> -    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    gen_update_pc(ctx, ctx->cur_insn_len);
>      gen_helper_wfi(cpu_env);
>      return true;
>  #else
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 81ed0d200a..f9f4d25cda 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -776,7 +776,7 @@ static bool trans_pause(DisasContext *ctx, arg_pause =
*a)
>       * PAUSE is a no-op in QEMU,
>       * end the TB and return to main loop
>       */
> -    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    gen_update_pc(ctx, ctx->cur_insn_len);
>      exit_tb(ctx);
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>
> @@ -800,7 +800,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fenc=
e_i *a)
>       * FENCE_I is a no-op in QEMU,
>       * however we need to end the translation block
>       */
> -    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    gen_update_pc(ctx, ctx->cur_insn_len);
>      exit_tb(ctx);
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>      return true;
> @@ -811,7 +811,7 @@ static bool do_csr_post(DisasContext *ctx)
>      /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
>      decode_save_opc(ctx);
>      /* We may have changed important cpu state -- exit to main loop. */
> -    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    gen_update_pc(ctx, ctx->cur_insn_len);
>      exit_tb(ctx);
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>      return true;
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 6c07eebc52..c2f7527f53 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -169,7 +169,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs=
1, TCGv s2)
>      gen_set_gpr(s, rd, dst);
>      mark_vs_dirty(s);
>
> -    gen_set_pc_imm(s, s->pc_succ_insn);
> +    gen_update_pc(s, s->cur_insn_len);
>      lookup_and_goto_ptr(s);
>      s->base.is_jmp =3D DISAS_NORETURN;
>      return true;
> @@ -188,7 +188,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv=
 s1, TCGv s2)
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
>      gen_set_gpr(s, rd, dst);
>      mark_vs_dirty(s);
> -    gen_set_pc_imm(s, s->pc_succ_insn);
> +    gen_update_pc(s, s->cur_insn_len);
>      lookup_and_goto_ptr(s);
>      s->base.is_jmp =3D DISAS_NORETURN;
>
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/i=
nsn_trans/trans_rvzawrs.c.inc
> index 8254e7dfe2..32efbff4d5 100644
> --- a/target/riscv/insn_trans/trans_rvzawrs.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -33,7 +33,7 @@ static bool trans_wrs(DisasContext *ctx)
>      /* Clear the load reservation  (if any).  */
>      tcg_gen_movi_tl(load_res, -1);
>
> -    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    gen_update_pc(ctx, ctx->cur_insn_len);
>      tcg_gen_exit_tb(NULL, 0);
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 3e13b1d74d..da093a4cec 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -999,7 +999,7 @@ static void gen_th_sync_local(DisasContext *ctx)
>       * Emulate out-of-order barriers with pipeline flush
>       * by exiting the translation block.
>       */
> -    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    gen_update_pc(ctx, ctx->cur_insn_len);
>      tcg_gen_exit_tb(NULL, 0);
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8a371c0d75..b01aa48f04 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -232,14 +232,14 @@ static void gen_pc_plus_diff(TCGv target, DisasCont=
ext *ctx,
>      tcg_gen_movi_tl(target, dest);
>  }
>
> -static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
> +static void gen_update_pc(DisasContext *ctx, target_long diff)
>  {
> -    gen_pc_plus_diff(cpu_pc, ctx, dest);
> +    gen_pc_plus_diff(cpu_pc, ctx, ctx->base.pc_next + diff);
>  }
>
>  static void generate_exception(DisasContext *ctx, int excp)
>  {
> -    gen_set_pc_imm(ctx, ctx->base.pc_next);
> +    gen_update_pc(ctx, 0);
>      gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> @@ -291,10 +291,10 @@ static void gen_goto_tb(DisasContext *ctx, int n, t=
arget_long diff)
>        */
>      if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
>          tcg_gen_goto_tb(n);
> -        gen_set_pc_imm(ctx, dest);
> +        gen_update_pc(ctx, diff);
>          tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
> -        gen_set_pc_imm(ctx, dest);
> +        gen_update_pc(ctx, diff);
>          lookup_and_goto_ptr(ctx);
>      }
>  }
> --
> 2.25.1
>
>

