Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A120C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YKt-0000P4-85; Sun, 11 Jun 2023 23:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YKo-0000OC-1i; Sun, 11 Jun 2023 23:35:14 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YKl-0008Jl-NS; Sun, 11 Jun 2023 23:35:13 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-78a57844f42so1038604241.2; 
 Sun, 11 Jun 2023 20:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686540910; x=1689132910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbQIfWr5g8GZxSk0AN9FMhs4zAA9dbL9qh9nfZomTYM=;
 b=oddKyoHb4Z+Ulpj6x9c1RbVz39EAlVcsHbmRXVQ3K461yzD4Sr0bpYy6TRFDYLAiWT
 iWcgRbnD4+6z/IV4PmcN6kTjMeCdR5ngxDpCJrdGeq6eASRAwdGEe8a2Mxccbz0Vxfqo
 VfRPGbYUwc5MNDoVIeMiaPgVxkoQs4o+7qkVPkypxgmWi8obp/PZsaIckNzXtuoZnstf
 vFrVP/rNWpQavqSzz23EqJctl2U2QJl4wFZ6MiQCfARwEpXlbPcqY+F83WmyapgysbY9
 vCyx/iCdQVdgG3qbj4MzkPeHBbqmYdKVWI32IGaP0FZgpCRb70dDYT3+AHofiHFx/Q6B
 08gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686540910; x=1689132910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbQIfWr5g8GZxSk0AN9FMhs4zAA9dbL9qh9nfZomTYM=;
 b=Q4saxamaEMlIlFQfP2E4/ZzSekVOtEN5xcym3SNl0qM0PhiCiU3edyjVjJSQlgOAZh
 EA6ewWwufwg9JNzcpyZmG5fSz0mwrDUL6D4eW0E9AFLCEsQMVP9TTkpt+AYSAS7cCjqf
 icJjqEk5U8P8tDDCT8SPQfcIl3K53LyUk9mwd2uLmq5KF8NVyE/NN2p9Rsd++3bW6kNY
 2urTmSl7Ax95fxj+/hKkF3XYIsbZtRD+RsCX0vHf2VZqSzlNjKsuU5WcWAhIqnj0paoA
 YS6G0+DEcdCoiVrliaWKGMa7+RYq+XUY28oos6OIVToNrErJnJF5fwh+HfdSElfXR6qO
 SdhQ==
X-Gm-Message-State: AC+VfDxIYSlPE5Ag2bnSbQuKsjBsUNvC27n5jgqTTw9Ta3DEUMQwMh2/
 4ORlPE7Nq7pyOtPS227l16bNeI3Hjou1N9GcBB4=
X-Google-Smtp-Source: ACHHUZ7DrClgjcgGg0PM7m/LfY13+bNTwqWDo2eE3QeJMyTA+J30/7sK2tWHDGyPgwlneHeFe/0OdKgx6j6UI1MgWZs=
X-Received: by 2002:a67:ad08:0:b0:43b:3c6e:67f7 with SMTP id
 t8-20020a67ad08000000b0043b3c6e67f7mr2324167vsl.22.1686540909629; Sun, 11 Jun
 2023 20:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-7-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-7-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:34:43 +1000
Message-ID: <CAKmqyKPkErk2ciZ-WqcYhNHCUv5x4UmcVbgJag_XODdPOLVm7A@mail.gmail.com>
Subject: Re: [PATCH 6/9] target/riscv/cpu: Share RISCVCPUConfig with
 disassembler
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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

On Tue, May 30, 2023 at 11:20=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> The disassembler needs the available extensions in order
> to properly decode instructions in case of overlapping
> encodings (e.g. for vendor extensions).
>
> Let's use the field 'disassemble_info::private_data' to store
> our RISCVCPUConfig pointer.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5b7818dbd1..6f0cd9a0bb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -819,6 +819,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, dis=
assemble_info *info)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(s);
>      CPURISCVState *env =3D &cpu->env;
> +    RISCVCPUConfig *cfg =3D &cpu->cfg;
> +
> +    info->private_data =3D cfg;
>
>      switch (env->xl) {
>      case MXL_RV32:
> --
> 2.40.1
>
>

