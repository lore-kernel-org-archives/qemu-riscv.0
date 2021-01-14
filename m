Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzqF6-0005Sc-Vw
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 19:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzqF4-0005QN-2j; Wed, 13 Jan 2021 19:11:58 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzqEw-0002v3-09; Wed, 13 Jan 2021 19:11:56 -0500
Received: by mail-io1-xd2d.google.com with SMTP id u17so7901264iow.1;
 Wed, 13 Jan 2021 16:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Quo/wGgy0Hlr0o8k6geQHjdINtrK6j81LuhvTmruK7Y=;
 b=pi53E+tN4nkwjOeX2NtkbCjwmHrBCa1gCFc1jAw9RuhEJC/z1X60IwawbvV2xDlpY2
 n0aNZq62wtL8pIUJbZTNI1xYQ16KpteaYNVIzsJ3SGlm6x/WZId0rfqL0QRR5LnF/pvC
 V+8BKTay2sR4YPSvxLKN2giBOKlpTN5+byR2R18mOpWFw1NbaTfV4TOH29dmBND3QVsM
 CSo7vdmibJ5c4UEELFn8MPOOeIv1adod6n1NKBI/1eyOIcwNYfdmKnO1pHLaw/2s4SHi
 IDDTu7MIBJiVap53gsnE7p7uJTkOPDPd0B/20n+Az8vU6kVfR9TB2axGbmA0mYruC4EL
 X8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Quo/wGgy0Hlr0o8k6geQHjdINtrK6j81LuhvTmruK7Y=;
 b=TOmYv/pQwaXPt6mPsr/SWPxzXS1/P91g5Yq5wsZ1N23bMXQQMlqRgz/qLKpKxWT7zB
 h9oP8eM+74MzhtQG8pDnm/cIAqdv3lH2InM5HEADokt+jz3zrvhUVxQUjc+ypJewk7Ol
 zNNCshv8pzlv3Vp+zy3L3zEv8UcUQsY7d4aN02kQyuxHUWOtXhECQ+3WTz3IwkcXQ9x8
 XRTaXwEYyXUC2JhI36fvkqvUumaLHDvaHJVV68uY/IYgAFNWxxlG1guyamrZLPhShG+Y
 1YhOJwM+QdLGRwJxPxwDhYn9XcA1is6XwAbWRlSfw7PHa6vH2idi3PW60+2U2fDn1P1E
 mvww==
X-Gm-Message-State: AOAM532sJwcjYlqyLvls2OH5js7xExoIO/EmS+8yR6LzA1oOb+orYc6a
 CzrHaQ5Etwy3JLb3PPmDSh2X8tpma9rSW23XCi4=
X-Google-Smtp-Source: ABdhPJyqEtUZjb4xeEYtuU/hYtwXFt3C7sOo/6O/iGjOLsWivIPsW2JKD5KSoW+KrCFdVXYUChrvXUicb9cj2GesHdY=
X-Received: by 2002:a02:ca09:: with SMTP id i9mr4457826jak.135.1610583108165; 
 Wed, 13 Jan 2021 16:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-22-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-22-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 16:11:21 -0800
Message-ID: <CAKmqyKNJUqw=naKe=Twi0Oe53PtH9WbXH5bNonuPeg4qJrh0OA@mail.gmail.com>
Subject: Re: [PATCH 21/22] docs/system: Add RISC-V documentation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
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
X-List-Received-Date: Thu, 14 Jan 2021 00:11:59 -0000

On Thu, Dec 31, 2020 at 3:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Add RISC-V system emulator documentation for generic information.
> `Board-specific documentation` and `RISC-V CPU features` are only
> a placeholder and will be added in the future.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

This is great! Thanks!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/target-riscv.rst | 62 ++++++++++++++++++++++++++++++++++++
>  docs/system/targets.rst      |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 docs/system/target-riscv.rst
>
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> new file mode 100644
> index 0000000000..978b96cbdb
> --- /dev/null
> +++ b/docs/system/target-riscv.rst
> @@ -0,0 +1,62 @@
> +.. _RISC-V-System-emulator:
> +
> +RISC-V System emulator
> +======================
> +
> +QEMU can emulate both 32-bit and 64-bit RISC-V CPUs. Use the
> +``qemu-system-riscv64`` executable to simulate a 64-bit RISC-V machine,
> +``qemu-system-riscv32`` executable to simulate a 32-bit RISC-V machine.
> +
> +QEMU has generally good support for RISC-V guests. It has support for
> +several different machines. The reason we support so many is that
> +RISC-V hardware is much more widely varying than x86 hardware. RISC-V
> +CPUs are generally built into "system-on-chip" (SoC) designs created by
> +many different companies with different devices, and these SoCs are
> +then built into machines which can vary still further even if they use
> +the same SoC.
> +
> +For most boards the CPU type is fixed (matching what the hardware has),
> +so typically you don't need to specify the CPU type by hand, except for
> +special cases like the ``virt`` board.
> +
> +Choosing a board model
> +----------------------
> +
> +For QEMU's RISC-V system emulation, you must specify which board
> +model you want to use with the ``-M`` or ``--machine`` option;
> +there is no default.
> +
> +Because RISC-V systems differ so much and in fundamental ways, typically
> +operating system or firmware images intended to run on one machine
> +will not run at all on any other. This is often surprising for new
> +users who are used to the x86 world where every system looks like a
> +standard PC. (Once the kernel has booted, most userspace software
> +cares much less about the detail of the hardware.)
> +
> +If you already have a system image or a kernel that works on hardware
> +and you want to boot with QEMU, check whether QEMU lists that machine
> +in its ``-machine help`` output. If it is listed, then you can probably
> +use that board model. If it is not listed, then unfortunately your image
> +will almost certainly not boot on QEMU. (You might be able to
> +extract the filesystem and use that with a different kernel which
> +boots on a system that QEMU does emulate.)
> +
> +If you don't care about reproducing the idiosyncrasies of a particular
> +bit of hardware, such as small amount of RAM, no PCI or other hard
> +disk, etc., and just want to run Linux, the best option is to use the
> +``virt`` board. This is a platform which doesn't correspond to any
> +real hardware and is designed for use in virtual machines. You'll
> +need to compile Linux with a suitable configuration for running on
> +the ``virt`` board. ``virt`` supports PCI, virtio, recent CPUs and
> +large amounts of RAM. It also supports 64-bit CPUs.
> +
> +Board-specific documentation
> +----------------------------
> +
> +Unfortunately many of the RISC-V boards QEMU supports are currently
> +undocumented; you can get a complete list by running
> +``qemu-system-riscv64 --machine help``, or
> +``qemu-system-riscv32 --machine help``.
> +
> +RISC-V CPU features
> +-------------------
> diff --git a/docs/system/targets.rst b/docs/system/targets.rst
> index 564cea9a9b..75ed1087fd 100644
> --- a/docs/system/targets.rst
> +++ b/docs/system/targets.rst
> @@ -19,6 +19,7 @@ Contents:
>     target-m68k
>     target-mips
>     target-ppc
> +   target-riscv
>     target-rx
>     target-s390x
>     target-sparc
> --
> 2.25.1
>
>

