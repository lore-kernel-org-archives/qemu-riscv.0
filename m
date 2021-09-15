Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQIPi-0004sC-1E
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 20:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIPg-0004qf-W3; Tue, 14 Sep 2021 20:04:33 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIPe-00060x-Bv; Tue, 14 Sep 2021 20:04:32 -0400
Received: by mail-il1-x12a.google.com with SMTP id b8so943651ilh.12;
 Tue, 14 Sep 2021 17:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aihq2Puc6Afdkq+HnBIBlSLDZG4oCajEtsfUmQbjBbw=;
 b=XLGo8Wt6o581kztGK+9oPIZ3Jul6L31kPpS3zCLFtxCTm9R8GBDpm+ftC0BAiaoWfJ
 dNSB86ntvd2grATuF26S/o5NwzzrbcCqv/98E2gwG4ScPqD7rdlltYVQUI75yEq4+HPc
 s3FA8eZ07++/jj3HdPsharBIwiE8t+UfxIub5SoJImCmK66s0hZRINTVTg49J8N32tDD
 gaA3FPCtW5YfnDOwDjyMJxG0X8KjIOGONrNFkSXnVMpl1xrKAyS4zP564R3EO7E7yYW6
 MWU8msO1xWd7MBlGuBhKk3SFHwKff5KlDY8yTUsKn95xbxOIZTLhDx2Q6eyz0tXJIiNk
 p8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aihq2Puc6Afdkq+HnBIBlSLDZG4oCajEtsfUmQbjBbw=;
 b=L10mTX8rsxZ+DsxtdcYYfIoVDqdtRjUicmSRV10J73f/fv3ZGWWs4wISl8FFrTrhKt
 nuYS/20c99WTAm/eqDU04NP4sTIA/YNEDbWre+uJrw7XkS79Sh4SwUmRYeutRs77L7c8
 emL+NT8F6Uy3cRsdfcofupqhhiW4XyTN/E5dAEu+SfTqNxwZDqjcGWw48NKI+9rgEZCU
 kwKzlO6dDwNmYwZ5uvTHvkTYgDOO2fHGLH7l5i8fEkv71GzgVzayi3dGg86h7W0RJhzx
 oZnzOUWRkITsmil4tuKH7G7pGXU1WxGKR2f61+/IzsLKkOSGbkl19XVxYgujFs02Aywr
 s4lg==
X-Gm-Message-State: AOAM530MpwPOq1NdZHm4Dt9mKcSiWd4NRdnCYtpoE28YLR12o1SgQSGK
 JpGPSJyDOmYXy5m2APnHYze1lz//hGciqYrPbLo=
X-Google-Smtp-Source: ABdhPJzYy1YPseboyFi19S5SdpJy3ZLYW5A8ejX8MfFIRw0P6clIkfoo7xcmB8vHB3YKsUeEoPRCo8I06fURZIbEdG4=
X-Received: by 2002:a05:6e02:1088:: with SMTP id
 r8mr11385213ilj.46.1631664268768; 
 Tue, 14 Sep 2021 17:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210911153431.10362-1-bmeng.cn@gmail.com>
In-Reply-To: <20210911153431.10362-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 10:04:01 +1000
Message-ID: <CAKmqyKNUu_Mzwf4N9OxYOR0Bi9dVeBGFTNi3KrS6t+38UZnt_Q@mail.gmail.com>
Subject: Re: [PATCH] docs/system/riscv: sifive_u: Update U-Boot instructions
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 15 Sep 2021 00:04:33 -0000

On Sun, Sep 12, 2021 at 1:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> In U-Boot v2021.07 release, there were 2 major changes for the
> SiFive Unleashed board support:
>
> - Board config name was changed from sifive_fu540_defconfig to
>   sifive_unleashed_defconfig
> - The generic binman tool was used to generate the FIT image
>   (combination of U-Boot proper, DTB and OpenSBI firmware)
>
> which make the existing U-Boot instructions out of date.
>
> Update the doc with latest instructions.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/sifive_u.rst | 49 ++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 23 deletions(-)
>
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
> index 01108b5ecc..8ac93d0153 100644
> --- a/docs/system/riscv/sifive_u.rst
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -209,15 +209,16 @@ command line options with ``qemu-system-riscv32``.
>  Running U-Boot
>  --------------
>
> -U-Boot mainline v2021.01 release is tested at the time of writing. To build a
> +U-Boot mainline v2021.07 release is tested at the time of writing. To build a
>  U-Boot mainline bootloader that can be booted by the ``sifive_u`` machine, use
> -the sifive_fu540_defconfig with similar commands as described above for Linux:
> +the sifive_unleashed_defconfig with similar commands as described above for
> +Linux:
>
>  .. code-block:: bash
>
>    $ export CROSS_COMPILE=riscv64-linux-
>    $ export OPENSBI=/path/to/opensbi-riscv64-generic-fw_dynamic.bin
> -  $ make sifive_fu540_defconfig
> +  $ make sifive_unleashed_defconfig
>
>  You will get spl/u-boot-spl.bin and u-boot.itb file in the build tree.
>
> @@ -312,31 +313,29 @@ board on QEMU ``sifive_u`` machine out of the box. This allows users to
>  develop and test the recommended RISC-V boot flow with a real world use
>  case: ZSBL (in QEMU) loads U-Boot SPL from SD card or SPI flash to L2LIM,
>  then U-Boot SPL loads the combined payload image of OpenSBI fw_dynamic
> -firmware and U-Boot proper. However sometimes we want to have a quick test
> -of booting U-Boot on QEMU without the needs of preparing the SPI flash or
> -SD card images, an alternate way can be used, which is to create a U-Boot
> -S-mode image by modifying the configuration of U-Boot:
> +firmware and U-Boot proper.
> +
> +However sometimes we want to have a quick test of booting U-Boot on QEMU
> +without the needs of preparing the SPI flash or SD card images, an alternate
> +way can be used, which is to create a U-Boot S-mode image by modifying the
> +configuration of U-Boot:
>
>  .. code-block:: bash
>
> +  $ export CROSS_COMPILE=riscv64-linux-
> +  $ make sifive_unleashed_defconfig
>    $ make menuconfig
>
> -then manually select the following configuration in U-Boot:
> -
> -  Device Tree Control > Provider of DTB for DT Control > Prior Stage bootloader DTB
> +then manually select the following configuration:
>
> -This lets U-Boot to use the QEMU generated device tree blob. During the build,
> -a build error will be seen below:
> +  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior Stage bootloader DTB
>
> -.. code-block:: none
> +and unselect the following configuration:
>
> -  MKIMAGE u-boot.img
> -  ./tools/mkimage: Can't open arch/riscv/dts/hifive-unleashed-a00.dtb: No such file or directory
> -  ./tools/mkimage: failed to build FIT
> -  make: *** [Makefile:1440: u-boot.img] Error 1
> +  * Library routines ---> Allow access to binman information in the device tree
>
> -The above errors can be safely ignored as we don't run U-Boot SPL under QEMU
> -in this alternate configuration.
> +This changes U-Boot to use the QEMU generated device tree blob, and bypass
> +running the U-Boot SPL stage.
>
>  Boot the 64-bit U-Boot S-mode image directly:
>
> @@ -351,14 +350,18 @@ It's possible to create a 32-bit U-Boot S-mode image as well.
>  .. code-block:: bash
>
>    $ export CROSS_COMPILE=riscv64-linux-
> -  $ make sifive_fu540_defconfig
> +  $ make sifive_unleashed_defconfig
>    $ make menuconfig
>
>  then manually update the following configuration in U-Boot:
>
> -  Device Tree Control > Provider of DTB for DT Control > Prior Stage bootloader DTB
> -  RISC-V architecture > Base ISA > RV32I
> -  Boot images > Text Base > 0x80400000
> +  * Device Tree Control ---> Provider of DTB for DT Control ---> Prior Stage bootloader DTB
> +  * RISC-V architecture ---> Base ISA ---> RV32I
> +  * Boot options ---> Boot images ---> Text Base ---> 0x80400000
> +
> +and unselect the following configuration:
> +
> +  * Library routines ---> Allow access to binman information in the device tree
>
>  Use the same command line options to boot the 32-bit U-Boot S-mode image:
>
> --
> 2.25.1
>
>

