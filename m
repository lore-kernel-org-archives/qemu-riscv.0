Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG5Gt-0002UK-C8
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 15:33:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5Gs-0002Rs-1Q
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 15:33:30 -0500
Received: from [2607:f8b0:4864:20::529] (port=40954
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nG5Gq-0005fF-0M
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 15:33:29 -0500
Received: by mail-pg1-x529.google.com with SMTP id q132so5932564pgq.7
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 12:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KqpTNMmFfys3C40DPRngPUWMearuow7Tf85/Nof3KlU=;
 b=p81AHRRF6oqxHqzMIOtf8Jp1qGtxhXnQikwVYDrHpSGpJBd46kQljYf/7JdlWIkOAV
 SmIyZWqPon7ZlJ3ZuS3Xx3/J2QjuYsd0Ln1x2kpfjNvPMeAwipAaG0LrWakJlml1pYuW
 fa78NGFsLORBEqPT0ScVSVXEBV7lj8KEePLpOGCmIh/axJulECFaPjMRUghiSQbGCLgO
 81YK0AX3+uMpI6M4K6yS45wYR3i5HvB5xZPOLvb2SYoZbKaKixYDVfwKoJDTeP/efmKx
 QJ90cSTBm9OxcB4k9W+BWiMBcahvki6vzoENcPNAUKjIElZopBq2lTR1ilqTdceW+OUE
 hH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KqpTNMmFfys3C40DPRngPUWMearuow7Tf85/Nof3KlU=;
 b=JD+0XxzRUizBTZtx18hezIFa6dniv1xmywGtIumuAs1cDle8nmuN03Sq++MpeMcEb9
 L53t859LeCcfBxbHAIUJ/GfO1BdHdAVmJfsCYQyTXeB91+WGfP2UxNWQ2mAGGQBeHiUo
 b+G3oWFbJm2eJbO2FXB4FOL+RYkw+aJIfbKRkEjEbhsINgX4vb5vIKhDpTZ6k490wjLr
 +FmMwBHHvMTiKl1+bcTsL4WN9kXLxOOS8YmT8BDVhOc0MDzIYi6cNtHaYHudnUPmaJbv
 3XGodIdMuhN8IV1OwgQGAzcvHakmfOk8cFn1lkRQj9e3hSFJdp9JIRuMQSotfAjDCLG/
 3ybQ==
X-Gm-Message-State: AOAM533P6Q0WwvHaaorqgtEsNomM0aiQuX/ev3UvI7aPnSvhUyzJvz1a
 mijm4UMqXdTI3g4ZjbffR6akpA==
X-Google-Smtp-Source: ABdhPJxIGeHcOF7/0VBplkwdvL6Zff5U7QPd322hq7/3bjcD0nYFxW+PEx0A1hrei4r7MJ0MJT5NVQ==
X-Received: by 2002:a63:f006:: with SMTP id k6mr599786pgh.173.1644006806388;
 Fri, 04 Feb 2022 12:33:26 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850?
 ([2001:8003:3a49:fd00:d2cd:dac2:7e7f:5850])
 by smtp.gmail.com with ESMTPSA id 16sm3581265pfl.99.2022.02.04.12.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 12:33:25 -0800 (PST)
Message-ID: <d1efe6e1-083e-e419-87aa-7513ee3b28e9@linaro.org>
Date: Sat, 5 Feb 2022 07:33:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
 <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
 <9fe41ac9-f0d9-1122-7ec3-3f20e3667826@linaro.org>
 <CAKmqyKNpefaQMZcW1CsKK22wKMRUxbkPjPAOumei+5NCQsLEVQ@mail.gmail.com>
 <2cb994f2-85e1-451f-c83c-a8403135cdc0@linaro.org>
 <CAKmqyKMRmjwu_DQvZduYwnBwxp1KsY07wzKVLzdw30PWBBEjZA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKMRmjwu_DQvZduYwnBwxp1KsY07wzKVLzdw30PWBBEjZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 20:33:30 -0000

On 2/4/22 18:36, Alistair Francis wrote:
>> So we need to check for write permission first, before performing the load.
> 
> Isn't that what this series does though, albeit for IO accesses only

No.

> Using probe_write() solves part of this problem. If we have RAM at the
> address but no permissions to access it, then probe_write() will
> generate a store/AMO fault. But it won't help if nothing is mapped at
> that address.
> 
> Let's say you are performing an atomic operation at an unmapped
> address 0x00, in M mode (so no MMU). probe_write() will eventually
> call riscv_cpu_tlb_fill() and get_physical_address(). On a system
> without an MMU and no PMP enforcement we get full read/write/execute
> permissions from riscv_cpu_tlb_fill(). So probe_write() succeeds.

True.

But there it's not a permission problem, per se.  What are you supposed to get here on 
riscv?  On some other cpus you don't get a "normal" segv, but a machine check.  I suppose 
you still want to see "store" rather than "load" in reporting that...


>>> Can't we just do the check in the slow path? By the time we get to the
>>> fast path shouldn't we already have permissions?
>>
>> No, the fast path performs the permissions check on one bit [rwx] depending on which tlb
>> comparator it loads.
> 
> If you have permissions then that's fine. I thought we went via the
> slow path if the permission check fails?

We do.  But you haven't changed any permissions checks, so you don't really know what 
you're getting -- you may not arrive at the slow path at all.


r~

