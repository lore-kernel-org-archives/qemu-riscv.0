Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1891FCA6009
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEafp-0004qi-67; Wed, 07 Oct 2026 19:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xEafI-0004fB-J1
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:03:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xEafG-0007de-Gh
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:03:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3a4dda53724so108333a91.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1791414187; x=1792018987; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9fYONzD3/kwX2rcLKOS7A7NAZqcYfDrGPOw0VIyqbd4=;
 b=T0GPIVd7XwjP/2l+bQFhfM2yuBlFFYWweGc4iomcZu06iP+NDsxcuWf9CCm4p7WtV+
 J+raGNq+AeqRjkpDX6lcvx8y56nea1Y1ioUgrGNlRpR+y5L4o7lH3ChnNWSUuvHyKeFg
 lUnMrxZFpm7zWFQ1r0Vz4eVZLLPC/yFGcAAISfdqdKN+h4GfGkzOgEW+cav49zfOAP63
 HyBVvpUasiukepiDMEUBXn1DEkE0gD5kl39Z3P6wh2E5xvHwgmjdDbs41xFTWkMOOch7
 LRaaE+/L7YpMNHPzPVdbocNS7iFqgVd9py4VVYt8GBZgEfig0Su7z6LCoUvwWvdLKkdl
 mprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791414187; x=1792018987;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9fYONzD3/kwX2rcLKOS7A7NAZqcYfDrGPOw0VIyqbd4=;
 b=Vhx8m5wGe0WXDPxICbz7E/WQqjS5ykbwkbwANgROQPPypuXjhTxs0qD2HAcePTY3KG
 dXt8dlrbXHNEFYk/oEwhp8S6VREG/P7Tf+w86yzEqKDT3KSA763MG5mDnXY/ZhzXzfNb
 jr8uGinrmBmjFZ2/Os8WrQ9MtaqFjSqMIgcw8UXPRNGxH8RT8zeL3p8srToMbMCdf3Ak
 AMLAXxO7xlQnZ4V8tNzu24aKEz9pxgzBmVOPagzndW++BGgv8cXmPz3zcHSrgI/FGo5Q
 AoK3+WGxIZabMwxAGkm8vciQK23CsxHK9096ib0CdBuKc0av6FktZuIEy1f7aE/WnsHp
 KQoA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8A+0eVxk343+hVJk4+c0Fhp708Dbkai8vMjwPCSkW7zB+mt2NiZexfA+1t+LL11cAJ1CLyMXi/fqw@nongnu.org
X-Gm-Message-State: AFq9FYKT0ov0Ei8G6/9C2ZrHIY3KxCGEDxu1RpBCIhs9lnUMS5AH6pvA
 Tg11u6gWAE4cnZgFOOcQlSG6plV9eW8qtwRqtp9XOg3wSat8jL7SP4bKmXnndLMR9F4=
X-Gm-Gg: AYBFou0KFpFpYPIt5olyxMp9VAV+QgX0qXK+t75xlAYK+KKuY7ha0F57r9HeSfUtJ0I
 W7gcDOc2aT/wJrc3DL1wefWX51waW4mG3rdf3rv5WIka/u5cIDzpKbgxr/fV2wPLpnhNfFjzfbW
 s0A6TQ08ySdUR2WpwM4+Y9ayi1sYewGQQI8dOQgk4CMoB/lz5TycZfHOh5dI4FmxXtHp5TKOBnn
 pcu/0KQVYKq0aIRfoGV673BrSXLU3iFbf5xaQZGy/A8QUdoohkjkaSd23vdrgXoh9HMOOgfX9f1
 T+Swn/jO0CQ+j6qZ0abQrEfuzAD1I1uy73MgsyUQfwFdO0+ZlNpCk7b3VXapYFWzkeUxEwp604R
 S2RzBl4Idch3WSrRLKMcOTI1ZB/XwDQLlSTbAPuBrz/Dtugd4fYoqSd189vMbCXH57bXVniiVLp
 AKwvav2T98W8DngKY19BHmulqoM9/dm3CBbRJevKZMD4vLGk/iGLWIdNHbujloQrO9n6mmTPiQL
 L/vi4vCf8Vbi91hTQsCQBL9mQ==
X-Received: by 2002:a17:90b:268a:b0:3a7:fef3:8561 with SMTP id
 98e67ed59e1d1-3aaab2945bcmr876980a91.5.1791414186459; 
 Wed, 07 Oct 2026 16:03:06 -0700 (PDT)
Received: from [172.16.1.33] ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a9ff817537sm1327932a91.8.2026.10.07.16.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 16:03:06 -0700 (PDT)
Message-ID: <79349810-29d7-43bb-a3f4-91c0b70e73df@oss.tenstorrent.com>
Date: Thu, 8 Oct 2026 09:02:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] hw/riscv/atlantis: Add machine property to select
 default uart
To: Alistair <alistair@alistair23.me>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>
References: <20261001233324.2636629-1-portias@oss.tenstorrent.com>
 <20261001233324.2636629-4-portias@oss.tenstorrent.com>
 <41b85b9ad64efab7ae41cdc4a7315ffe6903264b.camel@alistair23.me>
Content-Language: en-US
From: Portia Stephens <portias@oss.tenstorrent.com>
In-Reply-To: <41b85b9ad64efab7ae41cdc4a7315ffe6903264b.camel@alistair23.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


On 6/10/2026 11:35 PM, Alistair wrote:
> On Fri, 2026-10-02 at 09:33 +1000, Portia Stephens wrote:
>> The Atlantis SoC has 5 UARTs. This adds a machine property to set
>> which uart is on the first serial interface. This is the same pattern
>> that is used by aspeed. The rest of the uart's will be added in
>> sequential order starting at serial interface 1.
>>
>> The default value is uart1 which means the Ascalon console will be on
>> serial interface 0 by default.
>>
>> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
>> Reviewed-by: Daniel Henrique Barboza
>> <daniel.barboza@oss.qualcomm.com>
>> ---
>>   hw/riscv/tt_atlantis.c         | 77 ++++++++++++++++++++++++++++++--
>> --
>>   include/hw/riscv/tt_atlantis.h |  1 +
>>   2 files changed, 69 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
>> index 2342edce93..7a5e1ddcd1 100644
>> --- a/hw/riscv/tt_atlantis.c
>> +++ b/hw/riscv/tt_atlantis.c
>> @@ -12,6 +12,7 @@
>>   #include "qemu/error-report.h"
>>   #include "qemu/guest-random.h"
>>   #include "qemu/units.h"
>> +#include "qapi/visitor.h"
>>   
>>   #include "hw/core/boards.h"
>>   #include "hw/core/loader.h"
>> @@ -422,6 +423,26 @@ static void load_fdt(TTAtlantisState *ams)
>>       create_fdt_memory(ms->fdt, &ams->soc);
>>   }
>>   
>> +static inline int tt_atlantis_uart_index(int uart_dev)
>> +{
>> +    return uart_dev - TT_ATL_UART0;
>> +}
>> +
>> +static void tt_atlantis_connect_serial_hds_to_uarts(TTAtlantisState
>> *ams)
>> +{
>> +    TTAtlantisSoCState *s = &ams->soc;
>> +    int uart_index = tt_atlantis_uart_index(ams->uart_chosen);
>> +
>> +    qdev_prop_set_chr(DEVICE(&s->uart[uart_index]), "chardev",
>> serial_hd(0));
>> +
>> +    for (int i = 1, uart = 0; i < TT_ATL_NUM_UARTS; uart++) {
>> +        if (uart == uart_index) {
>> +            continue;
>> +        }
>> +        qdev_prop_set_chr(DEVICE(&s->uart[uart]), "chardev",
>> serial_hd(i++));
>> +    }
> I don't like this. We shouldn't dynamically change the command line API
> based on a property


Fair enough, can we just take the first 3 patches in the series and drop 
this one? That will add modeling for all the uarts but only expose uart1 
on command line.


We will expose the remaining uarts as features as added to the model 
that produce output that anyone would care to look at. For example, 
uart0 is the system controller's console, when the system controller is 
added to the model then we will expose uart0 on the command line. This 
will prevent us from locking into a command line API before we need to.



>
> Alistair
>
>> +}
>> +
>>   static void tt_atlantis_machine_done(Notifier *n, void *data)
>>   {
>>       TTAtlantisState *ams = container_of(n, TTAtlantisState,
>> machine_done);
>> @@ -484,11 +505,6 @@ static void tt_atlantis_machine_done(Notifier
>> *n, void *data)
>>                                 fdt_load_addr);
>>   }
>>   
>> -static inline int tt_atlantis_uart_index(int uart_dev)
>> -{
>> -    return uart_dev - TT_ATL_UART0;
>> -}
>> -
>>   static void tt_atlantis_soc_init(Object *obj)
>>   {
>>       TTAtlantisSoCState *s = TT_ATLANTIS_SOC(obj);
>> @@ -592,10 +608,6 @@ static void tt_atlantis_soc_realize(DeviceState
>> *dev, Error **errp)
>>       memory_region_add_subregion(s->memory, s-
>>> memmap[TT_ATL_BOOTROM].base,
>>                                   &s->bootrom);
>>   
>> -    /* UART1, the soc console (UART0 is for the boot microcontroller
>> */
>> -    qdev_prop_set_chr(DEVICE(&s-
>>> uart[tt_atlantis_uart_index(TT_ATL_UART1)]),
>> -                      "chardev", serial_hd(0));
>> -
>>       for (int i = 0; i < TT_ATL_NUM_UARTS; i++) {
>>           SysBusDevice *sbd = SYS_BUS_DEVICE(&s->uart[i]);
>>           if (!sysbus_realize(sbd, errp)) {
>> @@ -663,6 +675,10 @@ static void
>> tt_atlantis_machine_init(MachineState *machine)
>>                                OBJECT(&ams->soc_memory),
>> &error_abort);
>>       object_property_set_link(OBJECT(&ams->soc), "dram",
>> OBJECT(machine->ram),
>>                                &error_abort);
>> +
>> +    /* Map serial interfaces to uart */
>> +    tt_atlantis_connect_serial_hds_to_uarts(ams);
>> +
>>       qdev_realize(DEVICE(&ams->soc), NULL, &error_fatal);
>>   
>>       /* I2C peripherals: qemu specific */
>> @@ -680,6 +696,47 @@ static void
>> tt_atlantis_machine_init(MachineState *machine)
>>       qemu_add_machine_init_done_notifier(&ams->machine_done);
>>   }
>>   
>> +static void tt_atlantis_get_console(Object *obj, Visitor *v, const
>> char *name,
>> +                                    void *opaque, Error **errp)
>> +{
>> +    TTAtlantisState *ams = TT_ATLANTIS_MACHINE(obj);
>> +    uint32_t uart_index = tt_atlantis_uart_index(ams->uart_chosen);
>> +
>> +    visit_type_uint32(v, name, &uart_index, errp);
>> +}
>> +
>> +static void tt_atlantis_set_console(Object *obj, Visitor *v, const
>> char *name,
>> +                                    void *opaque, Error **errp)
>> +{
>> +    TTAtlantisState *ams = TT_ATLANTIS_MACHINE(obj);
>> +    uint32_t value;
>> +
>> +    if (!visit_type_uint32(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +
>> +    if (value >= TT_ATL_NUM_UARTS) {
>> +        error_setg(errp, "\"console\" should be in range [%d - %d]",
>> +                   0, TT_ATL_NUM_UARTS - 1);
>> +        return;
>> +    }
>> +    ams->uart_chosen = value + TT_ATL_UART0;
>> +}
>> +
>> +static void tt_atlantis_machine_class_props_init(ObjectClass *oc)
>> +{
>> +    ObjectProperty *console;
>> +
>> +    console = object_class_property_add(oc, "console", "uint32_t",
>> +                                        tt_atlantis_get_console,
>> +                                        tt_atlantis_set_console,
>> NULL, NULL);
>> +    object_class_property_set_description(oc, "console",
>> +            "Change the default UART index on -serial. Valid values
>> are 0 " \
>> +            "through 4");
>> +    /* Default to UART1, the Ascalon console */
>> +    object_property_set_default_uint(console, 1);
>> +}
>> +
>>   static void tt_atlantis_machine_class_init(ObjectClass *oc, const
>> void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -693,6 +750,8 @@ static void
>> tt_atlantis_machine_class_init(ObjectClass *oc, const void *data)
>>       mc->block_default_type = IF_VIRTIO;
>>       mc->no_cdrom = 1;
>>       mc->default_ram_id = "tt_atlantis.ram";
>> +
>> +    tt_atlantis_machine_class_props_init(oc);
>>   }
>>   
>>   static const TypeInfo tt_atlantis_types[] = {
>> diff --git a/include/hw/riscv/tt_atlantis.h
>> b/include/hw/riscv/tt_atlantis.h
>> index b81b7c8abd..7bd46e9c9b 100644
>> --- a/include/hw/riscv/tt_atlantis.h
>> +++ b/include/hw/riscv/tt_atlantis.h
>> @@ -56,6 +56,7 @@ struct TTAtlantisState {
>>   
>>       MemoryRegion soc_memory;
>>       TTAtlantisSoCState soc;
>> +    uint32_t uart_chosen;
>>   };
>>   
>>   enum {

