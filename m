Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9xy6-0006bp-QC
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 17:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9xy2-0006ZS-Qd; Wed, 10 Feb 2021 17:28:14 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:44694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9xxw-0001RS-T7; Wed, 10 Feb 2021 17:28:14 -0500
Received: by mail-il1-x135.google.com with SMTP id y15so3383719ilj.11;
 Wed, 10 Feb 2021 14:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6MdXFExxjfx5Vxj2KxEtP33kycI/3o1MawdworOI6RQ=;
 b=VLUoOeb8HTNgQNhPSANVc/h52B+AXaxLdyjzOt2DVrXwTDSh3lLRxlib4zwZ2HzGkK
 4Vl7c75/au1EDdskR2quUUnQ26kUVyDbadNd6nvvl5Z+FgOv1Z6x5J1NoRbVl2yH9lIG
 2VtczoCwUL0Et7oqwuuquGDDtwSJ2ALaQU39UFDGrvbs8NX657nuwp6S2u8HjfBFcfWZ
 Rj2x47WY0BTlBPgvTG9KfGk4y8kDzW3a/aZvSwd6u/Ns+Y/avH81BausR0wDZlIL41ZY
 CL1aOScvJwIsoYBTzoQXbL2a/9BUHINkIpZ5YfQiRF4EAvqVXzKRVkyhhwPFmvRWohNH
 AZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MdXFExxjfx5Vxj2KxEtP33kycI/3o1MawdworOI6RQ=;
 b=Jz5OzJJtJKefzd9fAGRFOMg4MbRf+jPR6CBNewfS2ElyhMyL9KpmBBkgr1XsnDWg6S
 BwsOE5iaXbu94245Apmwbca5wup9SgqmrNzA88Ke8EkhZLlbAuy/N7clhqXIy/yeOQVM
 kUeKPRU4b027GnT+bFeFCK7277VuUbbyE5kFhxY5NGxaX6G+kwT8s7fH19Yzqf+2Qi7f
 Ez046DiP4Cd7K57Vm4TLhtY+nM50M/0q4+RW+zHxv+Yo8ap4JUI8KcyKDe3Aepidm94I
 XcGmTVEcKYvPLMhvpgj51cCO7NH2lCcijuAlr0OWG3VqKYhxIrvGJOFFB03BTrY1sctd
 5Cmg==
X-Gm-Message-State: AOAM530IiovvvfBe5xERsUW9mQbV0+OO+g7gIrSfZW3zEb9xUXOFCC40
 2hut0zIdwZJRcCZS73BiRbTE4yg3IX+ULkniCHHq9GqJKiY=
X-Google-Smtp-Source: ABdhPJxZcvNLr6ehZ6LzatpkzXei9ocliNnd7WSPQoGmoBE9WdKwDU67SknXlKhx5vfH/SYTx9v9/VBJeiXdNtlyg+4=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr2951612ilv.131.1612996087151; 
 Wed, 10 Feb 2021 14:28:07 -0800 (PST)
MIME-Version: 1.0
References: <d2511f50-8b72-8a3b-9127-75b3ed98c584@msx.tu-dresden.de>
 <CAKmqyKOVvaVV-WHhm7dwWyO9zSomvTRA5bXJjf=4aRqqjD96rg@mail.gmail.com>
 <91d3712d74d3443397af042388b78865@MSX-L105.msx.ad.zih.tu-dresden.de>
In-Reply-To: <91d3712d74d3443397af042388b78865@MSX-L105.msx.ad.zih.tu-dresden.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Feb 2021 14:27:32 -0800
Message-ID: <CAKmqyKM4zXChtns+qMMRVXE+KWc=YGRDuSVEeBTig3GHAsFGVA@mail.gmail.com>
Subject: Re: Emulating sd card with hifive_u risc-v machine
To: Pascal Scholz <pascal.scholz@tu-dresden.de>
Cc: Pascal Scholz <s6899329@msx.tu-dresden.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Wed, 10 Feb 2021 22:28:16 -0000

On Wed, Feb 10, 2021 at 12:02 PM Pascal Scholz
<pascal.scholz@tu-dresden.de> wrote:
>
> Hi Alistair,
>
> thanks for your quick and helpful reply. :)
>
> I'll see, if I can try them out on the weekend and will report my results.

Great!

>
> Best regards and thanks again!

No worries!

Alistair

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
> >
> > If you do get a chance to test the patches it would be great if you
> > can let me know what works/doesn't work for you.
> >
> > Alistair
> >
> >> all I'm a bit confused, because there seems to be a block device "sd0"
> >> when I try to start the machine "sifive_u" without any additional
> >> device/drive arguments. I would really appreciate if someone would tell
> >> me, what I'm doing wrong.
> >>
> >> Thanks in advance and stay healthy!
> >>
> >> Best regards
> >>
> >> Pascal
> >>
> >>
> >> [1] https://www.sifive.com/boards/hifive-unleashed
> >>
> >>

