Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oKpBF-0001Rf-LA
	for mharc-qemu-riscv@gnu.org; Sun, 07 Aug 2022 18:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpBE-0001Q9-55; Sun, 07 Aug 2022 18:55:32 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpBC-0002Si-I3; Sun, 07 Aug 2022 18:55:31 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w10so7107214plq.0;
 Sun, 07 Aug 2022 15:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=FgYajevSy5JJOV/dvjp7vruzarNh37WfAGf2aLFXqgE=;
 b=ACcFkSGhwqsqXioVrnxFq+RHZwtSA3xfQ79I7MuOg3je8Uo8iu29m3bFj3LxCAbnzw
 Yn0JKEb+bYOZFF+p14jUyWBSnlMtB9HwEC5eaEGz5/Rmwr5sg4SCNNZc83pOihcjCuBS
 Nbd051rtoMLWuW1zXCH4+kNJxnZT9+/jM/OSRrcSHnbD/IPRa3Z6fs/bYaTZnIrr8Nmn
 6Zp+TdarbryM4360O6H0LtSF2X/NHPmcHxrZhBM0mUfj2veudWxkAXGUIAbHMUyIVZDo
 K9QjLWBfzRTNEl8pPdsRa6FzH3JY+GI4iap68m0g/fpE2lbFxHMvlgNdM7ohys3UFdV9
 4ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FgYajevSy5JJOV/dvjp7vruzarNh37WfAGf2aLFXqgE=;
 b=6MZuG0SjUSP5bnqZPmw4OLLkqXq9/RjisryEx3Uj4g3X3X4bgMB2706j2kbTwGUoHs
 Lwm4QLs3pIetr5+ATgVri9jpeNOpCZdf4XHW5uql0VIik/lFrcSW/A8mIFyNYuLXDaOA
 Q8GLauCiJkQ6zhzc7aEWXxM7rKh1ByZbSIUJSjpbA1Q5jjkamIbBZ26Bw/STVMNHPmVk
 CcuMqLQYjpnLDgfcsNovb2el5wyo5vdVigDgIBGDKSRUUHueJ7DP6AvP80dGYDx0WYv8
 6sVZniONt44mqewAuN77mYipGOI/KfrEIzJ6ve4YUP9rLgyYGk2Do1T42BtgKuxUyEPc
 LAmQ==
X-Gm-Message-State: ACgBeo19WPGx6XbHYBkH5CL3OD9S58u2IliRQNb+1pB9wvyZvuCVbkXJ
 a9nlotgG8VjfRXsuKkUU77LpYsjScn972h5j4s0=
X-Google-Smtp-Source: AA6agR4Mgwjx8G9tE8+yz7IcX0GIElOKLyDRRuqBHhObSd0d30OhHfKYgCPcdYjlc65+6MWSnTlph9piLPmCczZqlUs=
X-Received: by 2002:a17:90a:b391:b0:1f3:6c3:392c with SMTP id
 e17-20020a17090ab39100b001f306c3392cmr26040074pjr.166.1659912928746; Sun, 07
 Aug 2022 15:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-4-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-4-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:55:02 +1000
Message-ID: <CAKmqyKPv52ZkoJsEqHRJSnQS+ojQehY+PX0e0FN3xSFBYOMPYQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/riscv: virt: Fix the plic's address cells
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Sun, 07 Aug 2022 22:55:33 -0000

On Sat, Aug 6, 2022 at 2:11 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When optional AIA PLIC support was added the to the virt machine, the
> address cells property was removed leading the issues with dt-validate
> on a dump from the virt machine:
> /stuff/qemu/qemu.dtb: plic@c000000: '#address-cells' is a required property
>         From schema: /stuff/linux/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> Add back the property to suppress the warning.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Fixes: e6faee6585 ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 2 ++
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 6c61a406c4..8b2978076e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -465,6 +465,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      qemu_fdt_add_subnode(mc->fdt, plic_name);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name,
>          "#interrupt-cells", FDT_PLIC_INT_CELLS);
> +    qemu_fdt_setprop_cell(mc->fdt, plic_name,
> +        "#address-cells", FDT_PLIC_ADDR_CELLS);
>      qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
>                                    (char **)&plic_compat,
>                                    ARRAY_SIZE(plic_compat));
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 984e55c77f..be4ab8fe7f 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -111,6 +111,7 @@ enum {
>
>  #define FDT_PCI_ADDR_CELLS    3
>  #define FDT_PCI_INT_CELLS     1
> +#define FDT_PLIC_ADDR_CELLS   0
>  #define FDT_PLIC_INT_CELLS    1
>  #define FDT_APLIC_INT_CELLS   2
>  #define FDT_IMSIC_INT_CELLS   0
> --
> 2.37.1
>
>

