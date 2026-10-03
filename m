Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D5CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xD1YB-0005vT-DJ; Sat, 03 Oct 2026 11:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1Xt-0005ue-Ry
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:21:06 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1Xr-0004Z9-EM
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:21:05 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8ac9d666d4eso4066807b3.3
 for <qemu-riscv@nongnu.org>; Sat, 03 Oct 2026 08:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791040862; cv=none;
 d=google.com; s=arc-20260327;
 b=XIhqTqnnBfiRJdBFkQchsrLcpgdQ8Z0/YDrmZT2vQbrsBTpDWOdHcFS83caJ5XpMqh
 2Mwp8vY7/Y/YAgn1rs6ozpixfdiSo3go/ScTRCUeywSaKDP4aKhwmw9EXSpogG1hKo8A
 ucoJzzr0bWa/WmzkHRlHgja5HeKutXucQEGTK5dKjP1yMls0PIJCBYD6mFrQFrW62pKk
 H7d7DnSwnZnMRXpG5YBfKyDN2nK5T6o7hWwt0uochG3cbFNYnSZMm6nHWD87NIVT49ZM
 gtLpY+4L/BaOy1dDldQSfW5FyAhaeREko1rqdmgMpAaEsCPwMHzm98kNvLgi2cornwOU
 pi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aVqCcGVQqQIude+sAkq/xvQYLe7qn8fpvMdgD01ztIg=;
 fh=qcihYnSYyo/H30985X5NkAry/L68rg6JR7JMilswo84=;
 b=Fs8aWDCsGs7F+75ME7wDROsgNUNONoFRbbG5/FUGGsVYdbHwe/83feiOJpIWx8oX24
 UwWoR0KJYFEPKY1k6hcFNzz7CqpBn85+PkrFdiELEMDUhYkW+V1UwQriZc5Dz258kKmT
 BnexaEJEOOlD5yqxC5GQQK7/BPKlOXm0w7w+YSwoFF7ZEV/k2sLqtO0L0/BA6PvNPAqd
 a+mQYiNWiZIkg5u4pRT4/Uhj0XLoY9DGhBBeSSn1p8IwKzY5G9/2nOfToPqo2OcU/QuB
 FGt4rbGPPBGz8T3Ha7gYW1pfKQ59zNGthZozsF6xBUX9BfHuxIuAEZQpUTpkZI/O6t69
 XcHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791040862; x=1791645662; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=aVqCcGVQqQIude+sAkq/xvQYLe7qn8fpvMdgD01ztIg=;
 b=bP21ZpfijGzinaPCMGz1XT3swURUJRVmK5R5cZ4O1EbIL6V3jq8akrxNY5P7psQbQx
 0limuH0NqjuuiRm52IIipZDndw4E8dUfKkxeY0qu1ow9hZ9J1eOuivR3//RTIfYErD2V
 xgEjun/nlML+re5Et2r5iuULls7AtgstTbmDQiLP5c2m9Gnzjdsy/ZTevXFV0U+GgrgL
 RaQ1v8XDpA2u5Vg7kFXWskKwOLZvTnt7EnJMKf61myM8fHTbst7RcAG9voarLF57LVDS
 aq1riP4EprXqZsbzaE1rytmIxMHpR4b0c72evfLxBKIFFDlSatyKlJgeE3rrwdHVbMgZ
 st+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791040862; x=1791645662;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aVqCcGVQqQIude+sAkq/xvQYLe7qn8fpvMdgD01ztIg=;
 b=E5ldR0Y/FXtIFgEP/7mw8YZ4647vzSSPqTOxIFu9bx+lfcRFu3mBzgBUhnqsqtOMdl
 m0DNpBdbxQdP8YY5cnh1jQE+8f2FgiXpTw0HGmoFOc0OAojopK2syHTsr92sN+lVYCcA
 MHbXT1AjpeBfjcnBRPuntc52U5EiWtuk/e8Rds7vcQSxLaQMZROkW5Khii9iBECECLL1
 BBc6d2ft+ru240a8W4Q/L1ouFLPjOo2BZR9nH3nbu1lUFYcMepX4mqM5aWDePEd+Le24
 AVqOxEbxfxuvJOOBiNiXZQ1Ud5NtJTG9gBu6uOJeDEocCpSpyx4aVdSZfXAOPCGtyQZo
 AcYA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8/IvwoYGAdf0YPmdC1xMOr0QJU93HGsaVcNvci1+KyvJqK5l82D8BH/C55Lsx3Eh9DyuxNy+0Ht5D@nongnu.org
X-Gm-Message-State: AFq9FYLZrkiZWNpGj8jaEuqMlx0bl69XoJM58nNmeSXYuov5v/gyGXDr
 ouBtHpMMOiWvjqaTa6xE62j16c0PFd0TZpJx4R535Ip+EwR0j3MPI6s3oJLO8o2yDuPU4SrGFZ2
 GnE78LKxSUNkbpLaQLV8FrJ5JqxSqnqik5muI
X-Gm-Gg: AYBFou16w6BHQWJGEG8Wo+zRkds0pDENg4wiIQKbO48HCM++OFi87c9hizB4K+Oirbm
 5Tz+NAoVcuGsyvAXF9p1MYrfby25gXLVi3gniGk93qYS+yzfFfw0g8YWlsJpvPIzHy1L5aSkbxe
 6ojCoV6nmD2fd/TFd9BmCLRxRm6HHGzKlLvOtP8RJdentTmHX0PlXvqXEgWe7S93DQbC5QRIEWK
 YwRSGXLqQoWH6r8b5VPpjQ8G+yH7egHpQgwDGsd0NKCPH+jW1VFAd5jE1k1P2HviTBEnYK+rHAA
 sMDKTbCvkH79uN1inmJvWH1CZtn+VpO8maQAIYMTRQu5vY6czOCQ0eqo91B0EwstqWRCVgfNZCi
 fMRDgmn2bm4wYZs8=
X-Received: by 2002:a05:690c:386:b0:8ab:4a67:71a8 with SMTP id
 00721157ae682-8ae94ca2e24mr8982357b3.38.1791040861893; Sat, 03 Oct 2026
 08:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260904155758.3833179-1-bin.meng@processmission.com>
 <20260904155758.3833179-21-bin.meng@processmission.com>
 <20260930-railing-carving-18e0ea44025a@wendy>
In-Reply-To: <20260930-railing-carving-18e0ea44025a@wendy>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Oct 2026 23:20:50 +0800
X-Gm-Features: AclHuK-nJI7_eRZKujaT2bMOS_Ovew74g44AL9fpTrgJY-SLdsoheRewzShXmZ8
Message-ID: <CAEUhbmVj6frnpHgddhhP8dZsW43cUrW-pDOhYB9na=N89WMtMw@mail.gmail.com>
Subject: Re: [PATCH v2 20/24] docs/system/riscv: Document Icicle Kit HSS boot
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Conor Dooley <conor@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Sep 30, 2026 at 5:46=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, Sep 04, 2026 at 11:57:39PM +0800, Bin Meng wrote:
> > With all previous changes, the Icicle Kit model is now able to boot
> > HSS v2024.06 through a Buildroot 2026.05 SD image to U-Boot and Linux.
> >
> > Document the tested source versions and exact commands to build HSS
> > and Buildroot. Include the sparse resize and GPT relocation steps
> > needed to make the generated SD image usable by QEMU.
> >
> > Also describe the RAM and serial setup, boot stages, and remaining
> > model limitations.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > ---
> >
> > (no changes since v1)
> >
> >  docs/system/riscv/microchip-icicle-kit.rst | 101 +++++++++++++++++++--
> >  1 file changed, 95 insertions(+), 6 deletions(-)
> >
> > diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/r=
iscv/microchip-icicle-kit.rst
> > index 38352cc62b..eeb4ff938c 100644
> > --- a/docs/system/riscv/microchip-icicle-kit.rst
> > +++ b/docs/system/riscv/microchip-icicle-kit.rst
> > @@ -19,12 +19,15 @@ The ``microchip-icicle-kit`` machine supports the f=
ollowing devices:
> >  * 4 U54 cores
> >  * Core Level Interruptor (CLINT)
> >  * Platform-Level Interrupt Controller (PLIC)
> > -* L2 Loosely Integrated Memory (L2-LIM)
> > +* Loosely Integrated Memory (L2-LIM)
> > +* L2 cache controller (L2CC)
> >  * DDR memory controller
> > +* System controller and system services mailbox
> >  * 5 MMUARTs
> >  * 1 DMA controller
> >  * 2 GEM Ethernet controllers
> >  * 1 SDHC storage controller
> > +* 1 Real-Time Clock
> >
> >  The machine has a fixed 2 GiB of RAM. Other memory sizes are rejected.
> >  The machine always exposes all five harts. Other CPU counts are reject=
ed.
> > @@ -101,10 +104,96 @@ CAVEATS:
> >  Running HSS
> >  -----------
> >
> > -The machine ``microchip-icicle-kit`` used to run the Hart Software Ser=
vices
> > -(HSS_), however, the HSS development progressed and the QEMU machine
> > -implementation lacks behind.  Currently, running the HSS no longer wor=
ks.
> > -There is missing support in the clock and memory controller devices.  =
In
> > -particular, reading from the SD card does not work.
> > +The ``microchip-icicle-kit`` machine can boot the Hart Software Servic=
es
> > +(HSS_), which then loads an HSS payload containing U-Boot from an SD c=
ard.
> > +The following flow was tested with HSS v2024.06 and Buildroot 2026.05.
> > +
> > +Configure HSS for the ``mpfs-icicle-kit-es`` board using its default
> > +configuration. QEMU provides the software-visible registers and determ=
inistic
> > +status consumed by the HSS v2024.06 DDR initialization and training fl=
ow;
> > +it does not model the electrical properties of DDR training. HSS requi=
res
> > +the RISC-V bare-metal toolchain supplied by Microchip SoftConsole to b=
e
> > +available in ``PATH``.  Build the tested HSS version with:
> > +
> > +.. code-block:: bash
> > +
> > +  $ git clone https://github.com/polarfire-soc/hart-software-services.=
git
> > +  $ cd hart-software-services
> > +  $ git checkout v2024.06
> > +  $ make BOARD=3Dmpfs-icicle-kit-es defconfig
> > +  $ make -j$(nproc) BOARD=3Dmpfs-icicle-kit-es
> > +
> > +The HSS build creates both the raw wrapper and an eNVM programming ima=
ge.  QEMU
> > +needs the complete eNVM image, including the 256-byte boot header adde=
d by the
> > +Microchip boot mode programmer. Convert the generated Intel HEX file t=
o a raw
> > +binary image, for example:
> > +
> > +.. code-block:: bash
> > +
> > +  $ riscv64-unknown-elf-objcopy -I ihex -O binary \
> > +      build/hss-envm-wrapper.mpfs-icicle-kit-es.hex build/hss.bin
> > +
> > +Do not pass ``build/hss-envm-wrapper.bin`` directly to QEMU. That file=
 starts
> > +at eNVM offset 0x100 and does not contain the boot header with the ima=
ge size
> > +and per-hart reset vectors.
> > +
> > +Build the SD card image with the tested Buildroot version:
> > +
> > +.. code-block:: bash
> > +
> > +  $ git clone https://gitlab.com/buildroot.org/buildroot.git
> > +  $ cd buildroot
> > +  $ git checkout 2026.05
> > +  $ make microchip_mpfs_icicle_defconfig
> > +  $ make
> > +
> > +This produces ``output/images/sdcard.img`` with three GPT partitions:
> > +
> > +* An HSS ``payload.bin`` containing U-Boot.
> > +* A FAT partition containing ``boot.scr`` and the kernel FIT image.
> > +* An ext4 Linux root filesystem.
> > +
> > +The QEMU SD card model requires a power-of-two image size. Make a spar=
se
> > +4 GiB working copy and relocate its backup GPT to the new end of the i=
mage:
> > +
> > +.. code-block:: bash
> > +
> > +  $ cp --reflink=3Dauto output/images/sdcard.img sdcard.img
> > +  $ truncate -s 4G sdcard.img
> > +  $ sgdisk -e sdcard.img
> > +  $ sgdisk -v sdcard.img
> > +
> > +The Icicle Kit firmware device tree in the FIT image describes 2 GiB o=
f RAM,
> > +matching the machine's fixed RAM size. The command below keeps ``-m 2G=
``
> > +explicit.  Attach the image as an SD card and route both board serial =
ports:
> > +
> > +.. code-block:: bash
> > +
> > +  $ qemu-system-riscv64 \
> > +      -M microchip-icicle-kit -smp 5 -m 2G \
> > +      -bios path/to/hss/build/hss.bin \
> > +      -drive if=3Dsd,file=3Dpath/to/sdcard.img,format=3Draw \
> > +      -display none \
> > +      -serial file:hss.log \
> > +      -serial stdio \
> > +      -no-reboot
> > +
> > +HSS writes to MMUART0, which the command records in ``hss.log``. U-Boo=
t and
> > +Linux use MMUART1, which remains connected to the terminal. A successf=
ul
> > +boot proceeds through HSS payload loading, U-Boot, the Linux kernel, a=
nd the
> > +login prompt from the root filesystem on the third partition.
> > +
> > +Known limitations
> > +-----------------
> > +
> > +* The tested HSS v2024.06 flow contains 2 separate multi-hart startup =
races
> > +  issues which is still not fixed as of the latest v2026.04 release. A=
 boot
> > +  may therefore stall at the very beginning or after successful DDR tr=
aining
> > +  during the OpenSBI/U-Boot handoff.
>
> Some symptoms would be nice, so as to differentiate between the known
> issues and other potential problems.
>

Sure, will add in v3.

> > +* The SD card model requires the raw image size to be a power of two. =
Keep
> > +  the backup GPT header at the end when resizing the image.
> > +* The machine does not generate an Icicle Kit device tree. Firmware bo=
ot must
> > +  provide one in its payload or FIT image;
>
> There's 3 options actually. Either the HSS has one itself, there's one
> in the HSS payload or the software brings it - be that in a fit
> image or part of a U-Boot binary.
>

ditto

>
> > direct kernel boot must use
> > +  ``-dtb`` as described above.
> >
> >  .. _HSS: https://github.com/polarfire-soc/hart-software-services
> > --

Regards,
Bin

