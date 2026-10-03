Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97428CA5FEC
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:17:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xD1Tf-0003KV-6q; Sat, 03 Oct 2026 11:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1Te-0003KB-8k
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:16:42 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1Tc-0003UI-Eq
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:16:42 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 00721157ae682-8acf578ba66so938937b3.1
 for <qemu-riscv@nongnu.org>; Sat, 03 Oct 2026 08:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791040599; cv=none;
 d=google.com; s=arc-20260327;
 b=N3sW4DvV7OycXJq2RsFOY9m00Zj2ACyHwvT+nuo+mkhJA0ahixuklfN0d/DJ/oF0sE
 EUdPm1KJVhNINO8e7sGjud5z7fLnztBnqoEu58eHTSQrexYUer6S4NuVhOVi2yIcC39S
 zQsVin1z+jR2nAxqQYJ4cynQARguSZ3+8EkzNDzDsK0q5jZHmagNPZQPvRk9nX0EBqgm
 9t/2srjeILb9plmW25eFM82y4ozVXnNBV5EfvkESsJVYBV4GR8Hco/1L5SMQ9HRF8+PD
 CcZUXIHaACLA3/oAEGZq3WemZ6HOweHgSPGVraEKB+oEcFnxC1ecBiG3Wzc40k9cNDwK
 ilkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jG4fP06KtCkVhnzP9ejS0PCQ44NXt8Tv98QfOTIYTE4=;
 fh=izW4xJsNON+UEMozk+aaiSgENdHwQrivcdfNGXydCWE=;
 b=FqdGj+X733D3UaNhQQDRKHX/l9T3fEswMRiphzS8Tzo6ZP01b6yzNsLXGnQPS4OtNp
 hqnr8xc4DoA9eGfGUOo2+9tx8RJT0la/mI16ofJ0LvlRntvIfMO1oUOJJC2fmMHTFfbd
 OctHPKO/pfPi6bRBIrWcWfcmiIc+tI9HbNsND8cCdSef/tXXRbzvv5FASkztoRzmzyS1
 YvcWjC4xuzfqp2n7pnVOdJRIhRQKyi6wBPclNx75ruWhc98/0l+aXZFRWIeo8mAQHepI
 eIJEnHusYHGordh4uEa6GhyXC+1E/grkytPjfxOUGPP7dG3I4NeWSUngNXkI5Me8lTWp
 ko5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791040599; x=1791645399; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jG4fP06KtCkVhnzP9ejS0PCQ44NXt8Tv98QfOTIYTE4=;
 b=pYzo4kwU6bxyrO/tXOijI+9ZGFQcPmn7bwsBuAdihI9aAAqKQzak4u3LEl7AGT+z0n
 AdKsWROpxITREUqky5tFsdIO+R1tBQALhK/XPpDXgpFrCq6w2Sw7E/zhnoYw73QylgXh
 wSXMykqEKPke47scOCDQdQWm4OS3y1COG0RGDyKOPa/20byg1WhuF7uHabLrh4ilwagv
 ZkbIkeBn+/CCgGAv4wS12mrvNzOe+4AGgGcgB3MNhhBwjb9unVP/yee7rRP4Zx0w91B0
 NxW1/iMLNH5UVaoexAtgM1h3oS5E+PhFHmbUhx4hfIOf/0Frm1kvAAaNql3B0RQu97Di
 j8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791040599; x=1791645399;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jG4fP06KtCkVhnzP9ejS0PCQ44NXt8Tv98QfOTIYTE4=;
 b=Ya3wTYgeYbTDNd4vtxzZw1tEuRZgkA8S6Z4txVdICKgMxBsaWSko8jq6rkl1uUbvZm
 aNu64zCmo2+W+/9CF480bxXhMwQc8ttvWbWwGNbOlstJ+D43TjQ/0q0+/NVcGH01y7od
 CAleadYZvo3IU2Xo8pFu8HzJfKEs/pwmFhgw/X9S0aobluR90TVSr+cKzvh+KG78PN+E
 BeBMII3Y8FuLTJDABibsBNZx0/GZatD9JXdfMD6rX2ktn0OYZSTY/Fqsac+Yv5mzd1Ft
 qP77RmIZfc/myF/blWeIAebspjPKIGk23rMh0KS1EOfY9Awo6a3Fqiy3n3c7LxPhMjkE
 MlRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzGn8fOlRisE2lu4YY2D12LNsh1YI8/O8kL9pLw50cLjnM0At1Wsmn43Or/gSgLl/Lc/vvonjG5r1lt@nongnu.org
X-Gm-Message-State: AFq9FYJ5PWZ2xdat7SNWyMjLM1dNnPJuB212apZVcklGq9RkhYgO4/V3
 qKQkVdfZN/TCMT4cPWdOn8iBQyf8fQdL4yZRazLBTC4g5etb6yzKNBUmku/CVUPJpKOYQXxx88I
 MlhUKCOu1KS4sMGB5pK1iQsPgdWOzUaY=
X-Gm-Gg: AYBFou3L2RfsoS2x2QalM6KeqT+dzJOjwZSMe6pEg3MEgitCYW2G90sEBvNGPysgLE7
 0pTAOjaQUALX4fPFPC+lUYiAdrSGT/P+mG1gnFwkMPZvDjuR507noFSjTgwSw9meHzdaLJVTTXC
 OWyktHBJI1x3roh4+vVVwxKDBR+sS9j9EsbBeu8fIfk9ai8od+EJTGWExoEhHgl0amxqvxx+QWG
 Z/hjaUoCXqNq+Pc18+GCdvrqw/Cie8Wy4ElzSYcsDrcNE/3vAecHUsZkddRQCAkpUoOYTwVH/Ea
 pg0rk32pRXWJg70XQMbr5RPPorOKwqLPSEt9oVeECrs7t3A66eZw5xd2yUm4BqxoydtHPUKWlOD
 HmyiZoeOdOUsy6y8=
X-Received: by 2002:a05:690c:386:b0:8a7:d69f:3c31 with SMTP id
 00721157ae682-8ae39bbaa1cmr23747337b3.9.1791040598979; Sat, 03 Oct 2026
 08:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260904155758.3833179-1-bin.meng@processmission.com>
 <20260904155758.3833179-21-bin.meng@processmission.com>
 <20260930-disparity-announcer-a6bc30a7084c@wendy>
In-Reply-To: <20260930-disparity-announcer-a6bc30a7084c@wendy>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Oct 2026 23:16:27 +0800
X-Gm-Features: AclHuK_nMolFv8ZiMBiFcHxIAIwGGbH-0hM8MRlVFGGfzgv5fVD1BICvNqlNGbY
Message-ID: <CAEUhbmXM_ZQSyRpjUmr83WBFLbasAQ410ybm=vR3TmpbP=4V0A@mail.gmail.com>
Subject: Re: [PATCH v2 20/24] docs/system/riscv: Document Icicle Kit HSS boot
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Conor Dooley <conor@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Conor,

On Wed, Sep 30, 2026 at 6:17=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
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
>
> What's the reason that this is using 2024.06 by the way? Why not use the
> most recent release of the HSS?

This is because the Buildroot v2026.05 release's defconfig for Icicle
Kit board refers to v2024.06 version of
'microchip-hss-payload-generator' which is a tool from HSS, so I chose
to use the same HSS source version to build the HSS to match the tools
version.

>
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

Regards,
Bin

