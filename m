Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA5C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:02:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF4pw-0004PE-D1; Sun, 17 Dec 2023 23:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF4pr-0004Od-Hu; Sun, 17 Dec 2023 23:02:31 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF4pq-0001ib-2w; Sun, 17 Dec 2023 23:02:31 -0500
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4b6c3a37ddeso196527e0c.0; 
 Sun, 17 Dec 2023 20:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702872148; x=1703476948; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvbarZLcf8+hdpbtuI2t6ImhljTfKcEURhaE3dBn6OI=;
 b=ZRi0Y2cDP7TrTBUZ+cqldWf82b6+Ur8SJj/NzoHGyRsYv/Xr8mO5hSzxNN1eJoE9Wx
 45Mn4Bx/rAt5MeDgJBuJrlno5Jxhs3palGF3B4eXgYjg2zKXnT2wyM7Jgkln1j7OWzAc
 exwGNNY/pg3lJHywwBkzx/00c2mPWwkbhcxaZOvmC9uXa9kdigUfR9y8AeYJoF0aNJo0
 9z1UCF+DtCtQy2OEV/xo0oFJ8YvVm0ahAlP9qq1XwoDq8zI962pGBDd8yfzXKiNg+7+7
 FClWbySy3UnU9tAE/FP1wWEONaUelL0Hx/g/xrDgOF66rPHUkGtVo3xVq49DDxdLBTFL
 ZPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702872148; x=1703476948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvbarZLcf8+hdpbtuI2t6ImhljTfKcEURhaE3dBn6OI=;
 b=qeL7SAW2NPVD4l5/s9clLidzxOw75RFUsOhFgy9hCn7S0aKTMj/z6F+5LsRrbflplI
 jixh3XMEnh/MnDZ3nR40Z03WTOoNpPC3QFb58Om4CVQTbhBvq2yrSAYMVZJCw6fJy0WG
 Ndp4Ifj02yM2p3ktRQYXJjluMSf/ll+FIv2crGSAuWSnKjviRBIK+Ms42v6JOebhumot
 69FvI9c+hAIE+PWmCLptc3ckISIGK80HmVX45TiI/QrLA58VUsCU3cSgej0SMnPm9tb2
 wjCV7qAihIDMV1I4bumpnM7fH00n0Pp3OeAjvitC9maSJRBUx7vTUW4Poa0Owl+kUOxn
 3n1A==
X-Gm-Message-State: AOJu0YzQl5U2QpUYJbRJQ5mriz1YJuS7yu/d7I26HSs7trayVl+D43Yg
 pEoG2vrCeHCu54mn24vA5tR1Qr6MrxolxvA8Sss=
X-Google-Smtp-Source: AGHT+IE2K/ywxH1dRQAeDXX+FlsN/t80BgvzXrEX+5NxrwPaqNJwqNbV1c1UAbhuV9IC+zZIxZG7t6io8hYxmyVq7s0=
X-Received: by 2002:a05:6122:2519:b0:4b6:cb66:778c with SMTP id
 cl25-20020a056122251900b004b6cb66778cmr161888vkb.16.1702872148510; Sun, 17
 Dec 2023 20:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20231122053251.440723-1-ethan84@andestech.com>
 <20231122053251.440723-2-ethan84@andestech.com>
In-Reply-To: <20231122053251.440723-2-ethan84@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 14:02:02 +1000
Message-ID: <CAKmqyKMgxiW5ZK=OmGiDEpTXJN=jyFnzxMzduxkD9Dvn1WDM3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] hw/core: Add config stream
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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

On Wed, Nov 22, 2023 at 3:36=E2=80=AFPM Ethan Chen via <qemu-devel@nongnu.o=
rg> wrote:
>
> Make other device can use /hw/core/stream.c by select this config.

Ensure other devices can use /hw/core/stream.c by selecting this config.

>
> Signed-off-by: Ethan Chen <ethan84@andestech.com>

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/Kconfig          | 1 +
>  hw/core/Kconfig     | 3 +++
>  hw/core/meson.build | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 9ca7b38c31..e4d153dce7 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -79,6 +79,7 @@ config XILINX
>  config XILINX_AXI
>      bool
>      select PTIMER # for hw/dma/xilinx_axidma.c
> +    select STREAM
>
>  config XLNX_ZYNQMP
>      bool
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index 9397503656..e89ffa728b 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -27,3 +27,6 @@ config REGISTER
>
>  config SPLIT_IRQ
>      bool
> +
> +config STREAM
> +    bool
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 67dad04de5..0893917b12 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -32,8 +32,8 @@ system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: fil=
es('platform-bus.c'))
>  system_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
>  system_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
>  system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
> -system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
>  system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'=
))
> +system_ss.add(when: 'CONFIG_STREAM', if_true: files('stream.c'))
>
>  system_ss.add(files(
>    'cpu-sysemu.c',
> --
> 2.34.1
>
>

