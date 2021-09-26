Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUP4r-0004s2-Gr
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 04:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUP4p-0004p8-VD; Sun, 26 Sep 2021 03:59:59 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUP4o-0006NN-49; Sun, 26 Sep 2021 03:59:59 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v10so16196342ybq.7;
 Sun, 26 Sep 2021 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2JXuPJDPZnhPS5pvhJgjItsXgftt5KRypqBdA5Z5V74=;
 b=bqTAOyb+/VqOYY9bPf+di9ANVDTs35hRLbHfjcoflmyjehJa+JtTvwtLEpLyXzVrdf
 5TioFA+VF3QRsrVdlT+D1NGoCpZSHufPpZfFV6DCqclo6XxCQK7PilZ3VxefPD6rR4nI
 KXAGvlfy2Ud9cL6tw2GhPP9DCKf8G16jsrpbFZDWclaJOXUJtwnPnu31Bw3vGYuHGyG3
 bLJ0pEK3zgWTUYhMgvRMhHElxiKyUHOqFa3K1CeMHcH0KoraDvI8SeurOGmYVrsugOFr
 +7qVGirTzHNLOuZgdXn2HC2aS7a/HxZ5l6AuBxKp7CmoatI9gu5JZS3E/+Kuv2fW066I
 A9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2JXuPJDPZnhPS5pvhJgjItsXgftt5KRypqBdA5Z5V74=;
 b=RNkfBm5RFFhG38z3uhcN9zJbu+uVqUpWjgw4cX2OIPUgXahp0lu6XVMPVtlG2C3bwq
 MqQU9LmxIzid0xNgzm5uWlfIQCMP2muXcxBfdK8SKyTlrN7mY2r2Sbdl5qP8+ZNME+qk
 qxVfd7TImLDTlG1YLe6cA/ysWIAlhb2nI2qTrsWYzCC5Mxg0eyCLCsbtVz+ZOJ3ib8bd
 JSx6hrWP1oQG+dZNKB6IrXdwujlcynRWGKd2TklP6D3HnHN0MlOKGZ3mOkXF0db609J2
 wYl5H2hEcB/G67X4pfSXnyuowRinK0KZP9a5sJ45zKWoq31fUA6RzY0gmZqZh+7JMb0x
 nFjQ==
X-Gm-Message-State: AOAM532JqoueLzGrwXYJJ0egCJBQmNmw9ZqFNy7e5z/XzY/9CX7pS/IL
 EGpaShYrPEadX/sTRX7MqYEzfkP0I/4RzqI5lfw=
X-Google-Smtp-Source: ABdhPJwnPcNtl3hGBdcwizbumopgq2Rif90RdLJsbSmI7VdkiNvN/yxQa4em1o0SZvSZkmLomazvmmOcMv6OJ0oO530=
X-Received: by 2002:a25:905:: with SMTP id 5mr23416587ybj.293.1632643196568;
 Sun, 26 Sep 2021 00:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
 <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
In-Reply-To: <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 26 Sep 2021 15:59:45 +0800
Message-ID: <CAEUhbmW3V06da0Trp+oyE+=sc1w=S7Kg7Zs=GaNjJ8qd7kfT=A@mail.gmail.com>
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Sun, 26 Sep 2021 08:00:00 -0000

Hi Philippe,

On Thu, Sep 23, 2021 at 6:29 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >>
> >> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
> >> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
> >> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
> >> - Keep mchp_pfsoc_mmuart_create() behavior
> >
> > Thanks for taking care of the updates!
> >
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   include/hw/char/mchp_pfsoc_mmuart.h | 16 ++++--
> >>   hw/char/mchp_pfsoc_mmuart.c         | 77 +++++++++++++++++++++++----=
--
> >>   2 files changed, 73 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mch=
p_pfsoc_mmuart.h
> >> index f61990215f0..b484b7ea5e4 100644
> >> --- a/include/hw/char/mchp_pfsoc_mmuart.h
> >> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> >> @@ -28,16 +28,22 @@
> >>   #ifndef HW_MCHP_PFSOC_MMUART_H
> >>   #define HW_MCHP_PFSOC_MMUART_H
> >>
> >> +#include "hw/sysbus.h"
> >>   #include "hw/char/serial.h"
> >>
> >>   #define MCHP_PFSOC_MMUART_REG_SIZE  52
> >>
> >> -typedef struct MchpPfSoCMMUartState {
> >> -    MemoryRegion iomem;
> >> -    hwaddr base;
> >> -    qemu_irq irq;
> >> +#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
> >> +OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
> >>
> >> -    SerialMM *serial;
> >> +typedef struct MchpPfSoCMMUartState {
> >> +    /*< private >*/
> >> +    SysBusDevice parent_obj;
> >> +
> >> +    /*< public >*/
> >> +    MemoryRegion iomem;
> >> +
> >> +    SerialMM serial_mm;
> >>
> >>       uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
> >>   } MchpPfSoCMMUartState;
> >> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> >> index 2facf85c2d8..74404e047d4 100644
> >> --- a/hw/char/mchp_pfsoc_mmuart.c
> >> +++ b/hw/char/mchp_pfsoc_mmuart.c
> >> @@ -22,8 +22,9 @@
> >>
> >>   #include "qemu/osdep.h"
> >>   #include "qemu/log.h"
> >> -#include "chardev/char.h"
> >> +#include "qapi/error.h"
> >>   #include "hw/char/mchp_pfsoc_mmuart.h"
> >> +#include "hw/qdev-properties.h"
> >>
> >>   static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, un=
signed size)
> >>   {
> >> @@ -63,23 +64,69 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops=
 =3D {
> >>       },
> >>   };
> >>
> >> -MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> >> -    hwaddr base, qemu_irq irq, Chardev *chr)
> >> +static void mchp_pfsoc_mmuart_init(Object *obj)
> >>   {
> >> -    MchpPfSoCMMUartState *s;
> >> -
> >> -    s =3D g_new0(MchpPfSoCMMUartState, 1);
> >> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> >> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(obj);
> >>
> >>       memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s=
,
> >>                             "mchp.pfsoc.mmuart", 0x1000);
> >> +    sysbus_init_mmio(sbd, &s->iomem);
> >>
> >> -    s->base =3D base;
> >> -    s->irq =3D irq;
> >> -
> >> -    s->serial =3D serial_mm_init(sysmem, base, 2, irq, 399193, chr,
> >> -                               DEVICE_LITTLE_ENDIAN);
> >> -
> >> -    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
> >> -
> >> -    return s;
> >> +    object_initialize_child(obj, "serial-mm", &s->serial_mm, TYPE_SER=
IAL_MM);
> >> +    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), =
"chardev");
> >
> > Do we have a common convention for what needs to be done in the
> > instance_init() call and what in the realize() call?
>
> No official convention IFAIK, but Peter & Markus described it in a
> thread 2 years ago, IIRC it was about the TYPE_ARMV7M model.
>
> See armv7m_instance_init() and armv7m_realize().
>
> stellaris_init() does:
>
>      nvic =3D qdev_new(TYPE_ARMV7M);
>      qdev_connect_clock_in(nvic, "cpuclk",
>                            qdev_get_clock_out(ssys_dev, "SYSCLK"));
> (1) qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
> (2) object_property_set_link(OBJECT(nvic), "memory",
>                               OBJECT(get_system_memory()), &error_abort);
> (3) sysbus_realize_and_unref(SYS_BUS_DEVICE(nvic), &error_fatal);
>
> static void armv7m_instance_init(Object *obj)
> {
>      ...
>      object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
>      object_property_add_alias(obj, "num-irq",
>                                OBJECT(&s->nvic), "num-irq");
>
> For (1) to set the "num-irq" property (aliased to TYPE_NVIC)
> before realization (3), it has to be available (aliased) first,
> thus has to be in the instance_init() handler.
>
> When the child creation depends on a property which is set by
> the parent, the property must be set before the realization,
> then is available in the realize() handler. For example with (2):
>
> static void armv7m_realize(DeviceState *dev, Error **errp)
> {
>      ...
>      if (!s->board_memory) {
>          error_setg(errp, "memory property was not set");
>          return;
>      }
>      memory_region_add_subregion_overlap(&s->container, 0,
>                                          s->board_memory, -1);
>
> If your model only provides link/aliased properties, then it
> requires a instance_init() handler. If no property is consumed
> during realization, then to keep it simple you can avoid
> implementing a realize() handler, having all setup in instance_init().
>
> If your model only consumes properties (no link/alias), it must
> implement a realize() handler, and similarly you can skip the
> instance_init(), having all setup in realize().
>
> Now instance_init() is always called, and can never fail.
> The resources it allocates are freed later in instance_finalize().
>
> realize() can however fails and return error. If it succeeds,
> the resources are released in unrealize().
>
> If you have to implement realize() and it might fail, then it is
> cheaper to check the failing conditions first, then allocate
> resources. So in that case we prefer to avoid instance_init(),
> otherwise on failure we'd have allocated and released resources
> we know we'll not use. Pointless.
>
> Hope this is not too unclear and helps...
>

These are really helpful. Thanks a lot!

Do you think if we find a place in docs/develop to document such best
practice (qom.rst)?

> > For example, I see some devices put memory_region_init_io() and
> > sysbus_init_mmio() in their realize().
>
> Following my previous explanation, it is better (as cheaper) to
> have them in realize() indeed :)
>

Regards,
Bin

