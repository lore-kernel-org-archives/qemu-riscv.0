Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irqV9-0003PV-S8
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jan 2020 16:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irqV5-0003MO-6n
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 16:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irqV3-00005r-QM
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 16:46:54 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irqV3-000050-IA
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2020 16:46:53 -0500
Received: by mail-pj1-x1041.google.com with SMTP id d5so513548pjz.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2020 13:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bRHxtr/gEoRmIvcSsH4ljVDo6r+lSxazyG4v9oNPHvM=;
 b=hUO/M/KJVduBZNvdSfBtQ+s9JuVJpOv3oNUzT05nrIInQn4IPDoUTb4oOKzBrKCtV+
 436wk2H2fkDNat0ZO0uKteqd8VwfsjJIqKtS24WDWUn4Q5g7WgjtXZoLOFOEsM3lMb6V
 xA9PRJmw/gypJSy0e4VF2jwoNAVSz7f7HHNfdLz4xuOapQayY8KiqUn2YEZaaNOLtMtF
 ZpYHUyDLoWLOT2xlcQwR2w4ChNZCPwjK/2/5sEC3uHG8S16tDZnsqds0NqQDvoxElloe
 /XPoleB94rvm6ZaTN5/mmXApUtMFRLKLD78h6VXEiQkH28MDjtHucGS0f2PT6Oak0+x2
 7w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bRHxtr/gEoRmIvcSsH4ljVDo6r+lSxazyG4v9oNPHvM=;
 b=Z4HWJB4CpFHoOXpZnl6yMWdPSR5kTA+mIC5NA67X/NYWVUeANAvRdmBwhGXH1lhXKc
 g+yyWky6GK5b06BgTS2+BtPBwCfoz7Tn+1uQW7cEzkVRFFtjpFBGrD26p+BPaybAt+hD
 fB0L62QBRb8JBP+bZYEB3GxlE9gUG2vQLI8vOYaUYwtQnQucG8LlrWFs/Ae3bbIji1n3
 j/kRcz7QVQx8DZMdqVlvtVZn5kARvR5oESCeHbWPXHnKw3yK6g41p1r2nVvbBbmU4Zu6
 SqsKr+eQH9+2TTBr927o8sUoekJ1nTmtyW5zcyyzdr3b/DmBM4sqCrJGlsxuYYeUMA8J
 tmhA==
X-Gm-Message-State: APjAAAUArle6hRwy+oRlxDjC4ww/ahAk0JrAoDg2RZKUbktOCkcvQxvN
 DKKVGtElI3MkAfR5h11r1F3UXA==
X-Google-Smtp-Source: APXvYqzDg/6J39JZiH1htlFNt5qhLvP1t52CKHLoU+RiLrApl81zuSfpC1NHIddANtKmgAg3SbjvBg==
X-Received: by 2002:a17:90a:d34c:: with SMTP id
 i12mr2519102pjx.18.1579124812061; 
 Wed, 15 Jan 2020 13:46:52 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id p5sm21570504pgs.28.2020.01.15.13.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 13:46:51 -0800 (PST)
Subject: Re: [PATCH v3 1/3] target/riscv: Fix tb->flags FS status
To: Alistair Francis <alistair23@gmail.com>, shihpo.hung@sifive.com
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <1579069053-22190-1-git-send-email-shihpo.hung@sifive.com>
 <CAKmqyKNeAFRP7eCLtw1b0P53ub3k--+dROpPRynzCwM8DF15ng@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d63e90b-0779-6432-3a35-1b759f5ae279@linaro.org>
Date: Wed, 15 Jan 2020 11:46:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNeAFRP7eCLtw1b0P53ub3k--+dROpPRynzCwM8DF15ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2020 21:46:58 -0000

On 1/14/20 8:28 PM, Alistair Francis wrote:
> On Wed, Jan 15, 2020 at 4:18 PM <shihpo.hung@sifive.com> wrote:
>>
>> It was found that running libquantum on riscv-linux qemu produced an
>> incorrect result. After investigation, FP registers are not saved
>> during context switch due to incorrect mstatus.FS.
>>
>> In current implementation tb->flags merges all non-disabled state to
>> dirty. This means the code in mark_fs_dirty in translate.c that
>> handles initial and clean states is unreachable.
>>
>> This patch fixes it and is successfully tested with:
>>   libquantum
>>
>> Thanks to Richard for pointing out the actual bug.
>>
>> v3: remove the redundant condition
>> v2: root cause FS problem
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/riscv/cpu.h | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index e59343e..de0a8d8 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -293,10 +293,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>>  #ifdef CONFIG_USER_ONLY
>>      *flags = TB_FLAGS_MSTATUS_FS;
>>  #else
>> -    *flags = cpu_mmu_index(env, 0);
>> -    if (riscv_cpu_fp_enabled(env)) {
>> -        *flags |= TB_FLAGS_MSTATUS_FS;
>> -    }
>> +    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
> 
> I don't think this is right, you should use the riscv_cpu_fp_enabled() function.
> 
> Right now it's the same as env->mstatus & MSTATUS_FS but when the
> Hypervisor extension goes in riscv_cpu_fp_enabled() will be more
> complex.

Hmm.  Are you sure something like

  flags |= riscv_cpu_effective_mstatus(env) & MSTATUS_FS;

wouldn't be more appropriate for the hypervisor extension?

I guess I should have another browse through your hv patchset, but I worry now
about bare uses of env->mstatus, if they no longer mean what they appear to mean.


r~

