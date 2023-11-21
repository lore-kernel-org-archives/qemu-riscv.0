Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF46C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 05:25:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5JGQ-0008H8-Q3; Tue, 21 Nov 2023 00:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5JGI-0008FW-1c; Tue, 21 Nov 2023 00:25:26 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5JGC-0000k9-UG; Tue, 21 Nov 2023 00:25:25 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-462a24a7583so498669137.1; 
 Mon, 20 Nov 2023 21:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700544318; x=1701149118; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODDnYhnNJGT4HVCdZSSg7d+SgIQVjIy1ewFbVw6KxX8=;
 b=fj4Nm9nnaZgd5TiLar61SqNDpdhwDiyDBMwo0P/yl+q9O0aU0M3uObinB/VkdD8D+J
 F3brsZ0apoSZcSExRXdZtpIHLOZdGnFE2F/+KgwykFNyNSUD9r8Afb+TGfLfLSSMTHmq
 edneWeCE4EVeAVH4OEarss+BbzZf/+a62Lq8YgkvDUamfJ33bjPwthcJJCvTnz9yqQRH
 jhJ3eSgmTgWxdHXcTrqJ3LyjzzrzH2HE1VWJPE8HJqX5ACFoY/oZi/f1Ek7ynVwf5lZl
 vD03mKk6/Zjv+JjCdfwyRyBC+nXkioujGHIpy+/h/SQ2JHEoqpjcJE3mSC6w/DklvvW+
 UCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700544318; x=1701149118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODDnYhnNJGT4HVCdZSSg7d+SgIQVjIy1ewFbVw6KxX8=;
 b=fJKAnxQeiQWHHpUeAVh0Hcxg3SUGf9D9qyb/hJv5XIGaFA/SwUSkb9ou8K6OSsukeO
 BLp8G/szrmyKGozmPs46+VTQUA9CE0Tb7w4DtXRRJELFn3e0kZESrCKHh+iFYWfANCTc
 Om6/6xJUvaxYn5Y2Z5/C5jquAz3htcBxakhgxjdJSl4nzXmERV3Qn6AzjZgbdBpjHlLI
 tWUM4VKz3Yhkv02QsCj6ak7GvR54VxeHUOvCIcmVAFVEkLwyRrvZWOATvvlPqqQnCdrF
 N+Pa/dxToD2jt+CmSIG6vu5qID5V9+GuAXkFnRQZnYuP3jAqP55Ew0e1aLRx8jKXB/9j
 vY4g==
X-Gm-Message-State: AOJu0YwtquOZL1NY8+Ocr2we7F9Lpj7t2oJL5Rg0RMLCO+bYvBhL0QL3
 ARIr4lte+c2CMSrqaiU3Df522+K3JKnjITMoQQM=
X-Google-Smtp-Source: AGHT+IFiVjZg3OBvSkfFG+kKjK3isObVBq3hxlrOkQZ2NU81FFLKxGLqp7TBvwAO4VDoRqdjE/OyeNdsIUEnDSAc/c0=
X-Received: by 2002:a05:6102:1085:b0:462:9efa:77a0 with SMTP id
 s5-20020a056102108500b004629efa77a0mr5191192vsr.11.1700544317702; Mon, 20 Nov
 2023 21:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20231114094705.109146-1-ethan84@andestech.com>
 <20231114094705.109146-2-ethan84@andestech.com>
In-Reply-To: <20231114094705.109146-2-ethan84@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 15:24:50 +1000
Message-ID: <CAKmqyKOVpATp-pjkvqZtJHF3B0M5NpUJqDeyin8rVG8gpbtj4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] hw/core: Add config stream
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

On Tue, Nov 14, 2023 at 7:49=E2=80=AFPM Ethan Chen via <qemu-devel@nongnu.o=
rg> wrote:
>
> Make other device can use /hw/core/stream.c by select this config.
>
> Signed-off-by: Ethan Chen <ethan84@andestech.com>
> ---
>  hw/core/Kconfig     | 3 +++
>  hw/core/meson.build | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index 9397503656..628dc3d883 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -27,3 +27,6 @@ config REGISTER
>
>  config SPLIT_IRQ
>      bool
> +
> +config STREAM
> +    bool
> \ No newline at end of file

You are missing a newline here. I think checkpatch should catch this,
make sure you run it on all of your patches

> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 67dad04de5..d6ce14d5ce 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -34,6 +34,7 @@ system_ss.add(when: 'CONFIG_REGISTER', if_true: files('=
register.c'))
>  system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
>  system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
>  system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'=
))
> +system_ss.add(when: 'CONFIG_STREAM', if_true: files('stream.c'))

You have added the build but not the file. This will fail to compile.

Each patch must compile and run when applied individually in order.
That way we maintain git bisectability. Can you please make sure that
the build is not broken as your patches are applied

Alistair

>
>  system_ss.add(files(
>    'cpu-sysemu.c',
> --
> 2.34.1
>
>

