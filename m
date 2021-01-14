Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzqFO-0005jw-PJ
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 19:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzqFM-0005gT-PJ; Wed, 13 Jan 2021 19:12:16 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzqFJ-00031b-6Z; Wed, 13 Jan 2021 19:12:16 -0500
Received: by mail-io1-xd29.google.com with SMTP id d13so4630211ioy.4;
 Wed, 13 Jan 2021 16:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N3EtAwbaXOt+g1P5K0BVKaF9n2T0VhQUpMVh4u5gIGU=;
 b=oz0TYZ9wRH35LyH7+TgPw3NIPtI1f6UeGXcNznYX9Szsy3BBT+YTwSNyO3n2MvIRYw
 KOV0QY3ZVzCnwKHFNmNXncYDQaZ1xnTNKS85Lu9ZpvOEqW0dqJcF3J5Y1GevfG4rdYeK
 4NfTasy36396V1VCJEqlgQTzeWctB5nTtC4BrjI7xrRtyFDn3c15HGtrdvnGhEjnucTS
 pH2P5NhAAOeiZNINug25ijN39G5QJ+YLzTXwgmdhH/+rk2BryvNOhiTdV6feidwn7DYe
 M//zIanSd86gRo6ZIgLs2OZqLLwUesI4S+K8LVwxNGXtZ6nIGff5Q6IHHEi0MX9Z49cW
 yyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N3EtAwbaXOt+g1P5K0BVKaF9n2T0VhQUpMVh4u5gIGU=;
 b=Y0bJcO/xq+/Ag4ISEpWjaMm/1SHTe4XL28M5eTLJvjIbKP2gEvhwwfIauteL+SXBhy
 upiS0jUKuCgKAFOe9yK/RYw/+w5hYodfb+MJ7YdB5O1+JSlwtOYEuUHbergQwhH5mac7
 GO6lOINywQzb3U0h1l+MOQfG7vEMkUcqHOlsMFNKkXpTVhU3DDphwyaX2cUz4ymJMy0p
 Q079x5y/vW9U4M9uYUcs7gGeVezMST2Q83zIxKKtaSnrKXAuQ1wgnDRM+i71DAeOFOFN
 Mqr9JeWq0akPOlDAvfpJSzy/ttwaljro17CUBIWjCC+tcNsIc1NoI0+qOk/V0d7lojkT
 M98g==
X-Gm-Message-State: AOAM532KDkIiY4Z7d/ia/H6VlfCK3fqV+LsjNxzSOnW3sTwuw132tRUC
 IHrJ7FQ+K9DGD1DutTXuhdJmm2qmCbPa1I5Vs4N9JoD7AWo=
X-Google-Smtp-Source: ABdhPJzvREMD20DZ2EpDY6bFfNO9WrCpTcp0ZjqkPUoTL2OYnqxmzfMUfKfSvdhYUjgSBUECoZQUKXSUG5OnCiuM1m4=
X-Received: by 2002:a05:6638:83:: with SMTP id
 v3mr4403615jao.106.1610583131411; 
 Wed, 13 Jan 2021 16:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-23-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-23-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 16:11:45 -0800
Message-ID: <CAKmqyKMWJBBkXETCxzXeCN3sJeNRj4S-F5AcSbvRAszaK+rvRA@mail.gmail.com>
Subject: Re: [PATCH 22/22] docs/system: riscv: Add documentation for sifive_u
 machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 14 Jan 2021 00:12:17 -0000

On Thu, Dec 31, 2020 at 3:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds detailed documentation for RISC-V `sifive_u` machine,
> including the following information:
>
> - Supported devices
> - Hardware configuration information
> - Boot options
> - Machine-specific options
> - Running Linux kernel
> - Running VxWorks kernel
> - Running U-Boot, and with an alternate configuration
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  docs/system/riscv/sifive_u.rst | 336 +++++++++++++++++++++++++++++++++
>  docs/system/target-riscv.rst   |  10 +
>  2 files changed, 346 insertions(+)
>  create mode 100644 docs/system/riscv/sifive_u.rst
>
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.=
rst
> new file mode 100644
> index 0000000000..7e133d8ff3
> --- /dev/null
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -0,0 +1,336 @@
> +SiFive HiFive Unleashed (``sifive_u``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +SiFive HiFive Unleashed Development Board is the ultimate RISC=E2=80=91V=
 development
> +board featuring the Freedom U540 multi-core RISC=E2=80=91V processor.
> +
> +Supported devices
> +-----------------
> +
> +The ``sifive_u`` machine supports the following devices:
> +
> + * 1 E51 / E31 core
> + * Up to 4 U54 / U34 cores
> + * Core Level Interruptor (CLINT)
> + * Platform-Level Interrupt Controller (PLIC)
> + * Power, Reset, Clock, Interrupt (PRCI)
> + * L2 Loosely Integrated Memory (L2-LIM)
> + * DDR memory controller
> + * 2 UARTs
> + * 1 GEM ethernet controller
> + * 1 GPIO controller
> + * 1 One-Time Programmable (OTP) memory with stored serial number
> + * 1 DMA controller
> + * 2 QSPI controllers
> + * 1 ISSI 25WP256 flash
> + * 1 SD card in SPI mode
> +
> +Please note the real world HiFive Unleashed board has a fixed configurat=
ion of
> +1 E51 core and 4 U54 core combination and the RISC-V core boots in 64-bi=
t mode.
> +With QEMU, one can create a machine with 1 E51 core and up to 4 U54 core=
s. It
> +is also possible to create a 32-bit variant with the same peripherals ex=
ecpt
> +that the RISC-V cores are replaced by the 32-bit ones (E31 and U34), to =
help
> +testing of 32-bit guest software.
> +
> +Hardware configuration information
> +----------------------------------
> +
> +The ``sifive_u`` machine automatically generates a device tree blob ("dt=
b")
> +which it passes to the guest. This provides information about the addres=
ses,
> +interrupt lines and other configuration of the various devices in the sy=
stem.
> +Guest software should discover the devices that are present in the gener=
ated
> +DTB instead of using a DTB for the real hardware, as some of the devices=
 are
> +not modeled by QEMU and trying to access these devices may cause unexpec=
ted
> +behavior.
> +
> +Boot options
> +------------
> +
> +The ``sifive_u`` machine can start using the standard -kernel functional=
ity
> +for loading a Linux kernel, a VxWorks kernel, a modified U-Boot bootload=
er
> +(S-mode) or ELF executable with the default OpenSBI firmware image as th=
e
> +-bios. It also supports booting the unmodified U-Boot bootloader using t=
he
> +standard -bios functionality.
> +
> +Machine-specific options
> +------------------------
> +
> +The following machine-specific options are supported:
> +
> +- serial=3Dnnn
> +
> +  The board serial number. When not given, the default serial number 1 i=
s used.
> +
> +  SiFive reserves the first 1 KiB of the 16 KiB OTP memory for internal =
use.
> +  The current usage is only used to store the serial number of the board=
 at
> +  offset 0xfc. U-Boot reads the serial number from the OTP memory, and u=
ses
> +  it to generate a unique MAC address to be programmed to the on-chip GE=
M
> +  ethernet controller. When multiple QEMU ``sifive_u`` machines are crea=
ted
> +  and connected to the same subnet, they all have the same MAC address h=
ence
> +  it creates a unusable network. In such scenario, user should give diff=
erent
> +  values to serial=3D when creating different ``sifive_u`` machines.
> +
> +- start-in-flash
> +
> +  When given, QEMU's ROM codes jump to QSPI memory-mapped flash directly=
.
> +  Otherwise QEMU will jump to DRAM or L2LIM depending on the msel=3D val=
ue.
> +  When not given, it defaults to direct DRAM booting.
> +
> +- msel=3D[6|11]
> +
> +  Mode Select (MSEL[3:0]) pins value, used to control where to boot from=
.
> +
> +  The FU540 SoC supports booting from several sources, which are control=
led
> +  using the Mode Select pins on the chip. Typically, the boot process ru=
ns
> +  through several stages before it begins execution of user-provided pro=
grams.
> +  These stages typically include the following:
> +
> +  1. Zeroth Stage Boot Loader (ZSBL), which is contained in an on-chip m=
ask
> +     ROM and provided by QEMU. Note QEMU implemented ROM codes are not t=
he
> +     same as what is programmed in the hardware. The QEMU one is a simpl=
ified
> +     version, but it provides the same functionality as the hardware.
> +  2. First Stage Boot Loader (FSBL), which brings up PLLs and DDR memory=
.
> +     This is U-Boot SPL.
> +  3. Second Stage Boot Loader (SSBL), which further initializes addition=
al
> +     peripherals as needed. This is U-Boot proper combined with an OpenS=
BI
> +     fw_dynamic firmware image.
> +
> +  msel=3D6 means FSBL and SSBL are both on the QSPI flash. msel=3D11 mea=
ns FSBL
> +  and SSBL are both on the SD card.
> +
> +Running Linux kernel
> +--------------------
> +
> +Linux mainline v5.10 release is tested at the time of writing. To build =
a
> +Linux mainline kernel that can be booted by the ``sifive_u`` machine in
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
> +To boot the newly built Linux kernel in QEMU with the ``sifive_u`` machi=
ne:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M sifive_u -smp 5 -m 2G \
> +      -display none -serial stdio \
> +      -kernel arch/riscv/boot/Image \
> +      -initrd /path/to/rootfs.ext4 \
> +      -append "root=3D/dev/ram"
> +
> +To build a Linux mainline kernel that can be booted by the ``sifive_u`` =
machine
> +in 32-bit mode, use the rv32_defconfig configuration. A patch is require=
d to
> +fix the 32-bit boot issue for Linux kernel v5.10.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Driscv
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ curl https://patchwork.kernel.org/project/linux-riscv/patch/20201219=
001356.2887782-1-atish.patra@wdc.com/mbox/ > riscv.patch
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
> +Running VxWorks kernel
> +----------------------
> +
> +VxWorks 7 SR0650 release is tested at the time of writing. To build a 64=
-bit
> +VxWorks mainline kernel that can be booted by the ``sifive_u`` machine, =
simply
> +create a VxWorks source build project based on the sifive_generic BSP, a=
nd a
> +VxWorks image project to generate the bootable VxWorks image, by followi=
ng the
> +BSP documentation instructions.
> +
> +A pre-built 64-bit VxWorks 7 image for HiFive Unleashed board is availab=
le as
> +part of the VxWorks SDK for testing as well. Instructions to download th=
e SDK:
> +
> +.. code-block:: bash
> +
> +  $ wget https://labs.windriver.com/downloads/wrsdk-vxworks7-sifive-hifi=
ve-1.01.tar.bz2
> +  $ tar xvf wrsdk-vxworks7-sifive-hifive-1.01.tar.bz2
> +  $ ls bsps/sifive_generic_1_0_0_0/uboot/uVxWorks
> +
> +To boot the VxWorks kernel in QEMU with the ``sifive_u`` machine, use:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M sifive_u -smp 5 -m 2G \
> +      -display none -serial stdio \
> +      -nic tap,ifname=3Dtap0,script=3Dno,downscript=3Dno \
> +      -kernel /path/to/vxWorks \
> +      -append "gem(0,0)host:vxWorks h=3D192.168.200.1 e=3D192.168.200.2:=
ffffff00 u=3Dtarget pw=3DvxTarget f=3D0x01"
> +
> +It is also possible to test 32-bit VxWorks on the ``sifive_u`` machine. =
Create
> +a 32-bit project to build the 32-bit VxWorks image, and use exact the sa=
me
> +command line options with ``qemu-system-riscv32``.
> +
> +Running U-Boot
> +--------------
> +
> +U-Boot mainline v2020.10 release is tested at the time of writing. To bu=
ild a
> +U-Boot mainline bootloader that can be booted by the ``sifive_u`` machin=
e, use
> +the sifive_fu540_defconfig with similar commands as described above for =
Linux:
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ export OPENSBI=3D/path/to/opensbi-riscv64-generic-fw_dynamic.bin
> +  $ make sifive_fu540_defconfig
> +
> +You will get spl/u-boot-spl.bin and u-boot.itb file in the build tree.
> +
> +To start U-Boot using the ``sifive_u`` machine, prepare an SPI flash ima=
ge, or
> +SD card image that is properly partitioned and populated with correct co=
ntents.
> +genimage_ can be used to generate these images.
> +
> +A sample configuration file for a 128 MiB SD card image is:
> +
> +.. code-block:: bash
> +
> +  $ cat genimage_sdcard.cfg
> +  image sdcard.img {
> +          size =3D 128M
> +
> +          hdimage {
> +                  gpt =3D true
> +          }
> +
> +          partition u-boot-spl {
> +                  image =3D "u-boot-spl.bin"
> +                  offset =3D 17K
> +                  partition-type-uuid =3D 5B193300-FC78-40CD-8002-E86C45=
580B47
> +          }
> +
> +          partition u-boot {
> +                  image =3D "u-boot.itb"
> +                  offset =3D 1041K
> +                  partition-type-uuid =3D 2E54B353-1271-4842-806F-E436D6=
AF6985
> +          }
> +  }
> +
> +SPI flash image has slightly different partition offsets, and the size h=
as to
> +be 32 MiB to match the ISSI 25WP256 flash on the real board:
> +
> +.. code-block:: bash
> +
> +  $ cat genimage_spi-nor.cfg
> +  image spi-nor.img {
> +          size =3D 32M
> +
> +          hdimage {
> +                  gpt =3D true
> +          }
> +
> +          partition u-boot-spl {
> +                  image =3D "u-boot-spl.bin"
> +                  offset =3D 20K
> +                  partition-type-uuid =3D 5B193300-FC78-40CD-8002-E86C45=
580B47
> +          }
> +
> +          partition u-boot {
> +                  image =3D "u-boot.itb"
> +                  offset =3D 1044K
> +                  partition-type-uuid =3D 2E54B353-1271-4842-806F-E436D6=
AF6985
> +          }
> +  }
> +
> +Assume U-Boot binaries are put in the same directory as the config file,
> +we can generate the image by:
> +
> +.. code-block:: bash
> +
> +  $ genimage --config genimage_<boot_src>.cfg --inputpath .
> +
> +Boot U-Boot from SD card, by specifying msel=3D11 and pass the SD card i=
mage
> +to QEMU ``sifive_u`` machine:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M sifive_u,msel=3D11 -smp 5 -m 8G \
> +      -display none -serial stdio \
> +      -bios /path/to/u-boot-spl.bin \
> +      -drive file=3D/path/to/sdcard.img,if=3Dsd
> +
> +Changing msel=3D value to 6, allows booting U-Boot from the SPI flash:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M sifive_u,msel=3D6 -smp 5 -m 8G \
> +      -display none -serial stdio \
> +      -bios /path/to/u-boot-spl.bin \
> +      -drive file=3D/path/to/spi-nor.img,if=3Dmtd
> +
> +Note when testing U-Boot, QEMU automatically generated device tree blob =
is
> +not used because U-Boot itself embeds device tree blobs for U-Boot SPL a=
nd
> +U-Boot proper. Hence the number of cores and size of memory have to matc=
h
> +the real hardware, ie: 5 cores (-smp 5) and 8 GiB memory (-m 8G).
> +
> +Above use case is to run upstream U-Boot for the SiFive HiFive Unleashed
> +board on QEMU ``sifive_u`` machine out of the box. This allows users to
> +develop and test the recommended RISC-V boot flow with a real world use
> +case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM=
,
> +then U-Boot SPL loads the combined payload image of OpenSBI fw_dynamic
> +firmware and U-Boot proper. However sometimes we want to have a quick te=
st
> +of booting U-Boot on QEMU without the needs of preparing the SPI flash o=
r
> +SD card images, an alternate way can be used, which is to create a U-Boo=
t
> +S-mode image by modifying the configuration of U-Boot:
> +
> +.. code-block:: bash
> +
> +  $ make menuconfig
> +
> +then manually select the following configuration in U-Boot:
> +
> +  Device Tree Control > Provider of DTB for DT Control > Prior Stage boo=
tloader DTB
> +
> +This lets U-Boot to use the QEMU generated device tree blob. During the =
build,
> +a build error will be seen below:
> +
> +.. code-block:: none
> +
> +  MKIMAGE u-boot.img
> +  ./tools/mkimage: Can't open arch/riscv/dts/hifive-unleashed-a00.dtb: N=
o such file or directory
> +  ./tools/mkimage: failed to build FIT
> +  make: *** [Makefile:1440: u-boot.img] Error 1
> +
> +The above errors can be safely ignored as we don't run U-Boot SPL under =
QEMU
> +in this alternate configuration.
> +
> +Boot the 64-bit U-Boot S-mode image directly:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M sifive_u -smp 5 -m 2G \
> +      -display none -serial stdio \
> +      -kernel /path/to/u-boot.bin
> +
> +It's possible to create a 32-bit U-Boot S-mode image as well.
> +
> +.. code-block:: bash
> +
> +  $ export CROSS_COMPILE=3Driscv64-linux-
> +  $ make sifive_fu540_defconfig
> +  $ make menuconfig
> +
> +then manually update the following configuration in U-Boot:
> +
> +  Device Tree Control > Provider of DTB for DT Control > Prior Stage boo=
tloader DTB
> +  RISC-V architecure > Base ISA > RV32I
> +  Boot images > Text Base > 0x80400000
> +
> +Use the same command line options to boot the 32-bit U-Boot S-mode image=
:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv32 -M sifive_u -smp 5 -m 2G \
> +      -display none -serial stdio \
> +      -kernel /path/to/u-boot.bin
> +
> +.. _genimage: https://github.com/pengutronix/genimage
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 978b96cbdb..c1819580bb 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -58,5 +58,15 @@ undocumented; you can get a complete list by running
>  ``qemu-system-riscv64 --machine help``, or
>  ``qemu-system-riscv32 --machine help``.
>
> +..
> +   This table of contents should be kept sorted alphabetically
> +   by the title text of each file, which isn't the same ordering
> +   as an alphabetical sort by filename.
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   riscv/sifive_u
> +
>  RISC-V CPU features
>  -------------------
> --
> 2.25.1
>
>

