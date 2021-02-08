Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l97sj-0006ta-2u
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 09:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l97sV-0006rX-M3
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 09:51:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l97sN-0007RX-Qd
 for qemu-riscv@nongnu.org; Mon, 08 Feb 2021 09:51:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id g6so4459723wrs.11
 for <qemu-riscv@nongnu.org>; Mon, 08 Feb 2021 06:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3OjIIaYJOgJTaqyNNEmkAsPCnZ25uA8+JKC4fYqCwqk=;
 b=olyRjW9P/U1iYRFy0DsCcWfcH/yL3knboaFhzt3rVAAXFeAHsJXK2JgGzV9VL7XTUy
 sZCD85yu9OyeQcdcdkcKUosUt+YExVSddyIt+sJ+3c3QBytAFONSpaeeSVb8mw5twToO
 NkUubrMWuC4Gt3kXQ3LDykXxLX3WPxwA02N3wtjtfN6zaPeZIGJzU5fna+M/Up4eJlTk
 hBMCl6dM7rXuC3KQMscba9X+R+pXcSuQCcOk+gxjzKVR0YlvJ9PIX6z79Dv82+oyYK42
 nP3zIdVJBJ+mVAQ65vU/wmeFvTbDFlm0vdtNb2Mr9t4U8sXLMF8DxUTzJhb7Is2Zfv1G
 7nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3OjIIaYJOgJTaqyNNEmkAsPCnZ25uA8+JKC4fYqCwqk=;
 b=q23MwFZP3W1G2Be+5JjKS1etwPWPEczh37ug8QBAHyEQ8rbNADXYyzLNTzNFqZtwgb
 zKeoiVOd3tGA1NpHlxpGh7w+eHp7p4bU8hiMSs5h8Ge4fVlOCWIOb/U2avTZ5sT33npC
 dGtSdQ8uii9Z/zhzHQBalVulGewgbog4L4+O6mko97WXtdpR3qC3xY1Wl04IjDrEw0Xc
 a6JMS60e/a8NGG9G4GEBSKsqPXrbyb4If793nXHwo4q1INeD7t1lkkaKQDd5/tbc8tms
 Ibpwxbn17Igjh9vbnxgOwPWKIV9dEN0S6/J6DUVAPYYGnltdFoUdtYUSWeFgkUsw8RJy
 y6rA==
X-Gm-Message-State: AOAM533m6NFHiWFgMwl2aCfq1pNbFxqD4mY8BW8U/5TN67Vtdrdl9APy
 6rMQ5abaOXNKDyFWdpzh5S9quw==
X-Google-Smtp-Source: ABdhPJzfje3YiI0XflS4r5tABl9ki+cYIStyuyJv/Bj4WhcO84VnM1fnUUZUeJNvGLhfcfo3NRG/iQ==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr2498993wrj.386.1612795852988; 
 Mon, 08 Feb 2021 06:50:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm15967986wmi.43.2021.02.08.06.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 06:50:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1777E1FF7E;
 Mon,  8 Feb 2021 14:50:51 +0000 (GMT)
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org> <87im73aqsq.fsf@linaro.org>
 <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, qemu-arm@nongnu.org, Alistair Francis
 <Alistair.Francis@wdc.com>, Claudio Fontana <cfontana@suse.de>, Paolo
 Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
Date: Mon, 08 Feb 2021 14:48:20 +0000
In-reply-to: <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
Message-ID: <871rdqbol0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 08 Feb 2021 14:51:04 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 2/8/21 9:42 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>> What this code does is out of my league, but refactoring it allow
>>> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
>>> patch.
>>=20
>> The assertion that the table entry is current is just a simple
>> housekeeping one. The details of how the MTE implementation uses
>> (abuses?) the iotlb entries requires a closer reading of the code.
>>=20
>>> ---
>>>  include/exec/exec-all.h |  9 +++++++++
>>>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>>>  target/arm/mte_helper.c | 11 ++---------
>>>  target/arm/sve_helper.c | 10 ++--------
>>>  4 files changed, 27 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index f933c74c446..c5e8e355b7f 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target=
_ulong vaddr,
>>>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>>>                    hwaddr paddr, int prot,
>>>                    int mmu_idx, target_ulong size);
>>> +
>>> +/*
>>> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
>>> + * because we just found the mapping.
>>> + */
>>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr=
_mmu_idx,
>>> +                                            uint64_t ptr,
>>> +                                            MMUAccessType ptr_access,
>>> +                                            uintptr_t index);
>>=20
>> Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
>> case so we can eliminate the call to an empty function.
>
> But then we can't make tlb_addr_write() static (next patch) and
> we still have to include "tcg/tcg.h" for the TCG_OVERSIZED_GUEST
> definition...

Hmm - yeah. I'm not keen on turning something into a function call when
the compiler should have all the information it needs with it. On the
other hand maybe we don't care for a debug assert.

Richard WDYT?

>
>>=20
>>>  #else
>>>  static inline void tlb_init(CPUState *cpu)
>>>  {
>>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>>> index 8a7b779270a..a6247da34a0 100644
>>> --- a/accel/tcg/cputlb.c
>>> +++ b/accel/tcg/cputlb.c
>>> @@ -429,6 +429,20 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
>>>      tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
>>>  }
>>>=20=20
>>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr=
_mmu_idx,
>>> +                                            uint64_t ptr,
>>> +                                            MMUAccessType ptr_access,
>>> +                                            uintptr_t index)
>>> +{
>>> +#ifdef CONFIG_DEBUG_TCG
>>> +    CPUTLBEntry *entry =3D tlb_entry(env, ptr_mmu_idx, ptr);
>>> +    target_ulong comparator =3D (ptr_access =3D=3D MMU_DATA_LOAD
>>> +                               ? entry->addr_read
>>> +                               : tlb_addr_write(entry));
>>> +    g_assert(tlb_hit(comparator, ptr));
>>> +#endif
>>> +}
>>> +
>>>  static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
>>>                                        target_ulong page, target_ulong =
mask)
>>>  {
>>> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
>>> index 6cea9d1b506..f47d3b4570e 100644
>>> --- a/target/arm/mte_helper.c
>>> +++ b/target/arm/mte_helper.c
>>> @@ -111,15 +111,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *en=
v, int ptr_mmu_idx,
>>>       * matching tlb entry + iotlb entry.
>>>       */
>>>      index =3D tlb_index(env, ptr_mmu_idx, ptr);
>>> -# ifdef CONFIG_DEBUG_TCG
>>> -    {
>>> -        CPUTLBEntry *entry =3D tlb_entry(env, ptr_mmu_idx, ptr);
>>> -        target_ulong comparator =3D (ptr_access =3D=3D MMU_DATA_LOAD
>>> -                                   ? entry->addr_read
>>> -                                   : tlb_addr_write(entry));
>>> -        g_assert(tlb_hit(comparator, ptr));
>>> -    }
>>> -# endif
>>> +    tlb_assert_iotlb_entry_for_ptr_present(env, ptr_mmu_idx, ptr,
>>> +                                           ptr_access, index);
>>>      iotlbentry =3D &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
>>>=20=20
>>>      /* If the virtual page MemAttr !=3D Tagged, access unchecked. */
>>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>>> index c8cdf7618eb..a5708da0f2f 100644
>>> --- a/target/arm/sve_helper.c
>>> +++ b/target/arm/sve_helper.c
>>> @@ -4089,14 +4089,8 @@ static bool sve_probe_page(SVEHostPage *info, bo=
ol nofault,
>>>      {
>>>          uintptr_t index =3D tlb_index(env, mmu_idx, addr);
>>>=20=20
>>> -# ifdef CONFIG_DEBUG_TCG
>>> -        CPUTLBEntry *entry =3D tlb_entry(env, mmu_idx, addr);
>>> -        target_ulong comparator =3D (access_type =3D=3D MMU_DATA_LOAD
>>> -                                   ? entry->addr_read
>>> -                                   : tlb_addr_write(entry));
>>> -        g_assert(tlb_hit(comparator, addr));
>>> -# endif
>>> -
>>> +        tlb_assert_iotlb_entry_for_ptr_present(env, mmu_idx, addr,
>>> +                                               access_type, index);
>>>          CPUIOTLBEntry *iotlbentry =3D &env_tlb(env)->d[mmu_idx].iotlb[=
index];
>>>          info->attrs =3D iotlbentry->attrs;
>>>      }
>>=20
>> with the inline fix:
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20


--=20
Alex Benn=C3=A9e

