Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8hko-0002hv-Gn
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 08:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8hki-0002fM-IT; Fri, 23 Dec 2022 08:06:20 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8hkf-000293-PR; Fri, 23 Dec 2022 08:06:20 -0500
Received: by mail-ej1-x629.google.com with SMTP id x22so11903309ejs.11;
 Fri, 23 Dec 2022 05:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wpzs1i7LwOvqin1CU15kcFkuwnG01IcYLXfgRaNZZfU=;
 b=XhyCb0d8pK0jaIC50txzGOamLnTx9pHnrmRul0DYuyhUivVCQ/O5k1oC2EL/r6Vtoo
 RvAHnZBYqQ+msft+UaHWfi6VMphjwnExVV/6cJo2081U5U8kGatqOGROSHcPV+LOYbfO
 CJ/UNsdnZNN3Cjqf3FwPbJn/pKAeirU0AZEIzQQ3/43uh5mfwYN76je5TLR6BPB0KkWc
 +F2H3eeqfn+rjxiPpLwggFu2naNB4ZYecVhE0r20UJi44BDjY+ZNFkuGGtgKxf9MYIdN
 IHNV100e+K8KTh4XVaKWnR4G4kJNq7cVXQ83TtWOYyboDc2fP78R6//tdJa9heDy76qt
 OL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wpzs1i7LwOvqin1CU15kcFkuwnG01IcYLXfgRaNZZfU=;
 b=R3eolj8FZod3w+aZ6Xgxv8FtbUxDigOhUVRPWd1u6VZDZaM8qbzW+CmL/KqLZ0JDql
 zvydHaxOcB1i5qh9k6imiYATvX16iBgcidW3rlKsf/B5OJinwbL1G0MWV+1PrPjhQ+9U
 47RGgtlsKmTNTrMZNOzZACnDU8EyJtaR8zvVEwcI1d88z/2Oex53aSvBZ4PLAI+0Y7jN
 0aDgHwk2qC2KoijoGG0e/XQ9xji07JcN38n+SfJLf+YhnFqsqsY8StKpRsGkRQ1VPm3w
 +DM6Q+1F/Y75NSOroF+1hEnXYqx9gm9yhTMeWx+sg6SjanoVB7PFo0OSI6WM9suP0wet
 ZfHw==
X-Gm-Message-State: AFqh2kr3ouzG8xlMXhxg5ofqCmIzBjhg1hGUDCe6Br3aZc6hck4b5zeH
 cZB9hK/b4BlL4TmGBm8QdJwzvYKSrp3g9QryE3c=
X-Google-Smtp-Source: AMrXdXvUfNOFXUZw+SrOyPOXtgFyiyZs6Xwl30vj4WtbH3PQmPyQhzsZYwBipTafjMhNvQ+7HktlXLcys+NiI0bCsnQ=
X-Received: by 2002:a17:907:a08d:b0:846:8c9a:68a3 with SMTP id
 hu13-20020a170907a08d00b008468c9a68a3mr277251ejc.217.1671800775900; Fri, 23
 Dec 2022 05:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-14-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-14-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 21:06:04 +0800
Message-ID: <CAEUhbmVRXYO-_0eJfFBmd+7-ofau+TjTx1+YVm70tC70dcEtMg@mail.gmail.com>
Subject: Re: [PATCH 13/15] hw/riscv/spike.c: simplify create_fdt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 23 Dec 2022 13:06:24 -0000

On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'mem_size' and 'cmdline' aren't being used and the MachineState pointer
> is being retrieved via a MACHINE() macro.
>
> Remove 'mem_size' and 'cmdline' and add MachineState as a parameter.

Why do you add MachineState as a parameter? What's the problem of
using the MACHINE() macro?

>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/spike.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 2b9af5689e..181bf394a0 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -48,15 +48,14 @@ static const MemMapEntry spike_memmap[] = {
>      [SPIKE_DRAM] =     { 0x80000000,        0x0 },
>  };
>
> -static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> +static void create_fdt(MachineState *mc, SpikeState *s,
> +                       const MemMapEntry *memmap, bool is_32_bit)
>  {
>      void *fdt;
>      int fdt_size;
>      uint64_t addr, size;
>      unsigned long clint_addr;
>      int cpu, socket;
> -    MachineState *mc = MACHINE(s);
>      uint32_t *clint_cells;
>      uint32_t cpu_phandle, intc_phandle, phandle = 1;
>      char *name, *mem_name, *clint_name, *clust_name;
> @@ -254,8 +253,7 @@ static void spike_board_init(MachineState *machine)
>                                  mask_rom);
>
>      /* Create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> +    create_fdt(machine, s, memmap, riscv_is_32bit(&s->soc[0]));
>
>      /*
>       * Not like other RISC-V machines that use plain binary bios images,
> --

Regards,
Bin

