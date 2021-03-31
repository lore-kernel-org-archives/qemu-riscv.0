Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd99-0007B2-IH
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd97-00076d-Cw; Wed, 31 Mar 2021 11:52:41 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd92-0005pv-Lc; Wed, 31 Mar 2021 11:52:41 -0400
Received: by mail-il1-x12a.google.com with SMTP id t14so17560241ilu.3;
 Wed, 31 Mar 2021 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vwwL/K0taDCzeQUxMSr/b2SOINV2mYY4YB93yt/+1Qg=;
 b=n1BPfCAiDPm9bgX3NhDz0rSiHFQ1L1EOvGgudNVKI5yndG9I58nYeLzwNGhDD2MsYI
 d9uhloiOV+paljqTwkTaLY5z5Nimsv33pm+nalBp382jhLC6JzlubnPWDUzhNJW0HQ4Z
 R/kcVRslCv/fPOkhmDWlenVQZ4gWCjPuwvBGjGyeIpOIgyVHLNqlQbzE6QxQ29rQHm5y
 ei0hPH4M+t+pwmduvbJUvsH2mpNbzkk9cbz6NCHmr7M7pW5rWqMQBnpp4ol7nhNdilCr
 GYpr0j6VC5Z61uz4L2FxVhVt4p7J/CfnWYnrn6O2X90/A43ujvOEpRv56YjlrSbxcbbD
 I9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vwwL/K0taDCzeQUxMSr/b2SOINV2mYY4YB93yt/+1Qg=;
 b=RMMDtSDVIIrdGhbsct2fAI99ouNb8QdLjdZk9RMj9GODVgP6srK5h0vWcJbAIO/KVR
 qkf+uviAj4DeMYUxTuo2EXdlOGd7t6s+OwvlbD++MCNvfhu8vkbnT6paiICXBqxhHwka
 pA6BqP4N4wk9OpEnThPsvnO379DehFYYJ7j/kOq1kCFTqrRWBUqnieRZOdO25BXbl6Mi
 DpE/8E2UekXv32uqPnPsO9rEGlGUAjZNOWYdOkn3gM8zwPGaJRnABNrSE+EX0UyZb8qD
 0jNtaTe+E/pdVwTQE9bR3UDLDervrak5FxNSA46FVmJPvBvModqoXUDiKc/jJeDU4vTO
 Y6LA==
X-Gm-Message-State: AOAM532meYUQoMeLq4BQVtHtwHhkFF3TnBwIJdklIRRjf42ngclNebah
 d5MDiOO35NozBek+r2CQXqAbo925W4SAeFkjLLE=
X-Google-Smtp-Source: ABdhPJyga8uBuSmp0g0v50PxB4Gyn5FRM/xEeEwD0YonyHz8EecFWU7UBrJ4t2mVGWfTBMY1sWaCJQMsCzg+MayGhHI=
X-Received: by 2002:a05:6e02:1989:: with SMTP id
 g9mr3065005ilf.40.1617205954931; 
 Wed, 31 Mar 2021 08:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-8-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-8-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:50:23 -0400
Message-ID: <CAKmqyKN7_RBmU+P1j1z6WdozKF8m0bD5J0dNoT-PJJNBfC3ZdQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/riscv: microchip_pfsoc: Support direct kernel boot
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:52:41 -0000

On Mon, Mar 29, 2021 at 1:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the Microchip Icicle Kit machine only supports using
> '-bios' to load the HSS, and does not support '-kernel' for direct
> kernel booting just like other RISC-V machines do. One has to use
> U-Boot which is chain-loaded by HSS, to load a kernel for testing.
> This is not so convenient.
>
> Adding '-kernel' support together with the existing '-bios', we
> follow the following table to select which payload we execute:
>
>   -bios |    -kernel | payload
>   ------+------------+--------
>       N |          N | HSS
>       Y | don't care | HSS
>       N |          Y | kernel
>
> This ensures backwards compatibility with how we used to expose
> '-bios' to users. When '-kernel' is used for direct boot, '-dtb'
> must be present to provide a valid device tree for the board,
> as we don't generate device tree.
>
> When direct kernel boot is used, the OpenSBI fw_dynamic BIOS image
> is used to boot a payload like U-Boot or OS kernel directly.
>
> Documentation is updated to describe the direct kernel boot. Note
> as of today there is still no PolarFire SoC support in the upstream
> Linux kernel hence the document does not include instructions for
> that. It will be updated in the future.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/microchip-icicle-kit.rst | 30 ++++++--
>  hw/riscv/microchip_pfsoc.c                 | 81 +++++++++++++++++++++-
>  2 files changed, 103 insertions(+), 8 deletions(-)
>
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/ris=
cv/microchip-icicle-kit.rst
> index e803131763..54ced661e3 100644
> --- a/docs/system/riscv/microchip-icicle-kit.rst
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -31,17 +31,37 @@ Boot options
>
>  The ``microchip-icicle-kit`` machine can start using the standard -bios
>  functionality for loading its BIOS image, aka Hart Software Services (HS=
S_).
> -HSS loads the second stage bootloader U-Boot from an SD card. It does no=
t
> -support direct kernel loading via the -kernel option. One has to load ke=
rnel
> -from U-Boot.
> +HSS loads the second stage bootloader U-Boot from an SD card. Then a ker=
nel
> +can be loaded from U-Boot. It also supports direct kernel booting via th=
e
> +-kernel option along with the device tree blob via -dtb. When direct ker=
nel
> +boot is used, the OpenSBI fw_dynamic BIOS image is used to boot a payloa=
d
> +like U-Boot or OS kernel directly.
> +
> +The user provided DTB should have the following requirements:
> +
> +* The /cpus node should contain at least one subnode for E51 and the num=
ber
> +  of subnodes should match QEMU's ``-smp`` option
> +* The /memory reg size should match QEMU=E2=80=99s selected ram_size via=
 ``-m``
> +* Should contain a node for the CLINT device with a compatible string
> +  "riscv,clint0"
> +
> +QEMU follows below truth table to select which payload to execute:
> +
> +=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D
> +-bios     -kernel payload
> +=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D
> +    N           N     HSS
> +    Y  don't care     HSS
> +    N           Y  kernel
> +=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D
>
>  The memory is set to 1537 MiB by default which is the minimum required h=
igh
>  memory size by HSS. A sanity check on ram size is performed in the machi=
ne
>  init routine to prompt user to increase the RAM size to > 1537 MiB when =
less
>  than 1537 MiB ram is detected.
>
> -Boot the machine
> -----------------
> +Running HSS
> +-----------
>
>  HSS 2020.12 release is tested at the time of writing. To build an HSS im=
age
>  that can be booted by the ``microchip-icicle-kit`` machine, type the fol=
lowing
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index c4146b7a6b..1919c09f2f 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -53,6 +53,7 @@
>  #include "hw/riscv/microchip_pfsoc.h"
>  #include "hw/intc/sifive_clint.h"
>  #include "hw/intc/sifive_plic.h"
> +#include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>
>  /*
> @@ -462,6 +463,12 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
>      MemoryRegion *mem_high =3D g_new(MemoryRegion, 1);
>      MemoryRegion *mem_high_alias =3D g_new(MemoryRegion, 1);
>      uint64_t mem_high_size;
> +    hwaddr firmware_load_addr;
> +    const char *firmware_name;
> +    bool kernel_as_payload =3D false;
> +    target_ulong firmware_end_addr, kernel_start_addr;
> +    uint64_t kernel_entry;
> +    uint32_t fdt_load_addr;
>      DriveInfo *dinfo =3D drive_get_next(IF_SD);
>
>      /* Sanity check on RAM size */
> @@ -506,9 +513,6 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>                                  memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].ba=
se,
>                                  mem_high_alias);
>
> -    /* Load the firmware */
> -    riscv_find_and_load_firmware(machine, BIOS_FILENAME, RESET_VECTOR, N=
ULL);
> -
>      /* Attach an SD card */
>      if (dinfo) {
>          CadenceSDHCIState *sdhci =3D &(s->soc.sdhci);
> @@ -518,6 +522,77 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
>                                  &error_fatal);
>          qdev_realize_and_unref(card, sdhci->bus, &error_fatal);
>      }
> +
> +    /*
> +     * We follow the following table to select which payload we execute.
> +     *
> +     *  -bios |    -kernel | payload
> +     * -------+------------+--------
> +     *      N |          N | HSS
> +     *      Y | don't care | HSS
> +     *      N |          Y | kernel
> +     *
> +     * This ensures backwards compatibility with how we used to expose -=
bios
> +     * to users but allows them to run through direct kernel booting as =
well.
> +     *
> +     * When -kernel is used for direct boot, -dtb must be present to pro=
vide
> +     * a valid device tree for the board, as we don't generate device tr=
ee.
> +     */
> +
> +    if (machine->kernel_filename && machine->dtb) {
> +        int fdt_size;
> +        machine->fdt =3D load_device_tree(machine->dtb, &fdt_size);
> +        if (!machine->fdt) {
> +            error_report("load_device_tree() failed");
> +            exit(1);
> +        }
> +
> +        firmware_name =3D RISCV64_BIOS_BIN;
> +        firmware_load_addr =3D memmap[MICROCHIP_PFSOC_DRAM_LO].base;
> +        kernel_as_payload =3D true;
> +    }
> +
> +    if (!kernel_as_payload) {
> +        firmware_name =3D BIOS_FILENAME;
> +        firmware_load_addr =3D RESET_VECTOR;
> +    }
> +
> +    /* Load the firmware */
> +    firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
> +                                                     firmware_load_addr,=
 NULL);
> +
> +    if (kernel_as_payload) {
> +        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
> +                                                         firmware_end_ad=
dr);
> +
> +        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
> +                                         kernel_start_addr, NULL);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_ent=
ry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> +                                  "linux,initrd-end", end);
> +        }
> +
> +        if (machine->kernel_cmdline) {
> +            qemu_fdt_setprop_string(machine->fdt, "/chosen",
> +                                    "bootargs", machine->kernel_cmdline)=
;
> +        }
> +
> +        /* Compute the fdt load address in dram */
> +        fdt_load_addr =3D riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO]=
.base,
> +                                       machine->ram_size, machine->fdt);
> +        /* Load the reset vector */
> +        riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load=
_addr,
> +                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].base=
,
> +                                  memmap[MICROCHIP_PFSOC_ENVM_DATA].size=
,
> +                                  kernel_entry, fdt_load_addr, machine->=
fdt);
> +    }
>  }
>
>  static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, voi=
d *data)
> --
> 2.25.1
>
>

