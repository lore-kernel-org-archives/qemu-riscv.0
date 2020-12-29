Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ku6xE-0003xy-Np
	for mharc-qemu-riscv@gnu.org; Mon, 28 Dec 2020 23:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ku6xD-0003xZ-IL; Mon, 28 Dec 2020 23:49:51 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ku6xB-0008Mv-5g; Mon, 28 Dec 2020 23:49:51 -0500
Received: by mail-yb1-xb36.google.com with SMTP id y4so11437225ybn.3;
 Mon, 28 Dec 2020 20:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=whOtzGTkvT0PoVOtFu3YnXtOwNVxoLUQcPpKWlFVaoE=;
 b=pHVOAeQ4Jjdhf2KxKu+70yLRZf8HwOTb43tJnsCAsh3YRrxVkEJnzzx717h9Qp/382
 gRP/zIVmD7Rx5mB4G41GS0TqPf+Fxr5QOjP2TXP9hoJnw94cGq7mCgzH2YwdmDY6oElk
 AfAqwK18ti52vQwIy0ZlGvzFKmwZ9wTkw50c+Kyl/apaSQWv6ebFhIYqeDzReNZFBHgY
 W3FlW0/DsahYw0KlkBRk85RidgnghDsEuqhEYfalIU3svTEPs0BxElz5ZPPaJyCqcmdR
 0DUyc5S+e8dJnWrkhNNK4tPYtElXJqZJeKDVUbxWENzaNHSFpFJeDPD7oTh2OS59vL/U
 nhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whOtzGTkvT0PoVOtFu3YnXtOwNVxoLUQcPpKWlFVaoE=;
 b=p6LtleQYAGkjzlc4jieDsXE8jpsiRJNmXtjWUSZsrXugVPHrP02El38vy7bJ9TpbXe
 Lup7S9bOjvJ/0m6abc7ATzGH8CD/HrdsJU9uVA3bZXMKyMicTjUZhYlVlwhe//FtHfHz
 zpIgyC9XSTAcJbC/feEtZ0rWFROXgC5S10KKFmlTXC6gjd6nnYK6L0ZNY4SUfDRnpT2m
 LvdP9OlZNFuOR8Vi3FpPQnMlma4lYOM2G04EgNllAH5XkVnipY2KMNyfT0BmwgrVIyzg
 X+tfuGBhM2ub06n9t0W2YTTsK8+QJBX7FfNBtc7zXGG4TZIIay6cDIAgpe5gikUQy0DK
 7Q3A==
X-Gm-Message-State: AOAM532cO7eabA+F/xPtNqJCUJkvthztroaLiqNDj9H02WT2XDycnQBO
 2dyW7GFfyDZB105OXVFTdQXgc0YhgHmI3wQmE7I=
X-Google-Smtp-Source: ABdhPJx4Tnsa4gzlrbQ94xMfCX06r6wE5xC3ug9HWiZndkLS7nNYD71ddG0JZeaiub9j7rLt0sTmSScSs4M7ikfn4gI=
X-Received: by 2002:a25:690b:: with SMTP id e11mr66014201ybc.314.1609217387663; 
 Mon, 28 Dec 2020 20:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
 <4f09804c0e35a45fcf3fa78b3f3ed55276d6e10f.camel@wdc.com>
 <CAEUhbmX16h5S5Y0kFsnDv6t2cnn6we-b-9U_cbnEQkrrckYy0w@mail.gmail.com>
 <67cbbde886c3ae6e57e837e79f466f4156a910f8.camel@wdc.com>
 <CAEUhbmVEAxf3OCp=89MCx7qQiN0wKd3QM4k8t20r9Sbq+JA_-w@mail.gmail.com>
 <df986ea726abea58fedd1a870095378456823d2a.camel@wdc.com>
 <CAEUhbmUK95YJ74_AJQ8wu9oBM6mDky2n5=pGR_UQE0AB4eXYtQ@mail.gmail.com>
 <a33a44ff4ec9f16a5ff7649e2d8ed9d87c6bed64.camel@wdc.com>
 <CAEUhbmXCyrAZzVzvSMSf+FOt5g-jHpk2X6j=00rQNmJKYoXSAA@mail.gmail.com>
In-Reply-To: <CAEUhbmXCyrAZzVzvSMSf+FOt5g-jHpk2X6j=00rQNmJKYoXSAA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 29 Dec 2020 12:49:35 +0800
Message-ID: <CAEUhbmWB6RMX8L2YzYYBhFKuKUgFVx2s2jTER1QEAW6j_VsqKQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, 
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 29 Dec 2020 04:49:51 -0000

Hi Atish,

On Wed, Dec 23, 2020 at 9:20 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Atish,
>
> On Wed, Dec 23, 2020 at 3:59 AM Atish Patra <Atish.Patra@wdc.com> wrote:
> >
> > On Tue, 2020-12-22 at 13:35 +0800, Bin Meng wrote:
> > > Hi Atish,
> > >
> > > On Sat, Dec 19, 2020 at 3:46 AM Atish Patra <Atish.Patra@wdc.com>
> > > wrote:
> > > >
> > > > On Fri, 2020-12-18 at 16:42 +0800, Bin Meng wrote:
> > > > > Hi Atish,
> > > > >
> > > > > On Fri, Dec 18, 2020 at 4:00 PM Atish Patra <Atish.Patra@wdc.com>
> > > > > wrote:
> > > > > >
> > > > > > On Fri, 2020-12-18 at 15:33 +0800, Bin Meng wrote:
> > > > > > > Hi Atish,
> > > > > > >
> > > > > > > On Fri, Dec 18, 2020 at 3:27 PM Atish Patra <
> > > > > > > Atish.Patra@wdc.com>
> > > > > > > wrote:
> > > > > > > >
> > > > > > > > On Fri, 2020-12-18 at 15:21 +0800, Bin Meng wrote:
> > > > > > > > > Hi Atish,
> > > > > > > > >
> > > > > > > > > On Fri, Dec 18, 2020 at 5:48 AM Atish Patra
> > > > > > > > > <atish.patra@wdc.com>
> > > > > > > > > wrote:
> > > > > > > > > >
> > > > > > > > > > Currently, we place the DTB at 2MB from 4GB or end of
> > > > > > > > > > DRAM
> > > > > > > > > > which
> > > > > > > > > > ever is
> > > > > > > > > > lesser. However, Linux kernel can address only 1GB of
> > > > > > > > > > memory
> > > > > > > > > > for
> > > > > > > > > > RV32.
> > > > > > > > > > Thus, it can not map anything beyond 3GB (assuming 2GB
> > > > > > > > > > is
> > > > > > > > > > the
> > > > > > > > > > starting address).
> > > > > > > > > > As a result, it can not process DT and panic if opensbi
> > > > > > > > > > dynamic
> > > > > > > > > > firmware
> > > > > > > > > > is used.
> > > > > > > > > >
> > > > > > > > > > Fix this by placing the DTB at 2MB from 3GB or end of
> > > > > > > > > > DRAM
> > > > > > > > > > whichever is lower.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > > > > > > ---
> > > > > > > > > >  hw/riscv/boot.c | 4 ++--
> > > > > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > With this patch, 32-bit sifive_u still does not boot
> > > > > > > > > kernel
> > > > > > > > > with
> > > > > > > > > the
> > > > > > > > > following patch applied on 5.10:
> > > > > > > > >
> > > > > > > > > https://patchwork.kernel.org/project/linux-riscv/patch/20201217074855.1948743-1-atish.patra@wdc.com/
> > > > > > > > >
> > > > > > > > > Command I used:
> > > > > > > > > $ qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5
> > > > > > > > > -
> > > > > > > > > kernel
> > > > > > > > > arch/riscv/boot/Image
> > > > > > > > >
> > > > > > > > > 32-bit virt cannot boot the same kernel image with memory
> > > > > > > > > set
> > > > > > > > > to
> > > > > > > > > 2G
> > > > > > > > > either:
> > > > > > > > > $ qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -
> > > > > > > > > kernel
> > > > > > > > > arch/riscv/boot/Image
> > > > > > > > >
> > > > > > > >
> > > > > > > > Hi Bin,
> > > > > > > > As mentioned in the email on the linux mailing list, this
> > > > > > > > patch
> > > > > > > > only
> > > > > > > > solves 2GB problem. sifive_u problem is solved by
> > > > > > > > Alistair's
> > > > > > > > patch[1].
> > > > > > > >
> > > > > > > > He is planning to send the PR soon. The issue with sifive_u
> > > > > > > > boot
> > > > > > > > was it
> > > > > > > > was failing the 32 bit test earlier resulting a 2MB aligned
> > > > > > > > address
> > > > > > > > instead of 4MB.
> > > > > > >
> > > > > > > Ah, I see. However my testing shows that virt with 2G still
> > > > > > > does
> > > > > > > not
> > > > > > > boot with this patch.
> > > > > > >
> > > > > >
> > > > > > Strange. I verified again with following combination with -bios
> > > > > > and
> > > > > > without bios parameter.
> > > > > >
> > > > > > 1. virt 32/64 with 1GB/2GB memory
> > > > > > 2. sifive_u 32/64 bit with 1GB/2GB memory (Alistair's patch
> > > > > > included)
> > > > > >
> > > > > > Can you share the boot log along with the head commit of Qemu
> > > > > > and
> > > > > > commandline ? I am using 5.10 kernel with my kernel fix.
> > > > > >
> > > > >
> > > > > I was using Alistair's QEMU repo for testing and 5.10 kernel with
> > > > > your
> > > > > kernel fix:
> > > > >
> > > > > $ git checkout -b testing pull-riscv-to-apply-20201217-1
> > > > > $ apply this patch
> > > > > $ mkdir build;cd build;../configure
> > > > > --target-list=riscv64-softmmu,riscv32-softmmu;make -j
> > > > >
> > > > > $ ./qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
> > > > > ~/work/git/linux/arch/riscv/boot/Image
> > > > >
> > > > > OpenSBI v0.8
> > > > >    ____                    _____ ____ _____
> > > > >   / __ \                  / ____|  _ \_   _|
> > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > >   \____/| .__/ \___|_| |_|_____/|____/_____|
> > > > >         | |
> > > > >         |_|
> > > > >
> > > > > Platform Name       : riscv-virtio,qemu
> > > > > Platform Features   : timer,mfdeleg
> > > > > Platform HART Count : 4
> > > > > Boot HART ID        : 3
> > > > > Boot HART ISA       : rv32imafdcsu
> > > > > BOOT HART Features  : pmp,scounteren,mcounteren,time
> > > > > BOOT HART PMP Count : 16
> > > > > Firmware Base       : 0x80000000
> > > > > Firmware Size       : 104 KB
> > > > > Runtime SBI Version : 0.2
> > > > >
> > > > > MIDELEG : 0x00000222
> > > > > MEDELEG : 0x0000b109
> > > > > PMP0    : 0x80000000-0x8001ffff (A)
> > > > > PMP1    : 0x00000000-0xffffffff (A,R,W,X)
> > > > > <hangs here>
> > > > >
> > > > > $ ./qemu-system-riscv32 -nographic -M sifive_u -m 2G -smp 5 -
> > > > > kernel
> > > > > ~/work/git/linux/arch/riscv/boot/Image
> > > > >
> > > > > OpenSBI v0.8
> > > > >    ____                    _____ ____ _____
> > > > >   / __ \                  / ____|  _ \_   _|
> > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > >   \____/| .__/ \___|_| |_|_____/|____/_____|
> > > > >         | |
> > > > >         |_|
> > > > >
> > > > > Platform Name       : SiFive HiFive Unleashed A00
> > > > > Platform Features   : timer,mfdeleg
> > > > > Platform HART Count : 5
> > > > > Boot HART ID        : 4
> > > > > Boot HART ISA       : rv32imafdcsu
> > > > > BOOT HART Features  : pmp,scounteren,mcounteren
> > > > > BOOT HART PMP Count : 16
> > > > > Firmware Base       : 0x80000000
> > > > > Firmware Size       : 112 KB
> > > > > Runtime SBI Version : 0.2
> > > > >
> > > > > MIDELEG : 0x00000222
> > > > > MEDELEG : 0x0000b109
> > > > > PMP0    : 0x80000000-0x8001ffff (A)
> > > > > PMP1    : 0x00000000-0xffffffff (A,R,W,X)
> > > > > <hangs here>
> > > > >
> > > > > The following is sifive_u with 1G:
> > > > >
> > > > > $ ./qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -
> > > > > kernel
> > > > > ~/work/git/linux/arch/riscv/boot/Image
> > > > >
> > > > > OpenSBI v0.8
> > > > >    ____                    _____ ____ _____
> > > > >   / __ \                  / ____|  _ \_   _|
> > > > >  | |  | |_ __   ___ _ __ | (___ | |_) || |
> > > > >  | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > > > >  | |__| | |_) |  __/ | | |____) | |_) || |_
> > > > >   \____/| .__/ \___|_| |_|_____/|____/_____|
> > > > >         | |
> > > > >         |_|
> > > > >
> > > > > Platform Name       : SiFive HiFive Unleashed A00
> > > > > Platform Features   : timer,mfdeleg
> > > > > Platform HART Count : 5
> > > > > Boot HART ID        : 3
> > > > > Boot HART ISA       : rv32imafdcsu
> > > > > BOOT HART Features  : pmp,scounteren,mcounteren
> > > > > BOOT HART PMP Count : 16
> > > > > Firmware Base       : 0x80000000
> > > > > Firmware Size       : 112 KB
> > > > > Runtime SBI Version : 0.2
> > > > >
> > > > > MIDELEG : 0x00000222
> > > > > MEDELEG : 0x0000b109
> > > > > PMP0    : 0x80000000-0x8001ffff (A)
> > > > > PMP1    : 0x00000000-0xffffffff (A,R,W,X)
> > > > > [    0.000000] Linux version 5.10.0-00001-gbf0dad61896d
> > > > > (bmeng@pek-vx-bsp2) (riscv64-linux-gcc (GCC) 8.1.0, GNU ld (GNU
> > > > > Binutils) 2.30) #1 SMP Thu Dec 17 16:48:13 CST 2020
> > > > > [    0.000000] OF: fdt: Ignoring memory range 0x80000000 -
> > > > > 0x80400000
> > > > > [    0.000000] efi: UEFI not found.
> > > > > [    0.000000] Zone ranges:
> > > > > [    0.000000]   Normal   [mem 0x0000000080400000-
> > > > > 0x00000000bfffffff]
> > > > > [    0.000000] Movable zone start for each node
> > > > > [    0.000000] Early memory node ranges
> > > > > [    0.000000]   node   0: [mem 0x0000000080400000-
> > > > > 0x00000000bfffffff]
> > > > > [    0.000000] Initmem setup node 0 [mem 0x0000000080400000-
> > > > > 0x00000000bfffffff]
> > > > > [    0.000000] SBI specification v0.2 detected
> > > > > [    0.000000] SBI implementation ID=0x1 Version=0x8
> > > > > [    0.000000] SBI v0.2 TIME extension detected
> > > > > [    0.000000] SBI v0.2 IPI extension detected
> > > > > [    0.000000] SBI v0.2 RFENCE extension detected
> > > > > [    0.000000] SBI v0.2 HSM extension detected
> > > > > [    0.000000] CPU with hartid=0 is not available
> > > > > [    0.000000] CPU with hartid=0 is not available
> > > > >
> > > > > Regards,
> > > > > Bin
> > > >
> > > > May be you forgot to apply this patch for 2GB case on top of
> > > > Alistair's
> > > > tree? I don't see any issues with exact same setup.
> > >
> > > That's really weird. I have:
> > >
> > > $ git log --oneline
> > > 3ced2fb RISC-V: Place DTB at 3GB boundary instead of 4GB
> > > d31e970 riscv/opentitan: Update the OpenTitan memory layout
> > > 3ed2b8a hw/riscv: Use the CPU to determine if 32-bit
> > > 094b072 target/riscv: cpu: Set XLEN independently from target
> > > 8987cdc4 target/riscv: csr: Remove compile time XLEN checks
> > >
> > > I just rebuilt the QEMU binaries but still have the same result. 2G
> > > does not boot on either 'virt' or 'sifive_u'.
> > >
> > > $ ./qemu-system-riscv32 -version
> > > QEMU emulator version 5.2.50 (v5.2.0-551-g3ced2fb)
> > > Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project
> > > developers
> > >
> > > Maybe it's toolchain related? I am using kernel.org toolchain
> > > riscv64-linux-gcc (GCC) 8.1.0. I see you were using
> > > riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0.
> > >
> >
> > Strange. If it is a toolchain related issue, the cause might be
> > completely different. Can you give it a try to with updated toolchain ?
> > The pre-built toolchain available in bootlin[1] is 10.2.0.
> >
> > [1] https://toolchains.bootlin.com/
>
> I will give it a try.

I used the bootlin pre-built 10.2.0 toolchain to build the Linux
kernel. Still, 2GB does not boot on QEMU.

I looked at your kernel log again, and found:

[    0.000000] Linux version 5.10.0-00022-ge20097fb37e2-dirty

It seems you have 22 commits on top of 5.10.

I only have one commit "RISC-V: Fix usage of
memblock_enforce_memory_limit" on top of 5.10.

Could you please check?

>
> >
> > Can I download pre-built gcc 8.1.0 toolchain from somewhere ?
>
> Yes, you can download it from
> http://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/x86_64-gcc-8.1.0-nolibc-riscv64-linux.tar.xz

Regards,
Bin

