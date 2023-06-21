Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404D3EB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 00:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBlfA-0000Tn-HV; Tue, 20 Jun 2023 20:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qBlf9-0000TG-NA; Tue, 20 Jun 2023 20:25:31 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qBlf8-00014c-2H; Tue, 20 Jun 2023 20:25:31 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-440b4b0147bso701974137.1; 
 Tue, 20 Jun 2023 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687307128; x=1689899128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlSsorIZ3xzCtGqJbL0V7Q+2pschuwoy7zRCLEG2mFA=;
 b=MYorALeNuJO65UM3qPrJhd2tPwqUtnyaJg9+QkhO5ukuFfy9yfu0cPJNiC4HAvGrPk
 W7nriom5JhZoCjjdplbBcEsPNha4zmwUpw74Nhnjn4GCmvq0VZzExlQhqyRDdh2eYLG7
 jx0CQ68sQ4BBdiI4X4nqroCwSGSKeopXfbttc7r2ryLGwp0ON20UHOf2XPsKil8GeygM
 sMQjyfv4WlmkjdTz4t9cihw+S6pTilonkVJqUgj8HdrP1dKVlV4wMfY4NMH4p2p9ztbq
 NyKdHcFq5G+7ixyJYN1QvUuEbYR1CUtoOjir7EnP1q+zBg54tq0cbu03fUT9aMQ/hUNE
 M0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687307128; x=1689899128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GlSsorIZ3xzCtGqJbL0V7Q+2pschuwoy7zRCLEG2mFA=;
 b=BK6QrRVtUg1d2RLYBXgG7huEbVEOUWtX6AFYa7QakKuVLe+vrQXzYXdmmhXcbapCvp
 2vM3TeOQ4OvqTjrUqLwYAEks/yjufb3Cv0uUPH4p17/NJQC5mnrIEh9QX7YHwHQrirIZ
 7P9rQD4whlAZ397Zu8/QwPsdaO7sVOZcAJELQPtO0kaP/45Y5/FuP5IVevHL16MHPpDY
 SiMg2LwjYKN2s/m0EH0fR1Bu/FpoepbRNe631D2tX8w14XRtop7A27me4dymu7g7pVgB
 qZ3cV/cKAbLftIMtBiVeg1sMjwrC54Wb9w31KHI6OxMFmkyrY9ayI26d8v71Cwt8J3i4
 mRsQ==
X-Gm-Message-State: AC+VfDyqGCfWjmC73dsgvcZYtuK9u0ju3F7sXlKBPfMYLorE0slq+BIw
 JF6ef9+bim2gWGbzv+W1Om2J7nX5yj2OcAKUoHQ=
X-Google-Smtp-Source: ACHHUZ69giLLfza5raYLM03n0DYWYnmPUvSLPcOF/FK5V63edspWf+5S58cHWv7AQsovQNGb1n1oeEgMviKW4/uK9tc=
X-Received: by 2002:a67:ec4c:0:b0:43f:6dff:cfc5 with SMTP id
 z12-20020a67ec4c000000b0043f6dffcfc5mr3550213vso.0.1687307127773; Tue, 20 Jun
 2023 17:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230620152443.137079-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230620152443.137079-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Jun 2023 10:24:49 +1000
Message-ID: <CAKmqyKOCnmcSz9yxiRQb66bUNBtCvdXLui6ntgDsKQAL6dTArA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: fix veyron-v1 CPU properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Wed, Jun 21, 2023 at 1:25=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit 7f0bdfb5bfc2 ("target/riscv/cpu.c: remove cfg setup from
> riscv_cpu_init()") removed code that was enabling mmu, pmp, ext_ifencei
> and ext_icsr from riscv_cpu_init(), the init() function of
> TYPE_RISCV_CPU, parent type of all RISC-V CPUss. This was done to force
> CPUs to explictly enable all extensions and features it requires,
> without any 'magic values' that were inherited by the parent type.
>
> This commit failed to make appropriate changes in the 'veyron-v1' CPU,
> added earlier by commit e1d084a8524a. The result is that the veyron-v1
> CPU has ext_ifencei, ext_icsr and pmp set to 'false', which is not the
> case.
>
> The reason why it took this long to notice (thanks LIU Zhiwei for
> reporting it) is because Linux doesn't mind 'ifencei' and 'icsr' being
> absent in the 'riscv,isa' DT, implying that they're both present if the
> 'i' extension is enabled. OpenSBI also doesn't error out or warns about
> the lack of 'pmp', it'll just not protect memory pages.
>
> Fix it by setting them to 'true' in rv64_veyron_v1_cpu_init() like
> 7f0bdfb5bfc2 already did with other CPUs.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Fixes: 7f0bdfb5bfc2 ("target/riscv/cpu.c: remove cfg setup from riscv_cpu=
_init()")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..707f62b592 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -444,6 +444,9 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>
>      /* Enable ISA extensions */
>      cpu->cfg.mmu =3D true;
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.pmp =3D true;
>      cpu->cfg.ext_icbom =3D true;
>      cpu->cfg.cbom_blocksize =3D 64;
>      cpu->cfg.cboz_blocksize =3D 64;
> --
> 2.41.0
>
>

