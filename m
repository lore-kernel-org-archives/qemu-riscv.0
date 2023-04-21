Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppiZ4-0004dq-8H
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 00:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ppiZ2-0004d0-LU; Fri, 21 Apr 2023 00:40:04 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ppiYz-0001wG-3a; Fri, 21 Apr 2023 00:40:03 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso147741566b.3; 
 Thu, 20 Apr 2023 21:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682051998; x=1684643998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkvJ0545Y1D68lnXUbuHECmSG/vYQRYhJMPYL9DCOSg=;
 b=LoJnKQk42hofHwCy5WGyi5pVigCpACywhhq3Rb6MQwLCAK1p+0wohg4SlQn5pCe4EP
 EzJEqX50gTXS2LB2+hys/fkgtF+HYVuqbNA3EEV95auJ0wLpgwsNaBgCGhSnbS2Dg2Y4
 mHgdz70qwr1UyZCHw4JVRC2L4j03EJS7sd8Ots2tfmhr9b7QxcATvbqXoEGv9K4WxuEc
 2Kw2AlHF39jIOiDw978A128hSmhnTzuHzkhzErIX38D255ohtzlSxkoTh7ciox7UGJWG
 o1lwEhNe8IQJst35N83QXvGs6WZuVo6GLk4EO2RaBLoGdns3T7OywHjQb3wbHdMjm9sH
 1Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682051998; x=1684643998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkvJ0545Y1D68lnXUbuHECmSG/vYQRYhJMPYL9DCOSg=;
 b=DgeqCig0OxV++abQxfFvIGNm6DOXg6WYVjnYg4OFxB9dtnWi1Vc72W/HHujhq51cJh
 DxXtzS6oIrxNQC7sDmmKbdRq/jJuTE3TE2VnCNibC0Oap5hGIdElLfH9b6JMAKyTRY8h
 JetRS87qzeK712z4DXOh0fErzb8Tmlt52Cvxyn5YrdghVjizMY4HqTPRKXBbkO/OqPhO
 WG686W0KKfx8BLd2yfN+stbJ4ySc7FG0l1qsOzlU8YCwrU6EuW/kFkg7ZUPBeQMko0Pd
 23Fex6zcd6qJo4JutNo0GOcwbRjZ5KLsyIzX8Bc2oy2NldAmCiP8UIgt74rXO4T3ez65
 Le+Q==
X-Gm-Message-State: AAQBX9cjlAUL/QYt2bNKpfO5Sac6iLWwZlnqR/LNmLBdtdjDWSVy13xh
 zunlbhuDDjx/U9moPiNrpF2fq+uHcIsKb6u9Oe4=
X-Google-Smtp-Source: AKy350ZiMgWks7kn5Gnu0Mgbxy++fjDw9hANwZIVcg/amUk9rEBRzdPeTmLP1oRBrnvjAZ1hJZj7436yf83N/bMPpUw=
X-Received: by 2002:a17:907:1c84:b0:879:ab3:93d1 with SMTP id
 nb4-20020a1709071c8400b008790ab393d1mr1236138ejc.4.1682051997718; Thu, 20 Apr
 2023 21:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230421043353.125701-1-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Apr 2023 12:39:46 +0800
Message-ID: <CAEUhbmVFgpKXESX7RtqX5Z4mU0mdbYSU+=KD1R0qPhQt-wgfYw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 21 Apr 2023 04:40:04 -0000

On Fri, Apr 21, 2023 at 12:34=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> Currently, virt machine supports two pflash instances each with
> 32MB size. However, the first pflash is always assumed to
> contain M-mode firmware and reset vector is set to this if
> enabled. Hence, for S-mode payloads like EDK2, only one pflash
> instance is available for use. This means both code and NV variables
> of EDK2 will need to use the same pflash.
>
> The OS distros keep the EDK2 FW code as readonly. When non-volatile
> variables also need to share the same pflash, it is not possible
> to keep it as readonly since variables need write access.
>
> To resolve this issue, the code and NV variables need to be separated.
> But in that case we need an extra flash. Hence, modify the convention
> such that pflash0 will contain the M-mode FW only when "-bios none"
> option is used. Otherwise, pflash0 will contain the S-mode payload FW.
> This enables both pflash instances available for EDK2 use.
>
> Example usage:
> 1) pflash0 containing M-mode FW
> qemu-system-riscv64 -bios none -pflash <mmode_fw> -machine virt
> or
> qemu-system-riscv64 -bios none \
> -drive file=3D<mmode_fw>,if=3Dpflash,format=3Draw,unit=3D0 -machine virt
>
> 2) pflash0 containing S-mode payload like EDK2
> qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machine=
  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -pflash <smode_fw_code> \
> -pflash <smode_vars> \
> -machine  virt
> or
> qemu-system-riscv64 -bios <opensbi_fw> \
> -drive file=3D<smode_fw_code>,if=3Dpflash,format=3Draw,unit=3D0,readonly=
=3Don \
> -drive file=3D<smode_fw_vars>,if=3Dpflash,format=3Draw,unit=3D1 \
> -machine virt

Please update the docs in docs/system/riscv/virt.rst to include how to
run EDK2 bios with these settings.

>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  hw/riscv/virt.c | 51 ++++++++++++++++++-------------------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..1187a60d6e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1245,7 +1245,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>      target_ulong firmware_end_addr, kernel_start_addr;
>      const char *firmware_name =3D riscv_default_firmware_name(&s->soc[0]=
);
>      uint32_t fdt_load_addr;
> -    uint64_t kernel_entry;
> +    uint64_t kernel_entry =3D 0;
>
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
> @@ -1266,42 +1266,29 @@ static void virt_machine_done(Notifier *notifier,=
 void *data)
>      firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
>                                                       start_addr, NULL);
>
> -    if (drive_get(IF_PFLASH, 0, 1)) {
> -        /*
> -         * S-mode FW like EDK2 will be kept in second plash (unit 1).
> -         * When both kernel, initrd and pflash options are provided in t=
he
> -         * command line, the kernel and initrd will be copied to the fw_=
cfg
> -         * table and opensbi will jump to the flash address which is the
> -         * entry point of S-mode FW. It is the job of the S-mode FW to l=
oad
> -         * the kernel and initrd using fw_cfg table.
> -         *
> -         * If only pflash is given but not -kernel, then it is the job o=
f
> -         * of the S-mode firmware to locate and load the kernel.
> -         * In either case, the next_addr for opensbi will be the flash a=
ddress.
> -         */
> -        riscv_setup_firmware_boot(machine);
> -        kernel_entry =3D virt_memmap[VIRT_FLASH].base +
> -                       virt_memmap[VIRT_FLASH].size / 2;
> -    } else if (machine->kernel_filename) {
> +    if (drive_get(IF_PFLASH, 0, 0)) {
> +        if (machine->firmware && !strcmp(machine->firmware, "none")) {
> +            /*
> +             * Pflash was supplied but bios is none, let's overwrite the
> +             * address we jump to after reset to the base of the flash.
> +             */
> +            start_addr =3D virt_memmap[VIRT_FLASH].base;
> +        } else {
> +            /*
> +             * Pflash was supplied but bios is not none. In this case,
> +             * base of the flash would contain S-mode payload.
> +             */
> +            riscv_setup_firmware_boot(machine);
> +            kernel_entry =3D virt_memmap[VIRT_FLASH].base;
> +        }
> +    }
> +
> +    if (machine->kernel_filename && !kernel_entry) {
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
>          kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
>                                           kernel_start_addr, true, NULL);
> -    } else {
> -       /*
> -        * If dynamic firmware is used, it doesn't know where is the next=
 mode
> -        * if kernel argument is not set.
> -        */
> -        kernel_entry =3D 0;
> -    }
> -
> -    if (drive_get(IF_PFLASH, 0, 0)) {
> -        /*
> -         * Pflash was supplied, let's overwrite the address we jump to a=
fter
> -         * reset to the base of the flash.
> -         */
> -        start_addr =3D virt_memmap[VIRT_FLASH].base;
>      }
>
>      fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> --

Regards,
Bin

