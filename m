Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1LzS-00066u-1X
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 00:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1LzM-00066M-Ov; Thu, 08 Jul 2021 00:50:17 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1LzK-0002sc-PO; Thu, 08 Jul 2021 00:50:16 -0400
Received: by mail-io1-xd29.google.com with SMTP id d9so6639246ioo.2;
 Wed, 07 Jul 2021 21:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WpzdiDhls4D95tQ7c4dngG6Rcd06VXk1ViS3ksao6iE=;
 b=jqtCRgfMgmbZ+BtmbLJlF7xsxxPN8BsLA04t4CAdZKJJzh5Kg9MKNB24xEPiqHNJkp
 oSjni//L8YNu2A8Ej+olgEeSMihmQZUmO4uatuqbWaYsgXVk05qYj7D5SajiygYFGU7t
 scpZmCNjTXk2Dl8ozPHNZUTfaj+F+10u3OwUPubSZEAecIPSPsKvF+l6CIeVqQnv0wNh
 XCk9tdVJhL1m/Q429JzpjlPCBnUan9xOgpWZLKQag+ketcLN4+RDjmKV4V1t6r3pmqmc
 NnsnygUbJCzqH/Uz5wSzqH8OpySPdxLXg+wY2U7YGby99oj2QppWIsEtk5Pm3at7Ot91
 HZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WpzdiDhls4D95tQ7c4dngG6Rcd06VXk1ViS3ksao6iE=;
 b=mI2EelJgB0NWeTcIduUho45o1oDptLxlY4iTFvsfneMR4drT8fSExgGNMYJz7JaOX5
 6S/EOvXqp5egfMJmUWolwQ8+FbXNW1QXqgz7u/ol8+q7iB47st7Wi71RYQfF1e8OlG3s
 4WoK1swvP94UZfaMfx/d59VY0RsQJPZOq+gda1plT8kihUtXCdHdYg6GfEv/JRVeNvt8
 vNWrIX/a+GK8HPbwBrQOvfV+NaeU5Hs0rUAikpXRfGgplJE3ZydAycM1fFA/CPVqzjSI
 YXMY1OgR3pYAiLSUGDHvV63eUZT0KuKH5qPqJp6SiW1PCSWx74LEzA0f/yCrCVMzRAOf
 a6uQ==
X-Gm-Message-State: AOAM533xQWw6NoJ+H5gdaxUyB0cbD4dER3RHDdIuJNluOwaRSCiYKbil
 YIEjV6+i5oc+5xgp4tZ1TB0GshGu7rw3W+9AJO0=
X-Google-Smtp-Source: ABdhPJzbjXVZdcM7xZ1yydTEOtYSrVSEHl4ItrJaCJDPCDlyJPSKgyWIW1j9ucZLxzdNn+jq1eeQWEYN85PT7uhIEhI=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr22929000iov.42.1625719813019; 
 Wed, 07 Jul 2021 21:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095045.1917913-1-bmeng.cn@gmail.com>
In-Reply-To: <20210706095045.1917913-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Jul 2021 14:49:46 +1000
Message-ID: <CAKmqyKPU_NJNoLECp7Su3yxShCxKwrfZLg3iV97=N7FajVCCEg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: riscv: Update Microchip Icicle Kit for
 direct kernel boot
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 08 Jul 2021 04:50:19 -0000

On Tue, Jul 6, 2021 at 7:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds a new section in the documentation to demonstrate how to
> use the new direct kernel boot feature for Microchip Icicle Kit,
> other than the HSS bootflow, using an upstream U-Boot v2021.07 image
> as an example.
>
> It also updates the truth table to have a new '-dtb' column which is
> required by direct kernel boot.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/microchip-icicle-kit.rst | 54 +++++++++++++++++++---
>  1 file changed, 47 insertions(+), 7 deletions(-)
>
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> index 54ced661e3..817d2aec9c 100644
> --- a/docs/system/riscv/microchip-icicle-kit.rst
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -47,13 +47,13 @@ The user provided DTB should have the following requirements:
>
>  QEMU follows below truth table to select which payload to execute:
>
> -=====  ========== =======
> --bios     -kernel payload
> -=====  ========== =======
> -    N           N     HSS
> -    Y  don't care     HSS
> -    N           Y  kernel
> -=====  ========== =======
> +===== ========== ========== =======
> +-bios    -kernel       -dtb payload
> +===== ========== ========== =======
> +    N          N don't care     HSS
> +    Y don't care don't care     HSS
> +    N          Y          Y  kernel
> +===== ========== ========== =======
>
>  The memory is set to 1537 MiB by default which is the minimum required high
>  memory size by HSS. A sanity check on ram size is performed in the machine
> @@ -106,4 +106,44 @@ HSS output is on the first serial port (stdio) and U-Boot outputs on the
>  second serial port. U-Boot will automatically load the Linux kernel from
>  the SD card image.
>
> +Direct Kernel Boot
> +------------------
> +
> +Sometimes we just want to test booting a new kernel, and transforming the
> +kernel image to the format required by the HSS bootflow is tedious. We can
> +use '-kernel' for direct kernel booting just like other RISC-V machines do.
> +
> +In this mode, the OpenSBI fw_dynamic BIOS image for 'generic' platform is
> +used to boot an S-mode payload like U-Boot or OS kernel directly.
> +
> +For example, the following commands show building a U-Boot image from U-Boot
> +mainline v2021.07 for the Microchip Icicle Kit board:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=riscv64-linux-
> +  $ make microchip_mpfs_icicle_defconfig
> +
> +Then we can boot the machine by:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 -m 2G \
> +      -sd path/to/sdcard.img \
> +      -nic user,model=cadence_gem \
> +      -nic tap,ifname=tap,model=cadence_gem,script=no \
> +      -display none -serial stdio \
> +      -kernel path/to/u-boot/build/dir/u-boot.bin \
> +      -dtb path/to/u-boot/build/dir/u-boot.dtb
> +
> +CAVEATS:
> +
> +* Check the "stdout-path" property in the /chosen node in the DTB to determine
> +  which serial port is used for the serial console, e.g.: if the console is set
> +  to the second serial port, change to use "-serial null -serial stdio".
> +* The default U-Boot configuration uses CONFIG_OF_SEPARATE hence the ELF image
> +  ``u-boot`` cannot be passed to "-kernel" as it does not contain the DTB hence
> +  ``u-boot.bin`` has to be used which does contain one. To use the ELF image,
> +  we need to change to CONFIG_OF_EMBED or CONFIG_OF_PRIOR_STAGE.
> +
>  .. _HSS: https://github.com/polarfire-soc/hart-software-services
> --
> 2.25.1
>
>

