Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTMKw-0000NV-R5
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 06:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTMKu-0000Jp-MC; Thu, 23 Sep 2021 06:52:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTMKt-0006Yu-46; Thu, 23 Sep 2021 06:52:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id q11so15870884wrr.9;
 Thu, 23 Sep 2021 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GVORcyaLv3syAmBkfSaYTVn3/eMmXDx6hPlGBkz/PUA=;
 b=k6hnXZhMTzl/7xD42lAq5o2D87buaWxjziPww9tkZeMt0oEMiN4vS0u1Iak5j/3awL
 vdKkUPMuIoSK6b6VOieEsyhXgVvoiU9oimDwLqmleIvN0WHACflx6TKlShLWeLQIILQJ
 Xk+9cyW1QEBRsrzJ1JzK76cn6xfYmaV5Nerojlvv9AyB4YK+eqSjKu8KPzrhaiPAEuL3
 ejm1ikyJc3BtsqSfTnoMN0zhKYHnfR7eFsnSlnbBZP/Qi5cwcpBidHaXFcgISoj9ue+Q
 bzMT36C/Ro6VpsREDDv6ixUN2UStEq0fho7nzA58y48ohxwys+/N+z9whgQIYvf4XRkV
 KEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GVORcyaLv3syAmBkfSaYTVn3/eMmXDx6hPlGBkz/PUA=;
 b=rF9q5JpzeQ4q7vwPnW6yUyHFWsjUltJEFECzs0FBrYOcfrlHsfDm2gquyZ8d+zm/am
 dDlQj0ZTxfHtrdKWkaUV0rL9Lu1EOf+ZZhCDol0dhtfoBq/61qk/70R5z6kYMFu7AnCy
 hHBPVkYHe4NnnZ1D7EYtnFJiF+273HIhi7HAMC9AhKPtIoytWB6BNXVT2MurQKCvLTYu
 pjpTOBm6Y9z8FRyR2+nlmT6Nzqp843ZM6Y72ToD51k+HmIwR3dzbG85ayHMP4cm8OkDX
 hKQnaGu8VJuOx0QHDLLg7p01bUC1nJ0YmkE/47fKNI7OIWqRYWfAn7qz3HHag3HhBa5u
 L1VA==
X-Gm-Message-State: AOAM531olilnxRhiqNL+DLqgvtkL4WkXDf+WgX7caPbMgfD2rfZ43MLF
 OqJF7rejGDv9MQgNPPDKbXo=
X-Google-Smtp-Source: ABdhPJxUh4VDiUZHpBpKGT4SSa3Zt3TfUoBC6czaAzERKOVrXV9ACfCcRcQphCxkvr/zpyTn8CzUsA==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr4342990wrr.46.1632394332909;
 Thu, 23 Sep 2021 03:52:12 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 20sm9666228wme.46.2021.09.23.03.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:52:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <58a51968-39b9-1477-5c18-db9638fa66e3@amsat.org>
Date: Thu, 23 Sep 2021 12:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20210918180738.2506799-1-f4bug@amsat.org>
 <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
 <0cfcd1c1-8bff-f0dc-02ac-ac12ac392fc8@amsat.org>
 <CAFEAcA9aZ3HXmHc12X58N5k=1dfk6SZWEU9Uf1ErajNj0EHWxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA9aZ3HXmHc12X58N5k=1dfk6SZWEU9Uf1ErajNj0EHWxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Thu, 23 Sep 2021 10:52:16 -0000

On 9/23/21 12:41, Peter Maydell wrote:
> On Thu, 23 Sept 2021 at 11:29, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 9/23/21 07:16, Bin Meng wrote:> On Sun, Sep 19, 2021 at 2:07 AM
>> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> +static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
>>>> +{
>>>> +    MchpPfSoCMMUartState *s = MCHP_PFSOC_UART(dev);
>>>> +
>>>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
>>>> +    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
>>>> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
>>>> +                        DEVICE_LITTLE_ENDIAN);
>>>
>>> It looks like serial_mm_init() does one more thing:
>>>
>>>       qdev_set_legacy_instance_id(DEVICE(smm), base, 2);
>>>
>>> I am not sure what that is.
>>
>> I'll defer on Paolo / Marc-André for that part, I think this is for
>> migrating legacy (x86?) machines, which is not the case.
> 
> Yes, this is only needed for backwards-compatibility of incoming
> migration data with old versions of QEMU which implemented migration
> of devices with hand-rolled code. If a device didn't previously
> handle migration at all then it should not now be setting the
> legacy instance ID.

Thanks. I'll try to add that in the documentation somewhere.

> Speaking of migration, I notice that this QOM conversion does
> not add a vmstate, which usually we do as part of the QOM conversion.
> The device is also missing a reset method.

OK, I'll add that in a previous patch.

Thanks,

Phil.

