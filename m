Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kctW9-0001XB-Vs
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 12:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kctW8-0001Uo-T3; Wed, 11 Nov 2020 12:02:44 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kctW6-0006zB-H7; Wed, 11 Nov 2020 12:02:44 -0500
Received: by mail-io1-xd42.google.com with SMTP id u21so2963220iol.12;
 Wed, 11 Nov 2020 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4KuyojbxoN0QbpbzLNpvkg+zhVtdpr/SKldbV8LedQ=;
 b=f7dyaCAXL3QdyDjPuBKZXwcDGpp1lQ6aebo8jXqSOaWPUQYWIEMWSjlCzDqMKtbP8h
 8kq0IWYqvogXZG6nVQacrJP7W8x2LGPgBVLESsh7cBEKwXbwmMAA8MjPpOaaTd2MtY3c
 c5GQC+r56GjDy5PVTEsT54uCMyY7qZRxfYzyh4fiqVKT70aSY76Bfdj8rov4228Dx9mb
 7T5kGlghXulFVHhlQnb9nxTKKABVYh+jk+nLRyHQ8y6oF4Lf26XrsNEvC0NnHoLAe7M0
 5G2pGhNBMLfjeoziFKk/Boq+5/BLTfOC+SHB+P2rlOTkHKuDei8PnSBgL7hcHfx2m1od
 /enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4KuyojbxoN0QbpbzLNpvkg+zhVtdpr/SKldbV8LedQ=;
 b=G3BTzbKO8asPTMmfGZrpx/ZyhVkG/luT0K+LSXELospvBbck5y8RA/c1L7xHc2IEAu
 8J+dJ2fKro6ksh+aLBlRE3Gj/oimJhF2PJR0/3EpnxZVOvtnPE3/mJ0Wgam6GG/KIfLb
 RTkI55s5vVSt909yeyySzQAI6yXw+lkJOi74sA6fosJOibx2I0SzTXJ9UnED99dlvK9L
 DP49Y2wXayRV4TOwSd6YA6MzC6Z3imhQK8VXUM32MJIB4WEnQpMLq//c/dws8PEacmvO
 5s4pWvFsCA8kU5NnS4E0G25BR42YmH78ChHalbaLegViKnIUiBdhN8YbB+ib6950KpHs
 MN4w==
X-Gm-Message-State: AOAM531ve09BYreT8Z3ObvUWIyuISSLHbxZZceLVR9YJ0z/VX6HWRj+j
 c6LfSeoY6c7hj7N82hKtujhQshnQjToxbSGYjmg=
X-Google-Smtp-Source: ABdhPJwF5zXGAkcgHbUMIWIhB8I5x7YrSLqzZ7+Io3r/7Eq3ugXeJ/xq36zM08SSiVveuqg7HpCX1l6wY6PWFlTW8v0=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id
 d14mr19530485iow.105.1605114159201; 
 Wed, 11 Nov 2020 09:02:39 -0800 (PST)
MIME-Version: 1.0
References: <20201111094725.3768755-1-anup.patel@wdc.com>
In-Reply-To: <20201111094725.3768755-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Nov 2020 08:50:35 -0800
Message-ID: <CAKmqyKMAHxO-OH=iV6pMinKYLvnwF2Opu18LsiVjwvwEF+7GLw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
X-List-Received-Date: Wed, 11 Nov 2020 17:02:45 -0000

On Wed, Nov 11, 2020 at 1:48 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sifive_u machine emulates two UARTs but we have only UART0 DT
> node in the generated DTB so this patch adds UART1 DT node in the
> generated DTB.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

