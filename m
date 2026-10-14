Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F753CC6B1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 10:46:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGwVN-0005un-8X; Wed, 14 Oct 2026 06:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGwVH-0005sp-F8
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 06:46:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGwVF-0000uy-J5
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 06:46:35 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6afa651700eso5657836a12.2
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 03:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791974791; cv=none;
 d=google.com; s=arc-20260327;
 b=YYH0YtF+4QXhy/FUP6TX5lAtary61odnTYwWhC2pauEhwX20I7cwytdh8D3btZVT6A
 vQwQfuQ5cigrO0HhagnCacwcWCbxMVBhvmnEeOlUjVl3GkKecHC0jE2ZqJtS4yCaUJ2n
 joNC8FRVvos/No5owvNKbVfcMXi+o/YNK30uEUBSVevTIY7cg7h82RKw301sMbeHXqhB
 aYd7LjcG3PrQ9zuLo2swOF6BdFO8rWxLyI/zhlD9NidASaqsbzyVjFa6/T0Y4YxwE6d6
 QNrTACcW6dUK8QRi0/kisLCPlGnz3nELGtLO1L1ZO6Ala6MoYr0nMZtk8/L0YKLeo6yJ
 1Opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=dgAIZN9ZyT5AcReeOiog3uIyPsirNLEYDLgf6GKduJg=;
 fh=/H1BOReCjitHcT65Xfr3mkUhUovU6ude2nE/nDbGoPo=;
 b=r080XEGIVnNQ/S3k8hZWMiAo/TP2NQLgbyJii1wgVTKcBtt39bCAsonrDKbQZcHkB5
 ozuz7+wPWF+SIrtXK8AsFv27priaaxXaVOGBGRMmMtwbxwUMQ5+3BrR9oJ7b4UnJli2t
 +KEwbVy4GAkEYO56CBK7vKiJUePBxeSSw6ffizgd9caQTCzB/fGaxXexK9cSuh8taKt3
 Yq2DTA7wgfQMCwrQHWMTXV/Ewp1NvJdFV9iC7Lu+vwrs1l0ZSJVbEqR/X4CEoMWBmXAt
 yhN4qoLR2VAaZmu/mM0Dp+B4Cis4HF4P1/k4Ay7pWDZoERm8ejo8fsupCWXHAZY6h3al
 efhw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791974791; x=1792579591; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dgAIZN9ZyT5AcReeOiog3uIyPsirNLEYDLgf6GKduJg=;
 b=j1GkAPHNR8UTm7BoqlQTTPk/e/tMxy3RqQbimghhkuSFx8QWrN9YK+DzKJbMrKZm6d
 /TdGd7fIFfVsRjs7oX0jyNS/A3ewV9ISlQmz0yndk4PqOFp4Cq0vqFNUO1b8TeiiEuY3
 5+pGLf1x1I2JF0RKAFZKoq03p67Go9RRFI2rfGaOIDBszqzvyUSwNjnAPhL/OVDo9YXc
 3nQGkgF6U9BvLJoaUgPUGvUTAjO04HRIFvDQm4yF4BFLoq7hy5ov39bUK7KbqEkDbSLa
 vz2NLjQRvmWHmTI1SqgC18smBDO50KkTFgbIkOd4Oe67mGuikm9paXDXCMc9rHh0uOGB
 ZF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791974791; x=1792579591;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dgAIZN9ZyT5AcReeOiog3uIyPsirNLEYDLgf6GKduJg=;
 b=HvGn9hW2RHSBV/5AM0iKMdaaPEwpWK7Tcz//SwopeeAeTBIZL/fCQFKSHFCN6xw4zD
 z53vUZfolkvDPJOEV7aujMideOxgym3q1LLyuBvKjrpHpUeNAMvlb4DG+f6GcvkXKuCK
 GINZfIkS/jlfTwyGmwShBolFjZLmwrFb+yhIGk82jvb56UonjMwkWfhZ5kCprjfZ6C1c
 dDrW9i30wyEflrsw7T9G3IowsszPYj2nfRk4JQB4yCMQ5KiN6Qx2cdyDwOXSkvBLhXgq
 bhVrZ15uKHcdtKGgH+5D/5ipGtCcN81iqkRNca8awL9XE0kdjt6KoySL8fUoSY0EJFIl
 xYYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzsairoCKlJUO/mIpIiDmhGRyccaPJ1NkFg7L0OSkp4qo9kvpyvLKsrveuTvW+wWhS4tIpya8EC8C06@nongnu.org
X-Gm-Message-State: AFq9FYItf88z2RW0dyjsxtxqtw+NCsIe/S618fNeG9jKjdYbeBLrD27W
 GGTYxZvRhridm82btfoIckN74MwlADtO7q5AIkDV7yThtz4uQY69jf6Sr48eIEL5OYN5NhrUyGN
 /18BYk82nfpp+mmSZg/TQ4GZvjA55EgU=
X-Gm-Gg: AYBFou0HwfQj71oc7BB4WI6kXyFSHgjHFu0sWQOhCnmtunMY6upzhq9FFJEmiHG1b1j
 w5DZpGU5V+OsMLwwzICwb6uYPkccFhICJO5FxSE/vBFwO97ieWr802ibQpEjJTPHhUtZX/p60QX
 HKeCpWkY36gS68/7gAUf9xUxAr3LLCbpUgTuTkwQECxOQE8CHyEl+npCTPRZ6ZeG6NPJ1H4XIKU
 ZILm98sLV2rw6LqRWCZk+FXMkYuVkgnH8T995XWM9px6z7bNPOG62kXRwWSFPyUwn0EZRVWgxPc
 998QLgpHn2+25U8LHVLKi0hYoYtDXOXOz1nBMJcjw8Au2bunMCVZafs=
X-Received: by 2002:a05:6402:2808:b0:6b1:d62b:a8dc with SMTP id
 4fb4d7f45d1cf-6b1d62bab4fmr6241459a12.1.1791974790530; Wed, 14 Oct 2026
 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <20261014093152.834-6-luoyonggang@gmail.com>
 <e09a64d3-7632-4f90-bd69-0c6097f8cd78@oss.qualcomm.com>
In-Reply-To: <e09a64d3-7632-4f90-bd69-0c6097f8cd78@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 14 Oct 2026 18:46:14 +0800
X-Gm-Features: AclHuK99CHluDZFrJ7zUw4KmuE82Vz6nlN29M321nxoRS07KNUiRagNm5CzA4Eo
Message-ID: <CAE2XoE_7iHUBUD7bPDNbmEY7qx=ncOaODWNYAezuPivCz1hSMg@mail.gmail.com>
Subject: Re: [PATCH 05/34] qapi: add missing Linux user-mode targets to
 EmuTarget
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-s390x@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 qemu-arm@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x535.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 14, 2026 at 6:25=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 14/10/26 11:31, Yonggang Luo wrote:
> > This usermode targets:
> > aarch64_be
> > armeb
> > microblazeel
> > mipsn32
> > mipsn32el
> > ppc64le
> > sparc32plus
> > are not in machine.json
> >
> > This is a prepare for directly using TARGET_ARCH_VARIANT latter.
> >
> > Also get target-info.c to be compatible with future TARGET_ARCH_VARIANT=
 only usage.
> > So that we can define TARGET_ARCH_VARIANT to target_name directly
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   include/qemu/base-arch-defs.h | 13 +++++++++++++
> >   qapi/machine.json             | 25 +++++++++++++------------
> >   target-info.c                 | 26 +++++++++-----------------
> >   3 files changed, 35 insertions(+), 29 deletions(-)
>
>
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 07fac4f0764..a3d6e08a847 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -15,11 +15,10 @@
> >
> >   ##
> >   # @EmuTarget:
> > -#     The comprehensive enumeration of QEMU system emulation
> > -#     ("softmmu") targets.  Run "./configure --help" in the project
> > -#     root directory, and look for the \*-softmmu targets near the
> > -#     "--target-list" option.  The individual target constants are not
> > -#     documented here, for the time being.
> > +#     The comprehensive enumeration of QEMU system and user-mode
> > +#     emulation targets.  Run "./configure --help" in the project root
> > +#     directory, and look for the targets near the "--target-list"
> > +#     option.  Individual target constants are not documented here.
> >   #
> >   # @rx: since 5.0
> >   #
> > @@ -30,17 +29,19 @@
> >   # @hexagon: since 11.0
> >   #
> >   # .. note:: The resulting QMP strings can be appended to the
> > -#    "qemu-system-" prefix to produce the corresponding QEMU
> > -#    executable name.  This is true even for "qemu-system-x86_64".
> > +#    "qemu-system-" prefix for system emulation, or the "qemu-" prefix
> > +#    for user-mode emulation, to produce the corresponding executable
> > +#    name, where that target supports the respective emulation mode.
> >   #
> >   # Since: 3.0
> >   ##
> >   { 'enum' : 'EmuTarget',
> > -  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'hexagon', 'hppa', 'i38=
6',
> > -             'loongarch64', 'm68k', 'microblaze', 'mips', 'mips64',
> > -             'mips64el', 'mipsel', 'or1k', 'ppc',
> > -             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
> > -             'sh4eb', 'sparc', 'sparc64', 'tricore',
> > +  'data' : [ 'aarch64', 'aarch64_be', 'alpha', 'arm', 'armeb', 'avr',
> > +             'hexagon', 'hppa', 'i386', 'loongarch64', 'm68k', 'microb=
laze',
> > +             'microblazeel', 'mips', 'mips64', 'mips64el', 'mipsel',
> > +             'mipsn32', 'mipsn32el', 'or1k', 'ppc', 'ppc64', 'ppc64le'=
,
> > +             'riscv32', 'riscv64', 'rx', 's390x', 'sh4', 'sh4eb', 'spa=
rc',
> > +             'sparc32plus', 'sparc64', 'tricore',
> >                'x86_64', 'xtensa', 'xtensaeb' ] }
>
> 'machine.json' is for system binaries.
>
> If we want to expose these QAPI types to the user binaries
> (I'm not sure we want...) then this declaration block should
> be moved in another {qapi}.json file. QAPI types are versioned,

OK,

> so we'd need some "  @aarch64_be   # Since v13.0" comments.
>
> Anyway I doubt we want to alter EmuTarget, I'd rather let it
> die as a legacy field, and expose {arch, wordsize, endianness}
Are you talking about base_arch? that won't work(we need mapping to
the EmuTarget to select the $target directly)
What the advantage of EmuTarget is that we can have a one-to-one
mapping from EmuTarget to TargetInfo
That each EmuTarget only mapping to a single TargetInfo, so we can
reliably choose TargetInfo from EmuTarget
that is one item of data

Hi Philippe
rationale:
https://lore.kernel.org/qemu-devel/87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss=
.qualcomm.com/
This was tried before and rejected.

> to management layer if this is important to consume.



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

