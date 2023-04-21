Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppsIx-00021N-FR
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1pprsi-0006SZ-GV; Fri, 21 Apr 2023 10:37:00 -0400
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1pprsf-0001up-Hk; Fri, 21 Apr 2023 10:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682087777; i=xypron.glpk@gmx.de;
 bh=X61sY51cIiQt6YytIRJJYqT7s/WaLqEaTGZPERefldg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=V2rR0uqvIwAJtpeVizMlqQ3xBs4/pxamjHXB9cKlvUH1uT2SzTSLO1oZ+IxOlK87J
 X1NPV8q/hoZTYHrkNWcr90iPdAW57/qGCbZbL3yAFCNJCATG8mccLdRsHaY0ZRXC8a
 t5S9gOrftifUA2oKIoeADotG5ahELX2Poexnlf13uPE+xQfsMj23WnMUjf9+ROrMT2
 R+aM6FuQL4vEC21PBEN+m43JLatgx25Z2EzfcstX0g1YF9t58H2FVcXyqSBDjM6cV5
 pkUsF61uA5P076SvcNtcBE8pWbD21i2cEDdN3c8D4ZnIjh7Y7xSS3OVDgykoU35IX9
 szXGGvCUDHGkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.67] ([88.152.145.137]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhhN-1pzWEw2vQ7-00Ak9l; Fri, 21
 Apr 2023 16:36:17 +0200
Message-ID: <b882e2cf-8e7f-eacc-27cf-05364a065290@gmx.de>
Date: Fri, 21 Apr 2023 16:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230421043353.125701-1-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sW6gkWgO1gQ64YlJKuCwxLksP2cr68ZnnJbFQdltFLuwlq3UASo
 MrXkcijr6XReSw3vmm/rRqhAxKtm898e7ZTLarsZissnXETqGZcdvymNw/KIe6lopwwYNIr
 DyfVnDVU/r64dr/3g/PhLKyBU2JNkgpZ5aX/ycMP8mdtQp581iUDKd4IZlgDGUJ/4McGT7/
 t7yhC+z65rj4xgfB+UYxw==
UI-OutboundReport: notjunk:1;M01:P0:9R9WGhgpN9c=;jeCoVbC1Nfg402pBrw9qE0BQNbN
 C3+nxwuDgmTbDzYHHdOt34Re9/kqv+JyQcaO94FfEpMTERVQXq4R3E/RgE5PETnR7pzCKXOEc
 5c2ryM7K3MG1eQQQLavQjjiKL4s7QRPWy0gZ7OMg2ug7hbJ7tnOKeyRInd0NYti5YDF5pe1r+
 Ln2eae8kZZ+s9TorNRUKtaYcG/6thirmgpqoGfXKaqmcmtVxCj9npDG9f11OqFQ3g94S+ltJQ
 Py3KMtn+Xmh2m8ZiekasSuQ6++RvszNomIsNqPC0YFkX6jz+e+JN20XITIdZIiMerNWsBSzTq
 kCAGEdjbKEgP0iXWVuxs5UKz1YpIp4gUTJ9ejWu+BMXlxbPsPM1DQKKj/29qr6/bYysKFfsxW
 c1iv77gIX5ccEuIr650qc6RFS+Ys6nlS9s3x/w36tFOwJ4GypjL53+PGqXXOC+AjLwIBJJ9gl
 6z/PaNIDgi37q/URGnx7GW5FwNUQ6hOP5Uwa3YSSG2vGkK32nyH2v5zrHmXFxjWQJjsK6neNx
 mLElBYBZEmg9Z7WrwnGCgFIUSFr6UnPIy4N6pYrqsH7QSs7HZ8JHkV7632GKf3RQL3o6QhOFf
 2pT3FIpnIR1Bju+sNUtEubhnHirXcacLvSCyX7DY0Q0Dnggh5PTLRy2Vs2Zu7MAW9wVmJbxSc
 7KY8KD8zeiXAkAenUnlm3P8EcDJFma1Epu9xk9z96rASoE+3AdP1KlFikKqax/z5uihu58o6y
 PDmdoLUH80zR1juMcJ8LeXZhxc1DVK2lzZUcumnRMipNrjYv/l2V0wZ9Z9rcrG2fcBOCtBljX
 RnU2l6DFMpUDI4ygYoS6k3ew6fDAg6LPN7At71nFB/4kcwyQC0aPzl0gg87AIa1aI3u9XrK/C
 TK053XyhqCcI7sR1q6CaRuTZhU8E5LV+0Ht12RrUmpDqh7GREB6jK+ZyPV4Rd3Eu1N7a2bs1W
 Lg8hdKM3RmTjYR/DS5+NtDB95+E=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 Apr 2023 11:04:06 -0400
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
X-List-Received-Date: Fri, 21 Apr 2023 14:37:00 -0000

On 4/21/23 06:33, Sunil V L wrote:
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
> qemu-system-riscv64 -pflash <smode_fw_code> -pflash <smode_vars> -machin=
e  virt
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

QEMU 7.2 (and possibly 8.0 to be released) contains the old behavior.

Changed use of command line parameters should depend on the version of
the virt machine, i.e. virt-7.2 should use the old behavior and virt as
alias for virt-8.0 should use the new behavior. Please, have a look at
the option handling in hw/arm/virt.c and macro DEFINE_VIRT_MACHINE().

Best regards

Heinrich

> ---
>   hw/riscv/virt.c | 51 ++++++++++++++++++-------------------------------
>   1 file changed, 19 insertions(+), 32 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..1187a60d6e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1245,7 +1245,7 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
>       target_ulong firmware_end_addr, kernel_start_addr;
>       const char *firmware_name =3D riscv_default_firmware_name(&s->soc[=
0]);
>       uint32_t fdt_load_addr;
> -    uint64_t kernel_entry;
> +    uint64_t kernel_entry =3D 0;
>
>       /*
>        * Only direct boot kernel is currently supported for KVM VM,
> @@ -1266,42 +1266,29 @@ static void virt_machine_done(Notifier *notifier=
, void *data)
>       firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmwa=
re_name,
>                                                        start_addr, NULL)=
;
>
> -    if (drive_get(IF_PFLASH, 0, 1)) {
> -        /*
> -         * S-mode FW like EDK2 will be kept in second plash (unit 1).
> -         * When both kernel, initrd and pflash options are provided in =
the
> -         * command line, the kernel and initrd will be copied to the fw=
_cfg
> -         * table and opensbi will jump to the flash address which is th=
e
> -         * entry point of S-mode FW. It is the job of the S-mode FW to =
load
> -         * the kernel and initrd using fw_cfg table.
> -         *
> -         * If only pflash is given but not -kernel, then it is the job =
of
> -         * of the S-mode firmware to locate and load the kernel.
> -         * In either case, the next_addr for opensbi will be the flash =
address.
> -         */
> -        riscv_setup_firmware_boot(machine);
> -        kernel_entry =3D virt_memmap[VIRT_FLASH].base +
> -                       virt_memmap[VIRT_FLASH].size / 2;
> -    } else if (machine->kernel_filename) {
> +    if (drive_get(IF_PFLASH, 0, 0)) {
> +        if (machine->firmware && !strcmp(machine->firmware, "none")) {
> +            /*
> +             * Pflash was supplied but bios is none, let's overwrite th=
e
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
>           kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                            firmware_end_=
addr);
>
>           kernel_entry =3D riscv_load_kernel(machine, &s->soc[0],
>                                            kernel_start_addr, true, NULL=
);
> -    } else {
> -       /*
> -        * If dynamic firmware is used, it doesn't know where is the nex=
t mode
> -        * if kernel argument is not set.
> -        */
> -        kernel_entry =3D 0;
> -    }
> -
> -    if (drive_get(IF_PFLASH, 0, 0)) {
> -        /*
> -         * Pflash was supplied, let's overwrite the address we jump to =
after
> -         * reset to the base of the flash.
> -         */
> -        start_addr =3D virt_memmap[VIRT_FLASH].base;
>       }
>
>       fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,


