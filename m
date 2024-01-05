Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9612C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcka-0005yH-Iy; Fri, 05 Jan 2024 00:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLckZ-0005xE-RK; Fri, 05 Jan 2024 00:28:07 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLckY-0007qO-CE; Fri, 05 Jan 2024 00:28:07 -0500
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-46746edb7bcso261768137.0; 
 Thu, 04 Jan 2024 21:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704432484; x=1705037284; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17UITJ0cKd8ZbUdLS4tLr7i0KiAKs/G+nSUHMwOtFBY=;
 b=E5073KVbOuyMTbXDWWI8XYTKOt4Cku+iYZo0PvkU+POtBORdekP4jkQt8WtljKf9X3
 0knZETe7O+2M4KZrrjmWH8kBS03KqDkocdPYGbUt6PaEbz7hRrVwXlcvclNyRo4OC1W1
 wxcTgSH9VgDESMtITithxZWwg5M0T+5dXg27WDlrruMYWQlg6StK+nb+rn/jsDvNtXLE
 G1Bfde9XYdC9SQLUgRIY2xL0steQIzzLHCeiUohituae7wF0UP5TxklFurJ4mnvNHDpE
 h9bSUc97en5bQNpq8M8SjRgkhqMZIbmLrXdaZH8VN8otmyaBZok0P8ex3gOz2ulAwpdV
 uvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704432484; x=1705037284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17UITJ0cKd8ZbUdLS4tLr7i0KiAKs/G+nSUHMwOtFBY=;
 b=q7eGBQLeaBvzETyRifJ46eSayt28y660aTYsCf3DIf1rvwc+egxNk/VeV6KL001r3Q
 BGwWpYVMR/UV6g6OB9zrxbm92ip6kTwK2HHe81rMe9K5Ve8PPnYNeGENMOtrkkkuDqPk
 n6E5dIlHEvGFY4oMtcmJi9X+VSZXRou+I2xdhoB1kIOLALeH8kRLvIroYDkrm23JM3Sx
 PGcZZUrKYS4qMj+MXV8HQbT657eE1/MilHQb0/YSkRD+b6nGIc/daC064NKNXjzMON/s
 EVX6jL7EezGudNXrObMiW19xcayesY/uR4h5SiORjcp8duJ4cCEdoJnNSSZENcNdUfAz
 i7HQ==
X-Gm-Message-State: AOJu0Yxb9vHGpQ1UFKruhPngzHnZuJbBLcHj1AiIj/FPFa8wAInjQBe5
 N4X6XkN9uHQRujgQ0uuHwGvz1coSWzNiThENQQw=
X-Google-Smtp-Source: AGHT+IGPd3vByghx9pUY/k4h2w1lPJJJH1acVd6tTcqsmVpDiv+inJK2H7EWKhF80AoQlEnbJdkGU7ClSpt/iWG8nDI=
X-Received: by 2002:a05:6102:3d86:b0:467:b489:5e52 with SMTP id
 h6-20020a0561023d8600b00467b4895e52mr403806vsv.18.1704432484630; Thu, 04 Jan
 2024 21:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-7-me@deliversmonkey.space>
In-Reply-To: <20240103185716.1790546-7-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:27:38 +1000
Message-ID: <CAKmqyKMbYg2baDXRfzLCMajGJ-DL9Kjm2sot2wD8rNHERbNSJQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] target/riscv: Enable updates for pointer masking
 variables and thus enable pointer masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

On Thu, Jan 4, 2024 at 4:58=E2=80=AFAM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> ---
>  target/riscv/cpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e6571ce99..13389ddc55 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,6 +153,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_12_0, ext_ssnpm),
> +    ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_12_0, ext_smnpm),
> +    ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_12_0, ext_smmpm),
>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>      ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -1337,6 +1340,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[=
] =3D {
>
>      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
>
> +    /* Zjpm v0.8 extensions */
> +    MULTI_EXT_CFG_BOOL("ssnpm", ext_ssnpm, false),
> +    MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
> +    MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),

What happens to the existing J property?


Alistair

> +
>      MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
>      MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
>      MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
> --
> 2.34.1
>
>

