Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTMOe-0003yU-VX
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 06:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTMOd-0003wH-QG; Thu, 23 Sep 2021 06:56:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTMOc-0001Aw-58; Thu, 23 Sep 2021 06:56:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id t7so15830461wrw.13;
 Thu, 23 Sep 2021 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=GUdYhZ+D8xeVs7E95RdOwd83S7jw2Ky4yiX7s8ev2R8=;
 b=Qw4IucOjasPdpgSwkmeAFXnNS/3xOUBLw4B8toOyEO4gboaOX+7ClnLVJ94TGDoRbt
 8/WztWtn/AsJpFAkJU/A4p88e3ROyrIZvtOjl99MHIModyrcs8+ihPQXAhMl/+R0IzNS
 D5scAubT8jkq7AwkqryU8RxqrB0Z6gtOrq1h+ybfCLIfohP2XzzyOamEMo0YuYf21KKb
 sDj0XYBJCE/5BzFzn8bYkl5OYqaaOyG1WyENuKt3YeslmTILtQwDtw0FERhPmUr5cZP1
 i0w/MIiU9ayow7ZAe0W+NbZ+GktLZZsC4zowxMc1VXKyEv3Pr71n1NgYbvwT41bx4Nk8
 zx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=GUdYhZ+D8xeVs7E95RdOwd83S7jw2Ky4yiX7s8ev2R8=;
 b=aueZqR3P9LBcftygbZ/AYfQCIVvm1ZCgXILb6WbtuehMQ1i3CW3tDYjMuNblUVu6SZ
 apMmyUNsjb4Foj1CksLjoqfqMrnSP+zNrFk33Ly5+4K5kgBdYrmKwKcxw/xim58ORPwv
 vF1Q7aty65JjbxCMCyuyp/4YfxKY2Lzx4vzlO6WsMOjuzuA4xk5EO1Ny8s/EPIbpPcf5
 uoJUVP1ei3yUsGpx36ZL7HACbMmI+1No0KtLf7Cw1a19Sj8rE7/wdax5mGxA15pSg4Wg
 QmdT9V3UXgt6p++P0oFbANP4//iE0KJRq1qRUhUKhJ+ayEAyHuYlo6+LKiYmgVt6pd2u
 e0OQ==
X-Gm-Message-State: AOAM533/f0VelCi9Vv5qKgRuUYj2L80ECa3FomX6sPTiaQPyGvlloNjv
 A3zu6cU/YnAIDsprIm7dy08=
X-Google-Smtp-Source: ABdhPJy21Sg1jT1k4jxuQ2eIsLP1o+5VrgJjffGOL+H9MDA1+lyya298q8M6udakrtmv3oEcL22FnA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr4236660wrr.187.1632394563396; 
 Thu, 23 Sep 2021 03:56:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r27sm4960893wrr.70.2021.09.23.03.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:56:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <e6e6bdca-775b-ec39-4cac-c308f7cca166@amsat.org>
Date: Thu, 23 Sep 2021 12:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
 <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
 <CAFEAcA9aZ3HXmHc12X58N5k=1dfk6SZWEU9Uf1ErajNj0EHWxg@mail.gmail.com>
 <58a51968-39b9-1477-5c18-db9638fa66e3@amsat.org>
In-Reply-To: <58a51968-39b9-1477-5c18-db9638fa66e3@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 23 Sep 2021 10:56:08 -0000

On 9/23/21 12:52, Philippe Mathieu-Daudé wrote:
> On 9/23/21 12:41, Peter Maydell wrote:
>> On Thu, 23 Sept 2021 at 11:29, Philippe Mathieu-Daudé 
>> <f4bug@amsat.org> wrote:
>>> On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>> +static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
>>>>> +{
>>>>> +    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(dev);
>>>>> +
>>>>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
>>>>> +    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
>>>>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
>>>>> +                        DEVICE_LITTLE_ENDIAN);
>>>>
>>>> It looks like serial_mm_init() does one more thing:
>>>>
>>>>       qdev_set_legacy_instance_id(DEVICE(smm), base, 2);
>>>>
>>>> I am not sure what that is.
>>>
>>> I'll defer on Paolo / Marc-André for that part, I think this is for
>>> migrating legacy (x86?) machines, which is not the case.
>>
>> Yes, this is only needed for backwards-compatibility of incoming
>> migration data with old versions of QEMU which implemented migration
>> of devices with hand-rolled code. If a device didn't previously
>> handle migration at all then it should not now be setting the
>> legacy instance ID.
> 
> Thanks. I'll try to add that in the documentation somewhere.
> 
>> Speaking of migration, I notice that this QOM conversion does
>> not add a vmstate, which usually we do as part of the QOM conversion.
>> The device is also missing a reset method.

Sigh, you reminded me of this series:
"hw: Mark devices with no migratable fields"
https://lore.kernel.org/qemu-devel/20210117192446.23753-19-f4bug@amsat.org/

> 
> OK, I'll add that in a previous patch.
> 
> Thanks,
> 
> Phil.
> 

