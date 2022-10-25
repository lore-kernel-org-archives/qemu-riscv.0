Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onBCc-0004ff-VP
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 00:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onBCW-0004Zu-QY; Tue, 25 Oct 2022 00:06:04 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onBCV-0004uk-5e; Tue, 25 Oct 2022 00:06:04 -0400
Received: by mail-pf1-x435.google.com with SMTP id m6so10812138pfb.0;
 Mon, 24 Oct 2022 21:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=atNbw46gRBXMpLkWdREf0Nzc/gE6z41FgWCuX/SlcXk=;
 b=VbhJXWJDH5W4QL+9vm0SVdJh8GEsrkEbTvvKXVG6L1g7z9e4e6WoEIVaOdeHGZZnCY
 TSLdG4YJi3LS4pVCe/qrpnwRPjmHRI/9zFMyDPpCMCuxvU5GdvzUmOArg2LKs8I2SVtm
 o8YCrk1pQngJhu7e3wVeyQOhYbi2oC4J4yn1uRTBm7269Kq7r6qzaBXV9fng8o5mf5w4
 sFb+r+D1geax7yX//kLswYM2OHElOQykmRNkrTjocZ5Gi2cuyfMu31hyfTS3fohosPv2
 WNeM7tUVD+LzJmB1qTPyw1Dv7k+D7a5n1xPAra2iZotByvlh0F7EzsbiOv58zdMCuKWP
 Bs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atNbw46gRBXMpLkWdREf0Nzc/gE6z41FgWCuX/SlcXk=;
 b=NkLkAL1Q9HZYnIVMG+PXD6AS7CegfZiWeg+h7NCs7vetJ6jw+AjAMR5suWLYsP0saF
 pekiGzoErXrBCsJiE2Li6i4GAl3meprvm60pA5EVn6wJo9X2EFKjrHMrLF2eavUcciNe
 4SIRpqoAYXcC+9Oqn3EzhirTFMt4g90VL8Db5eTdtXBrZInBNyr3JG0hDXh734Oa23uF
 bwLhCDMLPp4+5axF9PfuD/DVJ7Vi+qS5iYE8DKYExKCdtL/bEkGyD3l7hZCtvqzKoJWn
 JM+1UDWXAWRNYk/BPmF+l9WXJMINrhiuyS2kh2vPKTJ/8Ctp9jQkQX7FXC+3hKNFv/Mm
 ll9g==
X-Gm-Message-State: ACrzQf30VCSUDn4PfG42p08zs/lSp2spJfegpxDW8rdoIEABE1hsF7xV
 qGDiJ+Kfn4YkYLJFZV0/XuQCgXC/povF9Da8Hxl0If4FO+GtiQ==
X-Google-Smtp-Source: AMsMyM5IAI05UxbMkxtF97D+Npjy2Op73tbJyKeEQEfL08lZAyKC9U4VaezqzaPlyAPqK1tI8Axx0SCm48VPA1g17xU=
X-Received: by 2002:a63:1a65:0:b0:460:d5db:8688 with SMTP id
 a37-20020a631a65000000b00460d5db8688mr30945398pgm.221.1666670761304; Mon, 24
 Oct 2022 21:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
 <20221025011040.246503-3-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221025011040.246503-3-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 14:05:34 +1000
Message-ID: <CAKmqyKNFct5cf4bA3hgyXid-yTAd0-CSDytatsYxR08_b9hc_g@mail.gmail.com>
Subject: Re: [PATCH v0 2/2] hw/riscv/opentitan: add aon_timer base unimpl
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 04:06:05 -0000

On Tue, Oct 25, 2022 at 11:19 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Adds the updated `aon_timer` base as an unimplemented device. This is
> used by TockOS, patch ensures the guest doesn't hit load faults.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c         | 3 +++
>  include/hw/riscv/opentitan.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 373fed36b6..50452f792a 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -48,6 +48,7 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
>      [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
>      [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
> +    [IBEX_DEV_AON_TIMER] =      {  0x40470000,  0x1000  },
>      [IBEX_DEV_SENSOR_CTRL] =    {  0x40490000,  0x1000  },
>      [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
>      [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
> @@ -264,6 +265,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
>          memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.aon_timer",
> +        memmap[IBEX_DEV_AON_TIMER].base, memmap[IBEX_DEV_AON_TIMER].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
>          memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 1fc055cdff..7659d1bc5b 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -81,6 +81,7 @@ enum {
>      IBEX_DEV_RSTMGR,
>      IBEX_DEV_CLKMGR,
>      IBEX_DEV_PINMUX,
> +    IBEX_DEV_AON_TIMER,
>      IBEX_DEV_USBDEV,
>      IBEX_DEV_FLASH_CTRL,
>      IBEX_DEV_PLIC,
> --
> 2.37.3
>
>

