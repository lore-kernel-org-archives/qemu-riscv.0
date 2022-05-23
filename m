Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntFlo-0007GU-BF
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 17:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFlk-0007EE-BA; Mon, 23 May 2022 17:39:17 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:34692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFlh-0004m1-PG; Mon, 23 May 2022 17:39:15 -0400
Received: by mail-il1-x12d.google.com with SMTP id j7so10718398ila.1;
 Mon, 23 May 2022 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/tUGsnBaSaN1tcAvI2T/rijC+MBI/P10RRWtJkie7k=;
 b=qsy9YDdr+6+fA1eMuUQZoWK32r+IoQ0+NYJVjn1sbRoQzqspEEKw4lag9oVahHBi7h
 pr6cDCIioDFqm+APVwemFpb15bExjXZCs2Akm8fZ3ihOGecG3lPOLTJMc9o9cjdQO80A
 NR/TyniwtdV84b7VvXt0ajg7MddGEoaK+FDTew1Rt7UZi1d4k3J8GIqP7Xmfi0fE8UQp
 gMCR/VdYmsKTaey3DxRLVh7VDORAhb16rnbbiDLwd1kXXot1MDNiZftzESan/yccRQy/
 jLLaaDC9m1dq1IxFul2PW1Z8IMR+IkRxpdTtFm5Uz0bdTVxh/6rV0UWqT4xmKrm5D5cS
 kbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/tUGsnBaSaN1tcAvI2T/rijC+MBI/P10RRWtJkie7k=;
 b=Dl7g35XDuq1PzgrD29z5eervYys6Yfij93eq9JmbOmhj+fhuJ7UDCZzI0dZ5H37arw
 jEPBBZ6xyIBgG+bMiQKYuNWckPcktasucfS9T2BX5IiI9v/bftc4mNWPLStQa5gTJpNw
 S6DwIMwtA7k2EzMTc3nhUhskOThXftljM36Z1bKsTMHvYGtAxKg2A63AGj4dOazY1hOQ
 5ZSzQ6JLOFAsiWhZTfnjyRHn5DEApOS7RLXjrPaFsck90jXSY359z1H7zmbhGITCa7Q9
 zF+fWcfe75IRmnCO944D+Ajb79131zNgttqIhP8uLGMcXN1UeH4kFPHwp0ErDzhoX+Rl
 eAKg==
X-Gm-Message-State: AOAM532rv1bWMvmuNUUub4GV++4e1CpUumiN6+HwSvxMsecImtS8jPwd
 Y5ljVPfjmzBmehAednY4SknAUUaHendEWj4WinA=
X-Google-Smtp-Source: ABdhPJwMOdtReSHbpaIseCZ3E7LgBUkrM7E1sQCDmSbBFu9zxeMzMHC5Us2Ekf7Y+SqnrCHIeYIn8l5U7CRgg2aaAE4=
X-Received: by 2002:a05:6e02:1747:b0:2d1:a5d6:b793 with SMTP id
 y7-20020a056e02174700b002d1a5d6b793mr4001843ill.55.1653341952450; Mon, 23 May
 2022 14:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-9-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-9-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 07:38:46 +1000
Message-ID: <CAKmqyKPokimdgTwboiCvtQcL9RhE1T4VE9W3JJrKpaMEgseejQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/riscv: virt: Fix interrupt parent for dynamic
 platform devices
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 23 May 2022 21:39:18 -0000

On Thu, May 12, 2022 at 12:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When both APLIC and IMSIC are present in virt machine, the APLIC should
> be used as parent interrupt controller for dynamic platform devices.
>
> In case of  multiple sockets, we should prefer interrupt controller of
> socket0 for dynamic platform devices.
>
> Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating
> platform FDT entries")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3326f4db96..c576173815 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -478,10 +478,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>      qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
>          plic_phandles[socket]);
>
> -    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
> -                                   memmap[VIRT_PLATFORM_BUS].base,
> -                                   memmap[VIRT_PLATFORM_BUS].size,
> -                                   VIRT_PLATFORM_BUS_IRQ);
> +    if (!socket) {
> +        platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
> +                                       memmap[VIRT_PLATFORM_BUS].base,
> +                                       memmap[VIRT_PLATFORM_BUS].size,
> +                                       VIRT_PLATFORM_BUS_IRQ);
> +    }
>
>      g_free(plic_name);
>
> @@ -561,11 +563,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
>      }
>      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
>
> -    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
> -                                   memmap[VIRT_PLATFORM_BUS].base,
> -                                   memmap[VIRT_PLATFORM_BUS].size,
> -                                   VIRT_PLATFORM_BUS_IRQ);
> -
>      g_free(imsic_name);
>
>      /* S-level IMSIC node */
> @@ -704,10 +701,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>      riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
>
> -    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
> -                                   memmap[VIRT_PLATFORM_BUS].base,
> -                                   memmap[VIRT_PLATFORM_BUS].size,
> -                                   VIRT_PLATFORM_BUS_IRQ);
> +    if (!socket) {
> +        platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
> +                                       memmap[VIRT_PLATFORM_BUS].base,
> +                                       memmap[VIRT_PLATFORM_BUS].size,
> +                                       VIRT_PLATFORM_BUS_IRQ);
> +    }
>
>      g_free(aplic_name);
>
> --
> 2.34.1
>
>

