Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE0C04A6A
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:25:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9P4-0003jr-PC; Thu, 10 Aug 2023 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9P3-0003j5-0H; Thu, 10 Aug 2023 13:24:53 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9P1-0000qW-H2; Thu, 10 Aug 2023 13:24:52 -0400
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-447a3d97d77so492912137.1; 
 Thu, 10 Aug 2023 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691688290; x=1692293090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWyJYnXfBQ1k0mHCplBELSf2rGr2UF8tA1vjtAa305g=;
 b=X+7B6/+IXWWu/GyCh2h33PRfM2L3AqzhbIUbBekn31L/u6HQhgkc4QK/5Bl2cdWyhB
 0eBDzTYT3UENMArxGD38z1kGYiNcBTgUxMYYAMgJO8HBaek1qQXI8bAd1dbyNrLfkdV+
 xgZ8j8WwVkqLI+8NFGl+JKb8LRxHYXxnU5SGLkZboepraJXFDsIuzEN4UFqF8hbprkyV
 +gKmWIu3dZ03DaqEQuBdo2EVz3vYpND61WncEHN+AT/SiWfKE/Hixlmn4sBiQHAgxFla
 zYzuqO6NUHlJcv5ldGhvyuwY9HE73PD2v925Tk79RtyQ9Ja3e8yCQmSj+U3xXXCedwhI
 7uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691688290; x=1692293090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWyJYnXfBQ1k0mHCplBELSf2rGr2UF8tA1vjtAa305g=;
 b=KuobZGEJV4uKo/7D+Nt2eZAb35j2KBIK3NOEjvDfBkRmpwTx44NFDVLWshZncv9gsq
 yVGG8eJndP1a9T0DwSMkYx4wXKowbmk3RPwoVESFI9Q2Aupb6vxwl7F8d5o66OSvX2z5
 82EZd0q0iOrAtdyWwYR3PklKIuifv7jKIElVgROyNI34kOUWbE76cKrtiIqZqr0BGmL+
 qGuGcb27TsEsQvnxaAY7nVMm7ZSkpD/lawG9sEdQuH04R9A7KNkQ4Wg3hr8/rj5K21Xl
 IDdO/wMXfeL6INDRE1BUuRog6LoCBzIemLljRtoWlDZSJJsoYxG1O6dwy9pBgxSJMye+
 LLdA==
X-Gm-Message-State: AOJu0Yz4zgvRwztte6EXoLZXxDdQYKSWQEvhnJbLeEbnv2lz292v3f3a
 nmxR9G9F3oJjZ2sGRKAbYVzV3ew/IXdmzKMgXmE=
X-Google-Smtp-Source: AGHT+IFY7065DewLLvIXkfH0x/YOYfElwPWl7ERDAn3MRhCK9vqNekt2e9VqggnZOuDWP6WUdvbtBTRBmatIImPKnyQ=
X-Received: by 2002:a05:6102:366b:b0:444:9475:362b with SMTP id
 bg11-20020a056102366b00b004449475362bmr2433689vsb.1.1691688290085; Thu, 10
 Aug 2023 10:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230728003906.768-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230728003906.768-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:24:24 -0400
Message-ID: <CAKmqyKNZbt6HP6_r1Ct_Rw17u69vF_qLZdyH8+KmPM0cgeqNmA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix zfa fleq.d and fltq.d
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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

On Thu, Jul 27, 2023 at 8:50=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
> Commit a47842d ("riscv: Add support for the Zfa extension") implemented t=
he zfa extension.
> However, it has some typos for fleq.d and fltq.d. Both of them misused th=
e fltq.s
> helper function.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next after adding a `Fixes` tag

Alistair

> ---
>  target/riscv/insn_trans/trans_rvzfa.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvzfa.c.inc b/target/riscv/ins=
n_trans/trans_rvzfa.c.inc
> index 2c715af3e5..0fdd2698f6 100644
> --- a/target/riscv/insn_trans/trans_rvzfa.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfa.c.inc
> @@ -470,7 +470,7 @@ bool trans_fleq_d(DisasContext *ctx, arg_fleq_d *a)
>      TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
>      TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_helper_fleq_d(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -485,7 +485,7 @@ bool trans_fltq_d(DisasContext *ctx, arg_fltq_d *a)
>      TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
>      TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
>
> -    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_helper_fltq_d(dest, cpu_env, src1, src2);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> --
> 2.17.1
>
>

