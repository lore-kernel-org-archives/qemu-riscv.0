Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kvglL-0008Jp-LJ
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jan 2021 08:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kvglJ-0008I9-Ep; Sat, 02 Jan 2021 08:16:05 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kvglH-0000bT-Ky; Sat, 02 Jan 2021 08:16:05 -0500
Received: by mail-yb1-xb30.google.com with SMTP id x2so21580810ybt.11;
 Sat, 02 Jan 2021 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+x0ngIwQ/DPLvEpEaM6SnFpnMA5HovoPhZ6V/u9Uaxc=;
 b=R6ELi3pVlO3oeRgr8qGvxfc28iae/7DxzzhWYR3e1eFipA8fy7zJqSD0r6p8vChszn
 N4h8NiT6CKM/lF9bdAFthEdorolecUhLyt5Fx75OaK+sPA1OKbUqywKOmFedSnfokck7
 GpOPYlHjePsjkCZAEoDs7r9Bb9AJTZwneLv2xMtry+o8B/UyqRS2YUSIN6HyHzvXbf+m
 8Ny78M3c/jcQVjJp6qfTUXw0V865Mm0VYfKye9OMa3wl6zTkCO/IUm0b0EudNAFOWT6U
 Ka6ZtHmB25jxSb5yi4GlU2RA5Qm3ppPppocMf/plKOfhqu+OgF7YuE9/iV7O8DclXmhC
 yd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+x0ngIwQ/DPLvEpEaM6SnFpnMA5HovoPhZ6V/u9Uaxc=;
 b=OJG/5JviBzdCE9YYHZa4i7XadzQUv6CccJlCvIpjegBVZzsG+lTJey/vTvLVWDZzEH
 IWzQRRv4CjNnDWchlsy6L/hfuaKYP9eplWGvPokSKfMNeZZu/wXLzwQilLUhUdh8F3u8
 kMW9ZtGgOIotrJKgmHRJzy3H12tuJcHS5XNJmCq2c+4Ks34tEM7teYqul+nJURF61Pru
 r3jlLCrfeNCbq8AUqovXQAPtv6ZN7qqrTKgkNuipWvIabekKqy4qCtMMpBSYIeSf91gv
 VdBph0kgMjS+QO9z7LbStA+Ae0WkHzCC2TMidnkpeEDSX0Ea2BzcxhilnxxOh4oIRfHv
 6MTg==
X-Gm-Message-State: AOAM5318/3VwqSWlHSbb1xINO1ikgGFxIoMoGzyo26CS1bIa5kyPTWuE
 LZWkahoGwh8OWbEJyuD6ZWeJs8FbU6UCAJBuxjE=
X-Google-Smtp-Source: ABdhPJwKWAPsusZG4ToVX3zdz+6wcQb0EgLgsZC6bDIonUmdxMubMAZlh2Dcj4JyVdXQiNgg9RMoWyaxgItdh72Jm1g=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr97285921ybe.306.1609593361577; 
 Sat, 02 Jan 2021 05:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <CAN8ut8Lt8dbmayZE9YCzVpoddaTefnoFazKqB=CvP9DTAF+n1Q@mail.gmail.com>
In-Reply-To: <CAN8ut8Lt8dbmayZE9YCzVpoddaTefnoFazKqB=CvP9DTAF+n1Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 2 Jan 2021 21:15:50 +0800
Message-ID: <CAEUhbmWH80=9nkDU+Ca01C9JMhPcJoCijbrL6VVtQbWD55a_Yw@mail.gmail.com>
Subject: Re: [PATCH 00/22] hw/riscv: sifive_u: Add missing SPI support
To: Pragnesh Patel <pragnesh.patel@sifive.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Sat, 02 Jan 2021 13:16:05 -0000

Hi Pragnesh,

On Sat, Jan 2, 2021 at 8:27 PM Pragnesh Patel <pragnesh.patel@sifive.com> wrote:
>
> Hi BIn,
>
> 1) Please rebase this series on master.

I remember I rebased it on master already.

>
> 2) When i tried to boot from SD card image it shows below,
>
> pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
> sifive_u,msel=11 -m 4G -nographic -bios
> ~/opensource/u-boot/spl/u-boot-spl.bin -device
> sd-card,spi=true,drive=mycard -drive
> file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none

The command is not correct. Please check the commit message of:
[18/22] hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card

The command should be:

$ qemu-system-riscv64 -nographic -M sifive_u,msel=11 -smp 5 -m 8G \
    -bios u-boot-spl.bin -drive file=sdcard.img,if=sd

Note the memory should be 8G and the SD card is already connected by
the sifive_u machine codes. No need to create it via "-device
sd-card".

> qemu-system-riscv64: -device sd-card,spi=true,drive=mycard: Drive
> 'mycard' is already in use by another device
>
>
> I hacked the qemu code temporary and able to boot U-Boot from SD card,
> below is my hack
>
> pragneshp:sifive-qemu$ git diff
> diff --git a/block/block-backend.c b/block/block-backend.c
> index ce78d30794..cfa739fa40 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -888,10 +888,11 @@ void blk_get_perm(BlockBackend *blk, uint64_t
> *perm, uint64_t *shared_perm)
>   */
>  int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
>  {
> +#if 0
>      if (blk->dev) {
>          return -EBUSY;
>      }
> -
> +#endif
>
> After applying this hack, I was able to boot U-Boot from Sd card
>
> Bootlogs:
>
> pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
> sifive_u,msel=11 -m 4G -nographic -bios
> ~/opensource/u-boot/spl/u-boot-spl.bin -device
> sd-card,spi=true,drive=mycard -drive
> file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none
>
> U-Boot SPL 2020.10-rc5-00007-gf9aadb57b1 (Dec 29 2020 - 17:48:05 +0530)
> Trying to boot from MMC1
>
>
> U-Boot 2020.10-rc5-00007-gf9aadb57b1 (Dec 29 2020 - 17:48:05 +0530)
>
> CPU:   rv64imafdc
> Model: SiFive HiFive Unleashed A00
> DRAM:  4 GiB
> MMC:   spi@10050000:mmc@0: 0
> Loading Environment from SPIFlash... Invalid bus 0 (err=-19)
> *** Warning - spi_flash_probe_bus_cs() failed, using default environment
>
> In:    serial@10010000
> Out:   serial@10010000
> Err:   serial@10010000
> Net:   eth0: ethernet@10090000
> Hit any key to stop autoboot:  0
> =>
>
> Thanks for the series.
>

Regards,
Bin

