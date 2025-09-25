Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B333CAC5A5
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 00:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1Zia-0001XV-0g; Wed, 24 Sep 2025 20:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ZiV-0001Wy-Uc
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 20:20:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ZiQ-0003Pm-5Q
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 20:20:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so2102445e9.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758759602; x=1759364402; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yBTysEaJeGfbau7ZgvrXVhzczRMD5WRfmbRaLJ4gBhE=;
 b=JMLhtZkeidvP0RMA1AzbB7tgZRWQeduu0ZwBGFnf8J/fFofixfYOsCNWu3BJy3WNHz
 Ge3rvYuMlX3PEePZEflDeCBYYbruTQSTQaOT4kVsj/hQ/qY/ZY4ceMWQjVQIdUBZvjq+
 RrUfjuK9b55wyBTK5AY73DOsL7Dv+am2/mBV3Ttk2gjzrpx0sJouLNzFwZAwoRgZys+W
 1kj6aOwHYcONTVvX91giCJL3rcbLaMDhV1UsLt1F3nrSdJQZc8UjVo4Ks8DPfeTTBk8i
 xCx3z76v6xYA4kngxoGzG263ZJLytcXj0nxCDg+eiPEmchYrcdXTHOdfIQnoSwxP1DEo
 6rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758759602; x=1759364402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBTysEaJeGfbau7ZgvrXVhzczRMD5WRfmbRaLJ4gBhE=;
 b=e4Y+AFfXwaFmb7HZeFAc6/jhUjpVzc5MjBXLo/b2dj00hcVZS8NejIZd9feAgzxUup
 HyDS27o6AClNtoQWCs7oY3JUgiXkDI6STqV9/XkZP/6JLvzy6vZsLN5hmjHyukA053ET
 ADHxHBXpQ21AQzuhhffvSgzZRxjlcI0ZY9fR/lHrYVyIj9B8G5B3bqJHIddWa6ygN8MR
 KQFnQm/NwdTjjRpp383GAJ3W3szcBcbe47lyPGMRSOqpqsfdgJMudsUgIwa+qYAhP9E0
 mKO/PRvGt/hFw+A9FpWb0CrYuBv2ExqnvfpPIMK0bg5y3P4cPdE8dEQo64EE0UEEd3Nt
 ghHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAz/BvrK3QYV6Nk7D0ynAV/xymzoV2KBFiVCK5Av0fsVCFjW7c/pJv+1JI4DBido6qCYLCtgJ+PPF+@nongnu.org
X-Gm-Message-State: AOJu0YxUXHrtYkrvOM7BqpdfEgzmTZIU19NA/Dj8f5z8GoAt9VWmPzp5
 0bh7vvsMDb8EZA+g3KQahI48PUrZD87xrBujZt5TpQ6wrOwjx8XszCK8NcXmUY5qUdU=
X-Gm-Gg: ASbGnctkHDRDeNR4ZJi6wz5kE4W8RZKrtg0zyrZLTCcg38Fi+lzBMGr57B8KgSXsiFd
 UXK8TNeIkg+wIBcrz0hA+wERIefFq0gDNOBWRJBTh5HnSj6Vuj+sUCd8JV6MrRydRuosNeA74TY
 w99C3C+QQVog7BT5fSdjsijFp0dZ6tauQzwSjeE1c8tVCBD9vG3pZWzFWl33uc2FhBo3XxomUgy
 NgYOZ7JBFMOHLreyGhL/Txw7CuH9DeRcVz2/JUcro7XCcZoL5qM9TeGzyeoABZztE1woP09xbe1
 9YTo8n04n1+eraFOpAoa1FJbDS4Xe8Pq/KsgTvRe2k1zw2N/gs1JF+5Y1zq1jRnll2imV9gq2dZ
 QN/YfQDujtjbIVU3hBetQFUl+W6r4qLjMoLu1W8HQIIA5d4BbS0biI606GJ53dUSazA==
X-Google-Smtp-Source: AGHT+IFpG9FWod2mOuetb+mLamZZcuHLaDWY25b1ZCgR/+Nd0TSNU+iYMojV0leL+1r9SFKmPErzLg==
X-Received: by 2002:a05:600c:1c8e:b0:46e:1f86:aeba with SMTP id
 5b1f17b1804b1-46e329f819dmr16198575e9.17.1758759601540; 
 Wed, 24 Sep 2025 17:20:01 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e330d1d2fsm5588915e9.3.2025.09.24.17.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 17:20:00 -0700 (PDT)
Message-ID: <a9d3913f-0996-4f5d-9ba7-b0fb464e9d28@linaro.org>
Date: Thu, 25 Sep 2025 02:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/system/security: Restrict "virtualization use
 case" to specific machines
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
References: <20250908125058.220973-1-peter.maydell@linaro.org>
 <aL7xrilR-gyByKEM@redhat.com>
 <CAFEAcA_wt3HwDq=sJ+VuLdx_RFFwB6E9FjrbT1zgNXGGvfQ9YA@mail.gmail.com>
 <B5215A1D-C8F5-44FD-B19B-70D78B7FD4F5@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <B5215A1D-C8F5-44FD-B19B-70D78B7FD4F5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/9/25 20:16, Bernhard Beschow wrote:
> Am 8. September 2025 15:15:43 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
>> On Mon, 8 Sept 2025 at 16:09, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Mon, Sep 08, 2025 at 01:50:57PM +0100, Peter Maydell wrote:

[...]

>>> Currently 'virtualization use case' is reasonably vague such that we can
>>> bend its scope as we desire, at the time it is questioned in a possible
>>> security report.
>>>
>>> Machine types are only one aspect of this. Devices are the other, and
>>> the area where it gets significantly more fuzzy and difficult because
>>> essentially any device can be used with KVM, and where we draw the
>>> line is fairly arbitrary.
>>
>> I think that being vague like this is a disservice to our users.
>> If I'm a user of QEMU, I'd like to know whether I'm inside the
>> line or outside of it before I put my config into production,
>> not later on when it turns out there was an exploitable bug
>> that wasn't classified as a security issue...
>>
>> Most devices can't in fact be used with KVM, because they're
>> sysbus devices that aren't used in the machines that you can
>> use with KVM. Pluggable devices are rarer (and yes, under
>> our current policy random PCI devices are effectively
>> in-scope).
> 
>  From the top of my head: Various USB and I²C devices can be used as well.

I suppose USB /is/ regularly used by 'virtualization use case' for input.

Also I expect I2C to be mandatory on x86/q35 due to the SMBus
dependency.

Like we list machines here, should we be explicit about devices covered?

> Best regards,
> Bernhard
> 
>>
>> thanks
>> -- PMM

