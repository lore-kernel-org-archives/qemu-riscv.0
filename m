Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0HHX-0006eF-0O
	for mharc-qemu-riscv@gnu.org; Mon, 05 Jul 2021 01:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m0HHR-0006do-VM; Mon, 05 Jul 2021 01:36:31 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m0HHP-0000Fx-Iq; Mon, 05 Jul 2021 01:36:29 -0400
Received: by mail-il1-x12c.google.com with SMTP id t12so16195150ile.13;
 Sun, 04 Jul 2021 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0WRLPW9OlnKk48Mg/eRlCKvx2VfARMTH+fUc6vhDzLc=;
 b=VeaO3GuESLf0gxZ6V1hTZK8fJS2QtCGlgPU4SbcGBMDuhJtRl9th89nAIEqVvcChBf
 LFimRscdIZPyCyJn1/bWT2k/LkClB0c6wB8Kjncpu9PTEI6N60WhE6peIDDVhRkmsZ7P
 pl1yQhWcg6cZb2EyIUj+TTua/XtcjuP+qDk2NJpo9mFBgsUuoYGjCf3VgemKPnCt/ZVA
 x9C3B1ozNQltUea/MzBk8m6ybtRotvWFYxYcDXIPh/IYPFmeK7zH1HtaKPmQbmkzCshB
 Pb0QWQ4ol2LaTPL6WPhRnhZ6wkWGEcoL8NboVwMyn6bVDHNHUipUF7aqUQFf0UVCAaxX
 semQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0WRLPW9OlnKk48Mg/eRlCKvx2VfARMTH+fUc6vhDzLc=;
 b=SuqxtPzpNdE29ICiE1Iq+5tY+D7d35/b+ytLWUusCTro1gRcSQo2DiKguCTIDvZw/Y
 O/qVwoCdG152LYK+M2WoEJ/+Q0XzwYnp12p9QG6B/eyLyb4WFh9h6sFe/07Ul0YOfA8n
 PMGV9pSuWj5WFUu9RnLowM6dIkExWpB4cJviVl+qRNlMKWa02u49+XyqX/JZj5g2c7U0
 aAdY+NzsnXFqh5V6M0/s6PsRil2zj2yWIl8xHkY+CNhNLHT1l/G69JOKn8Aqi1GGe4Ju
 kUgnRUhyc39aND1Fx7Xds2B0ru55GIeXqJ5Cuv3hqyY2dVcKVt9ZFONewJRqDI83eSzi
 Te6g==
X-Gm-Message-State: AOAM531Hg5dkvgoH/TMVmCd/jDsrWxbX7uAAmKKTFubJ9ulOeBb3E7WR
 jqu/OltFJuR1aWe4TyUToinYqOnreDpXV5zplps=
X-Google-Smtp-Source: ABdhPJxy0YWaby9OrH6c9kJV4/iK7WKKzF41k5IloSa2dq2xFgvXFhtxYiWBv/EuuxllYCdBgfY6h/9wK8OjmMw1h2w=
X-Received: by 2002:a92:c886:: with SMTP id w6mr9428473ilo.227.1625463385078; 
 Sun, 04 Jul 2021 22:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210627142816.19789-1-bmeng.cn@gmail.com>
 <20210627142816.19789-2-bmeng.cn@gmail.com>
In-Reply-To: <20210627142816.19789-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Jul 2021 15:35:58 +1000
Message-ID: <CAKmqyKMN3Uf0A-6K8DaSSbVZZL46dYyWy_d-MNEBJyo5eza=7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system: riscv: Add documentation for virt machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 05 Jul 2021 05:36:32 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

