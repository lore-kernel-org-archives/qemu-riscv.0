Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldOqA-0000E4-C1
	for mharc-qemu-riscv@gnu.org; Sun, 02 May 2021 23:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldOq4-0000Cr-Ne; Sun, 02 May 2021 23:01:42 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ldOps-0003qK-Of; Sun, 02 May 2021 23:01:40 -0400
Received: by mail-qt1-x82f.google.com with SMTP id 1so2799074qtb.0;
 Sun, 02 May 2021 20:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGuhw9Ku1JtZg/M1QL1En96iEWLlhiw5jHYDWwwsRLo=;
 b=uGswomg4tRdXyj0oHNPoh8gY87atsOc46Xkra8aEqqPhSVaxAxnRADr9lKxzXJjD48
 1zxAQ1ynhspr0qIIfop+VlVK684ZM/lP9qED99B5VBkFLpW/L9wANgNOXq/PDh22Q6DO
 yB0J4H2nLVaz2b+iRvo2GvnupZ/1B0jjiQt/hPmuRtGmY/c2x2VRLZ5slS4cIk6wocyw
 YYzuJemB1F8kMqPQ+VK4i64WlH7CK/qtx4mz+AB9zbGCfiDtioQao6/MbUEjJmxvWFX8
 LwGp1U4Ozlc/DOYoOsDkgyEnAQyqsEXSwlvhWddoQQfH6OOV2xy2U9EqD642yFRYz+Rt
 QmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGuhw9Ku1JtZg/M1QL1En96iEWLlhiw5jHYDWwwsRLo=;
 b=seLW/FZzmyFq3kSmrcMzgfaNGtAcjj0VtlFvPm3c+lzCvzVFmHo6xwl32zOL3pjVrb
 uhgpiRetHor784MFG1xP5mIKG4wi9qvMgYwxLs6AN/6XLUWVrNahhRwnljU4pxC4tKnC
 8Z1cNzr4R4NLqvqm4NVaQBZtmdhkwiVSNDEZg2O7HbykPPVHkop1BWnGOiHXF1KlfVF6
 j4c+68EE5abijwfx/hdQeQdGqmsmK6wNTtLHGgN4RSrmfukqKO816NtYT7XS3lapJTAI
 ExcBM1xXSuL0EQS0wEiLIfonpef3sQH2Mrg3lbvgGileDE2G6H/AA65Xmpl38k+T20at
 DEwQ==
X-Gm-Message-State: AOAM533iLaR3yXzcqIi7UL8GLHnwGjiIzX3IV4Sm6Y/NoZMFtfP1ACOc
 bBAt+dCDmkCCsyLLG/RhDzd6TkvvpG+nFrIV564=
X-Google-Smtp-Source: ABdhPJwOiASRqgOTxsvlKWgvBMo35j2pGG9yD+5/ygkqMRZPzR6pJzau0ynsXhdFOFIGnLVxNiyfT1HyezFhjRomUKM=
X-Received: by 2002:a05:622a:14c6:: with SMTP id
 u6mr15106901qtx.125.1620010880323; 
 Sun, 02 May 2021 20:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
 <20210430071302.1489082-5-bmeng.cn@gmail.com>
In-Reply-To: <20210430071302.1489082-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 May 2021 13:00:53 +1000
Message-ID: <CAKmqyKN1uW005iTR76dD=v_sZOHWtN9+00OudxQALTC9wmfcrw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] docs/system/riscv: Correct the indentation level
 of supported devices
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x82f.google.com
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
X-List-Received-Date: Mon, 03 May 2021 03:01:42 -0000

On Fri, Apr 30, 2021 at 5:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
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
> (no changes since v1)
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

