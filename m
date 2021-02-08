Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l96yk-0004x6-ED
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 08:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96yP-0004te-T1; Mon, 08 Feb 2021 08:53:07 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96yF-0000Kp-6X; Mon, 08 Feb 2021 08:52:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id n6so4393971wrv.8;
 Mon, 08 Feb 2021 05:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RO1fjUbPuaoEr7p6+/bv1uAV/ae5IRUpPRFbET0L9rM=;
 b=Zw+zqYLVHWb/tdInaOgxyIQEeBFiWq8kpg6G8cPmDh/G8CLsn6soPtQbY2TYi0FJPJ
 v/Muybyo9zHn3nQHE60ADe3pebZA3XFv6sV6tdSc3pF/cLWWEj8pKDAq15ZxOdXj/A10
 8wDVqIiJWRm+RZVyU1Hw5pMPcmolu6SWlNjVX1tgvcO0R8WztXZ4N4+rIYD5vPUuf5My
 wTzvlWMyt6WjY1aRJaCh8hbqfMapSK/5ptybQ8bS+i947x1XS1E13OP3aPi3DXlIbMoX
 R7whh5UcOMgquEabRUQ355+jWPMcNyR35IZKMnMUk6lih2VmUh/X9vnFVaPxseSuDNPs
 aMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RO1fjUbPuaoEr7p6+/bv1uAV/ae5IRUpPRFbET0L9rM=;
 b=A/f02tqOM6OyYqjy72jDjwmN7vmU5zxcVtDJybd51QrYwpQipNg29XXcNRfNkzmWN5
 YCATruqHl7YZBuH9gFIVgHrrXaqNfyDsOmi8baTDOVDc4vQY8vwseWdGgEdQgnUF86MD
 dfizFwVlv90T5A5gLoo+VNeKo/mWfGEicGOUGKCru+I3O/3M0nvEmkOMEx/zkqiGPn3Q
 WGDJMxv14zdHVzyiMPrK8zrP76aaBdhiIgDiMVMQELFJB6nLe5EH8lrU5EWsDXM2t2di
 8eJR888pHpphGOqkBkD+bGA8CMQT88dNrGi8QnMJYhVwUxn+Z0Cl7+fBO027p2S55CEb
 oHfA==
X-Gm-Message-State: AOAM5310x8uSEyVcTmwxmXH05WCzrOZ/YA0XMsjag4R+VIkAWO4C3cLd
 h4NruFT7DZGqhrPGbh0ALUE=
X-Google-Smtp-Source: ABdhPJyWJe2lgkK058CdMWRHq9VZQGyidshG36Fqs0fj0VRgGWq3Ku1z1XGTWDf+3/1AnvaoCaXAfQ==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr20663485wrt.164.1612792369192; 
 Mon, 08 Feb 2021 05:52:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z15sm11933382wmi.38.2021.02.08.05.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 05:52:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org> <87im73aqsq.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
Date: Mon, 8 Feb 2021 14:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87im73aqsq.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 08 Feb 2021 13:53:24 -0000

On 2/8/21 9:42 AM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> What this code does is out of my league, but refactoring it allow
>> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
>> patch.
> 
> The assertion that the table entry is current is just a simple
> housekeeping one. The details of how the MTE implementation uses
> (abuses?) the iotlb entries requires a closer reading of the code.
> 
>> ---
>>  include/exec/exec-all.h |  9 +++++++++
>>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>>  target/arm/mte_helper.c | 11 ++---------
>>  target/arm/sve_helper.c | 10 ++--------
>>  4 files changed, 27 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index f933c74c446..c5e8e355b7f 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>>                    hwaddr paddr, int prot,
>>                    int mmu_idx, target_ulong size);
>> +
>> +/*
>> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
>> + * because we just found the mapping.
>> + */
>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
>> +                                            uint64_t ptr,
>> +                                            MMUAccessType ptr_access,
>> +                                            uintptr_t index);
> 
> Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
> case so we can eliminate the call to an empty function.

But then we can't make tlb_addr_write() static (next patch) and
we still have to include "tcg/tcg.h" for the TCG_OVERSIZED_GUEST
definition...

> 
>>  #else
>>  static inline void tlb_init(CPUState *cpu)
>>  {
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 8a7b779270a..a6247da34a0 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -429,6 +429,20 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
>>      tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
>>  }
>>  
>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
>> +                                            uint64_t ptr,
>> +                                            MMUAccessType ptr_access,
>> +                                            uintptr_t index)
>> +{
>> +#ifdef CONFIG_DEBUG_TCG
>> +    CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
>> +    target_ulong comparator = (ptr_access == MMU_DATA_LOAD
>> +                               ? entry->addr_read
>> +                               : tlb_addr_write(entry));
>> +    g_assert(tlb_hit(comparator, ptr));
>> +#endif
>> +}
>> +
>>  static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
>>                                        target_ulong page, target_ulong mask)
>>  {
>> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
>> index 6cea9d1b506..f47d3b4570e 100644
>> --- a/target/arm/mte_helper.c
>> +++ b/target/arm/mte_helper.c
>> @@ -111,15 +111,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>>       * matching tlb entry + iotlb entry.
>>       */
>>      index = tlb_index(env, ptr_mmu_idx, ptr);
>> -# ifdef CONFIG_DEBUG_TCG
>> -    {
>> -        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
>> -        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
>> -                                   ? entry->addr_read
>> -                                   : tlb_addr_write(entry));
>> -        g_assert(tlb_hit(comparator, ptr));
>> -    }
>> -# endif
>> +    tlb_assert_iotlb_entry_for_ptr_present(env, ptr_mmu_idx, ptr,
>> +                                           ptr_access, index);
>>      iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
>>  
>>      /* If the virtual page MemAttr != Tagged, access unchecked. */
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index c8cdf7618eb..a5708da0f2f 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -4089,14 +4089,8 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
>>      {
>>          uintptr_t index = tlb_index(env, mmu_idx, addr);
>>  
>> -# ifdef CONFIG_DEBUG_TCG
>> -        CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
>> -        target_ulong comparator = (access_type == MMU_DATA_LOAD
>> -                                   ? entry->addr_read
>> -                                   : tlb_addr_write(entry));
>> -        g_assert(tlb_hit(comparator, addr));
>> -# endif
>> -
>> +        tlb_assert_iotlb_entry_for_ptr_present(env, mmu_idx, addr,
>> +                                               access_type, index);
>>          CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
>>          info->attrs = iotlbentry->attrs;
>>      }
> 
> with the inline fix:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

