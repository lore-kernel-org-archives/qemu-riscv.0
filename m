Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCVsS-000604-LO
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 19:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVsP-0005xd-FP
 for qemu-riscv@nongnu.org; Tue, 25 Jan 2022 19:09:30 -0500
Received: from [2607:f8b0:4864:20::1036] (port=37460
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVsM-0006EI-LH
 for qemu-riscv@nongnu.org; Tue, 25 Jan 2022 19:09:29 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so3214284pju.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Jan 2022 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4HF7wLuxfSuEzncaeCa3tIHO8CR4NPk77onD3UVpJvg=;
 b=itGmavk1zdREbPigpEtPtzfU/HVtIT2bVt9D/SEvH73RhRBj663/g7lqd/NbzwZn2v
 v3stk3Lo2e9pf4zq6ULDDBHuqlGlb1Q4nMhAyJe15LSs7YMTSH+VoBwR6q1sLTIT68ND
 4eAdiX0Zc/hizL+X7pmbhskyILX9scEYqwITq9zB6MS+Co7ek/ou4IMZR9cfvzxt0Cez
 QhZbzErrOLDrfIf/8TqnaI/vWzRkWrnCQGOecnVgUOseP1QLGwPw+x2Nj799aeCo6phE
 L02Y6Qjtw6BTaHdRkQNQhPiwtoBTyDmhATJtUHwoZ6K8uwxf5CJryyF34/vyzbmC1iWB
 XguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HF7wLuxfSuEzncaeCa3tIHO8CR4NPk77onD3UVpJvg=;
 b=U6G3to3JIgI5tW2MIa7FGxAJx25mb1PU3gUZh5IJmHhChVy17bq3URLKG8ok2H7l35
 H5dabFPC0ErdnF5QzMgv+3rf8wNGFyYxhebPfbf8qpXjfHmYt0XSSpLpMo7aCWxjARLc
 NzPWHCBrEnM1KN21s2NGShZltZ/I8Ah9UmZwXD/o5WmQTDe4cWF+U4+zdzFsfY716tKy
 ELCem/tivSxTf2mCaFmVcF5piFn8YLtCsPfmKWjpNh+b9FJ/xa+2Gwu1emy/dNyg1D4/
 0Kr248kjQz8ARc6onazy5T9ptc+ko3rwpRlgPeGYFl414nIuVVwDOqZX8c1IImFWwpJM
 vnHg==
X-Gm-Message-State: AOAM5306JZ0o7DBQrRixxpRMncxqp62TcR24sLjq6JsNLyqfrXOnGzme
 3zVbnC5dzcBzv99e1gEYMg/rRg==
X-Google-Smtp-Source: ABdhPJwU6JrfOAXbVOwlxvWATaGt8eYUk5wvgR3gNr6tBT5IfX/klz/uTl9DN7iB1liO6muoxmGK8A==
X-Received: by 2002:a17:902:ab8d:b0:14a:98aa:b87 with SMTP id
 f13-20020a170902ab8d00b0014a98aa0b87mr21208453plr.100.1643155764798; 
 Tue, 25 Jan 2022 16:09:24 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id om6sm1478217pjb.24.2022.01.25.16.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 16:09:24 -0800 (PST)
Subject: Re: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
To: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, bmeng.cn@gmail.com
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
 <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9fe41ac9-f0d9-1122-7ec3-3f20e3667826@linaro.org>
Date: Wed, 26 Jan 2022 11:09:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 26 Jan 2022 00:09:30 -0000

On 1/24/22 4:17 PM, LIU Zhiwei wrote:
> 
> On 2022/1/24 上午8:59, Alistair Francis wrote:
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> This series adds a MO_ op to specify that a load instruction should
>> produce a store fault. This is used on RISC-V to produce a store/amo
>> fault when an atomic access fails.
> 
> Hi Alistair,
> 
> As Richard said,  we  can address this issue in two ways, probe_read(I think probe_write 
> is typo)

It is not a typo: we want to verify that the memory is writable before we perform the 
load.  This will raise a write fault on a no-access page before a read fault would be 
generated by the load.  This may still generate the wrong fault for a write-only page. 
(Is such a page permission encoding possible with RISCV?  Not all cpus support that, since 
at first blush it seems to be mostly useless.  But some do, and a generic tcg feature 
should be designed with those in mind.)

> In my opinion use MO_op in io_readx may be not right because the issue is not only with IO 
> access. And MO_ op in io_readx is too later because the exception has been created when 
> tlb_fill.

You are correct that changing only io_readx is insufficient.  Very much so.

Alistair, you're only changing the reporting of MMIO faults for which read permission is 
missing.  Importantly, the actual permission check is done elsewhere, and you aren't 
changing that to perform a write access check.  Also, you very much need to handle normal 
memory not just MMIO.  Which will require changes across all tcg/arch/, as well as in all 
of the memory access helpers in accel/tcg/.

We may not want to add this check along the normal hot path of a normal load, but create 
separate helpers for "load with write-permission-check".  And we should answer the 
question of whether it should really be "load with read-write-permission-check", which 
will make the changes to tcg/arch/ harder.


r~

