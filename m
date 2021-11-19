Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo1gQ-0002id-4A
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 06:03:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1gO-0002f7-6x
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 06:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo1gM-0003hd-Nc
 for qemu-riscv@nongnu.org; Fri, 19 Nov 2021 06:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637319830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bp4wN2AZ3JpBiQ02Qg4P2ZC1FxhTxgHFv3gNsqqtcVw=;
 b=fg8U3AqTb4WJM/DItlzL0FlUksGQi6gGX9SYS6mhxwc9z4L8vDFQBcdgoKPBwFUFkqE676
 HmEWsyGMh8Hdce0zLUvOD0aAIeRkgWC3zNLJzNYuDeDgV5c0zK35LspHL55LMFwUpWz55o
 AaZ40q9mHh8HQ+x2dihnHjFWyCDod8Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-LDTDa5SpP0iar6lBuCQJsw-1; Fri, 19 Nov 2021 06:03:48 -0500
X-MC-Unique: LDTDa5SpP0iar6lBuCQJsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so3882961wme.6
 for <qemu-riscv@nongnu.org>; Fri, 19 Nov 2021 03:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bp4wN2AZ3JpBiQ02Qg4P2ZC1FxhTxgHFv3gNsqqtcVw=;
 b=hRfjpOoOALP0LkOhRniReuI7qmUVi6Wk7+MN3G2JmCg3iRDTADZQXvFsLBFbTC+Rkb
 J9MsMQ3BU1Q+LV+8+MOh4RVGO7aP/uDf3rLftEBWJU69Ni27Rny6YumxXeNoVlSzQEk3
 +QHGzhEPuhh4OQpEXdDQoHRx0XO83znVQjTBt7a/scq72uzbbMgkACTGyHrezFJyGTdq
 41eOuzXBnGfjEtdubEEic3swbKDP9wOVv4PQx64R7L1eDmI6mTfxyTahwWBH2ljHs/qz
 Igs4KtSYvR4BGS3Vw0ZGsU0BS1yEZFlukL3GR1itXpoC85zL48E7DlzacS3FiwuOMTMa
 G7Cg==
X-Gm-Message-State: AOAM532CL5JTwmKpgVrPVFPhIgyI8hoOp7giJpDBZLfqmQ9ULD8TtIxC
 zZkTWKUYW+SPs8M9IdEN0vuc/c0yDIJjz8p9y08SQTe/p0eixUhRBdkEp+U0V/W3JJBPlaKM8M3
 rRZmONuKJjySZqow=
X-Received: by 2002:adf:e686:: with SMTP id r6mr6241374wrm.379.1637319827396; 
 Fri, 19 Nov 2021 03:03:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDShv9PGU9vGhuIftBNMtD81l2D3Qu927ngRsQsadiSnJYfDc3/YIbBZP9vY8h/qLQNm6l8g==
X-Received: by 2002:adf:e686:: with SMTP id r6mr6241308wrm.379.1637319827005; 
 Fri, 19 Nov 2021 03:03:47 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o8sm2638804wrm.67.2021.11.19.03.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:03:46 -0800 (PST)
Message-ID: <45ffa010-7c93-1020-46b2-84c0f2060c20@redhat.com>
Date: Fri, 19 Nov 2021 12:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20211119102549.217755-1-thuth@redhat.com>
 <f2de8ec7-3157-0f87-cfc8-70633e0f8658@redhat.com>
 <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4a4c5223-905f-9974-3e54-e4ccd133c359@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 19 Nov 2021 11:03:52 -0000

On 11/19/21 12:02, Thomas Huth wrote:
> On 19/11/2021 11.40, Philippe Mathieu-Daudé wrote:
>> On 11/19/21 11:25, Thomas Huth wrote:
>>> Configuring a drive with "if=none" is meant for creation of a backend
>>> only, it should not get automatically assigned to a device frontend.
>>> Use "if=pflash" for the One-Time-Programmable device instead (like
>>> it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).
>>>
>>> Since the old way of configuring the device has already been published
>>> with the previous QEMU versions, we cannot remove this immediately, but
>>> have to deprecate it and support it for at least two more releases.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 6 ++++++
>>>   hw/misc/sifive_u_otp.c    | 9 ++++++++-
>>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>>> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
>>> index 18aa0bd55d..cf6098ff2c 100644
>>> --- a/hw/misc/sifive_u_otp.c
>>> +++ b/hw/misc/sifive_u_otp.c
>>> @@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState
>>> *dev, Error **errp)
>>>                             TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
>>>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
>>>   -    dinfo = drive_get_next(IF_NONE);
>>> +    dinfo = drive_get_next(IF_PFLASH);
>>> +    if (!dinfo) {
>>> +        dinfo = drive_get_next(IF_NONE);
>>
>> Isn't it a bug to call drive_get_next() from DeviceRealize()?
>>
>> Shouldn't drive_get_next() be restricted to the MachineClass?
> 
> Yes, that would certainly be better - but considering that we are
> already past RC1 of the 6.2 release, I'd rather prefer to keep this
> patch rather as small as possible and do such refactorings during the
> next development cycle instead.

OK. For pflash:
Acked-by: Philippe Mathieu-Daudé <philmd@redhat.com>


