Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC35C7EE22
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:15:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pyQYc-0007eQ-TF; Mon, 15 May 2023 01:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pyQYF-0007cd-Uf; Mon, 15 May 2023 01:15:16 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pyQY4-0004lk-Dz; Mon, 15 May 2023 01:15:10 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-780bb3b96e0so6159267241.0; 
 Sun, 14 May 2023 22:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684127700; x=1686719700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwUYxZVfEPnQruDWJQLoNn1xCuct0OpkqvfNpdsjNts=;
 b=oU7Qm8s0rAMkTX4WXL5BkiWWTcIBqT/Avs0w9EXa4xjYc4AufBLkulnbNgzTpegvmt
 5cccVKfptcm1JLVX6VPYDtlSRbZZaltl4pzwFKW9fDF+csqK4ix3ff/oWbFlOAfIzyb1
 E3OFpmUf0IvtLV9e0uz60dP939uhtmAKlWsZHZeLVvKjzmpjUBBWStiRY3TsUJ+QaRQW
 9Kqps/KLXJNyqwgUeDIj0LoH9Ovm0urHM/nVmoxnE6TkfUvg0g9rKvEPv9f5Qih0ZhG/
 aBHCgjjNeTA8FgSic2Eu31rZaCFilJelu6Kg0tMBHvIE14xguOPHLqlxpQFo/9HGhcft
 kljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684127700; x=1686719700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwUYxZVfEPnQruDWJQLoNn1xCuct0OpkqvfNpdsjNts=;
 b=l4SZUEHflbDeR5Eri9AcejqUCWerJCd4i1XxIzp7xGsDLTJ1IQRWeFHTWGsed0GLtN
 9FQOtgbtaeiYrg2Wfk8ktus/4oRwvFpxyWnAs12uI4UXRYdaD6AmW+qInjyE9MKMMaW7
 H+iRLSJ4UdbVDn2+HvnUihZiTCpPZpIu5mKpJaqo7psd6ASayZ8vnFspWwVF7y7F0Rtf
 ux0YvvYKH/Cvn3mlxeeJzx7Ge6DZQFb6fhvgBTMj5EjiWCbUboQO3eRZ86qbbzS4osmO
 lp02FhQBA4SykRgaDBf/eym28fi28nR00hkdaafvqsC1FYNwMVKwBW87L8rrDqDRWm0v
 zE4A==
X-Gm-Message-State: AC+VfDwlDOjx/p6eGjv0GawHVHvLMmiD6u3Xn7IqIXBEl0gH6IBXgN+7
 UA3XMIeu8qdMhxh0HghWbDLzo05AZ7ihxeD2d1VIRZ0Aeyxqiw==
X-Google-Smtp-Source: ACHHUZ721I3PGX00L2Edh27pzs2CEFlqmhic6yAg1XO7d/UVZD2rdRqHL6bRfwWQLnI26hgCbnhrZi7DmAxrYW3ocQY=
X-Received: by 2002:a1f:3fc1:0:b0:453:8523:c9dd with SMTP id
 m184-20020a1f3fc1000000b004538523c9ddmr5456176vka.8.1684127699953; Sun, 14
 May 2023 22:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230425073509.3618388-1-yong.li@intel.com>
 <CAKmqyKPOuryjYD=c=aJ0n0hfSx29HebGsyKwwUUa9U0GpfwOxg@mail.gmail.com>
 <8cea83b6-38eb-88a2-2ca5-fef6e67df75c@intel.com>
In-Reply-To: <8cea83b6-38eb-88a2-2ca5-fef6e67df75c@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 May 2023 15:14:33 +1000
Message-ID: <CAKmqyKOrwK+EzHskfG67hjYDfEeaX8scvFj5CyNnDTDzZmKYyA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv/virt: Add a second UART for secure world
To: "Li, Yong" <yong.li@intel.com>
Cc: qemu-devel@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 8, 2023 at 11:48=E2=80=AFAM Li, Yong <yong.li@intel.com> wrote:
>
> Hi Alistair,
>
> Thanks for the information, what I'm doing is to implement the
> StandaloneMm and secure boot feature for RISC-V by following the ARM's wa=
y
>
> https://trustedfirmware-a.readthedocs.io/en/latest/components/secure-part=
ition-manager-mm.html

That is something worth including in the commit message, to help
explain what your patch is trying to do.

>
> So here what I need from virt is actually the VIRT_SECURE_UART which
> will be delicately and isolated/used for secure world like it is in arm
> virt
>
> (the isolation could be controlled by riscv worldguard feature if qemu
> will support)
>
> Similar definition in ARM virt is
> https://github.com/qemu/qemu/blob/38441756b70eec5807b5f60dad11a93a9119986=
6/hw/arm/virt.c#L142

The ARM implementation isn't the same as this patch though. The ARM
virt machine added a secure memory region and guarded the entire
change behind a flag.

You can see the below commit for more details on the ARM implementation

commit 3df708eb48180fcf11956b81fd6a036cd13ed5f1
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Jan 21 14:15:07 2016 +0000

   hw/arm/virt: add secure memory region and UART

   Add a secure memory region to the virt board, which is the
   same as the nonsecure memory region except that it also has
   a secure-only UART in it. This is only created if the
   board is started with the '-machine secure=3Don' property.

>
> I guess the secure uart should not be pass-through from the pcie, it
> would be more reasonable to make it a dedicated one in virt.c compared
> to the UART0 in normal world.

Why can't the secure world not use the existing UART and the
non-secure world use a PCIe UART?

>
>
> So sorry, I did not know the background and did not make it clear in the
> patch (it is not a second uart for normal world usage for vm,
> application and etc),

The patch does add a second UART for use by anyone though. It's not
only available to secure world

>
> It is an UART for secure world. I guess I can re-do the patch and change
> the VIRT_UART1 to VIRT_SECURE_UART  to make it clear.

It would also be worth pointing to documentation or a spec that
describes why having a second UART is important for secure world.

It's probably worth sending a v4 with a detailed commit message
describing why this patch is required. That should include details
about why a second UART is important for secure world. That helps the
patch get accepted in the first place, but also include useful
information for future users.

Alistair

>
> Please let me know if further comments. Thanks so much!
>
>
> On 2023/5/8 7:05, Alistair Francis wrote:
> > On Tue, Apr 25, 2023 at 5:36=E2=80=AFPM Yong Li <yong.li@intel.com> wro=
te:
> >> The virt machine can have two UARTs and the second UART
> >> can be used by the secure payload, firmware or OS residing
> >> in secure world. Will include the UART device to FDT in a
> >> seperated patch.
> >>
> >> Signed-off-by: Yong Li <yong.li@intel.com>
> >> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > This has come up before (see
> > https://gitlab.com/qemu-project/qemu/-/issues/955) and we decided that
> > we don't want to add a second UART. If you would like a second one you
> > can attach it via PCIe.
> >
> > I think we need a really compelling reason to add another UART. There
> > was a push recently to move more towards a "PCIe board" where
> > everything is attached via PCIe, and this is going in the opposite
> > direction.
> >
> > Alistair
> >
> >> ---
> >>   hw/riscv/virt.c         | 4 ++++
> >>   include/hw/riscv/virt.h | 2 ++
> >>   2 files changed, 6 insertions(+)
> >>
> >> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >> index 4e3efbee16..8e11c4b9b3 100644
> >> --- a/hw/riscv/virt.c
> >> +++ b/hw/riscv/virt.c
> >> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] =3D {
> >>       [VIRT_APLIC_S] =3D      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) =
},
> >>       [VIRT_UART0] =3D        { 0x10000000,         0x100 },
> >>       [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
> >> +    [VIRT_UART1] =3D        { 0x10002000,         0x100 },
> >>       [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
> >>       [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
> >>       [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
> >> @@ -1506,6 +1507,9 @@ static void virt_machine_init(MachineState *mach=
ine)
> >>       serial_mm_init(system_memory, memmap[VIRT_UART0].base,
> >>           0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193=
,
> >>           serial_hd(0), DEVICE_LITTLE_ENDIAN);
> >> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
> >> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
> >> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
> >>
> >>       sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
> >>           qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
> >> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> >> index e5c474b26e..8d2f8f225d 100644
> >> --- a/include/hw/riscv/virt.h
> >> +++ b/include/hw/riscv/virt.h
> >> @@ -74,6 +74,7 @@ enum {
> >>       VIRT_APLIC_S,
> >>       VIRT_UART0,
> >>       VIRT_VIRTIO,
> >> +    VIRT_UART1,
> >>       VIRT_FW_CFG,
> >>       VIRT_IMSIC_M,
> >>       VIRT_IMSIC_S,
> >> @@ -88,6 +89,7 @@ enum {
> >>   enum {
> >>       UART0_IRQ =3D 10,
> >>       RTC_IRQ =3D 11,
> >> +    UART1_IRQ =3D 12,
> >>       VIRTIO_IRQ =3D 1, /* 1 to 8 */
> >>       VIRTIO_COUNT =3D 8,
> >>       PCIE_IRQ =3D 0x20, /* 32 to 35 */
> >> --
> >> 2.25.1
> >>
> >>

