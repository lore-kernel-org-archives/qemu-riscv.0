Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzDXS-0007lg-PY
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 03:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lzDXQ-0007hF-ID; Fri, 02 Jul 2021 03:24:36 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lzDXO-0005m9-Fd; Fri, 02 Jul 2021 03:24:36 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b15so10564641iow.4;
 Fri, 02 Jul 2021 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CvzKiJqJkOI+3jxyCyF5Kqto0O57+ditcI2v7uWilek=;
 b=MD7hcQw10KC0Yqa8xh8miXW4Jureb1oL00Cye8QeDnJ4uWVQTmFBpK5+F5PdgGy3YX
 MBdiMGEsNEvnRcXX1Defh+vfX7dmUTyLV6ISewMWpCIjN9ZaIYd9csnOc4U7WiVVlu8b
 nCa3N/5e5hui3NlgmKv0XlYvtnGPqbd41N4CHSSvVGH3ejOJ3tsp81o5+RntoYLP89rl
 CozuOR6Y9bA8k3k+Aowuhsgt/vL8Ga70axF0Cs7abAnoMJSd9TNlt2U1yN0JCTUChTu0
 f8yiV94Zkj//4x1bV5y8pb93GDvikmDg5dW3p5k3v0okXdUVnp2UII+LteQrflTrkhwG
 zdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CvzKiJqJkOI+3jxyCyF5Kqto0O57+ditcI2v7uWilek=;
 b=HML3+G4xKOWvSWOzeUtOvXKWG+43d0nnXu4SzIZ9ubYugNdvgvQogaQo4yGvQ3pI23
 v2Nvria+KALKig/b1IADCM7+4z6uYCDypCYIMgu6o+ZMh6S4j/WzpaRj/VyXpaqj+NES
 dwfG2gexZ0z+4dVLJdIQjUH6ALVYTLQvR+bCM27dqh0RUJ6H1806MMgM8HdyHz1fOAwA
 tXdbZiyPHG3w3kXGtAo2F+nWsaUkV3xlBhvaI45csISS+mse5PIWiy748LlIUTTSHSeo
 MqbCHFkbkNhz/eKUEsyF+oNoFRVsRmy5TpJUSimsFPYWzLSdvDZ/KNIJmxL5vm7gjTMn
 Jx9w==
X-Gm-Message-State: AOAM533ifRG5Z+s/wSQUfD3I1Earp/lqi5Kl00VrCf8BqHQfPNI2hkwq
 o3pl3j4EH8d7cg5iKAmCQCm/F1glqpj/lrFlZPY=
X-Google-Smtp-Source: ABdhPJzSj0Y61olnHUGQLr2bcx0BntP+5k4MQPS/MEXUGjkZ6NyRjR9WId2H8fI4RSacXxxAAfvi16DundtGbqLqV7U=
X-Received: by 2002:a05:6638:614:: with SMTP id
 g20mr3133768jar.135.1625210673091; 
 Fri, 02 Jul 2021 00:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210627142816.19789-1-bmeng.cn@gmail.com>
 <20210627142816.19789-2-bmeng.cn@gmail.com>
In-Reply-To: <20210627142816.19789-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jul 2021 17:24:06 +1000
Message-ID: <CAKmqyKMBpSOxxstFU7TUtigcj2PwvTecBcgaKe=v2q8-=1ug2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system: riscv: Add documentation for virt machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 02 Jul 2021 07:24:36 -0000

On Mon, Jun 28, 2021 at 12:29 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This adds detailed documentation for RISC-V `virt` machine,
> including the following information:
>
>   - Supported devices
>   - Hardware configuration information
>   - Boot options
>   - Running Linux kernel
>   - Running U-Boot
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/virt.rst   | 138 +++++++++++++++++++++++++++++++++++
>  docs/system/target-riscv.rst |   1 +
>  2 files changed, 139 insertions(+)
>  create mode 100644 docs/system/riscv/virt.rst
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> new file mode 100644
> index 0000000000..3709f05797
> --- /dev/null
> +++ b/docs/system/riscv/virt.rst
> @@ -0,0 +1,138 @@
> +'virt' Generic Virtual Platform (``virt``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The `virt` board is a platform which does not correspond to any real har=
dware;
> +it is designed for use in virtual machines. It is the recommended board =
type
> +if you simply want to run a guest such as Linux and do not care about
> +reproducing the idiosyncrasies and limitations of a particular bit of
> +real-world hardware.
> +
> +Supported devices
> +-----------------
> +
> +The ``virt`` machine supports the following devices:
> +
> +* Up to 8 generic RV32GC/RV64GC cores, with optional extensions
> +* Core Local Interruptor (CLINT)
> +* Platform-Level Interrupt Controller (PLIC)
> +* CFI parallel NOR flash memory
> +* 1 NS16550 compatible UART
> +* 1 Google Goldfish RTC
> +* 1 SiFive Test device
> +* 8 virtio-mmio transport devices
> +* 1 generic PCIe host bridge
> +* The fw_cfg device that allows a guest to obtain data from QEMU
> +
> +Note that the default CPU is a generic RV32GC/RV64GC. Optional extension=
s
> +can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=3Dtrue=
``
> +enables the hypervisor extension for RV64.
> +
> +Hardware configuration information
> +----------------------------------
> +
> +The ``virt`` machine automatically generates a device tree blob ("dtb")
> +which it passes to the guest, if there is no ``-dtb`` option. This provi=
des
> +information about the addresses, interrupt lines and other configuration=
 of
> +the various devices in the system. Guest software should discover the de=
vices
> +that are present in the generated DTB.
> +
> +If users want to provide their own DTB, they can use the ``-dtb`` option=
.
> +These DTBs should have the following requirements:
> +
> +* The number of subnodes of the /cpus node should match QEMU's ``-smp`` =
option
> +* The /memory reg size should match QEMU=E2=80=99s selected ram_size via=
 ``-m``
> +* Should contain a node for the CLINT device with a compatible string
> +  "riscv,clint0" if using with OpenSBI BIOS images
> +
> +Boot options
> +------------
> +
> +The ``virt`` machine can start using the standard -kernel functionality
> +for loading a Linux kernel, a VxWorks kernel, an S-mode U-Boot bootloade=
r
> +with the default OpenSBI firmware image as the -bios. It also supports
> +the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dy=
namic
> +firmware and U-Boot proper (S-mode), using the standard -bios functional=
ity.
> +
> +Running Linux kernel
> +--------------------
> +
> +Linux mainline v5.12 release is tested at the time of writing. To build =
a
> +Linux mainline kernel that can be booted by the ``virt`` machine in
> +64-bit mode, simply configure the kernel using the defconfig configurati=
on:
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Driscv
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ make defconfig
> +  $ make
> +
> +To boot the newly built Linux kernel in QEMU with the ``virt`` machine:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
> +      -display none -serial stdio \
> +      -kernel arch/riscv/boot/Image \
> +      -initrd /path/to/rootfs.cpio \
> +      -append "root=3D/dev/ram"
> +
> +To build a Linux mainline kernel that can be booted by the ``virt`` mach=
ine
> +in 32-bit mode, use the rv32_defconfig configuration. A patch is require=
d to
> +fix the 32-bit boot issue for Linux kernel v5.12.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Driscv
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ curl https://patchwork.kernel.org/project/linux-riscv/patch/20210627=
135117.28641-1-bmeng.cn@gmail.com/mbox/ > riscv.patch
> +  $ git am riscv.patch
> +  $ make rv32_defconfig
> +  $ make
> +
> +Replace ``qemu-system-riscv64`` with ``qemu-system-riscv32`` in the comm=
and
> +line above to boot the 32-bit Linux kernel. A rootfs image containing 32=
-bit
> +applications shall be used in order for kernel to boot to user space.
> +
> +Running U-Boot
> +--------------
> +
> +U-Boot mainline v2021.04 release is tested at the time of writing. To bu=
ild an
> +S-mode U-Boot bootloader that can be booted by the ``virt`` machine, use
> +the qemu-riscv64_smode_defconfig with similar commands as described abov=
e for Linux:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ make qemu-riscv64_smode_defconfig
> +
> +Boot the 64-bit U-Boot S-mode image directly:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
> +      -display none -serial stdio \
> +      -kernel /path/to/u-boot.bin
> +
> +To test booting U-Boot SPL which in M-mode, which in turn loads a FIT im=
age
> +that bundles OpenSBI fw_dynamic firmware and U-Boot proper (S-mode) toge=
ther,
> +build the U-Boot images using riscv64_spl_defconfig:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ export OPENSBI=3D/path/to/opensbi-riscv64-generic-fw_dynamic.bin
> +  $ make qemu-riscv64_spl_defconfig
> +
> +The minimal QEMU commands to run U-Boot SPL are:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M virt -smp 4 -m 2G \
> +      -display none -serial stdio \
> +      -bios /path/to/u-boot-spl \
> +      -device loader,file=3D/path/to/u-boot.itb,addr=3D0x80200000
> +
> +To test 32-bit U-Boot images, switch to use qemu-riscv32_smode_defconfig=
 and
> +riscv32_spl_defconfig builds, and replace ``qemu-system-riscv64`` with
> +``qemu-system-riscv32`` in the command lines above to boot the 32-bit U-=
Boot.
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index a5cc06b726..89a866e4f4 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -69,6 +69,7 @@ undocumented; you can get a complete list by running
>     riscv/microchip-icicle-kit
>     riscv/shakti-c
>     riscv/sifive_u
> +   riscv/virt
>
>  RISC-V CPU firmware
>  -------------------
> --
> 2.25.1
>
>

