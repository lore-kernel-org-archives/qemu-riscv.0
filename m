Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kvh5U-00055D-4O
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jan 2021 08:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kvh5S-000538-Ht; Sat, 02 Jan 2021 08:36:54 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kvh5Q-0007JW-RB; Sat, 02 Jan 2021 08:36:54 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id y128so21627814ybf.10;
 Sat, 02 Jan 2021 05:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NIVibGJtcgNw+be+n4i4/YmFSIeGkoa4EtPgc9/Z5Fc=;
 b=vIR3cF2ZoGILofBz+6XMP4+5tPKkldR1XyeaPdXcKfZLC7Y+tCJQeY4Uy32T1+mzKE
 GFVSkJqtZ7EYHSeOlbHjFD6TdCaNtvQUM5XyN6jEIfxZeeauyrllzkWaazl4zulMqKdj
 hn0fQsuL+lqQ17A1OZSELBaB678PzTA2wlaJ5td5MPKG9aKIJqlVkbsTge1+RD79Exyv
 1SObxuRxsKQcDDkuXDZd8FULEDcpTHuPm43al9GrSQWPx5oQUV4rcms7brEfWbyPLkd/
 5QViIioHm12XihfQt2rUycQRjyFDDJpTj2V3sDUNsqUYHYFoYOUg5pHWgERdMAfARGwn
 HVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NIVibGJtcgNw+be+n4i4/YmFSIeGkoa4EtPgc9/Z5Fc=;
 b=UNLQDqtcyCYsl3V/xICaLHQLKETI+YFHQOLfjrGjjdCISZVN5RfIo3hr4VrdFkZ240
 1SBV4A4FXLwGTFGNGAB1Dy6vltZbVrSwJAX0XvbSDHky3VNtmsbhkpqUdoQLYN1ZMj+K
 K6O0NoIzZMLWpuOlqg4d0JyW+dGL6r/zj3zPNipozCaS4a+Y66FM8EM8YCwBt4A/QNEZ
 nZaDx0G4vOyDgw7vdDIBIBLgoNwwso050LBIK1RM03e1DMuda35EDV3p4nt1IQD2uYSD
 vAP+JKnJ8Bv2K1KaT2Y/MH0CnkEd7rV2e/Du44MRj9R/20WXGrsv8Pi1lre3gWDhsY3j
 UBJw==
X-Gm-Message-State: AOAM533gC4d95alg/kAg+gSjo89UAN36D7jiJacshT9MtVgoD2QY5vrE
 p4uXqXmvdZkRl4A9jJbl0mDfijMpL6nW9DJjOic=
X-Google-Smtp-Source: ABdhPJzKUlXGtopfm/C5qbQ8W/iOkkqrFNHh2pvQQNVn8vLALeXz9ughajhNtAyPLfjEcc49PHYt/QxOEUjgXQ9nFYw=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr97375949ybe.306.1609594609385; 
 Sat, 02 Jan 2021 05:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <CAN8ut8Lt8dbmayZE9YCzVpoddaTefnoFazKqB=CvP9DTAF+n1Q@mail.gmail.com>
 <CAEUhbmWH80=9nkDU+Ca01C9JMhPcJoCijbrL6VVtQbWD55a_Yw@mail.gmail.com>
 <CAN8ut8KyJbvM+1MB923VmUTm7+E7jEsTuR3TKazFkxBnnc9YCQ@mail.gmail.com>
In-Reply-To: <CAN8ut8KyJbvM+1MB923VmUTm7+E7jEsTuR3TKazFkxBnnc9YCQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 2 Jan 2021 21:36:38 +0800
Message-ID: <CAEUhbmWghZ-P4e_=Z3RN=f4XXoo50LjQ0kW1wavLUXZPVpjwNA@mail.gmail.com>
Subject: Re: [PATCH 00/22] hw/riscv: sifive_u: Add missing SPI support
To: Pragnesh Patel <pragnesh.patel@sifive.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Sat, 02 Jan 2021 13:36:54 -0000

Hi Pragnesh,

On Sat, Jan 2, 2021 at 9:30 PM Pragnesh Patel <pragnesh.patel@sifive.com> wrote:
>
> Hi Bin,
>
> On Sat, Jan 2, 2021 at 6:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Pragnesh,
> >
> > On Sat, Jan 2, 2021 at 8:27 PM Pragnesh Patel <pragnesh.patel@sifive.com> wrote:
> > >
> > > Hi BIn,
> > >
> > > 1) Please rebase this series on master.
> >
> > I remember I rebased it on master already.
>
> It shows below,
>
> pragneshp:sifive-qemu$ git am hw-riscv-sifive_u-Add-missing-SPI-support.patch
> Applying: hw/block: m25p80: Add ISSI SPI flash support
> error: patch failed: hw/block/m25p80.c:1134
> error: hw/block/m25p80.c: patch does not apply
> Patch failed at 0001 hw/block: m25p80: Add ISSI SPI flash support
> Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> pragneshp:sifive-qemu$

Ah, I see. The branch I generated the series has some patches of SST
and i.MX6 SPI patches I previously worked on and it has some changes
in m25p80.c. Will generate the patches from a clean qemu/master.

>
>
> >
> > >
> > > 2) When i tried to boot from SD card image it shows below,
> > >
> > > pragneshp:sifive-qemu$ ./build/riscv64-softmmu/qemu-system-riscv64 -M
> > > sifive_u,msel=11 -m 4G -nographic -bios
> > > ~/opensource/u-boot/spl/u-boot-spl.bin -device
> > > sd-card,spi=true,drive=mycard -drive
> > > file=~/opensource/u-boot/fsbl.gpt,id=mycard,format=raw,if=none
> >
> > The command is not correct. Please check the commit message of:
> > [18/22] hw/riscv: sifive_u: Add QSPI2 controller and connect an SD card
> >
> > The command should be:
> >
> > $ qemu-system-riscv64 -nographic -M sifive_u,msel=11 -smp 5 -m 8G \
> >     -bios u-boot-spl.bin -drive file=sdcard.img,if=sd
> >
> > Note the memory should be 8G and the SD card is already connected by
> > the sifive_u machine codes. No need to create it via "-device
> > sd-card".
>
> Ok my bad. it's working now. thanks for the clarification.

Good to know it's working on your side.

Regards,
Bin

