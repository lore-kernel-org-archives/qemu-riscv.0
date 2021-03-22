Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOMMw-0005uO-Bz
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 11:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMMt-0005r6-UP; Mon, 22 Mar 2021 11:21:23 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMMs-0001PX-2Q; Mon, 22 Mar 2021 11:21:23 -0400
Received: by mail-il1-x12b.google.com with SMTP id z9so15168033ilb.4;
 Mon, 22 Mar 2021 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afchmH1IlSAXwzZ9i98UGpjO8aiUHPCpxSnbqEE4wlw=;
 b=lEIEcv+kuwDugra8PN4G9HMQHKTDhh0CkSnBk4geva8D5rmg12w0TQwYW3yrb3fYs3
 soRKRzt3NWJm6Qt3U/Md+camF7SWRmP1v061FJm1mToW9STydfeOqsORjxnSuj8Bv6Bt
 399C9EiDNbrEEarY6BeOlw5YUhEhqIc4Iyx2voa/rPOyw57mmj3LqalnS5MwP3RyK2zb
 qifD1jCFwm905TyEx2Pp18TxAgJpJ7YgDnt2xfWL6JkVQWbemrBCMavj37VvLNN1x0G/
 z2KCX07Wvj2hUVlrWkWtruWTX7cmhcZJU3esnVd72IBE/Ixb4TikscTDCbwf0BC3m7Jk
 7JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afchmH1IlSAXwzZ9i98UGpjO8aiUHPCpxSnbqEE4wlw=;
 b=bF1lxHuAtH+dv05m/AKjqDkPY5yvJquYts6+1mLAh7+FOmEkz9U7j9SF6DrhXEDFm7
 G1BZ76K7Hej2N4go0qYTpNHy4Mr3ciTyrFS/uXdQGCfTzrLJQNXkXv0iLynnEtLBXyuM
 9eGXp3GHx+sb/FlbJByGf2N84iOB9Lcj7j0bnu5X1XmyAb9R7sYo1AQ04hVMM7PDaO5q
 yq/VWrE4+NthqX0m5FLxPEcLVhFIWw622uDYKZFMp/1ptMBkoRtHpL9zJrHDM7i1+G1r
 ow6TmzDnq2WAH655OjdCDjpeDcVmSJ/f1v5hEZ+Mnrl2Tf0blRjjmqKV6axPA722LDLk
 KHgg==
X-Gm-Message-State: AOAM532Iuk/7uNKKZAAOZdpBfk0YY1GUZXg+khYOImXIY2KawAjIgsmW
 5iiGRG4X9uW864DQpNqjL0gR7qE1UGqmw6rnCmw=
X-Google-Smtp-Source: ABdhPJw6brVJykHRADxf2UJ0QGRQpmFciNSJ9qMwO8Tp8690yueMVLVTvxEvdwrcpIXeatvrvIZ8ZZHpJJna1mwERDA=
X-Received: by 2002:a05:6e02:c33:: with SMTP id
 q19mr435593ilg.177.1616426480258; 
 Mon, 22 Mar 2021 08:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210322075248.136255-1-bmeng.cn@gmail.com>
In-Reply-To: <20210322075248.136255-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 11:19:24 -0400
Message-ID: <CAKmqyKMHwpMERgRLsoKgedPqJ0KGK-ZvTuz7hpMJzFGsHgSavA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: microchip_pfsoc: Map EMMC/SD mux register
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 15:21:24 -0000

On Mon, Mar 22, 2021 at 3:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Since HSS commit c20a89f8dcac, the Icicle Kit reference design has
> been updated to use a register mapped at 0x4f000000 instead of a
> GPIO to control whether eMMC or SD card is to be used. With this
> support the same HSS image can be used for both eMMC and SD card
> boot flow, while previously two different board configurations were
> used. This is undocumented but one can take a look at the HSS code
> HSS_MMCInit() in services/mmc/mmc_api.c.
>
> With this commit, HSS image built from 2020.12 release boots again.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/microchip_pfsoc.h | 1 +
>  hw/riscv/microchip_pfsoc.c         | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index d0c666aae0..d30916f45d 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -109,6 +109,7 @@ enum {
>      MICROCHIP_PFSOC_ENVM_DATA,
>      MICROCHIP_PFSOC_QSPI_XIP,
>      MICROCHIP_PFSOC_IOSCB,
> +    MICROCHIP_PFSOC_EMMC_SD_MUX,
>      MICROCHIP_PFSOC_DRAM_LO,
>      MICROCHIP_PFSOC_DRAM_LO_ALIAS,
>      MICROCHIP_PFSOC_DRAM_HI,
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 266f1c3342..c4146b7a6b 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -122,6 +122,7 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
>      [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
>      [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
>      [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
> +    [MICROCHIP_PFSOC_EMMC_SD_MUX] =     { 0x4f000000,        0x4 },
>      [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
>      [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
>      [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
> @@ -411,6 +412,11 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
>                      memmap[MICROCHIP_PFSOC_IOSCB].base);
>
> +    /* eMMC/SD mux */
> +    create_unimplemented_device("microchip.pfsoc.emmc_sd_mux",
> +        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].base,
> +        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].size);
> +
>      /* QSPI Flash */
>      memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
>                             "microchip.pfsoc.qspi_xip",
> --
> 2.25.1
>
>

