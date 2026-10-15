Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8DECC6B2D
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 02:28:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHBCT-0004Zu-KS; Wed, 14 Oct 2026 22:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHBCQ-0004ZL-IT
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 22:28:07 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHBCO-0002RZ-EP
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 22:28:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so2313887a12.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 19:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792031282; cv=none;
 d=google.com; s=arc-20260327;
 b=UzpIDp03uSulemMXV+GqJmi9x5ipJ81zhbm2b/83Fd0E6JXdUZIsM9DGKU1FWt3VV6
 e/0+iFr4fFAe3QpGRooc6t5ByumliXdUFB1A633t4PkK+ubxXgdGAjPYr3Lzooa0J/sg
 hwohBcYQWAukYHQT/Yo+bY/PtxndjmtqiX53//Yhqs6xbpXgXz5PO+uMlEt7qlwUD2KU
 0os0Xuz2CqJLkTJYgSIT+2g0IZdHKOzDKlrF2Oy012SKsDmrgZqGJEb1TFG4EL8KD2i4
 W+LAQvcL1gydjowgoaalx/liJTpY/pKJpioy6/mIec3u8unH6ijaHXAzwkwSwea4Ku7z
 TRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=HgpTnaG1M0fZ8+ixlQuNqjXfAUXaGLgPrQ17b+wBbEg=;
 fh=NFSWFA61oUHxGmcV9Yxs8gznnUbMO73JTohRuYfrgKA=;
 b=mtA1KRhXi0XNO1W//ZHVZ3PKx7ZUVkp5pvjcB4iUQi5dHwPr+rrkTfKzC6dvN4TZWS
 nmI4Dt1y56hLna2RCs65BlAW5gTI4w1mHv79mgL6oBo8RF3i4XLAM+rkQ1qZV3GBZC5j
 yn8Ybx9Ovd/KXIIZPsNto2/JZ0Damm58vitDXJxzcfqu3CTO0QaZyU1MFdSXlW+Zpawc
 iDqFhDJJ7WbLCwOx9gmvqCGkgQFCEGshFVxoZNalD2wyr0A/46iccK6qGX381jV4BAfL
 CtbEfbrGEqRDB5THJhr8WLE4yUOv2KonUgW6j0mhdzC0SCQgPtGndfE34if0jIVQJPf0
 58Ig==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792031282; x=1792636082; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HgpTnaG1M0fZ8+ixlQuNqjXfAUXaGLgPrQ17b+wBbEg=;
 b=TaiGXu6UbW23j1d8LCnF7AEad6BaXDyWKqEVNyqXGioi8Sh73T183IzpZTzpZOya3s
 jRGv56+fSwDOH3buLde2BC3cv6hvSv1SvClVU7XQt3S6GQ0NaZIs9WZQ03NpAzeUKCYv
 le0sF61YekzenBDYOV0jBzaWkpi+v/tMAeb9TdJCQw9briWo2S1M3wl6scGpz9oTu2TA
 ehhFl7vNc/xuKjhY973bgdzwkHJqdFUSqkYGaUt+5JKAfZ7EwKIhyTEaDk5mL+2N/bzq
 FcCoImIVAKbNqyDsbq+8Ap6y1mpReM2lhM7chbrAW5sgwAKU4BejkqwR0irl9O9lNsp1
 MPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792031282; x=1792636082;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HgpTnaG1M0fZ8+ixlQuNqjXfAUXaGLgPrQ17b+wBbEg=;
 b=EI3giI2lgtfyoDLwIJzH6kuYZJdE7Vzk4vEwjXyhyDuk9lNkRlWZLBKCXOfHEL6Qdp
 /ZrDojhBSZJ6FDjS452nhs41JYeBoX1N/aZQZXfAThgo6x6o/72bxW8NW/uLKAjk9eIo
 m8SpDmd07+UzunCYFcIuPfcwIm2Y1r3MwknAI6B6ScqHdzNHXJVOZmxD9jxofXs8sGxx
 5eKNw3Pa60KHQ3VTrnVrctpC8YUvI22PGl4ACnIsf5qFYgz83QZEGei6ooKziRm0JiVl
 nG1nQ589knO4vxCNsFyI07DqvNp0kW+/EPY2d51eytG32uYRtXj9MNd+fvSZTZ/m5zpN
 f+ng==
X-Forwarded-Encrypted: i=1;
 AKwUvBxG5Bj3VKQyUYWEevsTab/CXrAkEWQLP9rJ30/cors4rKUyrq5uQG0mBIoAqzo4WfPGZ6oSlH7foSsu@nongnu.org
X-Gm-Message-State: AFq9FYJZvrgZYTSUwcJvzT+IPnWnfmkPgR1m2pEvt2LfVy4S/W/KgsJW
 bMMrDfvsFwMRX5id5KF1XIO0Ldag0sYRbO9n37wYxK3LENcZKMir+HDUF6OIoJad9TE5Hm8Pjws
 cszEPQzZ5njjgMPMmjrE7mEjb/d5yte4=
X-Gm-Gg: AYBFou3cpbRYyQqg0EcEomTwyR+7uQNBmxDhymi8jo3mwdO4JJ48XwvFTONFrkXD7YV
 kGx9Z+RC2DLA32yztk1Zs9bER8KuNrb0cW6CfgkmVtBwHtA8mzzVDRQsp4xYVveMJGAnrGg1aZw
 BUj5+5ik1LMXHZ9PpY15ZxI6e+kUvX78aRWWxTkh9WcZe9LtDS8YU/zB5Mqwnew/F7Kiyz2hu2i
 C3XIVCBtqFZV0Vg649kIHV3u6embSy86Fco2aCurh4mjgJmsNFvDhjAAsZ9UvJCsNSwqEnUmvjo
 SgebuP+0BocJw9tX2cCK/iA6KxOc2mdyBQpUFGH7kvA6BcsQARrW1mc=
X-Received: by 2002:a05:6402:a0d8:b0:6b1:d2d6:4013 with SMTP id
 4fb4d7f45d1cf-6b1d2d656aamr6151473a12.17.1792031282201; Wed, 14 Oct 2026
 19:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <b0d5c95f-b08d-4a3b-9c8c-7a7575250fdc@oss.qualcomm.com>
In-Reply-To: <b0d5c95f-b08d-4a3b-9c8c-7a7575250fdc@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 15 Oct 2026 10:27:48 +0800
X-Gm-Features: AclHuK_a0u7yDl5zMmDiJ4AwqFZyaiw4cpLpvZh527ZF_Xzmn3-ADaBc2UBnOzc
Message-ID: <CAE2XoE8joYkWK2UyJ3HW+eyDSQt=4ZAgbyKVv1AR9CBHQf6YKQ@mail.gmail.com>
Subject: Re: [PATCH 00/34] single-binary: Select the softmmu target through
 -machine <type>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 qemu-arm@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x534.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Oct 15, 2026 at 1:35=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/14/2026 2:31 AM, Yonggang Luo wrote:
> > MachineClass::targets declares each machine's supported targets as a
> > uint64_t QEMU_ARCH_* mask.
> >
> > In the combined executable, a machine can be selected from
> > <target>-<machine-name> when <machine-name> is ambitious.
> > Otherwise we can use <machine-name> to directly select a target.
> >
> > Renaming SysEmuTarget to EmuTarget prepares the enum for both system an=
d
> > user-mode targets before introducing more usage of it.
> > Rationale:
> > https://lore.kernel.org/qemu-devel/d6217459-1e55-4da0-a49f-bde8215d8c0e=
@oss.qualcomm.com/
> >
> > The "virt" machines need distinct QOM names to coexist in a combined bi=
nary
> > or test. Their existing CLI names and aliases are preserved.
> >
> > Other indirect call of target_info() in class_init/type_init is removed=
 by
> > serveral commits, this is a prepare for select <target> by -machine $ty=
pe.
> > As target_info() will be NULL till the target is selected under machine=
_select.
> >
> > The commits through "hw: add MachineClass::targets with a usage and tes=
t"
> > add a minimal demo/test for introduce MachineClass::targets
> >
> > The next group, through
> > "meson: build combined qemu-system for multi-target configurations",
> > enabled the test guard to prevent introduce future calling
> > target_info() in type_init or class_init
> >
> > These two boundaries provide possible merge points.
> >
> > "targets" be exported along with MachineInfo in commit
> > "qmp: Expose supported targets in query-machines", so that the qmp know
> > how to set proper $<target>-<machine-name>.
> >
> > The rest commits is the introduce of support of <target> select from
> > `-machine $type`.
> >
> > Yonggang Luo (34):
> >   qemu/base-arch-defs: extract QEMU_ARCH_BIT for QEMU_ARCH_* enums
> >   qemu: Use SYS_EMU_TARGET__MAX to define QEMU_ARCH_ALL
> >   qemu: increase width of QEMU_ARCH_* masks enums to be 64 bits
> >   qapi: rename SysEmuTarget to EmuTarget
> >   qapi: add missing Linux user-mode targets to EmuTarget
> >   meson: define TARGET_ARCH_VARIANT to target_name only
> >   target-info: prepare the QOM target list before
> >     module_call_init(MODULE_INIT_QOM)
> >   hw: add MachineClass::targets with a usage and test
> >   accel: register CPU parent for each target
> >   meson: collect Rust crates for combined system target
> >   module: Add module_allow_all_arch for allow all modules be loaded
> >   target/arm: defer max-v8 initializer selection until CPU creation
> >   hw/microblaze: defer PetaLogix endianness default until init
> >   hw/pci: Avoid guard loadparm with target_s390x() for s390x in
> >     class_init
> >   hw/scsi: Avoid guard loadparm with target_s390x() for s390x in
> >     class_init
> >   hw/virtio/virtio-mem: Avoid call to target_info() in class_init
> >   target-info: add a combined-binary query stub
> >   machine: allow -M name to differ from QOM type
> >   hw/riscv/virt: use unique QOM name
> >   hw/arm/virt: use unique QOM name
> >   hw/or1k/virt: use unique QOM name
> >   hw/hexagon/virt: use unique QOM name
> >   hw/loongarch/virt: use unique QOM name
> >   hw/m68k/virt: use unique QOM name
> >   hw/xtensa/virt: use unique QOM name
> >   qapi: return MachineInfo typename from query-machines
> >   machine: match the versioned virt example to arm virt
> >   hw: Add MachineClass.targets for all "virt" machines for all possible
> >     targets
> >   system/arch_init: update qemu_arch_available to handle non-target
> >     select condition
> >   meson: build combined qemu-system for multi-target configurations
> >   qmp: Expose supported targets in query-machines
> >   system/vl: select target from machine name in combined binaries
> >   system/vl: handle cpu/device help properly for multi-target qemu
> >   qdev: Handle device alias ambiguous under multi-target qemu
> >
> >  MAINTAINERS                              |   2 +
> >  accel/accel-common.c                     |   6 +-
> >  accel/accel-internal.h                   |   1 +
> >  accel/accel-system.c                     |  24 +++
> >  accel/accel-user.c                       |   7 +
> >  backends/igvm.c                          |   4 +-
> >  hw/alpha/dp264.c                         |   2 +
> >  hw/arm/virt.c                            |  56 +++----
> >  hw/core/machine-qmp-cmds.c               |  19 ++-
> >  hw/core/machine.c                        |   9 ++
> >  hw/hexagon/virt.c                        |  25 +++-
> >  hw/loongarch/virt.c                      |  47 +++---
> >  hw/m68k/virt.c                           |  39 +++--
> >  hw/microblaze/petalogix_s3adsp1800_mmu.c |  11 +-
> >  hw/misc/vmlaunchupdate.c                 |   6 +-
> >  hw/or1k/virt.c                           |  22 +--
> >  hw/pci/pci.c                             |  18 ++-
> >  hw/riscv/virt.c                          |  28 ++--
> >  hw/scsi/scsi-disk.c                      |  18 ++-
> >  hw/uefi/ovmf-log.c                       |   4 +-
> >  hw/virtio/virtio-mem.c                   |  26 ++--
> >  hw/xtensa/virt.c                         |  24 ++-
> >  include/hw/arm/virt.h                    |   5 +-
> >  include/hw/core/boards.h                 |  45 ++++--
> >  include/hw/hexagon/virt.h                |   5 +-
> >  include/hw/loongarch/virt.h              |   5 +-
> >  include/hw/riscv/virt.h                  |   5 +-
> >  include/monitor/qdev.h                   |   7 +
> >  include/qemu/base-arch-defs.h            |  80 ++++++----
> >  include/qemu/module.h                    |   2 +
> >  include/qemu/target-info-def.h           |   2 +-
> >  include/qemu/target-info-qapi.h          |   4 +-
> >  include/qemu/target-info-qom.h           |   4 +
> >  include/qemu/target-info.h               |   7 +
> >  meson.build                              |  82 +++++++++-
> >  monitor/monitor-hmp-internal.h           |   2 +-
> >  qapi/machine.json                        |  44 +++---
> >  qapi/pragma.json                         |   4 +-
> >  qom/object.c                             |   4 +-
> >  stubs/meson.build                        |   1 +
> >  stubs/target-info.c                      |  10 ++
> >  system/arch_init.c                       |  12 +-
> >  system/qdev-monitor.c                    |  54 ++++++-
> >  system/target-info.c                     |  10 ++
> >  system/vl.c                              | 181 ++++++++++++++++++++---
> >  target-info-def.c                        |   2 +-
> >  target-info-qom.c                        |  26 +++-
> >  target-info.c                            |  38 ++---
> >  target/arm/tcg/cpu-max-v8.c              |  17 ++-
> >  tests/qtest/fuzz/fuzz.c                  |   2 +-
> >  tests/qtest/qom-test.c                   |  65 +++++++-
> >  tests/unit/meson.build                   |   4 +-
> >  tests/unit/test-multi-target.c           |  67 ++++++++-
> >  util/module.c                            |  10 +-
> >  54 files changed, 915 insertions(+), 289 deletions(-)
> >  create mode 100644 stubs/target-info.c
> >  create mode 100644 system/target-info.c
> >
>
> Hi Yonggang,
>
> in a previous thread, we had a long discussion about which direction we
> want to go, and what needs to be implemented. I politely suggested to
> focus first on simply removing dependency in class_init to target_info,

The removing dependency in class_init to target_info is at:

https://lore.kernel.org/qemu-devel/20261013200525.1340-1-luoyonggang@gmail.=
com/

I think it's easy to avoid target_info  in class_init , there is no need to=
 rely
 on is_available for this.


> and rely on is_available only. The idea was to convince you that small
> iteration steps are better than throw-all-in series. I thought we were
> on the same page.

Sorry, I should add the DRAFT in the title, it is just a post for
experiment(means
testing locally) and tells us our direction is correct.
And also I can use it locally. Sorry for the burden.

>
> Now, yet another mega series mixing cleanup, code and even going as far
> as introducing the qemu-system binary.
>
> I feel like spending time to give advice didn't lead to a concrete

Your advice I am hearing and done at
https://lore.kernel.org/qemu-devel/20261013200525.1340-1-luoyonggang@gmail.=
com/

And I explained no need to introduce is_available to avoid
target_info() in class_init.
Because I can not get a usable qemu-system that includes all QOM names.
> change in behavior. As a result, I'm stopping to review all those
> series, and will let others drive this.

I am fine with that, thanks. Others drive(coding) will give more
agreement. Things/Design
sometimes needed in conjunction with code.

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

