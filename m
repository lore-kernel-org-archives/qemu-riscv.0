Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kvgzi-0003rt-Um
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jan 2021 08:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvgzh-0003rM-DK
 for qemu-riscv@nongnu.org; Sat, 02 Jan 2021 08:30:57 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvgzf-0005Ia-Eg
 for qemu-riscv@nongnu.org; Sat, 02 Jan 2021 08:30:56 -0500
Received: by mail-ej1-x630.google.com with SMTP id 6so30480073ejz.5
 for <qemu-riscv@nongnu.org>; Sat, 02 Jan 2021 05:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3d9Lb8GK+5+dbjtmMMtIvEC5oXmINjfPouWVGkFgqd8=;
 b=UPiVP7DfXzBoe8eMAF4ZY1W8HHgBG+2c/c/4xGoUPXT6jVu1mWAeNO/8wOufaTVe+g
 WXUUZhjDVHvRAfEMo8fswGkUTf1OoPsnuMjoHChNbcl87ChhUbhHHwrbx/KeinENAzza
 zEpX1LX5Y5FNiW8w675J+BfSJ0ucmiR5LWJdzh+bHs8OiCiKc87igRHtP4aGO1MDMY86
 XQ8SGFG0m6g2AZgXJZMuoCJ/8B03gc52qN+9DCoRIhu1WU80WlUmk0Jl4oZVj8anz3eE
 EgbFDiWQLb1EEk5/HTtDaIMt7SDhB1dZRg5DA8AaSt+82ClHTTiR6zXht1xlpwO+rqOH
 qfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3d9Lb8GK+5+dbjtmMMtIvEC5oXmINjfPouWVGkFgqd8=;
 b=Lkfws/A+ckt7xg1ayMSMdXn3ccC9l9GlS6RXgt54J44XD++yiLF8YheEvYsJys7hNF
 ogHMWQTB2SaBP6gQCjxrbl1RAiC4/78aNhrJjDe6JnOPM8UDDFiaVGQtI5rGshEFSOQ4
 XDVvAELC/P5Bmv/vTf3Rgs6vwKTmzw4A8P3GFBXJNCQorEIuFJyZha8Mfjktlw3e5YNn
 qAIR884BQ0TSXTNBSgVEomphdnx/MAjbbailF3WtQBplQWxiaQWQimcyPYCXAl4g+yhh
 3C+jkTnAF76EBBgnNvZpcPGYtXfvxC20n0eG9WVoC/yaWAFaChwyRAxTVFr8DPE22enG
 WdmA==
X-Gm-Message-State: AOAM532brqhslXR7JmuYGOt8Oyjcv99DAYpvg1s9L0AhLgjHuL8t7XfB
 j0M9VgGlyN4HPQujn+bKrrw61qkAKYsoMP8J53TfYg==
X-Google-Smtp-Source: ABdhPJyCrYf37PxAVlGoAmecJXfAnbEJpNFbHb/liEoktA0+wjIa4AI7fD0VHoqKeXoe83/Vr7cWOqfrMgbWq4ZO65U=
X-Received: by 2002:a17:906:d0c1:: with SMTP id
 bq1mr54233617ejb.202.1609594253531; 
 Sat, 02 Jan 2021 05:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <CAN8ut8Lt8dbmayZE9YCzVpoddaTefnoFazKqB=CvP9DTAF+n1Q@mail.gmail.com>
 <CAEUhbmWH80=9nkDU+Ca01C9JMhPcJoCijbrL6VVtQbWD55a_Yw@mail.gmail.com>
In-Reply-To: <CAEUhbmWH80=9nkDU+Ca01C9JMhPcJoCijbrL6VVtQbWD55a_Yw@mail.gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 19:00:41 +0530
Message-ID: <CAN8ut8KyJbvM+1MB923VmUTm7+E7jEsTuR3TKazFkxBnnc9YCQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] hw/riscv: sifive_u: Add missing SPI support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 02 Jan 2021 13:30:57 -0000

Hi Bin,

On Sat, Jan 2, 2021 at 6:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Pragnesh,
>
> On Sat, Jan 2, 2021 at 8:27 PM Pragnesh Patel <pragnesh.patel@sifive.com> wrote:
> >
> > Hi BIn,
> >
> > 1) Please rebase this series on master.
>
> I remember I rebased it on master already.

It shows below,

pragneshp:sifive-qemu$ git am hw-riscv-sifive_u-Add-missing-SPI-support.patch
Applying: hw/block: m25p80: Add ISSI SPI flash support
error: patch failed: hw/block/m25p80.c:1134
error: hw/block/m25p80.c: patch does not apply
Patch failed at 0001 hw/block: m25p80: Add ISSI SPI flash support
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
pragneshp:sifive-qemu$


>
> >
> > 2) When i tried to boot from SD card image it shows below,
> >
> > pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
> > sifive_u,msel=11 -m 4G -nographic -bios
> > ~/opensource/u-boot/spl/u-boot-spl.bin -device
> > sd-card,spi=true,drive=mycard -drive
> > file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none
>
> The command is not correct. Please check the commit message of:
> [18/22] hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
>
> The command should be:
>
> $ qemu-system-riscv64 -nographic -M sifive_u,msel=11 -smp 5 -m 8G \
>     -bios u-boot-spl.bin -drive file=sdcard.img,if=sd
>
> Note the memory should be 8G and the SD card is already connected by
> the sifive_u machine codes. No need to create it via "-device
> sd-card".

Ok my bad. it's working now. thanks for the clarification.

>
> > qemu-system-riscv64: -device sd-card,spi=true,drive=mycard: Drive
> > 'mycard' is already in use by another device
> >
> >
> > I hacked the qemu code temporary and able to boot U-Boot from SD card,
> > below is my hack
> >
> > pragneshp:sifive-qemu$ git diff
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index ce78d30794..cfa739fa40 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -888,10 +888,11 @@ void blk_get_perm(BlockBackend *blk, uint64_t
> > *perm, uint64_t *shared_perm)
> >   */
> >  int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
> >  {
> > +#if 0
> >      if (blk->dev) {
> >          return -EBUSY;
> >      }
> > -
> > +#endif
> >
> > After applying this hack, I was able to boot U-Boot from Sd card
> >
> > Bootlogs:
> >
> > pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
> > sifive_u,msel=11 -m 4G -nographic -bios
> > ~/opensource/u-boot/spl/u-boot-spl.bin -device
> > sd-card,spi=true,drive=mycard -drive
> > file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none
> >
> > U-Boot SPL 2020.10-rc5-00007-gf9aadb57b1 (Dec 29 2020 - 17:48:05 +0530)
> > Trying to boot from MMC1
> >
> >
> > U-Boot 2020.10-rc5-00007-gf9aadb57b1 (Dec 29 2020 - 17:48:05 +0530)
> >
> > CPU:   rv64imafdc
> > Model: SiFive HiFive Unleashed A00
> > DRAM:  4 GiB
> > MMC:   spi@10050000:mmc@0: 0
> > Loading Environment from SPIFlash... Invalid bus 0 (err=-19)
> > *** Warning - spi_flash_probe_bus_cs() failed, using default environment
> >
> > In:    serial@10010000
> > Out:   serial@10010000
> > Err:   serial@10010000
> > Net:   eth0: ethernet@10090000
> > Hit any key to stop autoboot:  0
> > =>
> >
> > Thanks for the series.
> >
>
> Regards,
> Bin

