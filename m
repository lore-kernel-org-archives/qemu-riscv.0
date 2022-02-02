Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nF3eI-00054t-O0
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 19:37:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF3eF-00052O-3h
 for qemu-riscv@nongnu.org; Tue, 01 Feb 2022 19:37:24 -0500
Received: from [2607:f8b0:4864:20::429] (port=44920
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF3eC-00004r-DF
 for qemu-riscv@nongnu.org; Tue, 01 Feb 2022 19:37:21 -0500
Received: by mail-pf1-x429.google.com with SMTP id n32so17347990pfv.11
 for <qemu-riscv@nongnu.org>; Tue, 01 Feb 2022 16:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jhsz2icLGKf29iT+HllDQ3q/SO5RJF21P2Q3G8ic0lw=;
 b=g4Miv8/yUbTODj9KdWjOYmmKlylEBYdHV1FwgPikauANQ0DS5Us4G7a8XfzpouSfye
 YY7i816qaEK9ijZsBpHSqb3/O10XCG2/stz90cyeG4kKH968OMA0ntUz5mXZJLdYEVw1
 D0LoaqkqCCw3wkcr2Iq8GqLePl+2bCWSAoqcBykyR9YQPmqqvPyRpG/koPfp8OKJCu4o
 j8fzejtUAtnVNzCCGk12OXN4PTRVZxhwjH4YaykCc4CBgvIEq0D4eAkheLVkFIv0whxh
 HSw7ip7yNbKa442fU6yNKcauWnNFkxc3M47KnWfMJXaa0KPVaOcEgCp8+9rOOoU+j+wo
 pS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jhsz2icLGKf29iT+HllDQ3q/SO5RJF21P2Q3G8ic0lw=;
 b=GnLIjDTnBHwBqAhqbph+sMdEo3m/iWqoW7of1iM9cAbfyaU3E0YW0hCWPfYgiBjWB8
 ajkME0rH8NJlMKTS1/oaw6OIjSGU32XV73c4jSEheIJIVsNSDvDaX2NQHzICzBLgWwrZ
 WxjsvArbePiWgjZBfDTiUO/VX1WvUPW8fOMtt3WRVoWs3pLi7hUIWDwyQG9ym6w6+4Aa
 PReXuEIHlEhpqPFbOGCIoTO3ryRCNdNwP1uT0YVQbNl2kS1lTPhPIfYBeANiCn1S3PIW
 YXGLkvP67b8Atwrc6KkDfZZp+rVxr9mVaiC1blAeDIVrVljeVbrfW/zSCxGhgOMWp0PQ
 YYFw==
X-Gm-Message-State: AOAM5327SHGsLV8ps349FYs+yUpHr8J0jvUpWzOxajD1TrGYAQyDxqBX
 1BM0C0u4T0FR74nWSymZ0RxMXw==
X-Google-Smtp-Source: ABdhPJw+ejomQCraBq7AZbNHppJ0tNWtAJWxbi50JWtbOlby/ZB0wTXpASBs+vQ054J8aJLxkgWflw==
X-Received: by 2002:a63:dd4d:: with SMTP id g13mr22868303pgj.202.1643762238787; 
 Tue, 01 Feb 2022 16:37:18 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c?
 ([2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c])
 by smtp.gmail.com with ESMTPSA id o9sm11870148pfw.86.2022.02.01.16.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 16:37:18 -0800 (PST)
Message-ID: <2cb994f2-85e1-451f-c83c-a8403135cdc0@linaro.org>
Date: Wed, 2 Feb 2022 11:37:10 +1100
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
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKNpefaQMZcW1CsKK22wKMRUxbkPjPAOumei+5NCQsLEVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Wed, 02 Feb 2022 00:37:25 -0000

On 2/1/22 15:40, Alistair Francis wrote:
>> Alistair, you're only changing the reporting of MMIO faults for which read permission is
>> missing.  Importantly, the actual permission check is done elsewhere, and you aren't
>> changing that to perform a write access check.  Also, you very much need to handle normal
> 
> I'm a little confused with this part.
> 
> Looking at tcg_gen_atomic_cmpxchg_i64() for example we either:
>   1. call tcg_gen_qemu_ld_i64() then tcg_gen_qemu_st_i64()
>   2. call table_cmpxchg[] which eventually calls atomic_mmu_lookup()
>   3. call tcg_gen_atomic_cmpxchg_i32() which is pretty much the same as
> the above two
> 
> That means in both cases we end up performing a load or tlb_fill(..,
> MMU_DATA_LOAD, ..) operation as well as a store operation.

Yep...

> So we are already performing a write permission check...

... but we're doing so *after* the load.

Which means that for a completely unmapped page (as opposed to a read-only page) we will 
generate a read fault, which generates RISCV_EXCP_LOAD_ACCESS_FAULT and *not* 
RISCV_EXCP_STORE_AMO_ACCESS_FAULT.

So we need to check for write permission first, before performing the load.

> Can't we just do the check in the slow path? By the time we get to the
> fast path shouldn't we already have permissions?

No, the fast path performs the permissions check on one bit [rwx] depending on which tlb 
comparator it loads.

> As in add a new INDEX_op_qemu_ld_write_perm_i32/i64, make edits to
> atomic_mmu_lookup() and all of the plumbing for those?

That's one possibility, sure.


r~

