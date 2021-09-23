Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTLzQ-0005At-Hu
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 06:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLzK-00058U-UZ; Thu, 23 Sep 2021 06:30:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLzJ-0004aQ-02; Thu, 23 Sep 2021 06:29:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id d6so15633477wrc.11;
 Thu, 23 Sep 2021 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=euDRmU9FpyU/+1QubYWj98seT8qnsOJPXCDGyA/Z9FU=;
 b=BbCyS6ID2dyUbJPyt4dYftz0Nx62lmzELqZPudcN26NPS58OEl6SxsjYseH9LOc7dE
 bWyInJNqt6SkRC7vWUpR8koxY+zNsMDIJ87nJSAa4q9Db7n2pCpmLZqgtHzN4xa9wAqO
 tWEpqIyeeIAgWHDy63m/JWR87DBS8qjsEjJFcAPOqlyybBxWxi4Lxqx5kwXbU+FdYql4
 s7Uyp1S4yPbs8d05hfND5Zt5uYXvoXYejseUyYrwv8ecwvQA184it+bKv4JyPC/M42m6
 NHJo+DuAXDgreuFrMhRCT8y2a33L/t/ILRH5QNWM9BzSQwtJ9LrDHcnral+porSwSS5z
 MxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=euDRmU9FpyU/+1QubYWj98seT8qnsOJPXCDGyA/Z9FU=;
 b=XHlog5+ImlaBxS/VVc4SVy5L1OclptcNnfnv/D+UMHHptQJOgdUgS7VshD0VfAvU1g
 C11HalumEOqsMYS/qEcuftBsrfZJ+JqO8hoxL0+iimmz1aUjTmeeP0undH7/qrp/xVWc
 QeN709ucnEsKLCSTxAOUkx4BsYgtpHRh32hFjZe0A+XBhDAi8nnlT2OccONjS75zZrKX
 6YdqUrv+vv51iO+d47BDuhnICxQ0ZQ+vqaas7ZGRDoI7OQfl0Yfs0QVyFUKnkAZSqJ7V
 gltEtXrFhX+TYwtP+Jq4i38R6/lDMnU/LDoC70ZV/6JF601K4ISaqixHNQZJNHPDGwLX
 UIIw==
X-Gm-Message-State: AOAM533/4Bw5yyHanAlwtmex4HTdRuoRos9/CW1ow/TCZwOMBMqOdLJm
 MdQep3ZttTGppT4yLMK9GPM=
X-Google-Smtp-Source: ABdhPJxSthYNzq4UYzQmn2+Cfls8E20PZBJZXzcDZCZD9pDn8mlJJiP/oOZVy12YbMWUg34wPR/x0A==
X-Received: by 2002:a05:6000:156e:: with SMTP id
 14mr4181540wrz.393.1632392995086; 
 Thu, 23 Sep 2021 03:29:55 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y197sm10268072wmc.18.2021.09.23.03.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:29:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
Date: Thu, 23 Sep 2021 12:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 23 Sep 2021 10:30:00 -0000

On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM 
Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
>> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
>> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
>> - Keep mchp_pfsoc_mmuart_create() behavior
> 
> Thanks for taking care of the updates!
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/hw/char/mchp_pfsoc_mmuart.h | 16 ++++--
>>   hw/char/mchp_pfsoc_mmuart.c         | 77 +++++++++++++++++++++++------
>>   2 files changed, 73 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
>> index f61990215f0..b484b7ea5e4 100644
>> --- a/include/hw/char/mchp_pfsoc_mmuart.h
>> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
>> @@ -28,16 +28,22 @@
>>   #ifndef HW_MCHP_PFSOC_MMUART_H
>>   #define HW_MCHP_PFSOC_MMUART_H
>>
>> +#include "hw/sysbus.h"
>>   #include "hw/char/serial.h"
>>
>>   #define MCHP_PFSOC_MMUART_REG_SIZE  52
>>
>> -typedef struct MchpPfSoCMMUartState {
>> -    MemoryRegion iomem;
>> -    hwaddr base;
>> -    qemu_irq irq;
>> +#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
>> +OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
>>
>> -    SerialMM *serial;
>> +typedef struct MchpPfSoCMMUartState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +
>> +    SerialMM serial_mm;
>>
>>       uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
>>   } MchpPfSoCMMUartState;
>> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
>> index 2facf85c2d8..74404e047d4 100644
>> --- a/hw/char/mchp_pfsoc_mmuart.c
>> +++ b/hw/char/mchp_pfsoc_mmuart.c
>> @@ -22,8 +22,9 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "qemu/log.h"
>> -#include "chardev/char.h"
>> +#include "qapi/error.h"
>>   #include "hw/char/mchp_pfsoc_mmuart.h"
>> +#include "hw/qdev-properties.h"
>>
>>   static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
>>   {
>> @@ -63,23 +64,69 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
>>       },
>>   };
>>
>> -MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
>> -    hwaddr base, qemu_irq irq, Chardev *chr)
>> +static void mchp_pfsoc_mmuart_init(Object *obj)
>>   {
>> -    MchpPfSoCMMUartState *s;
>> -
>> -    s = g_new0(MchpPfSoCMMUartState, 1);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(obj);
>>
>>       memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
>>                             "mchp.pfsoc.mmuart", 0x1000);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>>
>> -    s->base = base;
>> -    s->irq = irq;
>> -
>> -    s->serial = serial_mm_init(sysmem, base, 2, irq, 399193, chr,
>> -                               DEVICE_LITTLE_ENDIAN);
>> -
>> -    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
>> -
>> -    return s;
>> +    object_initialize_child(obj, "serial-mm", &s->serial_mm, TYPE_SERIAL_MM);
>> +    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), "chardev");
> 
> Do we have a common convention for what needs to be done in the
> instance_init() call and what in the realize() call?

No official convention IFAIK, but Peter & Markus described it in a
thread 2 years ago, IIRC it was about the TYPE_ARMV7M model.

See armv7m_instance_init() and armv7m_realize().

stellaris_init() does:

     nvic = qdev_new(TYPE_ARMV7M);
     qdev_connect_clock_in(nvic, "cpuclk",
                           qdev_get_clock_out(ssys_dev, "SYSCLK"));
(1) qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
(2) object_property_set_link(OBJECT(nvic), "memory",
                              OBJECT(get_system_memory()), &error_abort);
(3) sysbus_realize_and_unref(SYS_BUS_DEVICE(nvic), &error_fatal);

static void armv7m_instance_init(Object *obj)
{
     ...
     object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");

For (1) to set the "num-irq" property (aliased to TYPE_NVIC)
before realization (3), it has to be available (aliased) first,
thus has to be in the instance_init() handler.

When the child creation depends on a property which is set by
the parent, the property must be set before the realization,
then is available in the realize() handler. For example with (2):

static void armv7m_realize(DeviceState *dev, Error **errp)
{
     ...
     if (!s->board_memory) {
         error_setg(errp, "memory property was not set");
         return;
     }
     memory_region_add_subregion_overlap(&s->container, 0,
                                         s->board_memory, -1);

If your model only provides link/aliased properties, then it
requires a instance_init() handler. If no property is consumed
during realization, then to keep it simple you can avoid
implementing a realize() handler, having all setup in instance_init().

If your model only consumes properties (no link/alias), it must
implement a realize() handler, and similarly you can skip the
instance_init(), having all setup in realize().

Now instance_init() is always called, and can never fail.
The resources it allocates are freed later in instance_finalize().

realize() can however fails and return error. If it succeeds,
the resources are released in unrealize().

If you have to implement realize() and it might fail, then it is
cheaper to check the failing conditions first, then allocate
resources. So in that case we prefer to avoid instance_init(),
otherwise on failure we'd have allocated and released resources
we know we'll not use. Pointless.

Hope this is not too unclear and helps...

> For example, I see some devices put memory_region_init_io() and
> sysbus_init_mmio() in their realize().

Following my previous explanation, it is better (as cheaper) to
have them in realize() indeed :)

>> +}
>> +
>> +static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
>> +{
>> +    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(dev);
>> +
>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
>> +    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
>> +                        DEVICE_LITTLE_ENDIAN);
> 
> It looks like serial_mm_init() does one more thing:
> 
>      qdev_set_legacy_instance_id(DEVICE(smm), base, 2);
> 
> I am not sure what that is.

I'll defer on Paolo / Marc-André for that part, I think this is for
migrating legacy (x86?) machines, which is not the case.

> 
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->serial_mm), errp)) {
>> +        return;
>> +    }
>> +    sysbus_pass_irq(SYS_BUS_DEVICE(dev), SYS_BUS_DEVICE(&s->serial_mm));
>> +    memory_region_add_subregion(&s->iomem, 0x20,
>> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm), 0));
>> +}
>> +
>> +static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = mchp_pfsoc_mmuart_realize;
>> +}
>> +
>> +static const TypeInfo mchp_pfsoc_mmuart_info = {
>> +    .name          = TYPE_MCHP_PFSOC_UART,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(MchpPfSoCMMUartState),
>> +    .instance_init = mchp_pfsoc_mmuart_init,
>> +    .class_init    = mchp_pfsoc_mmuart_class_init,
>> +};
>> +
>> +static void mchp_pfsoc_mmuart_register_types(void)
>> +{
>> +    type_register_static(&mchp_pfsoc_mmuart_info);
>> +}
>> +
>> +type_init(mchp_pfsoc_mmuart_register_types)
>> +
>> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
>> +                                               hwaddr base,
>> +                                               qemu_irq irq, Chardev *chr)
>> +{
>> +    DeviceState *dev = qdev_new(TYPE_MCHP_PFSOC_UART);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +
>> +    qdev_prop_set_chr(dev, "chardev", chr);
>> +    sysbus_realize(sbd, &error_fatal);
>> +
>> +    memory_region_add_subregion(sysmem, base, sysbus_mmio_get_region(sbd, 0));
>> +    sysbus_connect_irq(sbd, 0, irq);
>> +
>> +    return MCHP_PFSOC_UART(dev);
>>   }
> 
> This patch unfortunately breaks the polarfire machine that no serial
> output is seen. I did not take a further look yet.

Doh, it passed the CI... Ah, now I see, this machine is not covered
by CI, only manual testing per 
docs/system/riscv/microchip-icicle-kit.rst... I'll have a look during 
the week-end.

Regards,

Phil.

