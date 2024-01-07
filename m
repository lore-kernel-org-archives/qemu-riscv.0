Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B83C47074
	for <qemu-riscv@archiver.kernel.org>; Sun,  7 Jan 2024 23:41:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMclb-0007BY-Sq; Sun, 07 Jan 2024 18:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMcla-0007Au-2K; Sun, 07 Jan 2024 18:41:18 -0500
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMclY-0006iI-4o; Sun, 07 Jan 2024 18:41:17 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-67f9f6caabcso14064896d6.3; 
 Sun, 07 Jan 2024 15:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704670874; x=1705275674; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EW2dgSQrxieMxSNaTZ7OtZx+Dr1ZzgYu+7eKtMT4bAA=;
 b=JfcfTKYGUOVx7o3dkmAETgQMiKcWm72EiG2Z9kfbvkX39VfdhFcNENk8U0rjSJDlFg
 1MUyPwAkB2SFRrYAaoJauGrZfZbbW+2AFebwX8WcH0qJZ3laWZUlV2vRXzXolUqclTUc
 EB8kEcK0wf0AI9QPWmpPJ9OJ4vS7B6z3I1C55boXd1bSre/qFFkW5yv+KRuhD8ApyzBM
 /qCk9e+iw8nXDUM9mrULHsY3y5cdXBZ+HrP9MDKK0/+LiR64PNUfRiBE7vOaoJCaWSm6
 uQsf6m/yjAnKggqjSJVHiS5DkYjdhLG5BWtcsJs9/xfd7xTxAUN7KXtpghi9/Da3y9os
 NVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704670874; x=1705275674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EW2dgSQrxieMxSNaTZ7OtZx+Dr1ZzgYu+7eKtMT4bAA=;
 b=DTuyThBs0pYAAgo2W6bQ457ijWvYoLDR4/ynOfg1t58KamO8vNdckdtfxQnkqHVrD2
 BHbPivu9enJbhGjUWKXTlPeNCxPClZkl4vVsoPiL88uKh7Mr3QofZIPR90wARB3zFDKj
 XssJ2UfLRpSM5h/Jg9pCDGnhuR17nUeL1E4YWjqiKUxFUHKLoR03rGkOUo79XjQDdDk/
 dfzIkR+s/z203nhkXp8zuQ6hNR6cFawWZcCIIONADNRXXbTr2kE1RlUTMnvVzF79EmTP
 1F5jct7XGwA559n8K5XIb9dGdnEaHvHl2x+8viUesSlMMHJpfGrmZsgJIFL54AfZJJYh
 h+YQ==
X-Gm-Message-State: AOJu0YzrOnv1l/4Q2ojKN0cvR0I8frdDXK5zCxUg9HewfaZCar4kBXCR
 1ckEh4cz6+6c1ImpBMUpqnUOEAwlHvJZRPNgl/s=
X-Google-Smtp-Source: AGHT+IHnXGZEXA0U7WRX0UI7OsKBJgyfh+K5Gc3ZCV5GEIht4L9AYrp6p4neqaHEb103PFF/6pB3ji5Fc9XM3/MTmBE=
X-Received: by 2002:a0c:f98f:0:b0:680:ca82:b1c8 with SMTP id
 t15-20020a0cf98f000000b00680ca82b1c8mr3892214qvn.86.1704670873767; Sun, 07
 Jan 2024 15:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20240104071523.273702-1-bmeng@tinylab.org>
In-Reply-To: <20240104071523.273702-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jan 2024 09:40:47 +1000
Message-ID: <CAKmqyKMSs9vYMVKfgeye-vnPQOgk34sdQXNVty2YZMFQszNP8Q@mail.gmail.com>
Subject: Re: [PATCH] docs/system/riscv: sifive_u: Update S-mode U-Boot image
 build instructions
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=alistair23@gmail.com; helo=mail-qv1-xf2d.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

