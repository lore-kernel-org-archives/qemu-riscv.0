Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3926CAC5A5
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 23:58:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1ZN0-0002FF-Rz; Wed, 24 Sep 2025 19:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ZMp-0002Dt-G8
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 19:57:47 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1ZMj-0005p8-P1
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 19:57:47 -0400
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-46e2562e8cbso3013465e9.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758758254; x=1759363054; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HUgE2je7N1/3ApoHHaiDlZbCzAijFIHTI6cDHfAhAK4=;
 b=SYJNFDAfkF7au5hr0qpMd1jBS+xB4CDule/srObOuGyjM1dX+TKAPfiJSF/O4ZcYG/
 5plVKEdQGxrkpGyKpRKzDdEAWPvBn/UeM7sOZPifz+JaUtcLQtbXYD6K1U8nMHWPpP1e
 +po/RhzWcbildZSqc1vsW/NL0ICFVY5Zzs0leinlUfoTT5Apt73zWFLhiJgjGNLrdPGV
 TGKEbkaULqwNHL9vSdK3Urz+1s51rVyUj2NTCpxA8qpd2Dfo+JJZFR4nvbsVVa5ID0De
 ugg8L5SXxvH3odvnZ9q7tiG0eY8Fo58Wxv2Jf3f1sVgXwNzca6wFAORu5EZ+iAgYy8FS
 uk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758254; x=1759363054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HUgE2je7N1/3ApoHHaiDlZbCzAijFIHTI6cDHfAhAK4=;
 b=SOwd/q98eDa2ex3IaueZizxruNoFvcQO5/y4O72SIx+PqquISexSyT9pCZolyckNqG
 CoJR/WW6tKDKQB1XHfkhhEIy99ecPRv6U4SLPAWSfbFBtd6+bTBijvxyT1d6wjBWU6Jl
 Q7QdZFgQUnYwa8ye9PG8BBQFB7C6FjKqBar5PftkhsoCrNLRmkw/uMzeDvSrJUA4B9bo
 Dp6xBcQ4XRrVStcqBlQPLcSLowp3PM5mX9Bprq8hHn/5U+0h8KRUqRa9DJe8eL1oOEz5
 U6BtC5lajD9mjsdVw4rtRn4sUL03nwBlNjK79+CYh0NOwN3Ut8ZhQey+ISgm4PsdkfC7
 exTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmrzgtc3HdwPR2S9fvdqSn3ZB4Q0YAy09sVRxXofsPVYWg9S0wuKlmK0GAFmU0P2IBMYFghFVCzmZg@nongnu.org
X-Gm-Message-State: AOJu0YzJara+oVcAamLfscr1VXp+JkIB8/o09SNwlLX8DWP9t6IK1kEo
 g9loJ9UCObJSrhe/vDQG5XKGqYKm2eE8pUHP5noGU8IOzIibcCyiPhZ7K0K3Q4aISDA=
X-Gm-Gg: ASbGncv21W2ts+5RNntfwRtLLMxMI47xWfKQ+U5HoohFUJy3HihHtFB9GCQhGsa1BA4
 uFo7Bxbt75OYxwll3MAIvwLhIT9kX8LRwL6MIFpw1Py8OX9qDmWDWYoU1kFzuUQkdEHE9dp4SJ3
 0zeVyubSXK04BbWg5gWLXkMnQxC2rgRptunvLxkaKfSlkM1E6QUnSrCwEiQsUZzk1kAvtui2ty0
 SjMWV+uokOrK1q6WFpYSi13V8RP4oOa79I641Kn0QrjBqEMfnldXRKMuCdhfF2ONWPKFaQvS7bd
 3o7BJfUWGiYSya7MkmjSWCHf+tdwi19DdA8QklSgHVd9uB8RpAD+7eVzb5WhTvDTHcz5pG5+fvs
 CEqzXYFySzx0L5Sw+sbuFcmbPFENr7qb/9GLAUapz9fpd2485uTQaOPeA8Ttcm34xAw==
X-Google-Smtp-Source: AGHT+IGOGVZv4lQD6ZBLmEqiyuefFes8NVHxawJVvxtuijz+bEggq/hqmDPRK8wpfq8SgaUR0da6/g==
X-Received: by 2002:a05:600c:620f:b0:46e:23d3:6417 with SMTP id
 5b1f17b1804b1-46e329afe41mr15882295e9.1.1758758254123; 
 Wed, 24 Sep 2025 16:57:34 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31ea3sm50493925e9.12.2025.09.24.16.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 16:57:33 -0700 (PDT)
Message-ID: <5e220ab6-be05-46c1-96ac-de0c3820ff52@linaro.org>
Date: Thu, 25 Sep 2025 01:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] docs/system/security: Restrict "virtualization use
 case" to specific machines
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
References: <20250908125058.220973-1-peter.maydell@linaro.org>
 <58abecd0-4071-4cd9-8df6-78478c310969@redhat.com>
 <c9192739-430a-4f9f-bce0-3fe2e819f9b7@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c9192739-430a-4f9f-bce0-3fe2e819f9b7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x341.google.com
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

On 8/9/25 15:21, Thomas Huth wrote:
> On 08/09/2025 15.09, Paolo Bonzini wrote:
>> On 9/8/25 14:50, Peter Maydell wrote:
>>> architectures where I've made a guess:
>>>
>>> i386, x86_64:
>>>   -- I have assumed that all machine types except the "experimental"
>>>      x-remote are supported
>>
>> Please exclude isapc as well.
> 
> Ack, isapc uses ne2k as NIC for example, so you certainly don't want to 
> have this in the list of supported machines.

Agreed.

> 
>>> mips, mips64
>>
>> Probably none.

Safe bet. MIPS host is being deprecated anyway:
https://lore.kernel.org/qemu-devel/20250924120426.2158655-26-marcandre.lureau@redhat.com/

>>
>>> riscv32, riscv64
>>
>> I'd assume "virt" only.
>>
>>> ppc, ppc64
>>
>> "pseries" only.
> 
> Ack, ppc64 should use "pseries". But that's 64-bit only. I don't think 
> we want any of the 32-bit machines listed here, though, so I'd simply 
> suggest to drop the 32-bit "ppc" word from this section.
> 
>   Thomas
> 


