Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p1xNN-0008Rl-FN
	for mharc-qemu-riscv@gnu.org; Sun, 04 Dec 2022 17:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xNL-0008R0-51; Sun, 04 Dec 2022 17:22:19 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xNJ-0004Dt-Cn; Sun, 04 Dec 2022 17:22:18 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id 125so9489483vsi.9;
 Sun, 04 Dec 2022 14:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NpJINFWhNDv9ZsvdQ/HZ+hG0x+GN7Ep6JVnZAj/ndcM=;
 b=X/6Ri4x6Peuyo3/7+5/mVGlTQhAVJ6C6fqyBToDliAftqrnLXERUVikA0QYoVv7siW
 lPWidlX+nQRDOHUgGr14Kn08Bx1EpncICQ080a7y8Z+i2lF5pq7g3PfobkX5MV/Ycm7j
 QwUEJ0DuhHlALjAQwuMYECKIgWpcaNbcU2s+UNSh8TfRKtzmol1s1SPSwi3AITL+TJ5/
 Eb87Cl6vGDNZvgvafbYJFyuGfSgPCp9YxMXhpiOb2FGLq90idM+e6Nu2ITIzezBGSvAY
 av7g9uEs+kFz4fNfNa5zRg1pAqZtaVJ34OrW2eWi1YI+rKOIJJzu96QGdY38Cewq92kw
 0oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NpJINFWhNDv9ZsvdQ/HZ+hG0x+GN7Ep6JVnZAj/ndcM=;
 b=Ec04QzUUgxybNSlF99nr4Thiw2o/l76IkJcHjYwipr80dQMdQIv5FNmGGSPdgKoljr
 j2Thb1Z559ul6fmGlKX9mQFxOmfbm0V6A1/n2hbASj+ZQTFaS33t6fXPsfOA906AIovZ
 NiQbkzvUiRKb0MyigvPeWe1lujleUOAco1nvgbemLLmcJtmN+OEAbZdTLogtcbxUopoz
 vibJt6n5t1ZXP6guSvt+4KwL9VoL86X2IQw7FKJIU2+Muf0nz49PA5A1E/W0X/ETedMF
 /MNOELjraweoV6g/RuKbv8+5Qt4oFDHuKPCc7hVb6jJ0MtEfucrSK+9qDae7cBASmDR8
 Usgg==
X-Gm-Message-State: ANoB5pnI+eDNyGceIueDqOhHGi/iE+pYykT/dFx570OrrglXbgTBYYOM
 gAJMLKewwW+scLITKLA3LDqe4Rbpd/wH1lxh6S4=
X-Google-Smtp-Source: AA0mqf7D+HfKKFdc7ZHi9s3EiBvQijnpbt30JW6EI/Ia8nLGIiD9p6mrZ4baOGY01VJ1lYBEwG5AWW54tH05fbNM++w=
X-Received: by 2002:a05:6102:f09:b0:3a6:eec3:b246 with SMTP id
 v9-20020a0561020f0900b003a6eec3b246mr42634493vss.64.1670192518232; Sun, 04
 Dec 2022 14:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Dec 2022 08:21:32 +1000
Message-ID: <CAKmqyKP+Fq9cLy3RfAgbqTFNQKOWz5CGsk8VTxN35=3oM59P5g@mail.gmail.com>
Subject: Re: [PATCH 01/15] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Sun, 04 Dec 2022 22:22:20 -0000

On Fri, Dec 2, 2022 at 12:15 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
> controllers regardless of how MSI is implemented. msi_nonbroken is
> initialized to true in sifive_plic_realize().
>
> Let SIFIVE_PLIC select MSI_NONBROKEN and drop the selection from
> RISC-V machines.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/intc/Kconfig  | 1 +
>  hw/riscv/Kconfig | 5 -----
>  2 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index ecd2883ceb..1d4573e803 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -78,6 +78,7 @@ config RISCV_IMSIC
>
>  config SIFIVE_PLIC
>      bool
> +    select MSI_NONBROKEN
>
>  config GOLDFISH_PIC
>      bool
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 79ff61c464..167dc4cca6 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -11,7 +11,6 @@ config MICROCHIP_PFSOC
>      select MCHP_PFSOC_IOSCB
>      select MCHP_PFSOC_MMUART
>      select MCHP_PFSOC_SYSREG
> -    select MSI_NONBROKEN
>      select RISCV_ACLINT
>      select SIFIVE_PDMA
>      select SIFIVE_PLIC
> @@ -37,7 +36,6 @@ config RISCV_VIRT
>      imply TPM_TIS_SYSBUS
>      select RISCV_NUMA
>      select GOLDFISH_RTC
> -    select MSI_NONBROKEN
>      select PCI
>      select PCI_EXPRESS_GENERIC_BRIDGE
>      select PFLASH_CFI01
> @@ -53,7 +51,6 @@ config RISCV_VIRT
>
>  config SIFIVE_E
>      bool
> -    select MSI_NONBROKEN
>      select RISCV_ACLINT
>      select SIFIVE_GPIO
>      select SIFIVE_PLIC
> @@ -64,7 +61,6 @@ config SIFIVE_E
>  config SIFIVE_U
>      bool
>      select CADENCE
> -    select MSI_NONBROKEN
>      select RISCV_ACLINT
>      select SIFIVE_GPIO
>      select SIFIVE_PDMA
> @@ -82,6 +78,5 @@ config SPIKE
>      bool
>      select RISCV_NUMA
>      select HTIF
> -    select MSI_NONBROKEN
>      select RISCV_ACLINT
>      select SIFIVE_PLIC
> --
> 2.34.1
>
>

