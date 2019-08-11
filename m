Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwrU9-0002ZY-4X
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 13:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59847)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwrU7-0002Vl-6Q
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:18:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwrU6-0000Xx-2f
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:18:23 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:39615)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwrU1-0000S6-Cn; Sun, 11 Aug 2019 13:18:18 -0400
Received: by mail-lf1-x143.google.com with SMTP id x3so19009004lfn.6;
 Sun, 11 Aug 2019 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qlGk1t1JX6kb8l3MG/lAxzFXFUA/DSSAXsqUp/eSLiE=;
 b=FTB4hR4kAo+9gv1FxusaPgXKiEywj9neb4Yef57QzfOv42OWniHhMMpalttkgdvp5H
 EBJO1i6g8RcCwlCn/OxhLHIFCZROJusM37yfSvuW6/0ILn0JF51GbPJ8wKfCEUpO2vhh
 mg6TNry0A5ZDv3iCxJnhsKrGw+i1DzXgCKnHF+Y5QTdZWhJSYmepPppbkhQGxIUxDncM
 X91bqp6GF8WUYv6JrZNZbDf0I5CkD3tE6uLIczbIL9gKz5tw8ZoFh57zJJgfGoYcU8Kp
 xg7XhikuYiAAK7BJ9N4KWlb9A25mcROYnNoBMkcIdNVhcXoGZYAfHNgmwpWZGKns7kpX
 iPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qlGk1t1JX6kb8l3MG/lAxzFXFUA/DSSAXsqUp/eSLiE=;
 b=KlfDu2CyqqppCQz6rdoTVpuFl4BlI8F0fDPigovVHn3hV+NUtJj/Pio6O6nB1Y21JH
 FbLo8wd4obMZt46uDF6WMfBV+kNWKcWBAjW2mBu6DxXg1UZhia2F/R46QsjCguMbEPzl
 esrkJ4HULJ1Ze1Hs75lhPPFD6mqcFfnEErYtOW5eyDdfSrVNQZvWP7bW1/HSBHwLAAbZ
 1sUOAyIQsNz6SbRRcYnpMDxYbY12PqvLoXGuyzxindhOD3kBDfMhg7onmiAHKQcwG5Xe
 Cwz9gLlvKqhwdvX8Dz2PiQnImyyN/lHTD4Rn5wgcZUJgRQHMM1k8CawnKB1vmCLjx4Ee
 2zsg==
X-Gm-Message-State: APjAAAVtw/1dfrV+XttLSEwH4k/BGHr83Y9m5ZJZzWbh3USxOPurnXnB
 b45Lz6m3XfhS++1jEuc6RXXOUYd4zDlzPcDKZEk=
X-Google-Smtp-Source: APXvYqz8dcXpixz6f+aBsN5AVY94G6TJKan0yNELtw2lAzSpbVR4zj2v5b7MdwVbndQAaqCr0r7mdk1sSd21kor3XnY=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr17851156lfy.141.1565543894974; 
 Sun, 11 Aug 2019 10:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
 <1565510821-3927-28-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565510821-3927-28-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 11 Aug 2019 10:17:47 -0700
Message-ID: <CAKmqyKN79+jZt_giWs8XqO3dcsuk+6f2nXXt42SOG+ar_CiQgg@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 27/28] riscv: virt: Change
 create_fdt() to return void
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
X-List-Received-Date: Sun, 11 Aug 2019 17:18:24 -0000

On Sun, Aug 11, 2019 at 1:14 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> There is no need to return fdt at the end of create_fdt() because
> it's already saved in s->fdt. Other machines (sifive_u, spike)
> don't do it neither.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/virt.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2f75195..6bfa721 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -112,7 +112,7 @@ static void create_pcie_irq_map(void *fdt, char *node=
name,
>                             0x1800, 0, 0, 0x7);
>  }
>
> -static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *mem=
map,
> +static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memm=
ap,
>      uint64_t mem_size, const char *cmdline)
>  {
>      void *fdt;
> @@ -316,8 +316,6 @@ static void *create_fdt(RISCVVirtState *s, const stru=
ct MemmapEntry *memmap,
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>      g_free(nodename);
> -
> -    return fdt;
>  }
>
>
> @@ -373,7 +371,6 @@ static void riscv_virt_board_init(MachineState *machi=
ne)
>      size_t plic_hart_config_len;
>      int i;
>      unsigned int smp_cpus =3D machine->smp.cpus;
> -    void *fdt;
>
>      /* Initialize SOC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->s=
oc),
> @@ -392,7 +389,7 @@ static void riscv_virt_board_init(MachineState *machi=
ne)
>          main_mem);
>
>      /* create device tree */
> -    fdt =3D create_fdt(s, memmap, machine->ram_size, machine->kernel_cmd=
line);
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
>
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
> @@ -411,9 +408,9 @@ static void riscv_virt_board_init(MachineState *machi=
ne)
>              hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
>                                             machine->ram_size, kernel_ent=
ry,
>                                             &start);
> -            qemu_fdt_setprop_cell(fdt, "/chosen",
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen",
>                                    "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
>                                    end);
>          }
>      }
> --
> 2.7.4
>
>

