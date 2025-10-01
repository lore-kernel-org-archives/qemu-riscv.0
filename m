Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E0ACAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 16:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3zuv-0002ox-WF; Wed, 01 Oct 2025 12:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3zuu-0002o0-Dq
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 12:43:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3zud-0007tG-Ij
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 12:42:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so237975e9.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759336944; x=1759941744; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+uabRtDuzJ/m4e+L6lhktLwA2GFXiRSn7Uix0Zvk/U=;
 b=uXl2HiadkNC9zR/qCyLswfhOSC9cmHN9fbymMLd5ikbM/BKExMXH8FESZSbmxbbKFK
 TS+GH9U5dYirRzz3QKQsja7WJe0R3/W+IRRylSc/qriXSw3BWiU2fmxEcDbSJQSYjuZw
 si2NaQubr0IhxhpYDxcc3Bhh7S+UHmRMOMg8OiZFwLPDbYQ7B9dkZMuHtIbQpLb0YIon
 gbLQZtqXtGnfdDR9uFutabWw0Ooi2rSBOc67gX0obi33Z5BOdjTmGT51Awm8xJ1fXBOo
 VCqCHbiEMVgMR53blVY5yGEiAZejbyrN3iZ+ngujmwNdfCgVEjqJyCPvHZsUg8om+jBr
 ts0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759336944; x=1759941744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+uabRtDuzJ/m4e+L6lhktLwA2GFXiRSn7Uix0Zvk/U=;
 b=kBvPn50f4fTLd1GvhEstg7eKu1qIY5GGoFmA6vchsWUYY9zzUUju0JVJTP9xwpSZWR
 CDdR4fGiC+1xTLpuxzb8PSafqmWWCcZT8TIHjQJwwGPV2llNc68b/FZnkYbab0jcljsS
 zFdnVa47m1WdWqwJ78zpIi3MeLsKm6PJmVm363JMwaVMSv/uHCTAnS//vlk6on/CW8m3
 VRDqqnJRYeOJmaQi6/8ptCvVMnF52cefsuiPG8j5iKpHHzNrciKgvZrwU7QLZ0TeodvB
 +zgNfNoxViD5mfOfqX+dtFGEJx8esenaGUhebcosLaFuFaEy1ZRdcptOsKkGEElhzn9B
 CUFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+p8kLmix8pqCqYNmiGjQGIPcVg4N+xJ8Yb8odd5+1FYVpbGi11AdWUBSk/cN+DDeATJZAZZHX5XX0@nongnu.org
X-Gm-Message-State: AOJu0Ywq/DLwG07wtP5oc6BVB9nnlBDNKodFT3vvwHVTO0mGXGLDrKTr
 yQQvlu19dfkMUVNq1s/9qhlNgcHfSoaIL81bb13IxPejTntOREu1+OAhGdsF7sI9oCM=
X-Gm-Gg: ASbGnctg2gM7qAZXqxvx7tNG4oCZir+HjPxZpcr2402Fy+wgwJxaeyPFl7Gi24TKHjd
 kdRxp/XcIHYssoZ0xmljCJLT+Bzee2jNbGtX6EitsQ0uIsYJpHxIaYrhahyF47kMvUpruTqRImw
 V9lyu4w2vktcBWDqgzOuMKb7o5RpIgQTDPogEIdxlWh/4Y3YE852Xmfg9GXrjKo8n6URGFPPgJU
 Ye0+GnJIGIbc+sPDRo2fOyTCq7JvSZ3Vc/s0CH7vfXFbmEBF090uYWNOn7g+R4qmOdG6CTrc98V
 kOJiTbFOmCMv+DpIStwSbR1sMPCwrwTWgwdXKGam1qVlLpFKH5GRFiwao+rGnaIZFMZjidNAFAI
 rczAhmZsM0Td9CW1nNxpsxs/UBcWgoG8Xr6i1b+BjbzrP4AK/76DkP2f0uNSQ6LzMBWL3gsPKGN
 YH3PV4bLUD1xDqsyg82hqobhFo
X-Google-Smtp-Source: AGHT+IH4jKSsUHp9Yqoi1XvxjhdrciWHucaXnu76L7493jt6wfeUpweQHhewh9H3oV9qQHugx5YIXA==
X-Received: by 2002:a05:600c:a304:b0:46e:652e:168f with SMTP id
 5b1f17b1804b1-46e652e1d0fmr19150305e9.6.1759336944205; 
 Wed, 01 Oct 2025 09:42:24 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c3cad50sm39100755e9.3.2025.10.01.09.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:42:23 -0700 (PDT)
Message-ID: <2a53049c-01e2-4f0e-ac51-f55d50173b22@linaro.org>
Date: Wed, 1 Oct 2025 18:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu <peterx@redhat.com>
References: <20251001150529.14122-1-philmd@linaro.org>
 <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
 <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 1/10/25 18:35, Richard Henderson wrote:
> On 10/1/25 09:08, Peter Maydell wrote:
>> On Wed, 1 Oct 2025 at 16:05, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> Instead of using the convenient @CPUState::as shortcut, use
>>> cpu_get_address_space(asidx=0) to get the vCPU first address
>>> space.
>>>
>>> The goal is to reduce the risk of AS mis-use for targets
>>> that uses multiple ASes per vCPU.
>>
>> I'm not sure I agree with this. The cpu->as is handy for
>> the large number of targets which only use one AddressSpace:
>> which is everything except arm and x86 right now.
>>
>> Targets that use multiple address spaces need to be careful
>> about which AS they use by definition. Unless we have a
>> track record of code in those targets carelessly using
>> cpu->as when it should do something else, I'm not sure
>> that there's a benefit that makes it worth making the
>> "use the one and only AS this CPU will ever have" more awkward.
> 
> I agree.
> 
> Moreover, '0' as a default is just as bad as cpu->as, because you're 
> giving no thought to the selection.  Similarly using 
> MEMATTRS_UNSPECIFIED.  When such things matter, we need the real 
> attributes and/or as piped down from the proper memory reference.

OK.


