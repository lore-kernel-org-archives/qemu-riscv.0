Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p1xQ1-0001lm-HN
	for mharc-qemu-riscv@gnu.org; Sun, 04 Dec 2022 17:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xPr-0001jz-50; Sun, 04 Dec 2022 17:24:56 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xPo-00050a-Tj; Sun, 04 Dec 2022 17:24:54 -0500
Received: by mail-vs1-xe33.google.com with SMTP id 125so9492998vsi.9;
 Sun, 04 Dec 2022 14:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gZscQJGKEL6OtXFpqM9DtwPlaW7OKg/MayZ4kgfXHA0=;
 b=Q0t0aX35Fxr9Qk561ghDjO08jydLp6XRsZOQWpcD2pvmxizvbJsNe1eM1IXMvR1zPk
 iCLppSqcowg3jsa4qgqadpiBd2fdxFRYeP0QWt28nABOz87WffLfZC87bcQxNmypDZVi
 C+RW7Qb5reCv+Mg/0vtEReiTXKjRGnmBK09oiD3NEMXYhvIpiL7J/vjEos+AyNyp4PfT
 igsYxkbrXmIOg8mvp3aG5kBtiOwqz7x70YRI3tvb19gsM9duX8L0ooIlPO+M5AhNRdrI
 6rzm9PXPAwbzprbydUIdT2LYokFpVyXiOosA8sEyqzwUrN4MQZxBGUch5bkfSWNW+84I
 hvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gZscQJGKEL6OtXFpqM9DtwPlaW7OKg/MayZ4kgfXHA0=;
 b=yvMF098b5tcnQWykqMs4J9LlxCsVfdLPyMuRkO+uVRkz1OT7BQwu0TBPASympTaXbe
 g5pjVeOrYsF0a6RkTVohce3PTWPWKF7kcuLfQn1sLtt90ctsV2qJSHpwQV72bUbyVIVd
 hIzvxbSugb2kUr/iZ96RTKo+2qlckUFMgoSMl9H82+8O2zSF07vKsBIfWN33u0RcASFW
 4RoooIGLEf/5/+gMUYLEuBIq+1wSEgupDoHYFgz2BRTVjTj7lFUoMOCNOkP+4ESbTdAs
 EnYVw0/01ERSpGzDMHyX87FSPeIpf1dmBVX4ydnXPbTHfkROp9G7f4bJnJkdfqiOTSjO
 uydg==
X-Gm-Message-State: ANoB5plvLm9DfTtp/jfW0PwBU7tkMg2FkL7tpG+BprtdTNR4h3kplWfl
 KVSVbO0MGYbGvXGJgs3jkWX8RbEdi8HOx8rnHI8=
X-Google-Smtp-Source: AA0mqf6LV30BetaeIo57SJGbp9EwbkJu6ukC7YZmGSExuejHq9VcxBsTOmmRFJQo2IIPQa6+Qf3d7uPWSxSYCjmWfs0=
X-Received: by 2002:a67:c519:0:b0:3b1:2b83:1861 with SMTP id
 e25-20020a67c519000000b003b12b831861mr2814969vsk.10.1670192690888; Sun, 04
 Dec 2022 14:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-4-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-4-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Dec 2022 08:24:24 +1000
Message-ID: <CAKmqyKPo4eb8P9MyhUKZf79pgNwWHP100k9S-SZNTEHUeng5kg@mail.gmail.com>
Subject: Re: [PATCH 04/15] hw/riscv: Sort machines Kconfig options in
 alphabetical order
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Sun, 04 Dec 2022 22:24:58 -0000

On Fri, Dec 2, 2022 at 12:14 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> SHAKTI_C machine Kconfig option was inserted in disorder. Fix it.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/Kconfig | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 1e4b58024f..4550b3b938 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -4,6 +4,8 @@ config RISCV_NUMA
>  config IBEX
>      bool
>
> +# RISC-V machines in alphabetical order
> +
>  config MICROCHIP_PFSOC
>      bool
>      select CADENCE_SDHCI
> @@ -22,13 +24,6 @@ config OPENTITAN
>      select SIFIVE_PLIC
>      select UNIMP
>
> -config SHAKTI_C
> -    bool
> -    select UNIMP
> -    select SHAKTI_UART
> -    select RISCV_ACLINT
> -    select SIFIVE_PLIC
> -
>  config RISCV_VIRT
>      bool
>      imply PCI_DEVICES
> @@ -50,6 +45,13 @@ config RISCV_VIRT
>      select FW_CFG_DMA
>      select PLATFORM_BUS
>
> +config SHAKTI_C
> +    bool
> +    select RISCV_ACLINT
> +    select SHAKTI_UART
> +    select SIFIVE_PLIC
> +    select UNIMP
> +
>  config SIFIVE_E
>      bool
>      select RISCV_ACLINT
> --
> 2.34.1
>
>

