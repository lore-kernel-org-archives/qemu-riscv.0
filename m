Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kW6kN-0004dO-8K
	for mharc-qemu-riscv@gnu.org; Fri, 23 Oct 2020 19:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW6kL-0004cA-Cm; Fri, 23 Oct 2020 19:45:21 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW6kH-00043e-SJ; Fri, 23 Oct 2020 19:45:21 -0400
Received: by mail-io1-xd43.google.com with SMTP id u62so3942628iod.8;
 Fri, 23 Oct 2020 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qjnuDSkXspZX0oK9YZhnBqaMGu+nHJxmu6U+0JKMbsc=;
 b=sR9bFFye6tXAKczLXmjC9Iu+vevh/Dz4bEpKKhG8LO3SfBf3zBUzpjsnKxaz9QyqnG
 MYhASD5Fz+BM6ZydI4++6peoIcxzf49LKNJc/FtDDF8Rb+cFMg26iWvuFY595nTgK49g
 dapOe16u3EvHt8V3V8UnHg+p4mPnwgYweZzKn8EQMI3QOHepPJB5nRSN/eB9ZhqD4gc/
 r1YkPG9tMebjJYKWs3PSZhmKz8q3ntiCN4+94s2jB2EhV+Hxkc3OtNNgucAav1jV9Lfy
 IoujQr6VdW4X8Dx02bmkb9cRN9lFxoNt33m7tqsB9D0GszVZuTti5TAVTHCkyurxhAlE
 aGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qjnuDSkXspZX0oK9YZhnBqaMGu+nHJxmu6U+0JKMbsc=;
 b=EK/PTFyTaVySP/Wst/RCmShoNh2aGH2gRwjUX8BnzTkdBj/r4Uxay5iEQdTFr/S7+S
 N4q4IzOCD+30nQuTOnFCJq3Tfdq0bIRCXyNr5e5hXFzehb2w5kWwkpta7dwYWuifoyqJ
 lbQnvQNfTq8BFolHdeNyGbECXHLFTHSByTw2gcb0zlZsET2v21lg3YSpB0llOBiFYM+k
 RNBZNb/RksdxXxFRAzp5zqj5hjbKICVczHjc/u2psDc4iB4orRm3tPQ21EvSXExrZiyR
 2XOOUhnxRQsXRRIU1AXweIFJPuvzm0kVMS/byjXYbNOLOPCuyxQv/RDt81Ypbi+nJwF/
 GzAw==
X-Gm-Message-State: AOAM530sz0yX6zge9EoU2l72h+TJEmRmV70G5BlmpUOVqd1HLbc6d2i/
 niN2rhMkUQy9eE5d6jaiGsocbLOsZ80u6l+/jRE=
X-Google-Smtp-Source: ABdhPJzbnmX0Ro17qaIHzSToNl3cUejfcFMB7HPsrx7cfJOinRzBrPUVYCK+msOwBYtOjLII5nGvx/lX4qKhrqRXm18=
X-Received: by 2002:a02:c956:: with SMTP id u22mr3836309jao.135.1603496716590; 
 Fri, 23 Oct 2020 16:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201022053225.2596110-1-anup.patel@wdc.com>
 <20201022053225.2596110-2-anup.patel@wdc.com>
In-Reply-To: <20201022053225.2596110-2-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Oct 2020 16:33:29 -0700
Message-ID: <CAKmqyKOT34W4hYCAN+sDYxPpKiaGFYZrov1AbhhhSLp=Uv0C7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: virt: Allow passing custom DTB
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
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
X-List-Received-Date: Fri, 23 Oct 2020 23:45:21 -0000

On Wed, Oct 21, 2020 at 10:34 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Extend virt machine to allow passing custom DTB using "-dtb"
> command-line parameter. This will help users pass modified DTB
> to virt machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 41bd2f38ba..d535119e37 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -181,6 +181,7 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>  {
>      void *fdt;
>      int i, cpu, socket;
> +    const char *dtb_filename;
>      MachineState *mc = MACHINE(s);
>      uint64_t addr, size;
>      uint32_t *clint_cells, *plic_cells;
> @@ -194,10 +195,20 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
>      hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
>
> -    fdt = s->fdt = create_device_tree(&s->fdt_size);
> -    if (!fdt) {
> -        error_report("create_device_tree() failed");
> -        exit(1);
> +    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> +    if (dtb_filename) {
> +        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
> +        if (!fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +        goto update_bootargs;
> +    } else {
> +        fdt = s->fdt = create_device_tree(&s->fdt_size);
> +        if (!fdt) {
> +            error_report("create_device_tree() failed");
> +            exit(1);
> +        }
>      }
>
>      qemu_fdt_setprop_string(fdt, "/", "model", "riscv-virtio,qemu");
> @@ -418,9 +429,6 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
> -    if (cmdline) {
> -        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> -    }
>      g_free(name);
>
>      name = g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base);
> @@ -441,6 +449,11 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>                                   2, flashbase + flashsize, 2, flashsize);
>      qemu_fdt_setprop_cell(s->fdt, name, "bank-width", 4);
>      g_free(name);
> +
> +update_bootargs:
> +    if (cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> +    }
>  }
>
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
> --
> 2.25.1
>
>

