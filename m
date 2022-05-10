Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMDP-0003aA-SR
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noMDI-0003Y6-CS
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 05:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noMDD-0001Jd-P7
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 05:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652175071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUmpwpy85uI+MvOTmx6uML8p19sbFrVOZWZsg5MDfTQ=;
 b=LWbnb6j5xCA6ovf2McLHrjGauyiOU22sFuw6Bkp9hR++O57j84DdEfon17/0jz8OEvPRZv
 Hf5sLDSmWZ2CTK5opsLSj5YffmUhQPBGSIjZmmygB+u2VbycrzEv/c7tIjLj1iYKI1OPxy
 f+8lcZWrVCzx0o5d8TzzCPIED8Ng/gk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321--6fwYHDIMMSVRBUE60FnHQ-1; Tue, 10 May 2022 05:31:07 -0400
X-MC-Unique: -6fwYHDIMMSVRBUE60FnHQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso5046434wmm.7
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 02:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GUmpwpy85uI+MvOTmx6uML8p19sbFrVOZWZsg5MDfTQ=;
 b=3NSetDgBTmQoDtqlO1vA5NH2krubv+a58YIbAmTLzEYrrQ4vRg2BLQ1diTPhLhYEDl
 bQBclId3yAOPAm/9w+SQu4DokqJWNftQnxyOIl7znTGamCA+vcQmHJ0slNxdRjctY3Je
 M7rbPn4hEyy4x4mgewebcdmTrgimlkApR1CgIbOe/Fa/P9VfCGwJW0UH9iIHt3Oi9mcq
 iroEcf45BS1rVg2RBqWnzvesDWjz4YjWO8nRuXL+tyhR91Uc0R/4CM5KnqL38GIPS4wA
 TGlfiWy0WOvUUdBEQMkZAmBJ3TBMql5SPacZfpmWwD7KpoPUw4ekReHk+mB5AaXtJeJf
 4/OA==
X-Gm-Message-State: AOAM530hN0+iw0vXuM8JRSXHOiMbnMK5/+pkmVrOKHR6dzMHGCtXo6Hv
 f/HTy2J4ECQiJTDm0+Zu86vERh5z2rEbcMa0j8CuFFBdV3VSEt1qftoDxvutWX5M3lntrg2vcAK
 EbzYoEKy4ENfwMmY=
X-Received: by 2002:adf:e7c1:0:b0:20a:b724:cedd with SMTP id
 e1-20020adfe7c1000000b0020ab724ceddmr18531145wrn.409.1652175066095; 
 Tue, 10 May 2022 02:31:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2HVK2rSRzzOAgdeQk+975gcY32lhPoNIvfb28aYMPOu/vGzCj8rW3SEjL0jeuKKl2MuNtVQ==
X-Received: by 2002:adf:e7c1:0:b0:20a:b724:cedd with SMTP id
 e1-20020adfe7c1000000b0020ab724ceddmr18531111wrn.409.1652175065791; 
 Tue, 10 May 2022 02:31:05 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0020c5253d8cfsm16087878wrw.27.2022.05.10.02.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 02:31:05 -0700 (PDT)
Message-ID: <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
Date: Tue, 10 May 2022 11:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: QEMU 32-bit vs. 64-bit binaries
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 mopsfelder@gmail.com, qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-RISC-V <qemu-riscv@nongnu.org>
References: <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
 <Ynou3EnxfSmrzGT0@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Ynou3EnxfSmrzGT0@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 09:31:34 -0000

On 10/05/2022 11.22, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Tue, 10 May 2022 at 10:01, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 10/05/2022 10.54, Markus Armbruster wrote:
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>> [...]
>>>>
>>>>> I once suggested in the past already that we should maybe get rid of
>>>>> the 32-bit variants in case the 64-bit variant is a full superset, so
>>>>> we can save compile- and test times (which is quite a bit for QEMU),
>>>>> but I've been told that the 32-bit variants are mostly still required
>>>>> for supporting KVM on 32-bit host machines.
>>>>
>>>> Do we still care for 32-bit host machines?
>>>
>>> As long as the Linux kernel still supports 32-bit KVM virtualization, I
>>> think we have to keep the userspace around for that, too.
>>>
>>> But I wonder why we're keeping qemu-system-arm around? 32-bit KVM support
>>> for ARM has been removed with Linux kernel 5.7 as far as I know, so I think
>>> we could likely drop the qemu-system-arm nowadays, too? Peter, Richard,
>>> what's your opinion on this?
>>
>> Two main reasons, I think:
>>   * command-line compatibility (ie there are lots of
>>     command lines out there using that binary name)
>>   * nobody has yet cared enough to come up with a plan for what
>>     we want to do differently for these 32-bit architectures,
>>     so the default is "keep doing what we always have"
>>
>> In particular, I don't want to get rid of qemu-system-arm as the
>> *only* 32-bit target binary we drop. Either we stick with what
>> we have or we have a larger plan for sorting this out consistently
>> across target architectures.
> 
> To my mind, qemu-system-arm makes a lot of sense, and I'd rather see the
> 32 bit guests disappear from qemu-system-aarch64.
> It's difficult to justify to someone running their aarch virt stack why
> their binary has the security footprint that includes a camera or PDA.

I'm not very familiar with KVM on ARM - but is it possible to use KVM there 
with an arbitrary machine? If that's the case, a user might want to use KVM 
on their 64-bit host to run a 32-bit guest machine, and then you need to 
keep the 32-bit machines in the -aarch64 binary.

Something like that is at least theoretically possible with ppc64, I think: 
Using KVM-PR, it should be possible to run a g3beige (i.e. 32-bit) machine 
on a 64-bit host. Not sure whether anybody has tried that in recent times 
(afaik KVM-PR is in a rather bad shape nowadays), but it might have been 
possible at one point in time in the past. (PPC folks, please correct me if 
I'm wrong)

  Thomas


