Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lB9b2-00072w-J4
	for mharc-qemu-riscv@gnu.org; Sun, 14 Feb 2021 00:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lB9b1-000728-1p; Sun, 14 Feb 2021 00:05:23 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lB9ay-0007X3-C3; Sun, 14 Feb 2021 00:05:22 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id m9so1746157ybk.8;
 Sat, 13 Feb 2021 21:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=93JBS1kasGrjGQP5QyWouIB88V8r++th0aGR+lBYdZ8=;
 b=FTWnkSiyr/aBvXXv2l50/5ybgqpCGl+oNk52E8k1wQrMFsUrtPuigr6d1X6zjiF/Fp
 CL4TlWIGECdm5GOZAUboI/3QoPKIf9jEEqsxYtQUY3+qc2z+r5jjttQYnoexVPPcuqpR
 z0rZ/Xf3B8Pl/gFz+NdfJq5rwiNEu9vq2Jzgklb3rh76OmqJJg5xjvNBmPvkMAUc/60I
 IfkAxqP+bdohOfEgJsBTRQ44O8vIrUVUOWmfr1krTaULO2TY+4oBpSUoFrMselR2gKW4
 ineMJlHNSNeUVOiHqKuF02gJDYL4uYua8vsOxw/Q/SeYJMLO4UXLOSKzYT5yGkZS6/Vu
 lbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=93JBS1kasGrjGQP5QyWouIB88V8r++th0aGR+lBYdZ8=;
 b=hmK633ml/222DJq44hn0iakHdb7ceIfqJQM83twkbgj0kRjKxZcY7IiKR0rUblPv6T
 qVdipNz6piL2Z0OtaqDPp6lVGyIGg3RQ11bon2O3rrFcTK+nwO1h8P1fsb32U9U2SHZA
 1mHqWa/CrEE+xYdBHdth5QrumcDHB9oQU4r5ZSbL4Qp/O4EfHchHYumzqoXI0NIda5nD
 yeK3po0ckOzJD6hJM4vRkfN17Py+0g/SYR8PYu5+5PJxCT12KpZVchNy+W8WmhCleEDW
 H+F1qPcs3TPMVqEdojsvn+y92GmRK5KTxr34d3qfiAMPZWQAX7/PVVwewhRGWJhmVzVs
 22bQ==
X-Gm-Message-State: AOAM533dhr8s7ct8jlT9K1zU5bYmkPiLP79LPHhU7PaBzlqNOUIL62rn
 FyOcuzyKXYL0Iy2DEe5NVM/f2bEanUI+jDOg6Ro=
X-Google-Smtp-Source: ABdhPJy1HGAV4Jy/Beg9PnJ8DClE2jk5PbUP0VJ0bzBoS+L3Bpk9Uefo/GTybd0/OnbegefUQx8fvzO8Vi6yn7Cdj3U=
X-Received: by 2002:a25:c407:: with SMTP id u7mr15427178ybf.387.1613279118993; 
 Sat, 13 Feb 2021 21:05:18 -0800 (PST)
MIME-Version: 1.0
References: <d2511f50-8b72-8a3b-9127-75b3ed98c584@msx.tu-dresden.de>
 <CAKmqyKOVvaVV-WHhm7dwWyO9zSomvTRA5bXJjf=4aRqqjD96rg@mail.gmail.com>
 <91d3712d74d3443397af042388b78865@MSX-L105.msx.ad.zih.tu-dresden.de>
In-Reply-To: <91d3712d74d3443397af042388b78865@MSX-L105.msx.ad.zih.tu-dresden.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 14 Feb 2021 13:05:07 +0800
Message-ID: <CAEUhbmXY1JDk4tEd0QuoGV+r8vpiQrmHaabxPRqx2haG1hmtQQ@mail.gmail.com>
Subject: Re: Emulating sd card with hifive_u risc-v machine
To: Pascal Scholz <pascal.scholz@tu-dresden.de>
Cc: Alistair Francis <alistair23@gmail.com>,
 Pascal Scholz <s6899329@msx.tu-dresden.de>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Sun, 14 Feb 2021 05:05:23 -0000

Hi Pascal,

On Thu, Feb 11, 2021 at 5:47 AM Pascal Scholz
<pascal.scholz@tu-dresden.de> wrote:
>
> Hi Alistair,
>
> thanks for your quick and helpful reply. :)
>
> I'll see, if I can try them out on the weekend and will report my results.
>
> Best regards and thanks again!
>
> Pascal
>
> On 08.02.21 23:49, Alistair Francis wrote:
> > On Mon, Feb 8, 2021 at 12:00 PM Pascal Scholz
> > <s6899329@msx.tu-dresden.de> wrote:
> >> Hi all,
> >>
> >> I'm hoping that I addressed the right mailing lists.
> > Hello Pascal,
> >
> > Yep, this is the right place :)
> >
> >> I'm working a bit with qemu's risc-v emulation. My current goal is to
> >> simulate a complete boot process for the SiFive Unleashed Board (SU 540
> >> SoC)[1]. I've created the correspondig OpenSBI and U-Boot images, being
> >> the -bios and the -kernel images. It's possible for me to boot up to the
> >> U-Boot prompt. From this prompt I now want to boot an system image
> >> located on an emulated sd card.

Yep, your goal is now satisfied with the patch series Alistair pointed
out, along with one more dependent series (see below)

> >>
> >> However I now fail to get a working sd card within qemu for the device
> >> sifive_u. For example i tried the following command:
> >>
> >> qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios
> >> build/platform/sifive/fu540/firmware/fw_jump.bin -kernel
> >> ../../u-boot/u-boot.bin -device sdhci-pci -device sd-card,drive=sdX
> >> -drive id=sdX,if=none,format=raw,file=path/to/image.elf
> >>
> >> This results in Qemu telling me: -device sdhci-pci: No 'PCI' bus found
> >> for device 'sdhci-pci'.
> >>
> >> Using the machine "virt" the command above works.
> >>
> >> The thing i tried was:
> >>
> >> qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios
> >> opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin -kernel
> >> ../u-boot/u-boot.bin -sd path/to/image.elf
> >>
> >> Resulting in: machine type does not support if=sd,bus=0,unit=0
> >>
> >>
> >> Even if the machine gets stuck at some point when booting, Qemu has no
> >> problem starting the VM if I use "-M virt" instead of "-M sifive_u". At
> >> this point i think, that the machine "sifive_u" doesn't support sd
> >> cards? Is this guess right or is there anything left I can try? After
> > Correct. There is no SD card support for the SiFive U in QEMU.
> >
> > You actually just reminded me though that someone has sent patches to
> > add support and I need to review them.
> >
> > You can find the patches here:
> > https://patchew.org/QEMU/20210126060007.12904-1-bmeng.cn@gmail.com/
> > which should work when applied to QEMU.

Note you will also need to apply the following SD card patches to make it work:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226785

> >
> > If you do get a chance to test the patches it would be great if you
> > can let me know what works/doesn't work for you.

Please test and report.

Regards,
Bin

