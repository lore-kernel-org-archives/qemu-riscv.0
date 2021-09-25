Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mU6p9-0000A3-6I
	for mharc-qemu-riscv@gnu.org; Sat, 25 Sep 2021 08:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU6p4-00009K-Lr; Sat, 25 Sep 2021 08:30:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU6p2-0004mY-2G; Sat, 25 Sep 2021 08:30:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id u18so35772489wrg.5;
 Sat, 25 Sep 2021 05:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=luQgcPbNYLc9EVkWsegE/0auXgnjLHJ1lXRlkGmBeac=;
 b=ae+5VQ5w2kd3G1fw+AP1aQuRtbHw3jpchikyv9aeFKkMc4lIcIRrYWgNo1l7sjt4gA
 H7/G7LhKCyURenxo+L33eiY8206yy5M2FSz0GLcN3W/OiE3erK04ZGzmo++KrhorliZW
 C3fAWJDZMc/tm3vhjNVYChrZFRzJ/Q5SF/D5uQPjyKxB8HTPLegecr+bfb7jFRYT2osA
 Jkmabi9D6zkkxMDVX/VttAoqhZhreZEjmfb4mmGke3DBllIk3mc/+ktEFo3Flk63TSP+
 jWSb1DNIp4pceu7a9mlT4UvuDrLIPq7J4R7zBAVlISx8/dOtQJTIU4kVqKM8X83w4q9q
 0xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=luQgcPbNYLc9EVkWsegE/0auXgnjLHJ1lXRlkGmBeac=;
 b=1lnBc6TQPGwGOYz1/eT5LIlJHvLvY6zq8/cRDJx7VzNXD+qwpz1V4mMxo0T628MeHd
 1i7RU5teKwOfqEvaBMHc2nY3nW/lSnQCVOZlzhkjQa5rmDtB0C7t9IgFUEvO/YNVq3pI
 Ls2bD/bAZDQh0zAKH+RUzW4rrdaMQrJMmSWoWi5RyehisaFVhg2mtb3BdvLLWcQ6jeTA
 dmeZLBWQZOpSEhQIHl+fX4ze2rc6D+SNdejk5k/xt5weEIyDt//+Je+tLtSB7qWQpW+D
 FXQqZlToo5uROkgrSsSF/Og+EmSN+WQT7zA/vWK2H6/I0q5g39Sw0iLIXzr7JA8WAJgh
 I36Q==
X-Gm-Message-State: AOAM532svd/zC+l++8lpS9Pj/mGKUBaMzTtJepaotvBpvbLL1WGDioSc
 GHZzNzAn7YzRTufjmK8G6P8=
X-Google-Smtp-Source: ABdhPJxSEcWtqWhyUMsZGDjmeMuBOuTRPgoh7dXN/azKOlEBui3Va9muYplFm8oZJEkrrS7/dPcnkA==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr16796700wrn.238.1632573024544; 
 Sat, 25 Sep 2021 05:30:24 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s2sm2906900wru.3.2021.09.25.05.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 05:30:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <282948b6-0c83-6197-758f-159b7c24459b@amsat.org>
Date: Sat, 25 Sep 2021 14:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair23@gmail.com>
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
 <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
In-Reply-To: <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Sat, 25 Sep 2021 12:30:31 -0000

Hi Bin,

On 9/23/21 12:29, Philippe Mathieu-Daudé wrote:
> On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM 
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
>>> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
>>> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
>>> - Keep mchp_pfsoc_mmuart_create() behavior

>>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->serial_mm), errp)) {
>>> +        return;
>>> +    }
>>> +    sysbus_pass_irq(SYS_BUS_DEVICE(dev), 
>>> SYS_BUS_DEVICE(&s->serial_mm));
>>> +    memory_region_add_subregion(&s->iomem, 0x20,

So the bug is here, the serial is at 0x00 and the other register
stubs at 0x20. I can see u-boot console doing s/0x20/0x00/.

>>> +                
>>> sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm), 0));
>>> +}
>>> +
>>> +static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>>> +
>>> +    dc->realize = mchp_pfsoc_mmuart_realize;
>>> +}
>>> +
>>> +static const TypeInfo mchp_pfsoc_mmuart_info = {
>>> +    .name          = TYPE_MCHP_PFSOC_UART,
>>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size = sizeof(MchpPfSoCMMUartState),
>>> +    .instance_init = mchp_pfsoc_mmuart_init,
>>> +    .class_init    = mchp_pfsoc_mmuart_class_init,
>>> +};
>>> +
>>> +static void mchp_pfsoc_mmuart_register_types(void)
>>> +{
>>> +    type_register_static(&mchp_pfsoc_mmuart_info);
>>> +}
>>> +
>>> +type_init(mchp_pfsoc_mmuart_register_types)
>>> +
>>> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
>>> +                                               hwaddr base,
>>> +                                               qemu_irq irq, Chardev 
>>> *chr)
>>> +{
>>> +    DeviceState *dev = qdev_new(TYPE_MCHP_PFSOC_UART);
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>> +
>>> +    qdev_prop_set_chr(dev, "chardev", chr);
>>> +    sysbus_realize(sbd, &error_fatal);
>>> +
>>> +    memory_region_add_subregion(sysmem, base, 
>>> sysbus_mmio_get_region(sbd, 0));
>>> +    sysbus_connect_irq(sbd, 0, irq);
>>> +
>>> +    return MCHP_PFSOC_UART(dev);
>>>   }
>>
>> This patch unfortunately breaks the polarfire machine that no serial
>> output is seen. I did not take a further look yet.
> 
> Doh, it passed the CI... Ah, now I see, this machine is not covered
> by CI, only manual testing per 
> docs/system/riscv/microchip-icicle-kit.rst... I'll have a look during 
> the week-end.
> 
> Regards,
> 
> Phil.
> 

