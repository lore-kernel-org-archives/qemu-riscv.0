Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXMjJ-00006o-KA
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 08:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXMjH-00006K-0H
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 08:42:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXMjE-0008Ph-Pd
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 08:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677678164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MScLB+8lbFGwRQBY52TOhEDcemJszYTl7LVgeyNiOxI=;
 b=UmerQEG6JXyXxk/C4jikx5M0pXMGyEZgOkyxpINBsiJ2tNEz3EfJ8rlOITl7Ks92WuKsDA
 QLFSrLDH1LJEi8igM1oRlz4hOIzQE7Jo0SS4vApgvvlgcVAsAdI3Sn5lEYNBsvR5LH1Gpq
 iTK1soNUkC2ZofzaYf2MCwalC1Um7IY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-8FDi0rvJPU-jWXFWFuVNmw-1; Wed, 01 Mar 2023 08:42:43 -0500
X-MC-Unique: 8FDi0rvJPU-jWXFWFuVNmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so5328571wms.9
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 05:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677678162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MScLB+8lbFGwRQBY52TOhEDcemJszYTl7LVgeyNiOxI=;
 b=rMfGPtfCyya5VYrDdJ2zqnxJUF2di+EVVmYquS1POUJjz0X+baI8l7/td1xuw1FqcO
 x8K/0Mw1armk4IToNTNZ0RLQHZZHSXgm7WWh5Q6+CM5r+lielC1fvP1PA3n1S6J1oSP2
 +450IxXF7G6DtsFM9uDyc6Zt0mJuqEwawERgoX+HT1VpnxpFSzQM0c+e/f3FylL1KuzD
 69LjcAiQm3OVrWUE//AOpfc5e2lD0OXJkubLN7usgTKjoVre/DQWvX3OcCxJgNKiakCC
 1hCXfZ7vTqYzD4+wVgsPlEMjvtE12PhrT5lw1ncirIoKBBoEkslKjYJst91F6C3LwCLI
 NEyw==
X-Gm-Message-State: AO0yUKWX1Wfp6AlXF3JgmD6vUP3fIPE34jF5NNZDtY9SPZ7Ny2UP6hew
 KDG4bjA9o+OE3hXfQdAhVVsJuMRk02Z1oCs30QCH0joV0D6jQggAqKirPCFBej0v/BVKJaN/e9A
 ywtPsLLxuVf0kM44=
X-Received: by 2002:a05:600c:4fd4:b0:3eb:cf1:f2b6 with SMTP id
 o20-20020a05600c4fd400b003eb0cf1f2b6mr5570417wmq.14.1677678161826; 
 Wed, 01 Mar 2023 05:42:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/smHQs9bXXitsZnvk5cbJTvcuBuXOF1jOzivWIWVrCSNEurAWqdDQ9/wZ4a8dZX90cqlaZ3A==
X-Received: by 2002:a05:600c:4fd4:b0:3eb:cf1:f2b6 with SMTP id
 o20-20020a05600c4fd400b003eb0cf1f2b6mr5570397wmq.14.1677678161472; 
 Wed, 01 Mar 2023 05:42:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c358400b003dc5b59ed7asm17555933wmq.11.2023.03.01.05.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 05:42:40 -0800 (PST)
Date: Wed, 1 Mar 2023 14:42:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 00/19] hw: Set QDev properties using QDev API (part 1/3)
Message-ID: <20230301144239.7dc58097@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 01 Mar 2023 13:42:48 -0000

On Fri,  3 Feb 2023 19:08:55 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> QEMU provides the QOM API for core objects.
> Devices are modelled on top of QOM as QDev objects.
>=20
> There is no point in using the lower level QOM API with
> QDev; it makes the code more complex and harder to review.
>=20
> I first converted all the calls using errp=3D&error_abort or
> &errp=3DNULL, then noticed the other uses weren't really
> consistent.
>=20
> A QDev property defined with the DEFINE_PROP_xxx() macros
> is always available, thus can't fail. When using hot-plug
> devices, we only need to check for optional properties
> registered at runtime with the object_property_add_XXX()
> API. Some are even always registered in device instance_init.
>=20
> I have probably been overzealous, so I tagged the patches
> not using errp=3D&error_abort|&error_fatal|NULL as RFC.

such patches are wrong (12/19 is definitely broken),
you can do above only if failure is not expected
otherwise you are killing QEMU process during runtime.

So if you do this, plse describe in commit message why
it isn't breaking anything for each case.

>=20
> PPC and ARM conversions will follow as two different series.
>=20
> Philippe Mathieu-Daud=C3=A9 (19):
>   scripts/coccinelle: Add qom-qdev-prop.cocci
>   hw/qdev: Introduce qdev_prop_set_link()
>   hw/acpi: Set QDev properties using QDev API
>   hw/audio: Set QDev properties using QDev API
>   hw/core/numa: Set QDev properties using QDev API
>   hw/core/gpio: Set QDev properties using QDev API
>   hw/scsi: Set QDev properties using QDev API
>   hw/usb: Set QDev properties using QDev API
>   hw/virtio: Set QDev properties using QDev API
>   hw/avr: Set QDev properties using QDev API
>   hw/hppa: Set QDev properties using QDev API
>   hw/i386: Set QDev properties using QDev API
>   hw/m68k: Set QDev properties using QDev API
>   hw/microblaze: Set QDev properties using QDev API
>   hw/mips: Set QDev properties using QDev API
>   hw/nios2: Set QDev properties using QDev API
>   hw/riscv: Set QDev properties using QDev API
>   hw/rx: Set QDev properties using QDev API
>   hw/sparc: Set QDev properties using QDev API
>=20
>  hw/acpi/cpu_hotplug.c                    |  7 ++--
>  hw/acpi/ich9.c                           |  4 +--
>  hw/acpi/piix4.c                          |  4 +--
>  hw/avr/arduino.c                         |  4 +--
>  hw/avr/atmega.c                          |  4 +--
>  hw/core/gpio.c                           |  8 ++---
>  hw/core/numa.c                           |  4 +--
>  hw/core/qdev-properties.c                |  5 +++
>  hw/display/virtio-gpu-pci.c              |  4 +--
>  hw/display/virtio-vga.c                  |  4 +--
>  hw/dma/sparc32_dma.c                     |  6 ++--
>  hw/hppa/machine.c                        |  3 +-
>  hw/i386/pc.c                             |  8 ++---
>  hw/i386/pc_q35.c                         | 25 +++++++-------
>  hw/i386/sgx.c                            |  3 +-
>  hw/i386/x86.c                            | 12 +++----
>  hw/m68k/next-cube.c                      |  2 +-
>  hw/m68k/q800.c                           |  7 ++--
>  hw/mem/pc-dimm.c                         |  5 ++-
>  hw/microblaze/petalogix_ml605_mmu.c      | 40 ++++++++++------------
>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c          | 40 +++++++++-------------
>  hw/mips/boston.c                         |  6 ++--
>  hw/mips/cps.c                            | 42 ++++++++----------------
>  hw/mips/jazz.c                           |  3 +-
>  hw/mips/malta.c                          |  6 ++--
>  hw/nios2/10m50_devboard.c                |  2 +-
>  hw/riscv/microchip_pfsoc.c               |  8 ++---
>  hw/riscv/opentitan.c                     |  9 ++---
>  hw/riscv/shakti_c.c                      |  7 ++--
>  hw/riscv/sifive_e.c                      |  8 ++---
>  hw/riscv/sifive_u.c                      |  9 ++---
>  hw/riscv/spike.c                         | 10 +++---
>  hw/riscv/virt.c                          |  9 ++---
>  hw/rx/rx-gdbsim.c                        | 11 +++----
>  hw/scsi/scsi-bus.c                       |  6 +---
>  hw/sparc/sun4m.c                         | 10 +++---
>  hw/sparc64/sun4u.c                       |  3 +-
>  hw/usb/hcd-xhci-pci.c                    |  2 +-
>  hw/usb/hcd-xhci-sysbus.c                 |  2 +-
>  hw/virtio/virtio-iommu-pci.c             |  3 +-
>  hw/virtio/virtio-rng.c                   |  3 +-
>  include/hw/audio/pcspk.h                 |  2 +-
>  include/hw/qdev-properties.h             |  1 +
>  target/i386/cpu.c                        |  6 ++--
>  target/i386/host-cpu.c                   |  7 ++--
>  46 files changed, 155 insertions(+), 221 deletions(-)
>  create mode 100644 scripts/coccinelle/qom-qdev-prop.cocci
>=20


