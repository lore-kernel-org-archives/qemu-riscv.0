Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd31-0000f7-W4
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd30-0000ba-3I; Wed, 31 Mar 2021 11:46:22 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd2x-0002I2-EY; Wed, 31 Mar 2021 11:46:21 -0400
Received: by mail-io1-xd33.google.com with SMTP id f19so20573915ion.3;
 Wed, 31 Mar 2021 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gkennqXznIPHEjDcTXj4rAN3QaaLF0AWXtpvbjiQnDc=;
 b=XQ0t8OcuV+ew8O/Z2KeGJGXuHBmtXlAwPQdHI/on+DxorIq1jDriLbgCBvc5+eeSNl
 dHGChpw2PX6vHsCz4pKqMfoeW3ykmwzAp6fSkHpf/qAczEuPuQjY8t/2tYq7I9kTB+6s
 Z6+WAMnlSMgKkmuihdBCxtWZYgU+B9nrrWyL6m/Mrmr8ELuSc0J3wspuYfhzFXT+37qn
 K1m9BsgYY/XOJemWKJDYKfkHBFxChmk4qMWV4OJxUkoyPnb7qyi0IdmUBXAE6Ch3z/FM
 JkoMbN0LnzmsLoXvdWSe4+lS14oMH2RKdBdbp2F108ziuITLPv+t3o6uDKBcPhyYWzOa
 s2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gkennqXznIPHEjDcTXj4rAN3QaaLF0AWXtpvbjiQnDc=;
 b=jNzqFhVnfosPjykqim1ozHJThuKYsZgagDb1KSoDUdN3xBIj7NbO9/6PdHXrfZYLDL
 v4Nuf7QMZNPmmH8m1Ue+MzgQkvr+GJdATdRzzCUk2CjeZqiXesuDy4MY1tsfcWuCO4mu
 fwoNOScdo7bloPhTNTA4vYzd/zWHNejy/Y+6MTdjYK2bPm6lxS2HVi17mYvKj9GMNmSV
 5lc5piV8IyihxmmaA87HXAPuGb866Xq5TivUHLmcsmOCu3SJF9glXcgEG9I93Hg3Px2w
 R/MGfVTt2lhaAukGrW5Wv49rsFVXxeIDHF4aeP1xxVP8rZCrPi/s64wbQYoKc02BSeGv
 lHSg==
X-Gm-Message-State: AOAM530ZuV7DunVuDpWgy17htBrpb3qPrFumAx8ltzd6bfJwMlXLEOlb
 XVfsCfvUaCsHleM3klRKS0Uhfr9XfTX6joUeNHzfwWYRrA0=
X-Google-Smtp-Source: ABdhPJzQrz92/0OzEjVTgudGIK+AtVCLJswpC9asABivxpnkYVOqFbH7Xz+JGuL9UZ+SYh0SvNX9F0SxQNEWLAvHSXk=
X-Received: by 2002:a5d:9496:: with SMTP id v22mr2889240ioj.175.1617205578026; 
 Wed, 31 Mar 2021 08:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-5-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:44:07 -0400
Message-ID: <CAKmqyKN+UCJ_mNO5L6y7mmDBVsz=atARywnrr+xFbQw3AEy-7A@mail.gmail.com>
Subject: Re: [PATCH 5/8] docs/system/riscv: Correct the indentation level of
 supported devices
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Mar 2021 15:46:22 -0000

On Mon, Mar 29, 2021 at 1:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The supported device bullet list has an additional space before each
> entry, which makes a wrong indentation level. Correct it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/microchip-icicle-kit.rst | 20 +++++++--------
>  docs/system/riscv/sifive_u.rst             | 30 +++++++++++-----------
>  2 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> index 4fe97bce3f..e803131763 100644
> --- a/docs/system/riscv/microchip-icicle-kit.rst
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -15,16 +15,16 @@ Supported devices
>
>  The ``microchip-icicle-kit`` machine supports the following devices:
>
> - * 1 E51 core
> - * 4 U54 cores
> - * Core Level Interruptor (CLINT)
> - * Platform-Level Interrupt Controller (PLIC)
> - * L2 Loosely Integrated Memory (L2-LIM)
> - * DDR memory controller
> - * 5 MMUARTs
> - * 1 DMA controller
> - * 2 GEM Ethernet controllers
> - * 1 SDHC storage controller
> +* 1 E51 core
> +* 4 U54 cores
> +* Core Level Interruptor (CLINT)
> +* Platform-Level Interrupt Controller (PLIC)
> +* L2 Loosely Integrated Memory (L2-LIM)
> +* DDR memory controller
> +* 5 MMUARTs
> +* 1 DMA controller
> +* 2 GEM Ethernet controllers
> +* 1 SDHC storage controller
>
>  Boot options
>  ------------
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
> index 98e7562848..dcdfbda931 100644
> --- a/docs/system/riscv/sifive_u.rst
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -9,21 +9,21 @@ Supported devices
>
>  The ``sifive_u`` machine supports the following devices:
>
> - * 1 E51 / E31 core
> - * Up to 4 U54 / U34 cores
> - * Core Level Interruptor (CLINT)
> - * Platform-Level Interrupt Controller (PLIC)
> - * Power, Reset, Clock, Interrupt (PRCI)
> - * L2 Loosely Integrated Memory (L2-LIM)
> - * DDR memory controller
> - * 2 UARTs
> - * 1 GEM Ethernet controller
> - * 1 GPIO controller
> - * 1 One-Time Programmable (OTP) memory with stored serial number
> - * 1 DMA controller
> - * 2 QSPI controllers
> - * 1 ISSI 25WP256 flash
> - * 1 SD card in SPI mode
> +* 1 E51 / E31 core
> +* Up to 4 U54 / U34 cores
> +* Core Level Interruptor (CLINT)
> +* Platform-Level Interrupt Controller (PLIC)
> +* Power, Reset, Clock, Interrupt (PRCI)
> +* L2 Loosely Integrated Memory (L2-LIM)
> +* DDR memory controller
> +* 2 UARTs
> +* 1 GEM Ethernet controller
> +* 1 GPIO controller
> +* 1 One-Time Programmable (OTP) memory with stored serial number
> +* 1 DMA controller
> +* 2 QSPI controllers
> +* 1 ISSI 25WP256 flash
> +* 1 SD card in SPI mode
>
>  Please note the real world HiFive Unleashed board has a fixed configuration of
>  1 E51 core and 4 U54 core combination and the RISC-V core boots in 64-bit mode.
> --
> 2.25.1
>
>

