Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9FMX-0008SF-VL
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 17:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9FMS-0008Px-Rt; Mon, 08 Feb 2021 17:50:30 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:38081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9FMN-0002dF-6B; Mon, 08 Feb 2021 17:50:28 -0500
Received: by mail-io1-xd2e.google.com with SMTP id f6so16820605ioz.5;
 Mon, 08 Feb 2021 14:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FysIOZ87icjobs3JgrfyO/HazpJvePqT83hifnbpYkw=;
 b=j/SbgdgcwuRBvjsu1KkFEdDh3vAEZ1xtBvz9ltjxXHvl0dHjF3naMqFEqtTSAleePD
 G4E97aha6R8wOCzyUZHL/lLtgJXH5PngppT6RR0Up1jOGe9ClLCQc0LKHdeMkBYJAq2G
 e3UoivNBH4nhgHjEo0Xovd7GalM9HBByTUUDtPJ+CFIOUROZFU0cxYBFGmnD5SzZBHkR
 XkNHSzVBz6IB61V3DdB+sEopb/p5B9dq2jo6K+QVk16plzejddggPgfRj28q0Zjpovf6
 E3z4E1uEG2kMYmlUdKNVqwoww1Mam8SYXaB5fPa6Kx9TTSGZBwSvGt+ie4JnkXqho3eR
 b+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FysIOZ87icjobs3JgrfyO/HazpJvePqT83hifnbpYkw=;
 b=JxsAYWkw/eYx8x2qgrGxCv0YEnNmhCXGF8whF91xvca41LeFEOd/Aemd7khnL1shxI
 opd5SujJkbPBbf1dRrnwWBYeN9Cskypt6mYAeEfy5VfKKeLsc52Y7DOLIvXA/g7v/yGu
 eXVhReijaGd7/SClTYuSk+nV5RwqUOCZsAMkX1vsU5mjR+YjDHG2N7Km8YC3A3/ViN2B
 N88E0ScN4FR6EFtsQ/srrhRRBNAKQ2WyRKVATK14R6wuUQ/FpXR7pVy7wBb9O8rXJkZm
 tnuEGTzfyw6inqyHLQT+3NvXWYVArNIKAkG/mKWFZ0fa5clZDPOoGTC+SqKWGCinP9XE
 yzlQ==
X-Gm-Message-State: AOAM530kx4VLFirtjm6PVY4sMs8gM93A5hc2M/cUyNT96LePJGH7eSbu
 JlwCGzFLWEHVhe1sZAeEpcu4PS0h8aihejnzpjGtIJacCoM5jg==
X-Google-Smtp-Source: ABdhPJwMox4BQ+UJqTJqI8oiIHZvWPioL6g7X8zzKBcXLtCzkFak30ULsdjVaxJMTc/EIvOZDloswHbBy0k4Umyjgk0=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr17454292ioq.176.1612824619751; 
 Mon, 08 Feb 2021 14:50:19 -0800 (PST)
MIME-Version: 1.0
References: <d2511f50-8b72-8a3b-9127-75b3ed98c584@msx.tu-dresden.de>
In-Reply-To: <d2511f50-8b72-8a3b-9127-75b3ed98c584@msx.tu-dresden.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Feb 2021 14:49:47 -0800
Message-ID: <CAKmqyKOVvaVV-WHhm7dwWyO9zSomvTRA5bXJjf=4aRqqjD96rg@mail.gmail.com>
Subject: Re: Emulating sd card with hifive_u risc-v machine
To: Pascal Scholz <s6899329@msx.tu-dresden.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Mon, 08 Feb 2021 22:50:32 -0000

On Mon, Feb 8, 2021 at 12:00 PM Pascal Scholz
<s6899329@msx.tu-dresden.de> wrote:
>
> Hi all,
>
> I'm hoping that I addressed the right mailing lists.

Hello Pascal,

Yep, this is the right place :)

>
> I'm working a bit with qemu's risc-v emulation. My current goal is to
> simulate a complete boot process for the SiFive Unleashed Board (SU 540
> SoC)[1]. I've created the correspondig OpenSBI and U-Boot images, being
> the -bios and the -kernel images. It's possible for me to boot up to the
> U-Boot prompt. From this prompt I now want to boot an system image
> located on an emulated sd card.
>
> However I now fail to get a working sd card within qemu for the device
> sifive_u. For example i tried the following command:
>
> qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios
> build/platform/sifive/fu540/firmware/fw_jump.bin -kernel
> ../../u-boot/u-boot.bin -device sdhci-pci -device sd-card,drive=sdX
> -drive id=sdX,if=none,format=raw,file=path/to/image.elf
>
> This results in Qemu telling me: -device sdhci-pci: No 'PCI' bus found
> for device 'sdhci-pci'.
>
> Using the machine "virt" the command above works.
>
> The thing i tried was:
>
> qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios
> opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin -kernel
> ../u-boot/u-boot.bin -sd path/to/image.elf
>
> Resulting in: machine type does not support if=sd,bus=0,unit=0
>
>
> Even if the machine gets stuck at some point when booting, Qemu has no
> problem starting the VM if I use "-M virt" instead of "-M sifive_u". At
> this point i think, that the machine "sifive_u" doesn't support sd
> cards? Is this guess right or is there anything left I can try? After

Correct. There is no SD card support for the SiFive U in QEMU.

You actually just reminded me though that someone has sent patches to
add support and I need to review them.

You can find the patches here:
https://patchew.org/QEMU/20210126060007.12904-1-bmeng.cn@gmail.com/
which should work when applied to QEMU.

If you do get a chance to test the patches it would be great if you
can let me know what works/doesn't work for you.

Alistair

> all I'm a bit confused, because there seems to be a block device "sd0"
> when I try to start the machine "sifive_u" without any additional
> device/drive arguments. I would really appreciate if someone would tell
> me, what I'm doing wrong.
>
> Thanks in advance and stay healthy!
>
> Best regards
>
> Pascal
>
>
> [1] https://www.sifive.com/boards/hifive-unleashed
>
>

