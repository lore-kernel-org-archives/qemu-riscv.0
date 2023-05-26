Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC7AC77B7C
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 06:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2RFW-0007km-31; Fri, 26 May 2023 02:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2RFR-0007jx-DT; Fri, 26 May 2023 02:48:25 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2RFM-00050G-Ff; Fri, 26 May 2023 02:48:22 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-510db954476so478175a12.0; 
 Thu, 25 May 2023 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685083695; x=1687675695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gebbvLecwxmC4j6HVqVaGnssKKu6mrz7ssMgpBbb4qU=;
 b=rDvfhFiIEm9nGVml1VX1onMSyfMRwRj28o/PngYLWbl7pK0dOt2XkNihUeKublOtPo
 DvXOU1xBZg+75jTkO+R1lGnlsppIKyxCu17BvFTBjo1ZlOhCvmiNf2swR6jfqMWcsi9d
 zjvesTAm/KlRGwT4hBcefIaA2knwmW2VaxcQjWpvyQiedk9xTkDK22immhDcHaOh/p1o
 cvHS24xtk+9fpbF0W9fVuk1thKj9S8Z54oQeN97Ca45RizdasY4omUXVKA2H7RIesbNt
 tJg1QSs3ZWrvv2bKtqzLhAbss9MDu/hUPBRwV4lZB6H7mZQunkJVxEOaXEbMYZV+NbjE
 iR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685083695; x=1687675695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gebbvLecwxmC4j6HVqVaGnssKKu6mrz7ssMgpBbb4qU=;
 b=Zrfjz3fhP0v46YXGVmlQFulsgqpX/tvul2RfpmCf9RsbRLj9kumDmCyAr8bO5VEX09
 fjdXpq8O5sCA9MvlMonlTMC01WGjKmfI3F6Satu7heony/PCI9hD4CEYxgRQemHGrUi6
 rNCDLNizHE8J6TCT4HeD1fEUu6DY5wYjoizeaig//jJ5ZaLvv0K99LVVEt09lNnbg2km
 MvkQoCCS0M0q1/WxQxmUOzS5U6yR4fZ+fvd9GrhHsiyR+2O4fLaoMfHZ88P9RfDsO1UQ
 8InxqtY5bNIpAcqJ8heQRrtjybcEHKtlXSPefDgtO0OrYrLt3hd/9l0ik71qvZYqo5sj
 HnGw==
X-Gm-Message-State: AC+VfDwbhCcTiLs1I1qaJxd7I7m21F/y/kbFpd5j4q0cdpmkzmgQGrFo
 QQpLmkaBE6qvSII2zikYILNSo9QBBfXxXnFhDQZVzkXeO1U4Dwue
X-Google-Smtp-Source: ACHHUZ4BV0PwbDbD8ni5WsM8KXY0nGYExiFrOnzFEuVVzsCD2vhN2lt8uT5gTKudZ7Uvf3x6vQ4TA0fEfYVAXR6gocY=
X-Received: by 2002:a17:906:d54f:b0:94b:ffe9:37fd with SMTP id
 cr15-20020a170906d54f00b0094bffe937fdmr1067308ejc.5.1685083694992; Thu, 25
 May 2023 23:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230523102805.100160-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230523102805.100160-1-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 16:47:47 +1000
Message-ID: <CAKmqyKPMtrJBMypSH_Y4MS8shMiTGY67jnuHtM0LZO-YYQUhyg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Assume M-mode FW in pflash0 only when
 "-bios none"
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, May 23, 2023 at 8:29=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
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
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> The issue is reported at
> https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1=
e53c619ce60587f6
>
> The patch is based on Alistair's riscv-to-apply.next branch.
>
> Changes since v2:
>         1) Reverted v2 changes and used v1 approach so that pflash0 can b=
e used
>            for code and pflash1 for variable store.
>         2) Rebased to latest riscv-to-apply.next branch.
>         3) Added documentation for pflash usage.
>
> Changes since v1:
>         1) Simplified the fix such that it doesn't break current EDK2.
>
>  docs/system/riscv/virt.rst | 33 ++++++++++++++++++++++++
>  hw/riscv/virt.c            | 51 ++++++++++++++------------------------
>  2 files changed, 52 insertions(+), 32 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index 4b16e41d7f..4ac0d38fdf 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -53,6 +53,39 @@ with the default OpenSBI firmware image as the -bios. =
It also supports
>  the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dy=
namic
>  firmware and U-Boot proper (S-mode), using the standard -bios functional=
ity.
>
> +Using flash devices
> +-------------------
> +
> +The first flash device (pflash0) can contain either ROM code like Oreboo=
t
> +or S-mode payload firmware code like EDK2. If the pflash0 contains the
> +ROM code, -bios should be set to none. Otherwise, pflash0 is assumed to
> +contain S-mode payload code.
> +
> +Firmware images used for pflash should be of size 32M.
> +
> +To boot as ROM code like Oreboot:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -bios none -pflash <rom_code_image> \
> +       ... other args ....
> +
> +To boot as S-mode payload like EDK2:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -pflash <s-mode_fw_code> -pflash <smode_fw_vars>=
 \
> +       ... other args ....
> +
> +To boot as read-only S-mode payload like EDK2:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -bios <opensbi_fw> \
> +       -drive file=3D<smode_fw_code>,if=3Dpflash,format=3Draw,unit=3D0,r=
eadonly=3Don \
> +       -drive file=3D<smode_fw_vars>,if=3Dpflash,format=3Draw,unit=3D1 \
> +       ... other args ....
> +
>  Machine-specific options
>  ------------------------
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
> 2.34.1
>
>

