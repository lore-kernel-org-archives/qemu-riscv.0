Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hXC-0000Xz-JE
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1hX7-0000UV-2j; Thu, 08 Jul 2021 23:50:33 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:43632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1hX3-0008Q5-Bq; Thu, 08 Jul 2021 23:50:32 -0400
Received: by mail-io1-xd2d.google.com with SMTP id k16so10875920ios.10;
 Thu, 08 Jul 2021 20:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3I3ZsGH1kIEwlL7l08yEkJQZ2uVtpH/LfVLDFj4nQL8=;
 b=pwVWQPy7htJhH4K/sdlLTo1G22q75aqxwUqa3L/s/5y5bV+lyhN7IZIIdKJMFdBP7I
 smPUH6jvmFDDE1nSVEn/jyZA1b0dus9/SkcptVWdv7a0guy7urlaiQiyeyxUYKFyU9wL
 yYzokiejSpp8pfGbEMtTGkEoRorIuu/pnx60V7dwwuxJ2/l6ior0YS0Ut6j4+sB18i9P
 e6xYaod1aBgksNbFc2zcDQu7T5C1dcDo3OjHfuZ8Ak0HhUci7P2dfR1u0BwNcbwXxNRT
 hxEif6+8bWVKnYinrn9wEzAOMO0sgunXSdqYUaW8ExmMj/yjEVcu08NVDneapBrKdMqV
 yTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3I3ZsGH1kIEwlL7l08yEkJQZ2uVtpH/LfVLDFj4nQL8=;
 b=O3e+xSrJJtHcw8/YqS3uTTdxisTbLVOYW6nDXXreLzDEr0NiB+EKyNTvgYNry3MYUb
 DDm3v7pmrzfqF0IlKguxn/3pjzKLDHylOa4cpfxC5K6hgQw4Uk9uSDRiEGGmDolRTpkO
 6xN59FK7h6n6PuAa+ULVaWzy0g9j7Lx6gtwug+mS9bgNF/P0c7G3RoLV7Av8k9QUFv7+
 OiT2ZccsBAvId4C5134Dcv9390QANM+GHy3MTRQiejRbXpak0IkHGsYoXNRqIhW+jkYo
 rJhpRk3hAgP++QoTaO+2BCHf15pPFvmDvi9VGHnyKgwSfq3gJ66ku4uaMkNfGHCt4FBL
 yfrg==
X-Gm-Message-State: AOAM531R438+Jlza3qoJvMkgGjTcMceyvVWEvEBnhPavvmIr/v0jIMJb
 iPEIsG8tKjzONnL8xTE0dyjVV/qzUrlYzr1Al/s=
X-Google-Smtp-Source: ABdhPJy6lkYaxc/IJybs+i+2cBk16fwHp1wo5QDjlHuDlt8rtD2HJrpUY4R+p6TO/w9XwtP7Td0WoF7KBGI3wqkJGwQ=
X-Received: by 2002:a6b:490d:: with SMTP id u13mr27249535iob.176.1625802626962; 
 Thu, 08 Jul 2021 20:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095045.1917913-1-bmeng.cn@gmail.com>
In-Reply-To: <20210706095045.1917913-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Jul 2021 13:50:00 +1000
Message-ID: <CAKmqyKPdsw+ZEiuAphgTQ4rjLvEvxJDpdbyG0DMXNK2Oo-L0EQ@mail.gmail.com>
Subject: Re: [PATCH] docs/system: riscv: Update Microchip Icicle Kit for
 direct kernel boot
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 03:50:35 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

