Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXlNy-0003sW-W4
	for mharc-qemu-riscv@gnu.org; Fri, 14 Dec 2018 06:12:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXlNv-0003qD-EL
	for qemu-riscv@nongnu.org; Fri, 14 Dec 2018 06:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXlNs-00063x-70
	for qemu-riscv@nongnu.org; Fri, 14 Dec 2018 06:11:59 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXlNr-00061v-Ss
	for qemu-riscv@nongnu.org; Fri, 14 Dec 2018 06:11:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id a62so5290746wmh.4
	for <qemu-riscv@nongnu.org>; Fri, 14 Dec 2018 03:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l98oXVgCrk2iQK/xbh7h4rAyZq32/e40C/BQ4vnQqaU=;
	b=baiA9W0tAtMrUGoesG86YaPM+8taP+MEvRW7PvKV481Kjc4dTVgRL+P4v6vClbzvL+
	fpQDjbONOv1qpfSChM+T1qQQtMgO2duj71UjWMSxVpUFr0jw3GfxSKEDAa+MpYsUf2xw
	zAvWA+3BKVjuqjPbr4/H3J9PyQAzyZicESzoNeGzHJmPPPIg4qOJhUb41c9seDnFhlgl
	WsXcnpQh1/Iy8R7xSh3clKMMiOqZFi6qcNsRcm4ei2nYqm/zn2Xf7a7QBXKKkm+aXQeJ
	L+WUvqOY4gcxX8tkK8yjc1NUNfKILq93dXtfrlZteqe0JuISm8JY3Pxq4C08LzKRfDmz
	SHfg==
X-Gm-Message-State: AA+aEWaM9TDoPbOCx9lRbJtiEU7/jleiFqNM6JEXtT4t7mHEu4dTj+Pq
	n3IvvmxX3i6SLpp8kuHRQXiPqAW/DQU=
X-Google-Smtp-Source: AFSGD/WtAvC/XI6i2+B9ABv6kD4wyiJlPyxfMv2istWXjg2Mw1NFXCpUVZzv2bH4ET1IXTuJii5fsw==
X-Received: by 2002:a1c:934b:: with SMTP id v72mr3007317wmd.5.1544785912902;
	Fri, 14 Dec 2018 03:11:52 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	o17sm6604932wmg.35.2018.12.14.03.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 03:11:52 -0800 (PST)
To: Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181213235804.14956-1-benh@kernel.crashing.org>
	<20181213235804.14956-2-benh@kernel.crashing.org>
	<c59aabb14c0b89257db6c136300df24d583977b3.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <926d9f34-c615-e4a7-b0d7-04b77d215540@redhat.com>
Date: Fri, 14 Dec 2018 12:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <c59aabb14c0b89257db6c136300df24d583977b3.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/3] i386: Atomically update
 PTEs with mttcg
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 11:12:01 -0000

On 12/14/18 1:05 AM, Benjamin Herrenschmidt wrote:
> Note to RiscV folks: You may want to adapt your code to do the same as
> this, esp. afaik, what you do today is endian-broken if host and guest
> endian are different.

Cc'ing the RISC-V list.

> Cheers,
> Ben. 
> 
> On Fri, 2018-12-14 at 10:58 +1100, Benjamin Herrenschmidt wrote:
>> Afaik, this isn't well documented (at least it wasn't when I last looked)
>> but OSes such as Linux rely on this behaviour:
>>
>> The HW updates to the page tables need to be done atomically with the
>> checking of the present bit (and other permissions).
>>
>> This is what allows Linux to do simple xchg of PTEs with 0 and assume
>> the value read has "final" stable dirty and accessed bits (the TLB
>> invalidation is deferred).
>>
>> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> ---
>>  target/i386/excp_helper.c | 104 +++++++++++++++++++++++++++++---------
>>  1 file changed, 80 insertions(+), 24 deletions(-)
>>
>> diff --git a/target/i386/excp_helper.c b/target/i386/excp_helper.c
>> index 49231f6b69..93fc24c011 100644
>> --- a/target/i386/excp_helper.c
>> +++ b/target/i386/excp_helper.c
>> @@ -157,11 +157,45 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>  
>>  #else
>>  
>> +static inline uint64_t update_entry(CPUState *cs, target_ulong addr,
>> +                                    uint64_t orig_entry, uint32_t bits)
>> +{
>> +    uint64_t new_entry = orig_entry | bits;
>> +
>> +    /* Write the updated bottom 32-bits */
>> +    if (qemu_tcg_mttcg_enabled()) {
>> +        uint32_t old_le = cpu_to_le32(orig_entry);
>> +        uint32_t new_le = cpu_to_le32(new_entry);
>> +        MemTxResult result;
>> +        uint32_t old_ret;
>> +
>> +        old_ret = address_space_cmpxchgl_notdirty(cs->as, addr,
>> +                                                  old_le, new_le,
>> +                                                  MEMTXATTRS_UNSPECIFIED,
>> +                                                  &result);
>> +        if (result == MEMTX_OK) {
>> +            if (old_ret != old_le && old_ret != new_le) {
>> +                new_entry = 0;
>> +            }
>> +            return new_entry;
>> +        }
>> +
>> +        /* Do we need to support this case where PTEs aren't in RAM ?
>> +         *
>> +         * For now fallback to non-atomic case
>> +         */
>> +    }
>> +
>> +    x86_stl_phys_notdirty(cs, addr, new_entry);
>> +
>> +    return new_entry;
>> +}
>> +
>>  static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
>>                          int *prot)
>>  {
>>      CPUX86State *env = &X86_CPU(cs)->env;
>> -    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
>> +    uint64_t rsvd_mask;
>>      uint64_t ptep, pte;
>>      uint64_t exit_info_1 = 0;
>>      target_ulong pde_addr, pte_addr;
>> @@ -172,6 +206,8 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
>>          return gphys;
>>      }
>>  
>> + restart:
>> +    rsvd_mask = PG_HI_RSVD_MASK;
>>      if (!(env->nested_pg_mode & SVM_NPT_NXE)) {
>>          rsvd_mask |= PG_NX_MASK;
>>      }
>> @@ -198,8 +234,10 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
>>                  goto do_fault_rsvd;
>>              }
>>              if (!(pml4e & PG_ACCESSED_MASK)) {
>> -                pml4e |= PG_ACCESSED_MASK;
>> -                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
>> +                pml4e = update_entry(cs, pml4e_addr, pml4e, PG_ACCESSED_MASK);
>> +                if (!pml4e) {
>> +                    goto restart;
>> +                }
>>              }
>>              ptep &= pml4e ^ PG_NX_MASK;
>>              pdpe_addr = (pml4e & PG_ADDRESS_MASK) +
>> @@ -213,8 +251,10 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
>>              }
>>              ptep &= pdpe ^ PG_NX_MASK;
>>              if (!(pdpe & PG_ACCESSED_MASK)) {
>> -                pdpe |= PG_ACCESSED_MASK;
>> -                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
>> +                pdpe = update_entry(cs, pdpe_addr, pdpe, PG_ACCESSED_MASK);
>> +                if (!pdpe) {
>> +                    goto restart;
>> +                }
>>              }
>>              if (pdpe & PG_PSE_MASK) {
>>                  /* 1 GB page */
>> @@ -256,8 +296,10 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
>>          }
>>          /* 4 KB page */
>>          if (!(pde & PG_ACCESSED_MASK)) {
>> -            pde |= PG_ACCESSED_MASK;
>> -            x86_stl_phys_notdirty(cs, pde_addr, pde);
>> +            pde = update_entry(cs, pde_addr, pde, PG_ACCESSED_MASK);
>> +            if (!pde) {
>> +                goto restart;
>> +            }
>>          }
>>          pte_addr = (pde & PG_ADDRESS_MASK) + (((gphys >> 12) & 0x1ff) << 3);
>>          pte = x86_ldq_phys(cs, pte_addr);
>> @@ -295,8 +337,10 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
>>          }
>>  
>>          if (!(pde & PG_ACCESSED_MASK)) {
>> -            pde |= PG_ACCESSED_MASK;
>> -            x86_stl_phys_notdirty(cs, pde_addr, pde);
>> +            pde = update_entry(cs, pde_addr, pde, PG_ACCESSED_MASK);
>> +            if (!pde) {
>> +                goto restart;
>> +            }
>>          }
>>  
>>          /* page directory entry */
>> @@ -376,7 +420,7 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>      int error_code = 0;
>>      int is_dirty, prot, page_size, is_write, is_user;
>>      hwaddr paddr;
>> -    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
>> +    uint64_t rsvd_mask;
>>      uint32_t page_offset;
>>      target_ulong vaddr;
>>  
>> @@ -401,6 +445,8 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>          goto do_mapping;
>>      }
>>  
>> + restart:
>> +    rsvd_mask = PG_HI_RSVD_MASK;
>>      if (!(env->efer & MSR_EFER_NXE)) {
>>          rsvd_mask |= PG_NX_MASK;
>>      }
>> @@ -436,8 +482,10 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>                      goto do_fault_rsvd;
>>                  }
>>                  if (!(pml5e & PG_ACCESSED_MASK)) {
>> -                    pml5e |= PG_ACCESSED_MASK;
>> -                    x86_stl_phys_notdirty(cs, pml5e_addr, pml5e);
>> +                    pml5e = update_entry(cs, pml5e_addr, pml5e, PG_ACCESSED_MASK);
>> +                    if (!pml5e) {
>> +                        goto restart;
>> +                    }
>>                  }
>>                  ptep = pml5e ^ PG_NX_MASK;
>>              } else {
>> @@ -456,8 +504,10 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>                  goto do_fault_rsvd;
>>              }
>>              if (!(pml4e & PG_ACCESSED_MASK)) {
>> -                pml4e |= PG_ACCESSED_MASK;
>> -                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
>> +                pml4e = update_entry(cs, pml4e_addr, pml4e, PG_ACCESSED_MASK);
>> +                if (!pml4e) {
>> +                    goto restart;
>> +                }
>>              }
>>              ptep &= pml4e ^ PG_NX_MASK;
>>              pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
>> @@ -472,8 +522,10 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>              }
>>              ptep &= pdpe ^ PG_NX_MASK;
>>              if (!(pdpe & PG_ACCESSED_MASK)) {
>> -                pdpe |= PG_ACCESSED_MASK;
>> -                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
>> +                pdpe = update_entry(cs, pdpe_addr, pdpe, PG_ACCESSED_MASK);
>> +                if (!pdpe) {
>> +                    goto restart;
>> +                }
>>              }
>>              if (pdpe & PG_PSE_MASK) {
>>                  /* 1 GB page */
>> @@ -520,8 +572,10 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>          }
>>          /* 4 KB page */
>>          if (!(pde & PG_ACCESSED_MASK)) {
>> -            pde |= PG_ACCESSED_MASK;
>> -            x86_stl_phys_notdirty(cs, pde_addr, pde);
>> +            pde = update_entry(cs, pde_addr, pde, PG_ACCESSED_MASK);
>> +            if (!pde) {
>> +                goto restart;
>> +            }
>>          }
>>          pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
>>              a20_mask;
>> @@ -563,8 +617,10 @@ int x86_cpu_handle_mmu_fault(CPUState *cs, vaddr addr, int size,
>>          }
>>  
>>          if (!(pde & PG_ACCESSED_MASK)) {
>> -            pde |= PG_ACCESSED_MASK;
>> -            x86_stl_phys_notdirty(cs, pde_addr, pde);
>> +            pde = update_entry(cs, pde_addr, pde, PG_ACCESSED_MASK);
>> +            if (!pde) {
>> +                goto restart;
>> +            }
>>          }
>>  
>>          /* page directory entry */
>> @@ -634,11 +690,11 @@ do_check_protect_pse36:
>>      /* yes, it can! */
>>      is_dirty = is_write && !(pte & PG_DIRTY_MASK);
>>      if (!(pte & PG_ACCESSED_MASK) || is_dirty) {
>> -        pte |= PG_ACCESSED_MASK;
>> -        if (is_dirty) {
>> -            pte |= PG_DIRTY_MASK;
>> +        pte = update_entry(cs, pte_addr, pte,
>> +                           PG_ACCESSED_MASK | (is_dirty ? PG_DIRTY_MASK : 0));
>> +        if (!pte) {
>> +            goto restart;
>>          }
>> -        x86_stl_phys_notdirty(cs, pte_addr, pte);
>>      }
>>  
>>      if (!(pte & PG_DIRTY_MASK)) {
> 
> 

