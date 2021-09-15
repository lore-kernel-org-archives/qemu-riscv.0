Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQIjy-00040d-8Y
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 20:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIjv-0003zM-Qk; Tue, 14 Sep 2021 20:25:27 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIju-0003Rr-0w; Tue, 14 Sep 2021 20:25:27 -0400
Received: by mail-il1-x12d.google.com with SMTP id w1so1059290ilv.1;
 Tue, 14 Sep 2021 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1RMyCOyzhLUo1c4kKPZmDH9KV/lf67WdLRwYqSKUSlg=;
 b=IX/dsTvMBDmePYYa9c8i2Fa0d0cRbCBFjPpjj5HrpxuUVW360+sqBk7TWIQpXa2Vc+
 SEpWPA9qi2yW1rXKXvHAV7mGC2okXt7k6ABhOURLvpLfajsMF/hRUGlFpaSMrs7MmjDA
 VaD/RvWRNWrpKXlWy5MagniiFw2ZIHufFsJ+XJ5bZPisOr3X5ybkzg1UAPoX9pNPTIgv
 m/dPqhqXxvxdxWA3s+l8O+nM2M4bDnBgbjvihTOMCfUPj0p1QtgYZE19XLaq+TVhwbk/
 YPtLV3ymUWi22xHLw81c4LVhC3nxC7Tr0sNYIku/DxD8dXyswOx8GeV7IEM4fjO6raEs
 3qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1RMyCOyzhLUo1c4kKPZmDH9KV/lf67WdLRwYqSKUSlg=;
 b=UFkok+u8rge3o0FbM6LyYn1mslL0YwcZV/5L0QNrMwn8UkZCkt6/tXdscQL9dOMhAU
 uOnVgonhMtNHLgxMXmalwTKc6gcUHhYnv/PlHlumkqskOB2T3xgbfeshxGAIyXsPspll
 V0EUkz/F9y2z2Ha8H+D2gAziHm4nxLi1vL5AqIdWuSevRaZq26A19+QzOc3IDVtnh0ML
 SfsBSQbvXpYEZIUyTk5w10FL4YPmmQ/n6KQEte8i5e3Yqosw3/qQEM2EjrO1buUzoQ9P
 tM1d7FWWybFqVFU4ER86y9aujebfRn6H/pnFqjmI3KmX0Hu0EaWJItRJC/I4INTZLoZJ
 rYIw==
X-Gm-Message-State: AOAM533efLW3CtvNKCv6U+GxUVLyqsU+ANxI+yaZUYDv7mbF9lM3QHef
 /ZttJ+VmqlbWo8AyZJwck4P/50bvHOat2ipdzAs=
X-Google-Smtp-Source: ABdhPJxHMl2o/IUmEGOtQPKNYsM5xVWLdnT5SvsLORzltH0rKFDqyPiFL8fNloByo5ReHmEuQlLo9ljIWb/YfHX8c40=
X-Received: by 2002:a05:6e02:1088:: with SMTP id
 r8mr11442132ilj.46.1631665524392; 
 Tue, 14 Sep 2021 17:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210911153431.10362-1-bmeng.cn@gmail.com>
In-Reply-To: <20210911153431.10362-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 10:24:58 +1000
Message-ID: <CAKmqyKNvJnS5EYUuZFz-mcxU6D3oz6kc5bfEZvm_2iBUx9EkLg@mail.gmail.com>
Subject: Re: [PATCH] docs/system/riscv: sifive_u: Update U-Boot instructions
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 00:25:28 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

