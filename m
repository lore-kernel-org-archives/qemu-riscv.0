Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqBLr-0008MJ-Ou
	for mharc-qemu-riscv@gnu.org; Fri, 18 Dec 2020 03:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqBLn-0008Kg-C6; Fri, 18 Dec 2020 03:42:59 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqBLi-0005ND-1i; Fri, 18 Dec 2020 03:42:58 -0500
Received: by mail-yb1-xb35.google.com with SMTP id a16so1265934ybh.5;
 Fri, 18 Dec 2020 00:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/m1KfA9RhrYP8sQc57/K6avGgPiJtcO5Dc5nchV604=;
 b=EGxjkJ29gIjnVmMQ+if4XsWolss8g8Go0FLb+nU3KyuiZe1PsXNUe+n/Uydpi6/Q/y
 MIElGwUTY0vFn5h+MlIgssPheiE9byfEbPZgmt5xyIhH/ARG4Yx4SwfDwb6s/XQgZCXb
 YIRix2PrY8U5mOaZ0oQdQELcgUiqIAQ02EEL7SCpyvuy625rEZBhe1zT9eZGPXZ+i0+F
 tSAvmklgxyjPwfYcTYizU4+lNl5/lJB0X8XNNJTl9zRNNhvq3eYwqsGDEA+NN6tqrYf9
 hVI38dTUfSHn2WD6GGWPy/VvoqCz1zz+KTWtYxBCM3lGvzK2d3s0T8oeNLVc0wyq7rrK
 1wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/m1KfA9RhrYP8sQc57/K6avGgPiJtcO5Dc5nchV604=;
 b=IWvzJghN4i9uCYLpidM9r4ohq+WfCehQR9OJEHLNMyZJawVF5Z7itW62udmTVNCN9t
 UW/cmHMoAhEXwmD//recUnerihLC3jngxqtNCOIo08fEmynlENPSHDH2KgTKmMszifV/
 v9YDs56vgGYplPSAu9QhD4iia8Z2UxwozBe3ZQVPT24iZFQN/8KbJxuTKz/DdYs3qkNE
 wME1Mc/ey4aBJ7fktp1V4GNeotaQ5yvaRYMoT78l5AuEY7FmUcSVAl+HLUwdmkXqmHtY
 UcJHLuRiBCa9lcr2os6aFsNlIvdpr9Qld9mgGa7p+w9RbTykbmEzxqkb9NOdjhjn/est
 uJBQ==
X-Gm-Message-State: AOAM531qFkjzvtpmXrmbdu2AYyYj6WfcXhTmsbVEALYYCtguv79euvhV
 RpcWOrTRQe1PqEBERp85c/KLn61+meuERef6oNI=
X-Google-Smtp-Source: ABdhPJwk2VLUAiHGTZkBTySC0FZ4WVlktAtj29dBBfZSKDVjzToM/lpmFCP8P+e/aOR7Ud6F2062piws/RuLh/qq+wU=
X-Received: by 2002:a25:aaee:: with SMTP id t101mr4332691ybi.517.1608280972264; 
 Fri, 18 Dec 2020 00:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
 <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
 <4f09804c0e35a45fcf3fa78b3f3ed55276d6e10f.camel@wdc.com>
 <CAEUhbmX16h5S5Y0kFsnDv6t2cnn6we-b-9U_cbnEQkrrckYy0w@mail.gmail.com>
 <67cbbde886c3ae6e57e837e79f466f4156a910f8.camel@wdc.com>
In-Reply-To: <67cbbde886c3ae6e57e837e79f466f4156a910f8.camel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Dec 2020 16:42:40 +0800
Message-ID: <CAEUhbmVEAxf3OCp=89MCx7qQiN0wKd3QM4k8t20r9Sbq+JA_-w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 Anup Patel <Anup.Patel@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Fri, 18 Dec 2020 08:43:00 -0000

Hi Atish,

On Fri, Dec 18, 2020 at 4:00 PM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Fri, 2020-12-18 at 15:33 +0800, Bin Meng wrote:
> > Hi Atish,
> >
> > On Fri, Dec 18, 2020 at 3:27 PM Atish Patra <Atish.Patra@wdc.com>
> > wrote:
> > >
> > > On Fri, 2020-12-18 at 15:21 +0800, Bin Meng wrote:
> > > > Hi Atish,
> > > >
> > > > On Fri, Dec 18, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com>
> > > > wrote:
> > > > >
> > > > > Currently, we place the DTB at 2MB from 4GB or end of DRAM
> > > > > which
> > > > > ever is
> > > > > lesser. However, Linux kernel can address only 1GB of memory
> > > > > for
> > > > > RV32.
> > > > > Thus, it can not map anything beyond 3GB (assuming 2GB is the
> > > > > starting address).
> > > > > As a result, it can not process DT and panic if opensbi dynamic
> > > > > firmware
> > > > > is used.
> > > > >
> > > > > Fix this by placing the DTB at 2MB from 3GB or end of DRAM
> > > > > whichever is lower.
> > > > >
> > > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > > ---
> > > > >  hw/riscv/boot.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > >
> > > > With this patch, 32-bit sifive_u still does not boot kernel with
> > > > the
> > > > following patch applied on 5.10:
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/20201217074855.1948743-1-atish.patra@wdc.com/
> > > >
> > > > Command I used:
> > > > $ qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -kernel
> > > > arch/riscv/boot/Image
> > > >
> > > > 32-bit virt cannot boot the same kernel image with memory set to
> > > > 2G
> > > > either:
> > > > $ qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
> > > > arch/riscv/boot/Image
> > > >
> > >
> > > Hi Bin,
> > > As mentioned in the email on the linux mailing list, this patch
> > > only
> > > solves 2GB problem. sifive_u problem is solved by Alistair's
> > > patch[1].
> > >
> > > He is planning to send the PR soon. The issue with sifive_u boot
> > > was it
> > > was failing the 32 bit test earlier resulting a 2MB aligned address
> > > instead of 4MB.
> >
> > Ah, I see. However my testing shows that virt with 2G still does not
> > boot with this patch.
> >
>
> Strange. I verified again with following combination with -bios and
> without bios parameter.
>
> 1. virt 32/64 with 1GB/2GB memory
> 2. sifive_u 32/64 bit with 1GB/2GB memory (Alistair's patch included)
>
> Can you share the boot log along with the head commit of Qemu and
> commandline ? I am using 5.10 kernel with my kernel fix.
>

I was using Alistair's QEMU repo for testing and 5.10 kernel with your
kernel fix:

$ git checkout -b testing pull-riscv-to-apply-20201217-1
$ apply this patch
$ mkdir build;cd build;../configure
--target-list=riscv64-softmmu,riscv32-softmmu;make -j

$ ./qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
~/work/git/linux/arch/riscv/boot/Image

OpenSBI v0.8
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name       : riscv-virtio,qemu
Platform Features   : timer,mfdeleg
Platform HART Count : 4
Boot HART ID        : 3
Boot HART ISA       : rv32imafdcsu
BOOT HART Features  : pmp,scounteren,mcounteren,time
BOOT HART PMP Count : 16
Firmware Base       : 0x80000000
Firmware Size       : 104 KB
Runtime SBI Version : 0.2

MIDELEG : 0x00000222
MEDELEG : 0x0000b109
PMP0    : 0x80000000-0x8001ffff (A)
PMP1    : 0x00000000-0xffffffff (A,R,W,X)
<hangs here>

$ ./qemu-system-riscv32 -nographic -M sifive_u -m 2G -smp 5 -kernel
~/work/git/linux/arch/riscv/boot/Image

OpenSBI v0.8
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name       : SiFive HiFive Unleashed A00
Platform Features   : timer,mfdeleg
Platform HART Count : 5
Boot HART ID        : 4
Boot HART ISA       : rv32imafdcsu
BOOT HART Features  : pmp,scounteren,mcounteren
BOOT HART PMP Count : 16
Firmware Base       : 0x80000000
Firmware Size       : 112 KB
Runtime SBI Version : 0.2

MIDELEG : 0x00000222
MEDELEG : 0x0000b109
PMP0    : 0x80000000-0x8001ffff (A)
PMP1    : 0x00000000-0xffffffff (A,R,W,X)
<hangs here>

The following is sifive_u with 1G:

$ ./qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -kernel
~/work/git/linux/arch/riscv/boot/Image

OpenSBI v0.8
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name       : SiFive HiFive Unleashed A00
Platform Features   : timer,mfdeleg
Platform HART Count : 5
Boot HART ID        : 3
Boot HART ISA       : rv32imafdcsu
BOOT HART Features  : pmp,scounteren,mcounteren
BOOT HART PMP Count : 16
Firmware Base       : 0x80000000
Firmware Size       : 112 KB
Runtime SBI Version : 0.2

MIDELEG : 0x00000222
MEDELEG : 0x0000b109
PMP0    : 0x80000000-0x8001ffff (A)
PMP1    : 0x00000000-0xffffffff (A,R,W,X)
[    0.000000] Linux version 5.10.0-00001-gbf0dad61896d
(bmeng@pek-vx-bsp2) (riscv64-linux-gcc (GCC) 8.1.0, GNU ld (GNU
Binutils) 2.30) #1 SMP Thu Dec 17 16:48:13 CST 2020
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80400000
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080400000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080400000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080400000-0x00000000bfffffff]
[    0.000000] SBI specification v0.2 detected
[    0.000000] SBI implementation ID=0x1 Version=0x8
[    0.000000] SBI v0.2 TIME extension detected
[    0.000000] SBI v0.2 IPI extension detected
[    0.000000] SBI v0.2 RFENCE extension detected
[    0.000000] SBI v0.2 HSM extension detected
[    0.000000] CPU with hartid=0 is not available
[    0.000000] CPU with hartid=0 is not available

Regards,
Bin

