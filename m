Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBM76-0003e5-NP
	for mharc-qemu-riscv@gnu.org; Mon, 09 Mar 2020 13:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jBM73-0003a3-VC
 for qemu-riscv@nongnu.org; Mon, 09 Mar 2020 13:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jBM72-0000Uq-UF
 for qemu-riscv@nongnu.org; Mon, 09 Mar 2020 13:22:45 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:43248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jBM70-0000Th-7j; Mon, 09 Mar 2020 13:22:42 -0400
Received: by mail-vk1-xa41.google.com with SMTP id t3so2733729vkm.10;
 Mon, 09 Mar 2020 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8JMaAc9E7xRvTT4ZxwRDkgO+u9WlCB6dTbmmOH3cPqg=;
 b=bttYgB+kJeogOnbtuMSsYubg1unnCrnrIWn0kMul9jlAZ5gNOL7um1fAf8KbtoLwlp
 jaAhCIboZc1I0BDamnSwyKMU/7jMIHOOyJu1yOD/LdQxpjDVWqbMwE2CYqDgyMJ4am3Y
 xZg0CzE0bOen/XYMgpiobDNkLVHp7O+y+VpRuCevyZLZPPXTF0+6j588NubmqrbOhMTX
 YS/IVh/GMMOTIJX6tPz9Du8hzeCZt56kO75lm+DS9JSukywvLw9HgfUygTzLPDJMofDt
 VvhkVBsuIN2sV9YsQw0tn0il0bGIItsSI7gO6/LfPpdJrRMC43CWB7RYOoYjKpO02HGQ
 k2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8JMaAc9E7xRvTT4ZxwRDkgO+u9WlCB6dTbmmOH3cPqg=;
 b=PlUcrtdiYBeR4iE/DvxCr77Cksqs4+4LkwMRUdcnxLuBOIkFCXx7gJvM6gGAo9lUbj
 qRwOVppCrkoBm+f7CgYJ6wL6KaY1Jxk26eJvMg/xY7B7/EQkavrsoxSA8n7zSUFtMYGz
 77LPn9QsZ2LxD6KcI1qHKQUfosLBschlAgABJtjk0usQEaLf00NSDTeffI6CnKPc8LcX
 1KdD3ANVgAWbfCgZoNX9/fv3Bkf46zNWmO7Pcz3gCqa5nhBu/S6rHvuflRscCX45vYbC
 KE9/V0KnSwFb/d1nG9KpfPC7/cjmYp2S+7doSG9OT4ppuYBeAqmdxYW5DN9zLJtHoQnn
 P60A==
X-Gm-Message-State: ANhLgQ00lDPiN7B8056v4cOHByD0793RaqjaYXDDldfuni+vH/sugZfz
 kXLNIh4+b+ylAqzn5E174Xkqpym25Z946vqeexc=
X-Google-Smtp-Source: ADFU+vu3VT8/9rLbVMAFZZkSbGncLCekpYVopTwR3o6tA/YbJIPC3nLXFCBMz9uox0+72mDLpO3KRbPlAA3G/HHJtIo=
X-Received: by 2002:a1f:19c4:: with SMTP id 187mr9453499vkz.70.1583774561162; 
 Mon, 09 Mar 2020 10:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <1583585319-26603-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1583585319-26603-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Mar 2020 10:14:54 -0700
Message-ID: <CAKmqyKPEptmsw222Tt1T1qvoSvfhgMMznypEM+wr8hWYkcW0qg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Generate correct "mmu-type" for 32-bit machines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a41
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
X-List-Received-Date: Mon, 09 Mar 2020 17:22:47 -0000

On Sat, Mar 7, 2020 at 4:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> 32-bit machine should have its CPU's "mmu-type" set to "riscv,sv32".
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 4 ++++
>  hw/riscv/spike.c    | 4 ++++
>  hw/riscv/virt.c     | 4 ++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index d318988..26ea777 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -159,7 +159,11 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_add_subnode(fdt, nodename);
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu != 0) {
> +#if defined(TARGET_RISCV32)
> +            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
> +#else
>              qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +#endif
>              isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
>          } else {
>              isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 8823681..6f9a1ba 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -102,7 +102,11 @@ static void create_fdt(SpikeState *s, const struct MemmapEntry *memmap,
>          char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          char *isa = riscv_isa_string(&s->soc.harts[cpu]);
>          qemu_fdt_add_subnode(fdt, nodename);
> +#if defined(TARGET_RISCV32)
> +        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
> +#else
>          qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +#endif
>          qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 7f9e1e5..57f532a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -229,7 +229,11 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>          char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          char *isa = riscv_isa_string(&s->soc.harts[cpu]);
>          qemu_fdt_add_subnode(fdt, nodename);
> +#if defined(TARGET_RISCV32)
> +        qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
> +#else
>          qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +#endif
>          qemu_fdt_setprop_string(fdt, nodename, "riscv,isa", isa);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
>          qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
> --
> 2.7.4
>
>

