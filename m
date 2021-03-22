Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOMRK-0001Pp-E6
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMRJ-0001Or-6A; Mon, 22 Mar 2021 11:25:57 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lOMRE-0003vF-3n; Mon, 22 Mar 2021 11:25:56 -0400
Received: by mail-io1-xd2c.google.com with SMTP id x16so14341173iob.1;
 Mon, 22 Mar 2021 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gdzcd17w02nFW6OSyJ1t3QvINzfm5kR+CItYNa7a2zU=;
 b=dxnWax9uZnW2O+DzCssIDrbBzJBNLU0tM+Ea/5dnM4VN9zwaLdMsSYJrgtlnTBUtLb
 Ht6Ip+elKKuqCPtbRAawQ6L4ilIuKjMwyhMDu91rWEB6wg69wRxP344aMWpjuhS0kfyC
 Rvyx1pfCYZCUpAv+C1jJV5fDm57KBHbRR54N3hyXUGBCRbEa0RIHv3LhzrYqRvgqH496
 gmOEFbOAURapDG05iuW2UQMBPGA00Ik3j2FRkhLmp41lmaCkgQg8RBSuX1IrtrwBc0MQ
 RxCqsAEm/Gsccdl6nBXWTgyOliPJ8w0jR7g5MYvfNkMqQAClBVodeY7Nja6SVuMjHUbK
 TT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gdzcd17w02nFW6OSyJ1t3QvINzfm5kR+CItYNa7a2zU=;
 b=g66VkX99V0A5Mtt/x65+MC6Nypsw4EhI9p6db/6/zNwCXvRvvLP8eL8PcMKmipHqd3
 7+r/AzjjB+xyiRo6KY669sKA8w6zkD74/ZF1RbpdEKJcehEfxhJRHBL0jUWqmillgVms
 N13aXazhtsIy9GF/B5caQwXlm+U96ehF0C2uDzbYRIFEC+hp6rr10yvv6mdyQWO/Vs1i
 yxaDssJBqyR00A1eyJVDvx5Bt4t4eGyyikGvYpD/UCwno6TAUtoofDW2T6CGT7jqsvLE
 FF63NiZIO6CqQFHx3tMxE6SQ1VIt6ahJ3XGlpwuuBSR0Y6GCwW1MdE+9y012KD6U/32a
 1MoA==
X-Gm-Message-State: AOAM532HUmUfwlMqxrkz5xWibzje2XA73OpGKiqNlbuKgZxAilj/CiW5
 Y6QAbjvGu5Do9o4K0FRlWa+vgM3dSzIzssXXv1A=
X-Google-Smtp-Source: ABdhPJyRHeg0E9cFGy3BFlK11Nfixp4xITQ0G5UcXDaSCMQGhb+NkHT/Nv2at3dbRq5D1s8mu6DuBXzuSdRL4Tcbq+4=
X-Received: by 2002:a02:11c9:: with SMTP id 192mr11599239jaf.135.1616426750083; 
 Mon, 22 Mar 2021 08:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210322075248.136255-1-bmeng.cn@gmail.com>
 <20210322075248.136255-2-bmeng.cn@gmail.com>
In-Reply-To: <20210322075248.136255-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Mar 2021 11:23:54 -0400
Message-ID: <CAKmqyKPxa=CShXBK-0svxqhAEyUF+OrSWGiT11Vym02Acj63JQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system: riscv: Add documentation for
 'microchip-icicle-kit' machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Mon, 22 Mar 2021 15:25:57 -0000

On Mon, Mar 22, 2021 at 3:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the documentation to describe what is supported for the
> 'microchip-icicle-kit' machine, and how to boot the machine in QEMU.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/microchip-icicle-kit.rst | 89 ++++++++++++++++++++++
>  docs/system/target-riscv.rst               |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 docs/system/riscv/microchip-icicle-kit.rst
>
> diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
> new file mode 100644
> index 0000000000..4fe97bce3f
> --- /dev/null
> +++ b/docs/system/riscv/microchip-icicle-kit.rst
> @@ -0,0 +1,89 @@
> +Microchip PolarFire SoC Icicle Kit (``microchip-icicle-kit``)
> +=============================================================
> +
> +Microchip PolarFire SoC Icicle Kit integrates a PolarFire SoC, with one
> +SiFive's E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> +
> +For more details about Microchip PolarFire SoC, please see:
> +https://www.microsemi.com/product-directory/soc-fpgas/5498-polarfire-soc-fpga
> +
> +The Icicle Kit board information can be found here:
> +https://www.microsemi.com/existing-parts/parts/152514
> +
> +Supported devices
> +-----------------
> +
> +The ``microchip-icicle-kit`` machine supports the following devices:
> +
> + * 1 E51 core
> + * 4 U54 cores
> + * Core Level Interruptor (CLINT)
> + * Platform-Level Interrupt Controller (PLIC)
> + * L2 Loosely Integrated Memory (L2-LIM)
> + * DDR memory controller
> + * 5 MMUARTs
> + * 1 DMA controller
> + * 2 GEM Ethernet controllers
> + * 1 SDHC storage controller
> +
> +Boot options
> +------------
> +
> +The ``microchip-icicle-kit`` machine can start using the standard -bios
> +functionality for loading its BIOS image, aka Hart Software Services (HSS_).
> +HSS loads the second stage bootloader U-Boot from an SD card. It does not
> +support direct kernel loading via the -kernel option. One has to load kernel
> +from U-Boot.
> +
> +The memory is set to 1537 MiB by default which is the minimum required high
> +memory size by HSS. A sanity check on ram size is performed in the machine
> +init routine to prompt user to increase the RAM size to > 1537 MiB when less
> +than 1537 MiB ram is detected.
> +
> +Boot the machine
> +----------------
> +
> +HSS 2020.12 release is tested at the time of writing. To build an HSS image
> +that can be booted by the ``microchip-icicle-kit`` machine, type the following
> +in the HSS source tree:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=riscv64-linux-
> +  $ cp boards/mpfs-icicle-kit-es/def_config .config
> +  $ make BOARD=mpfs-icicle-kit-es
> +
> +Download the official SD card image released by Microchip and prepare it for
> +QEMU usage:
> +
> +.. code-block:: bash
> +
> +  $ wget ftp://ftpsoc.microsemi.com/outgoing/core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
> +  $ gunzip core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz
> +  $ qemu-img resize core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic 4G
> +
> +Then we can boot the machine by:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
> +      -bios path/to/hss.bin -sd path/to/sdcard.img \
> +      -nic user,model=cadence_gem \
> +      -nic tap,ifname=tap,model=cadence_gem,script=no \
> +      -display none -serial stdio \
> +      -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
> +      -serial chardev:serial1
> +
> +With above command line, current terminal session will be used for the first
> +serial port. Open another terminal window, and use `minicom` to connect the
> +second serial port.
> +
> +.. code-block:: bash
> +
> +  $ minicom -D unix\#serial1.sock
> +
> +HSS output is on the first serial port (stdio) and U-Boot outputs on the
> +second serial port. U-Boot will automatically load the Linux kernel from
> +the SD card image.
> +
> +.. _HSS: https://github.com/polarfire-soc/hart-software-services
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 94d99c4c82..8d5946fbbb 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -66,6 +66,7 @@ undocumented; you can get a complete list by running
>  .. toctree::
>     :maxdepth: 1
>
> +   riscv/microchip-icicle-kit
>     riscv/sifive_u
>
>  RISC-V CPU features
> --
> 2.25.1
>
>

