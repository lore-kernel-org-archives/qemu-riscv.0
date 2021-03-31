Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd5H-0003PA-RA
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd5G-0003Mg-EQ; Wed, 31 Mar 2021 11:48:42 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd5E-0003gN-HB; Wed, 31 Mar 2021 11:48:42 -0400
Received: by mail-il1-x12d.google.com with SMTP id t6so17528925ilp.11;
 Wed, 31 Mar 2021 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KjZ0G05Gm4AVtoqHU3z2Jec0h5+ZhUFbB2yXo7AJ+WU=;
 b=Nk26JDwGgDIthuZZLdjcrS2DHIX9RzyEqI2kbmz0kJGgv6DVB99Pp0EqcqLt5YISVB
 IKKuhMmKcEwQVGbt8YbvVfsNySw41ww7mW8cH/zJJzX+da/Bq6Nz45/BvH680rP7kdFj
 aID0N6TZ70KtkL8mw2JYM9V/T40nuq31rpai2sa/HM4Wh7THdtWF/tWuKVgn0AwAHcjV
 xD3XQGcBX7FuOF4LoD/ZACrcN/gMUBlUCfWjvfrLRPSk93GR5x1N9V2csFRIFjqrCwcD
 LWR2EbSyfzAWUSX+Ad3FlQrLWdYhqgsM1ETI13iHIHD5GBJu6DtiEXQ7xV+y/LRsG1Wh
 N0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KjZ0G05Gm4AVtoqHU3z2Jec0h5+ZhUFbB2yXo7AJ+WU=;
 b=mJ1IjZ68+Cy89jJtqxS51M5Lx/7MXMyKRkk6O3M3cXw83oewjrOw2Iqx5gcUJPRyA8
 AvGSK2HVw7SQdU2Zpsfa1hHx1XlOuVMWWqJTvyCY/B5g2IIPETri3oZmd314Xq0TSJBM
 /RmdJYClY8eD15AdsqR1P4eSUoEC1jmyYOPe4MFXvQuEd/lS+xPUscubc+c5rMbQllWN
 iy6NgJF3icrhEtsV7Lnc+wcUYlz81pfT1iDdaZ3bYsejFxPwXkRa5JpAAgYzf4VlbB6P
 dGTMcBHNViwRow78JrVfGUOmRcA2GIdRX4VxwUmdPgY4TVkSyeyBOK4CP3erzkA6F7XM
 7zZA==
X-Gm-Message-State: AOAM530rTpx1UjdgRS8ZiEi5+uMRYa0GT1XNCmQAppDciEvP6UL3ivcB
 FFnB4r0bUGIY0q407K3P6KmdXFgMUBpvuzzJhn8=
X-Google-Smtp-Source: ABdhPJxhXVxdrTN0Z8RPECWLT4bXIL8/LbVrCHXcJwUEXOGR9FyoDbZHLfumpQabkHQMB+dIpJx5AHZT9pFj2jXg3fo=
X-Received: by 2002:a05:6e02:1989:: with SMTP id
 g9mr3053038ilf.40.1617205718755; 
 Wed, 31 Mar 2021 08:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-6-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-6-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:46:28 -0400
Message-ID: <CAKmqyKNKzWKxn0gaKQcg=uGTDw5JTzexMzrwciUYMMEc_pRLug@mail.gmail.com>
Subject: Re: [PATCH 6/8] docs/system/riscv: sifive_u: Document '-dtb' usage
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 31 Mar 2021 15:48:42 -0000

On Mon, Mar 29, 2021 at 1:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Update the 'sifive_u' machine documentation to mention the '-dtb'
> option that can be used to pass a custom DTB to QEMU.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/riscv/sifive_u.rst | 47 +++++++++++++++++++++++++++++-----
>  1 file changed, 41 insertions(+), 6 deletions(-)
>
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.=
rst
> index dcdfbda931..32d0a1b85d 100644
> --- a/docs/system/riscv/sifive_u.rst
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -36,12 +36,21 @@ Hardware configuration information
>  ----------------------------------
>
>  The ``sifive_u`` machine automatically generates a device tree blob ("dt=
b")
> -which it passes to the guest. This provides information about the addres=
ses,
> -interrupt lines and other configuration of the various devices in the sy=
stem.
> -Guest software should discover the devices that are present in the gener=
ated
> -DTB instead of using a DTB for the real hardware, as some of the devices=
 are
> -not modeled by QEMU and trying to access these devices may cause unexpec=
ted
> -behavior.
> +which it passes to the guest, if there is no ``-dtb`` option. This provi=
des
> +information about the addresses, interrupt lines and other configuration=
 of
> +the various devices in the system. Guest software should discover the de=
vices
> +that are present in the generated DTB instead of using a DTB for the rea=
l
> +hardware, as some of the devices are not modeled by QEMU and trying to a=
ccess
> +these devices may cause unexpected behavior.
> +
> +If users want to provide their own DTB, they can use the ``-dtb`` option=
.
> +These DTBs should have the following requirements:
> +
> +* The /cpus node should contain at least one subnode for E51 and the num=
ber
> +  of subnodes should match QEMU's ``-smp`` option
> +* The /memory reg size should match QEMU=E2=80=99s selected ram_size via=
 ``-m``
> +* Should contain a node for the CLINT device with a compatible string
> +  "riscv,clint0" if using with OpenSBI BIOS images
>
>  Boot options
>  ------------
> @@ -122,6 +131,32 @@ To boot the newly built Linux kernel in QEMU with th=
e ``sifive_u`` machine:
>        -initrd /path/to/rootfs.ext4 \
>        -append "root=3D/dev/ram"
>
> +Alternatively, we can use a custom DTB to boot the machine by inserting =
a CLINT
> +node in fu540-c000.dtsi in the Linux kernel,
> +
> +.. code-block:: none
> +
> +    clint: clint@2000000 {
> +        compatible =3D "riscv,clint0";
> +        interrupts-extended =3D <&cpu0_intc 3 &cpu0_intc 7
> +                               &cpu1_intc 3 &cpu1_intc 7
> +                               &cpu2_intc 3 &cpu2_intc 7
> +                               &cpu3_intc 3 &cpu3_intc 7
> +                               &cpu4_intc 3 &cpu4_intc 7>;
> +        reg =3D <0x00 0x2000000 0x00 0x10000>;
> +    };
> +
> +with the following command line options:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M sifive_u -smp 5 -m 8G \
> +      -display none -serial stdio \
> +      -kernel arch/riscv/boot/Image \
> +      -dtb arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb \
> +      -initrd /path/to/rootfs.ext4 \
> +      -append "root=3D/dev/ram"
> +
>  To build a Linux mainline kernel that can be booted by the ``sifive_u`` =
machine
>  in 32-bit mode, use the rv32_defconfig configuration. A patch is require=
d to
>  fix the 32-bit boot issue for Linux kernel v5.10.
> --
> 2.25.1
>
>

