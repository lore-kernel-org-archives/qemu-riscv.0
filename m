Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21CECA5FC4
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:13:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC7ER-0004Z6-OQ; Wed, 30 Sep 2026 23:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xC7EQ-0004Yn-00
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 23:13:14 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xC7EN-0006VT-S2
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 23:13:13 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-39666e7c9efso639009a91.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 20:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1790824390; x=1791429190; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y+zlM5o8tj72RsI5d/qQ9Ifd5fAfAiSENQxMGm6NXfQ=;
 b=QdTp9tX2gmEljvq7jSM98zUcWYys7Hgyn3DMkkU//lqcAay2Ag5px6kIDitdtY/z8r
 xHpQkRyHEYGxXgSb48HYx3yFJ0BfIzwcEyfLJF92ZNFaf8F65GZEx53tCByEUXf4IImT
 oy2P7txsxNRN3kh8WTr2J0AItR0lEC+GTWn1YhpTcNvEtehEMhtoNgxzRXUF4b5zMFRO
 y99jAMwEYtX9DggQK3R6C4HY35Y5j+GBRcb9N4rH1r9N7/y/9zezNRYY1DaWriLX99a9
 6m1ehOI/0p0HBuqgt7SemkY50W7e/XIqInXCbpCnsYwxqGWhJaVsq3+f6BkviFrC1YYz
 DVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790824390; x=1791429190;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y+zlM5o8tj72RsI5d/qQ9Ifd5fAfAiSENQxMGm6NXfQ=;
 b=rYqSs2XAOpTE7gAmGEz9N+m9my4X4+poGkxvl/yiN6eg00EaNkDACIwn6eiIq9VFTL
 28O0Pk+9jRIdHPnrc38zadEZ+pmWeWi4hFON6K3kvQeU7aozBNLGoAYZcEQ0mCbCuXs3
 Z276L5J4eyUf/Mlh0SSR4pH2wHWYmxCctgHr+iMJ7FUPHRublYZku5awzhy6cpJh0y/M
 CqKNgPCKha2S6+9U06iPu/AaakID97WGrAvLS2Gw3N6b/8QlW2IjfVmBmfpmYlEPRY+f
 GaewbA4xrtsRFvNuFURJocf1dZscr46kieUUa9VhlLG3nRG5KDwgsUTDZROfh1EAoxa3
 +OgA==
X-Forwarded-Encrypted: i=1;
 AKwUvByb/vsq7j/ukMW7sVOZzlXLvcWEKwVzMpsjCbuO0w+kn8pEQz0x+vmrLqVm0XU6WOnfAxCvOvYAXngw@nongnu.org
X-Gm-Message-State: AFq9FYJLKAKpDsUMwEIIuhna/g2YiRJHGdCKqneZ+37rnz65ea3/R3xt
 te0iLL731wtJ5CLw3M14zVYNNPRmxGrZbqMLEikEQmTCgsINcaq1Zli6O4zZ2A5OUF0=
X-Gm-Gg: AYBFou1FSkM2eMNX5t7u0gxmcXiDxI3g19kBIrC7hU0f4r0EKmqA1uJNd9eONdyp7Z2
 wUREeAxvgf9/pUUMp/d7eii2XYXYB5GFAWCpCDnjxv7yn8puv4yh6JqidCtmFR9Mefqd6IJZRD4
 IKDpJcUStUsTTKa3aupWt8UWY5jRxWk09f2UiXJNnzMu+rN+94/0H/dzSC+JwvHbcCmZBWfzM8T
 +WVKL8kfJxSFo5YN4SGo4GA4iyDk43+I+NnQdehUZNgdNaWn+s72zRDQMpY01WGQYd2iCmtzslV
 aZ/O965XPXt4O1D9vGYuSeWEX5wAfLPT1SqP7E93/dsM/A8Lv/2LMPHD12UvRWOOT0k5reepzvy
 VrDI9vHmE3N+Ipy1a90m5/0i1gGATyfpfRiirC4gPebkTrbfaG23O95J/nUkdhHzQJMokqNBwSa
 56uRT7BKfI/tl8ayqH2KVJobIRZG6oMrpZBjxlt/RppkTWLps0KdO0En4uTFRjeNL3KrA81qrZS
 9QF6Ll+gxIJ1p6Wo/YrhAoysNU=
X-Received: by 2002:a17:902:f690:b0:2e2:c797:d87f with SMTP id
 d9443c01a7336-2e2e490bfadmr43000625ad.1.1790824389777; 
 Wed, 30 Sep 2026 20:13:09 -0700 (PDT)
Received: from [172.16.1.33] ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e311774747sm100965ad.32.2026.09.30.20.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 20:13:09 -0700 (PDT)
Message-ID: <5a5f0085-186d-47bc-9d6e-7719ea9ed024@oss.tenstorrent.com>
Date: Thu, 1 Oct 2026 13:13:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Portia Stephens <portias@oss.tenstorrent.com>
Subject: Re: [PATCH 1/5] hw/char/dw8250: Fix leak when creating child device
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
 <20260929031644.1016354-2-portias@oss.tenstorrent.com>
 <238b1bf5-c7a4-4103-9e70-c5bf9efc3691@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <238b1bf5-c7a4-4103-9e70-c5bf9efc3691@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=portias@tenstorrent.com; helo=mail-pj2-x10.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 30/9/2026 11:28 PM, Daniel Henrique Barboza wrote:
> Hi Portia,
>
> I believe this fix should be made by the original patch that 
> introduces the device,
> which isn't upstreamed yet:
>
> [PATCH v5 1/7] hw/char: Add dw8250 UART
> https://lore.kernel.org/qemu-devel/20260927201326.650943-2-visitorckw@gmail.com/ 
>


Whoops sorry. I saw Alistair reviewed it and I must of read it as applied.


>
>
> Thanks,
> Daniel
>
> On 9/29/2026 12:16 AM, portias@oss.tenstorrent.com wrote:
>> From: Portia Stephens <portias@oss.tenstorrent.com>
>>
>> dw8250_instance_init() creates two references for serial_mm, one from
>> qdev_new() and one from object_property_add_child() which leaks the
>> serial_mm object. Fix embedding the SerialMM struct in the DW8250State.
>>
>> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
>> ---
>>   hw/char/dw8250.c         | 11 +++++------
>>   include/hw/char/dw8250.h |  3 ++-
>>   2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/char/dw8250.c b/hw/char/dw8250.c
>> index ccf05dd9ad..50baeae62c 100644
>> --- a/hw/char/dw8250.c
>> +++ b/hw/char/dw8250.c
>> @@ -72,23 +72,22 @@ static void dw8250_instance_init(Object *obj)
>>   {
>>       DW8250State *s = DW8250(obj);
>>   -    s->serial_mm = qdev_new("serial-mm");
>> -    object_property_add_child(obj, "serial-mm", OBJECT(s->serial_mm));
>> -    object_property_add_alias(obj, "chardev", OBJECT(s->serial_mm), 
>> "chardev");
>> +    object_initialize_child(obj, "serial-mm", &s->serial_mm, 
>> TYPE_SERIAL_MM);
>> +    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), 
>> "chardev");
>>   }
>>     static void dw8250_realize(DeviceState *dev, Error **errp)
>>   {
>>       DW8250State *s = DW8250(dev);
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> -    SysBusDevice *serial_sbd = SYS_BUS_DEVICE(s->serial_mm);
>> +    SysBusDevice *serial_sbd = SYS_BUS_DEVICE(&s->serial_mm);
>>         memory_region_init(&s->container, OBJECT(dev), 
>> "dw8250-container",
>>                          DW_UART_REGION_SIZE);
>>       sysbus_init_mmio(sbd, &s->container);
>>   -    qdev_prop_set_uint8(s->serial_mm, "regshift", s->regshift);
>> -    qdev_prop_set_uint8(s->serial_mm, "endianness", 
>> DEVICE_LITTLE_ENDIAN);
>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 
>> s->regshift);
>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness", 
>> DEVICE_LITTLE_ENDIAN);
>>       if (!sysbus_realize(serial_sbd, errp)) {
>>           return;
>>       }
>> diff --git a/include/hw/char/dw8250.h b/include/hw/char/dw8250.h
>> index 59396ad202..ce0b97715b 100644
>> --- a/include/hw/char/dw8250.h
>> +++ b/include/hw/char/dw8250.h
>> @@ -10,6 +10,7 @@
>>     #include "hw/core/sysbus.h"
>>   #include "qom/object.h"
>> +#include "hw/char/serial-mm.h"
>>     #define TYPE_DW8250 "dw8250"
>>   OBJECT_DECLARE_SIMPLE_TYPE(DW8250State, DW8250)
>> @@ -19,7 +20,7 @@ struct DW8250State {
>>         MemoryRegion container;
>>       MemoryRegion ext_iomem;
>> -    DeviceState *serial_mm;
>> +    SerialMM serial_mm;
>>         uint8_t regshift;
>>   };
>

