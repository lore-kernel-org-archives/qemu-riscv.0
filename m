Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCCEC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:05:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MpW-0000Ar-Ay; Thu, 25 May 2023 22:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MpT-0000Ah-Q7; Thu, 25 May 2023 22:05:20 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MpS-0003uv-6t; Thu, 25 May 2023 22:05:19 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-4393e3951ecso40084137.2; 
 Thu, 25 May 2023 19:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685066716; x=1687658716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niwCxKfvBgFLgKUEPm3ysQP2/Aobi6EQ7aJ8ncIDxgI=;
 b=pOLbwTLmb7ErtuEDLEETAnWwim6lIoA7ZwZTdBWkmc+WPbgiSJGks5gu9zKPpni7+Q
 2S3Wtqx2PiK811nsvbxmw3hEWxeGNZMUrs2ubpxFO7cznU+JPZ/Xc34A1okcud3pARof
 S+syEu4aRgv8hMWX5uCp6v65zLpxCK/RK/XIjfJCJsmYpV6RJPTpCuPB78KoFBSi6C5b
 OgQt0fy8K1qG4G+5FmUoJ9ex+/Y3S7z5F7Yno4KAHLUosyFJM7XFKOCBPW4hQ8JNSrKB
 j8kP5JnYmGSt/Y2hQkPE3EIeQEOn3iK7JjN26mf/fEfz57Ou5ZBsjZXGyDhOoWPlHauU
 S/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685066716; x=1687658716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niwCxKfvBgFLgKUEPm3ysQP2/Aobi6EQ7aJ8ncIDxgI=;
 b=STaJRrTMSKRNR/GvsJhKhFKudP9NiMjGEtGHiuPuq2/sNKGvn/ERrDQPV0T4eEbtGp
 iJzTPG2gZTpG2LNdU/DmFESbvZGTMNpCHtvcCLbspSuEbSE5r5dVA4T8uEr65lJy0AGx
 YdCVV8jfETb6A7h1djJPMd4uvf9zTEsI2JEWgnr0x/NU7NOuQjvHTe8BaekSclPzHVUT
 /9+0C1JpFM7e2Cb+xr8Qayq8UkPh5DEtSxBbJr6Sff1D5X5anQPBph0Pgw/V33McJUFk
 0cmNLepeWknqxfWZfg88PVUd8ELuFhfm9FnVPMJJi7cL4KqLuDhbn9Z5JlNxdU0VtI0u
 2a1A==
X-Gm-Message-State: AC+VfDxLMGDrBGcQSuuiJPs2Es9cDgz2xSwEQbcVWLhMiv4NYpaV438M
 Odv3LIpeA+2qiyiJ7HY8AilrHfPVjdeYzYrs/eYtx8WZI3WSGzDP
X-Google-Smtp-Source: ACHHUZ64qElrMnP6cOwF0xdJqCHSsmikiQtEFtyzm+z4wtSassPXIZUDHlMh2jNUZmHb1O6xXXtqu8neMl1qQVdFsKQ=
X-Received: by 2002:a67:eb0d:0:b0:42f:edd9:6f2e with SMTP id
 a13-20020a67eb0d000000b0042fedd96f2emr82600vso.10.1685066716657; Thu, 25 May
 2023 19:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 12:04:50 +1000
Message-ID: <CAKmqyKOWpL-910w+Wb7YgFTtW0MW3VS9yaK+=Lp2YXOwmauPeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/riscv: Change gen_goto_tb to work on
 displacements
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Wed, May 24, 2023 at 12:14=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Reduce reliance on absolute value to prepare for PC-relative translation.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>  target/riscv/translate.c                | 8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 0d52a80178..81ed0d200a 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -171,7 +171,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>      } else {
>          tcg_gen_brcond_tl(cond, src1, src2, l);
>      }
> -    gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
> +    gen_goto_tb(ctx, 1, ctx->cur_insn_len);
>
>      gen_set_label(l); /* branch taken */
>
> @@ -182,7 +182,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>          gen_pc_plus_diff(target_pc, ctx, next_pc);
>          gen_exception_inst_addr_mis(ctx, target_pc);
>      } else {
> -        gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
> +        gen_goto_tb(ctx, 0, a->imm);
>      }
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d756866925..8a371c0d75 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -281,8 +281,10 @@ static void exit_tb(DisasContext *ctx)
>      tcg_gen_exit_tb(NULL, 0);
>  }
>
> -static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
> +static void gen_goto_tb(DisasContext *ctx, int n, target_long diff)
>  {
> +    target_ulong dest =3D ctx->base.pc_next + diff;
> +
>       /*
>        * Under itrigger, instruction executes one by one like singlestep,
>        * direct block chain benefits will be small.
> @@ -557,7 +559,7 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)
>      }
>
>      gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
> -    gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for s=
afety */
> +    gen_goto_tb(ctx, 0, imm); /* must use this for safety */
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
>
> @@ -1228,7 +1230,7 @@ static void riscv_tr_tb_stop(DisasContextBase *dcba=
se, CPUState *cpu)
>
>      switch (ctx->base.is_jmp) {
>      case DISAS_TOO_MANY:
> -        gen_goto_tb(ctx, 0, ctx->base.pc_next);
> +        gen_goto_tb(ctx, 0, 0);
>          break;
>      case DISAS_NORETURN:
>          break;
> --
> 2.25.1
>
>

