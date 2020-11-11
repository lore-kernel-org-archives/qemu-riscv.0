Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcyL4-0001F0-Hq
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 17:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcyL3-0001Eo-95; Wed, 11 Nov 2020 17:11:37 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcyL1-0001P4-LE; Wed, 11 Nov 2020 17:11:36 -0500
Received: by mail-il1-x141.google.com with SMTP id e17so3428092ili.5;
 Wed, 11 Nov 2020 14:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGDYP+RYFax2sfAvw9/5IW7EYqfp4/mdCt2UhiKYeR4=;
 b=OJpgqnn1S/KFrTJTmDId3y800oSsxwq7TRyzB1r1auGv3ydElI0XcOeDlWI8MbL7mD
 ys25bWlRXjWliYQ0pGtzxYjpY50nh7Pvi0eiGCion1sPBaLgyR5+4rwf7zpZUYeAxXee
 sYThYNDw1rryGiZrgWdVWphFX/ItXqrIex1RfhAzIkZHBeNX/+jLv1oRPPu/WjsWyPjy
 NbSOCiRDF+1BsfB7CSD2aODBRFSNau8bX15Gp/8DYLXeDMiZbOHH+k+9QB3O2N/5fVHW
 +9yUNOSav2oUICRVExftkszCodojiqNU367fqRrRBvISYKVVmgtPJHCja5EKkUwExYr2
 UZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGDYP+RYFax2sfAvw9/5IW7EYqfp4/mdCt2UhiKYeR4=;
 b=m/vS//abhNz1zD5uHeIoPxXf59jpxWqNlZAo3qfxmxLtthboKez4STSnDGd5ganyct
 n+j8z/vXZMywTNv5Hw34TI9fhTwkQkuEg6jXFkVLC7166BFK6KqbtDk4yzCV1up/Ybtm
 do70oDhdSd+/5ORjnQ148ESzkyolg3L1yPl/UmaywgOuUjAxMRXiYatseC17OqavPJdc
 Lh9OwNWCCCOebwKyZijbrAXdHCOXFuSZUIJlJXPje4l4UvPdPBGcxpXeSx9FlaD/W9rh
 jMQlls5H/pKRjjhjo6ocmNlgFlHzgO3c9L0rujOWNha1lccPXLPn6N1RqveyeFh5TRmS
 5nFw==
X-Gm-Message-State: AOAM53029WoRihXolJW1JuRB2Dv8gd3ytBavaFZl7V1kxmAbbbMZXA76
 xGNT2ejc3IpMDbH9nP3svkT2GaCOCqQg3isAyoA=
X-Google-Smtp-Source: ABdhPJwWi+1jC+a4S/uhV+Oye4iTePJmFWPSsfe/2JU2+I3SdkNZMl5UPRBXMMWLK7GoysW9+oBKKPKld0c9OX6Ojjg=
X-Received: by 2002:a05:6e02:1094:: with SMTP id
 r20mr4535037ilj.40.1605132694249; 
 Wed, 11 Nov 2020 14:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20201111094725.3768755-1-anup.patel@wdc.com>
In-Reply-To: <20201111094725.3768755-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 13:59:30 -0800
Message-ID: <CAKmqyKMTFpptBQpR86w4GLEwNMUoqaJAHip+-Abs81KkM-H0jw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Add UART1 DT node in the generated DTB
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 11 Nov 2020 22:11:37 -0000

On Wed, Nov 11, 2020 at 1:48 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sifive_u machine emulates two UARTs but we have only UART0 DT
> node in the generated DTB so this patch adds UART1 DT node in the
> generated DTB.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/sifive_u.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 2f19a9cda2..146944a293 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -387,6 +387,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
>      g_free(nodename);
>
> +    nodename = g_strdup_printf("/soc/serial@%lx",
> +        (long)memmap[SIFIVE_U_DEV_UART1].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +        0x0, memmap[SIFIVE_U_DEV_UART1].base,
> +        0x0, memmap[SIFIVE_U_DEV_UART1].size);
> +    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
> +        prci_phandle, PRCI_CLK_TLCLK);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART1_IRQ);
> +
> +    qemu_fdt_setprop_string(fdt, "/aliases", "serial1", nodename);
> +    g_free(nodename);
> +
>      nodename = g_strdup_printf("/soc/serial@%lx",
>          (long)memmap[SIFIVE_U_DEV_UART0].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> --
> 2.25.1
>
>

