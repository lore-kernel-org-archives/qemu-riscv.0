Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E02C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:30:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLclw-0006j3-KJ; Fri, 05 Jan 2024 00:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLclu-0006iM-Qn; Fri, 05 Jan 2024 00:29:30 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLclt-00084V-7f; Fri, 05 Jan 2024 00:29:30 -0500
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7cd861086a7so422897241.1; 
 Thu, 04 Jan 2024 21:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704432567; x=1705037367; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGve81iZh7DeumVsNopDUzBrLKhnhLbrPWslp/4l6kA=;
 b=Qf9vvVC8CMAIHhxY4G6mDgH293SZub1C8kjhHoydrO8hOHrj0r7zzyKTmR20R7OrXQ
 kJy+luosm+h1qmBaS2B7J9n1SAnO1gAE55Sit5DXbIzMMRATIeQHj0ig2e4IsYQah0rf
 J4PsG6e18oZKp8bt5nnz1+yrIVEdZ2izh1GM/Dgt7of+r2aDbSGMdfTwBxC0lSyu8B/I
 qDCXXhbnymk3Wckwio0wyAYDKTDYABw1SqZOtE4NWzLsfLD541igkdHzXRuX4GJxrXff
 9b7pZUZ6QUXT2sHO/31Cltap3rDR+8pSOkLnPcmv6NuaBusWtUJznYVgOWB6HYwX1jn/
 OV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704432567; x=1705037367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGve81iZh7DeumVsNopDUzBrLKhnhLbrPWslp/4l6kA=;
 b=AWPGX4/8FyV/ztblzY31ZFF0hstrVhhHKK0KOAl+HG6EBafQjyqRTpm0G2D+kNMmeb
 i9YRpdnmwT3c+qBSpq3zY1Qj+K0gNteHgM9VFnL+xeog4D/mkddaCXCdX7CDVYDHKJQ0
 t/OuCILdI0c2x9D7aWSgUPA4/4FQeWDYNFlMnFIt3/QAc8wyypklNDAEHf+nGZ/HOuKu
 WMRSMHG701pC9SwMzgqdxifKVk5Fp7LKXUiVh/uDXB4xAyvAELCPM+JD7tnP8PhLzmmD
 oErW1kr4ujSq4I1GaL5QaefEJ3QHpM9ppMG1LGCLUUTO081aYKoI74o0CfZxy/C0Gqb/
 1GSw==
X-Gm-Message-State: AOJu0Yz0S3+mpu2CGNnrzznj9CcbiV6AhrKkCjgYzrOOUuJK2KIk0Rsq
 Nu4WFHJDlRE9SWpfRQkFF8E21gNp0scU96U2Xg0EnoYP
X-Google-Smtp-Source: AGHT+IE5i1rEeIy473NJp4v+Sa1QZU+yik+CYZ8FQ2iSusZaoY7CjC1qky/M1TylgYWVIYxvit+UEEEVnWFOGgoa8iw=
X-Received: by 2002:a05:6122:88d:b0:4b6:e6e1:49b3 with SMTP id
 13-20020a056122088d00b004b6e6e149b3mr1443269vkf.17.1704432567658; Thu, 04 Jan
 2024 21:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20240104071523.273702-1-bmeng@tinylab.org>
In-Reply-To: <20240104071523.273702-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:29:01 +1000
Message-ID: <CAKmqyKMmcVBU5BxwNxY58BvqXmYSB+fFOR0FKHy0bqTeO_OoqQ@mail.gmail.com>
Subject: Re: [PATCH] docs/system/riscv: sifive_u: Update S-mode U-Boot image
 build instructions
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Thu, Jan 4, 2024 at 5:18=E2=80=AFPM Bin Meng <bmeng@tinylab.org> wrote:
>
> Currently, the documentation outlines the process for building the
> S-mode U-Boot image using `make menuconfig` and manual actions within
> the menuconfig UI. However, this approach is fragile due to Kconfig
> options potentially changing across different releases. For example,
> CONFIG_OF_PRIOR_STAGE has been replaced by CONFIG_BOARD since v2022.01
> release, and CONFIG_TEXT_BASE has been moved to the 'General setup'
> menu from the 'Boot options' menu in v2024.01 release.
>
> This update aims to make the S-mode U-Boot image build instructions
> future-proof. It leverages the 'config' script provided in the U-Boot
> source tree to edit the .config file, followed by a `make olddefconfig`.
>
> Validated with U-Boot v2024.01 release.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  docs/system/riscv/sifive_u.rst | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
>
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.=
rst
> index 7b166567f9..8f55ae8e31 100644
> --- a/docs/system/riscv/sifive_u.rst
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -210,7 +210,7 @@ command line options with ``qemu-system-riscv32``.
>  Running U-Boot
>  --------------
>
> -U-Boot mainline v2021.07 release is tested at the time of writing. To bu=
ild a
> +U-Boot mainline v2024.01 release is tested at the time of writing. To bu=
ild a
>  U-Boot mainline bootloader that can be booted by the ``sifive_u`` machin=
e, use
>  the sifive_unleashed_defconfig with similar commands as described above =
for
>  Linux:
> @@ -325,15 +325,10 @@ configuration of U-Boot:
>
>    $ export CROSS_COMPILE=3Driscv64-linux-
>    $ make sifive_unleashed_defconfig
> -  $ make menuconfig
> -
> -then manually select the following configuration:
> -
> -  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior S=
tage bootloader DTB
> -
> -and unselect the following configuration:
> -
> -  * Library routines ---> Allow access to binman information in the devi=
ce tree
> +  $ ./scripts/config --enable OF_BOARD
> +  $ ./scripts/config --disable BINMAN_FDT
> +  $ ./scripts/config --disable SPL
> +  $ make olddefconfig
>
>  This changes U-Boot to use the QEMU generated device tree blob, and bypa=
ss
>  running the U-Boot SPL stage.
> @@ -352,17 +347,13 @@ It's possible to create a 32-bit U-Boot S-mode imag=
e as well.
>
>    $ export CROSS_COMPILE=3Driscv64-linux-
>    $ make sifive_unleashed_defconfig
> -  $ make menuconfig
> -
> -then manually update the following configuration in U-Boot:
> -
> -  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior S=
tage bootloader DTB
> -  * RISC-V architecture ---> Base ISA ---> RV32I
> -  * Boot options ---> Boot images ---> Text Base ---> 0x80400000
> -
> -and unselect the following configuration:
> -
> -  * Library routines ---> Allow access to binman information in the devi=
ce tree
> +  $ ./scripts/config --disable ARCH_RV64I
> +  $ ./scripts/config --enable ARCH_RV32I
> +  $ ./scripts/config --set-val TEXT_BASE 0x80400000
> +  $ ./scripts/config --enable OF_BOARD
> +  $ ./scripts/config --disable BINMAN_FDT
> +  $ ./scripts/config --disable SPL
> +  $ make olddefconfig
>
>  Use the same command line options to boot the 32-bit U-Boot S-mode image=
:
>
> --
> 2.34.1
>
>

