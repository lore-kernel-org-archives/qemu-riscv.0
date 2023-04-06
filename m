Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkL1W-0004aY-PZ
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 04:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkL1R-0004ZJ-QZ
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 04:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkL1N-0007xC-09
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 04:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680769861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
 b=fq5hrbMEhSr5sV2EYnGWDORJco4nvgQELjlwSO/41rdakmqlGvjgpENehimCW/VeH4zX4E
 E3+MFG9oYrgfH21vqyXP12eLTt6XkqWt+OpZlH0ND/A1Qczeq2sZn/vir4+eG5heyVdYfs
 eXQrftlGl1/oTebIvowhRfkevqjzYhY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-YdaNrFzzP-WC_TJlAFWaeA-1; Thu, 06 Apr 2023 04:31:00 -0400
X-MC-Unique: YdaNrFzzP-WC_TJlAFWaeA-1
Received: by mail-qt1-f199.google.com with SMTP id
 s23-20020a05622a1a9700b003e6578904c3so7758447qtc.17
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 01:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680769860;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ERnzxn9Qx+vwXFLzk0V7Z+TZPxG+skd++dkET3pEDA=;
 b=rsgBBcsnRyh3A6tJJYL/pc6KJuOQBj65fS7a+ybuqVhnq5KwJbQAXgouRiaQDzmZmN
 zsTCWtR5rFP0RQ5u3qEsmQqBKy3tZkpyu5x8k/T6zYEUb7Y+fR7lg0xoga6AyWNU0ZFU
 Je0ykx8NtNXc57wBqKSFULZfQODqWU6tf4dhE2kmOrNN1ynOeO2APRrSTNtgjZFs0cve
 htrLixKFqXZ8iAcMUUr4JG+MkU/H3CSQ+zvj0eWOHdh84XRtYb6lTvekep+P6WtNwLM2
 osVHFmZEZ6lWpHvVUyVoIt9m1N/IuIgJ2mjkSzj4BF7a+zzLjyS5wEqjl0oIpcSgk1oB
 14jw==
X-Gm-Message-State: AAQBX9fHIuIweNVV86kYlNW/bXNzK/JHLp5S/fAEpvlTVN5zLF1/ptbl
 Uz0W61dWzXj3FEa6tJaPrKn89uBvfKPy7BcqyHekgthWIh1UQUFHKUFzfIfI9+/ylZwvWKwQX+Y
 RvmdJI4HbBbfL0VM=
X-Received: by 2002:a05:622a:1707:b0:3e3:93ae:d104 with SMTP id
 h7-20020a05622a170700b003e393aed104mr10590515qtk.30.1680769859912; 
 Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bX/yu95XVWK0ZnZ1Tm5Ts1RGGCREWa6oXibiKT2zJGhGsp/AR1+Uw/BcOp85JRID7YKxdxlw==
X-Received: by 2002:a05:622a:1707:b0:3e3:93ae:d104 with SMTP id
 h7-20020a05622a170700b003e393aed104mr10590489qtk.30.1680769859542; 
 Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de.
 [109.43.178.193]) by smtp.gmail.com with ESMTPSA id
 b125-20020ae9eb83000000b0071eddd3bebbsm306099qkg.81.2023.04.06.01.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 01:30:59 -0700 (PDT)
Message-ID: <82060846-281f-8c30-6938-7ad35a8c5548@redhat.com>
Date: Thu, 6 Apr 2023 10:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
 <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
 <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
 <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
In-Reply-To: <c47e1b5a-38bb-fe08-8020-29361fd0e99a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 06 Apr 2023 08:31:11 -0000

On 06/04/2023 10.22, Philippe Mathieu-Daudé wrote:
> On 6/4/23 10:04, Janosch Frank wrote:
>> On 4/6/23 09:50, Thomas Huth wrote:
>>> On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
>>>> Protected Virtualization is specific to KVM.
>>>> Rename the file as 'pv-kvm.c' to make this clearer.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>    hw/s390x/{pv.c => pv-kvm.c} | 0
>>>>    hw/s390x/meson.build        | 2 +-
>>>>    2 files changed, 1 insertion(+), 1 deletion(-)
>>>>    rename hw/s390x/{pv.c => pv-kvm.c} (100%)
>>>>
>>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
>>>> similarity index 100%
>>>> rename from hw/s390x/pv.c
>>>> rename to hw/s390x/pv-kvm.c
>>>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
>>>> index f291016fee..2f43b6c473 100644
>>>> --- a/hw/s390x/meson.build
>>>> +++ b/hw/s390x/meson.build
>>>> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>>      'tod-kvm.c',
>>>>      's390-skeys-kvm.c',
>>>>      's390-stattrib-kvm.c',
>>>> -  'pv.c',
>>>> +  'pv-kvm.c',
>>>>      's390-pci-kvm.c',
>>>>    ))
>>>>    s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
>>>
>>> Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?
>>>
>>> Janosch, what's your opinion?
>>>
>>>    Thomas
>>>
>>>
>>
>> Don't care as long as the file is not deleted :)
> 
> I followed the current pattern:
> 
> $ ls -1 hw/s390x/*kvm*
> hw/s390x/s390-pci-kvm.c
> hw/s390x/s390-skeys-kvm.c
> hw/s390x/s390-stattrib-kvm.c
> hw/s390x/tod-kvm.c

There's a differences for those: First, these devices have an implementation 
that works with TCG, too. Second, protected virtualization (pv) is not a 
real hardware device, it's a feature of the firmware on s390x that is 
exposed to userspace via the KVM interface. So target/s390x/kvm/ slightly 
sounds like a better place to me ... no strong opinion, though.

  Thomas


