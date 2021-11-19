Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo1eo-0000zs-Ua
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 06:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo1em-0000z2-VR
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 06:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo1eh-0003MP-UM
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 06:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637319726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rj/1CqR4qJ/fafB6UhewPg7pui603W3pbBM1COFFvJU=;
 b=bM3I/Xjv+vSfAc46cVKentsuwXQ7H+ZHDF/bjq5eyVdbr//BHnVeBZ10d3a3bSrCpg8UH1
 pXDZjXncVWlQNDGupuf9hLCjPGvsEx9Wz8vBfLM05Tv8xrobxHPo0q3lcbA+c2scf9moRh
 uhA6uJpz24tH+KnXdWi37PLOrP095bM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-ztF3ZIbkMuO-bwDqDuLpUA-1; Fri, 19 Nov 2021 06:02:05 -0500
X-MC-Unique: ztF3ZIbkMuO-bwDqDuLpUA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b15-20020aa7c6cf000000b003e7cf0f73daso8022171eds.22
 for <qemu-riscv@nongnu.org>; Fri, 19 Nov 2021 03:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rj/1CqR4qJ/fafB6UhewPg7pui603W3pbBM1COFFvJU=;
 b=pPKGmAj1U612MkLLZSy59CtOhYrYuD5bBKWme3soI1mhImVWPAQ2Ku2f/uvsXbEyKr
 Q5sfkyoiaxB2ZcT7Xtlgm0uy1sdjt0gd+ip08bokK58OpWfSxSmPfzC09pErEjJCbl25
 p+ZUrEZPlz7F/puZCQcu27Afu8riG0m7Jvz2US3g8LKvepWsQp02LBlVWhpJtCJmtotT
 4dPXcHMWMyeD3cWdMJlFofq8/pZGEm/0HaTxkMCeP9iGDpioZrhwkPFkkq2UlvicSAiq
 /f72wgTV8QMbY1M2ZM7i2ovlTdM38aRN6rQebYkOZFJF7fyHt2V/1gBmUkR4JffjwS/R
 cjAA==
X-Gm-Message-State: AOAM530/NNi8l81DvAC9S0dWmO2SFdlUFMioh+dPMhrFcwknsW+WXy4R
 8ZrGJS2Mx+vFv8VxUrL/caSgj6zhi/4NVqYMrtbydVB8SOgXeOWPgKt9nn87jka9eBwgIDRxpl8
 lMPjKPxniUXfgDQE=
X-Received: by 2002:a17:906:eda3:: with SMTP id
 sa3mr6637539ejb.51.1637319724486; 
 Fri, 19 Nov 2021 03:02:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu0pGsMXbCRfnIhca9ETKutmauHel+izB+GA76wt5CNDolHpVmYMXvS8+TjvJyjv4plt3Smw==
X-Received: by 2002:a17:906:eda3:: with SMTP id
 sa3mr6637495ejb.51.1637319724179; 
 Fri, 19 Nov 2021 03:02:04 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id k16sm1251653edq.77.2021.11.19.03.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:02:03 -0800 (PST)
Message-ID: <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
Date: Fri, 19 Nov 2021 12:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211119102549.217755-1-thuth@redhat.com>
 <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 19 Nov 2021 11:02:13 -0000

On 19/11/2021 11.40, Philippe Mathieu-Daudé wrote:
> On 11/19/21 11:25, Thomas Huth wrote:
>> Configuring a drive with "if=none" is meant for creation of a backend
>> only, it should not get automatically assigned to a device frontend.
>> Use "if=pflash" for the One-Time-Programmable device instead (like
>> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
>>
>> Since the old way of configuring the device has already been published
>> with the previous QEMU versions, we cannot remove this immediately, but
>> have to deprecate it and support it for at least two more releases.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 6 ++++++
>>   hw/misc/sifive_u_otp.c    | 9 ++++++++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
>> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
>> index 18aa0bd55d..cf6098ff2c 100644
>> --- a/hw/misc/sifive_u_otp.c
>> +++ b/hw/misc/sifive_u_otp.c
>> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
>>                             TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>>   
>> -    dinfo = drive_get_next(IF_NONE);
>> +    dinfo = drive_get_next(IF_PFLASH);
>> +    if (!dinfo) {
>> +        dinfo = drive_get_next(IF_NONE);
> 
> Isn't it a bug to call drive_get_next() from DeviceRealize()?
> 
> Shouldn't drive_get_next() be restricted to the MachineClass?

Yes, that would certainly be better - but considering that we are already 
past RC1 of the 6.2 release, I'd rather prefer to keep this patch rather as 
small as possible and do such refactorings during the next development cycle 
instead.

  Thomas


