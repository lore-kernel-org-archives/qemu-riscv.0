Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1147CCCF9FE
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 12:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vFtSS-0007hV-7Z; Mon, 03 Nov 2025 07:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vFtS9-0007fH-V4
 for qemu-riscv@nongnu.org; Mon, 03 Nov 2025 07:14:30 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vFtS1-0004Go-CD
 for qemu-riscv@nongnu.org; Mon, 03 Nov 2025 07:14:28 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7a435a3fc57so4044761b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Nov 2025 04:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762172049; x=1762776849; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VwJ4E1CnRoW4X96XmZV3n/pGDA7Tx+TyThnuSnSkfeI=;
 b=V9I5VeJDOtGz5G9cAvwLCSMju7RjQWj5o4gZSnPZvFH8zbQ7oxrAfkcL5VjWR7MtJb
 DIFALMIvltkJsINvgT12Wz84KWB+UwFMgmgwIfntLQaz2nLpPMpxPsHWQGspwz+mJnTL
 UvVeYcWQJAxxT05swSURQcF04b7YSJsYE1lWjSCTNz+pjC4VMy+8k1RcIW1g1Ln5NNpk
 TGz8E5wnbPIxfzCrHPX9yHfqCYdrt2ORYtHWcsdqpBhXjurwLArmrWb5DJdquu6GvvUb
 M9w7WpXB59V/sghoud5/wsIA1DUBsxYcDBFXdmKyqfBvjiotziAxlkGIfOQRRx2qQkzv
 ZGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762172049; x=1762776849;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VwJ4E1CnRoW4X96XmZV3n/pGDA7Tx+TyThnuSnSkfeI=;
 b=aKEw5hWlZaB/n9eCHGGJ2/oBP/bvTKRIQYXhywjP7B8c4oWp6FdjKcpwKAlEdi52up
 EMvjI/VZ8jRCvLvMSPOIhFlqpKl/306KXTdemcfjDThwWju80hm7lT/TxGGr174Gcuvk
 E0EJglvtoN+gzOwt5di78ApiELsSR5BQ14l0GwA6fzLC8922oLVqxlCrSa0Mn4XXzom/
 QYgapDgz63VGiGhpJVtOPa2DgR+ReosCVl5XbALriz16xMZmixtPf37UuCEtxHVJmbCM
 KSE205VJfu8pgvB0Bf5bEgVvjzkOENrY2DqyfQYZhhY73SI7b3zSKrYhQ7pWPsgDl0+F
 9Dpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXop3ocsgvJSTcFlxN7TCOXxbHFNwt2gUbsU0tSbQY+c7C3hHRvlFE2DlOuRbeaSlnVZTJEZOWvnta@nongnu.org
X-Gm-Message-State: AOJu0YzznKAIJgbnKiNb/2ExvVHHwfQIQsnM1SBV0yBmBtLGHVCrp4t6
 mazFYx4sjK9ra3rwb271Jepep+EAEhBuUtGC2NMuT6S85v1ehafT0JWehkTSWi3jIl8=
X-Gm-Gg: ASbGncuRKW/XBm5bjLL021AsnVHXoXYhuAe+GRqvHRD8LhBr6jFXJjVYMkszxGP+J2b
 T/3DiwDZ+O9q482MF69ivz4YDkwkqZZxfFrhIa0wgb1XcDGv6NWXn0jANPIdhqeT3o5fkC1r5xq
 6sNsHkfx9fVggZsZJe7+IEdn97Z1/HEvHjLcZTd5I6td488alF104p42bBqWNMIcuvOYPadJqDB
 tx3RdwlztydObtTi3RimnDHZ2EH37s3oRO1RoZbix4CqsggV+TcuIbYa9gxAyjbp8uQoIHY6Qco
 t9sr+gIt5U2AUgvdvC5UXcfCDI2WsFc4BNzZARBX5p9Qvg4wsp5anlmn67yWaG49w6c+SBm9xLI
 Ch5gyYNWJYXikKQID0+WbNXhRl+SbsCglWNT9TVt0iIiWzSNbJny1VrUWF45YtRixDNz76WyykX
 xJLQrFGY/j46VtEc5F2sYQoIc=
X-Google-Smtp-Source: AGHT+IF6ssF4vtxdGhasJRtaY5hA6SZSFCSEQXAz+Nj6xgiAcT0FCsAWU7QKf10KDK2sWrkm3/A/iQ==
X-Received: by 2002:a05:6a20:7d8b:b0:334:8759:5016 with SMTP id
 adf61e73a8af0-348cbda9bb2mr15612013637.28.1762172048670; 
 Mon, 03 Nov 2025 04:14:08 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.79])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b93bf265180sm10377203a12.33.2025.11.03.04.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 04:14:08 -0800 (PST)
Message-ID: <a4e05115-25a2-4487-b8b4-32462a1c88f6@ventanamicro.com>
Date: Mon, 3 Nov 2025 09:13:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/18] accel/tcg: Store section pointer in
 CPUTLBEntryFull
To: Jim Shu <jim.shu@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20251021155548.584543-1-jim.shu@sifive.com>
 <20251021155548.584543-2-jim.shu@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251021155548.584543-2-jim.shu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 10/21/25 12:55 PM, Jim Shu wrote:
> To fix the bug of iotlb_to_section(), store complete MemoryRegionSection
> pointer in CPUTLBEntryFull to replace the section_index in xlat_section.
> Rename 'xlat_section' to 'xlat' as we remove last 12 bits section_index
> inside. Also, since we directly use section pointer in the
> CPUTLBEntryFull (full->section), we can remove the unused functions:
> iotlb_to_section(), memory_region_section_get_iotlb().
> 
> iotlb_to_section() bug description:
> 'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
> find the correct section when CPU access the IO region over the IOTLB.
> However, section_index is only unique inside single AddressSpace. If
> address space translation is over IOMMUMemoryRegion, it could return
> section from other AddressSpace. 'iotlb_to_section()' API only finds the
> sections from CPU's AddressSpace so that it couldn't find section in
> other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
> wrong section and QEMU will have wrong load/store access.
> 
> This bug occurs only when
> (1) IOMMUMemoryRegion is in the path of CPU access.
> (2) IOMMUMemoryRegion returns different target_as and the section is in
> the IO region.
> 
> Common IOMMU devices don't have this issue since they are only in the
> path of DMA access. Currently, the bug only occurs when ARM MPC device
> (hw/misc/tz-mpc.c) returns 'blocked_io_as' to emulate blocked access
> handling. Upcoming RISC-V wgChecker device is also affected by this bug.


I believe you could sent this patch as a bug fix, apart from this series, given
that it's a bug fix.

I would also rename the commit title to something like

"accel/tcg: Fix store section ptr in ...",

i.e. adding a "fix" in it, to make it clearer that this is a bug fix.



Thanks,

Daniel

> 
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>   accel/tcg/cputlb.c        | 32 +++++++++++++++-----------------
>   include/accel/tcg/iommu.h | 15 ---------------
>   include/exec/cputlb.h     |  2 +-
>   include/hw/core/cpu.h     | 12 +++++++-----
>   system/physmem.c          | 25 -------------------------
>   5 files changed, 23 insertions(+), 63 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 631f1fe135..b3ed5d2b9c 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1089,7 +1089,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>           }
>       } else {
>           /* I/O or ROMD */
> -        iotlb = memory_region_section_get_iotlb(cpu, section) + xlat;
> +        iotlb = xlat;
>           /*
>            * Writes to romd devices must go through MMIO to enable write.
>            * Reads to romd devices go through the ram_ptr found above,
> @@ -1140,10 +1140,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>       /*
>        * When memory region is ram, iotlb contains a TARGET_PAGE_BITS
>        * aligned ram_addr_t of the page base of the target RAM.
> -     * Otherwise, iotlb contains
> -     *  - a physical section number in the lower TARGET_PAGE_BITS
> -     *  - the offset within section->mr of the page base (I/O, ROMD) with the
> -     *    TARGET_PAGE_BITS masked off.
> +     * Otherwise, iotlb contains a TARGET_PAGE_BITS aligned
> +     * offset within section->mr of the page base (I/O, ROMD)
> +     *
>        * We subtract addr_page (which is page aligned and thus won't
>        * disturb the low bits) to give an offset which can be added to the
>        * (non-page-aligned) vaddr of the eventual memory access to get
> @@ -1153,7 +1152,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>        */
>       desc->fulltlb[index] = *full;
>       full = &desc->fulltlb[index];
> -    full->xlat_section = iotlb - addr_page;
> +    full->xlat = iotlb - addr_page;
> +    full->section = section;
>       full->phys_addr = paddr_page;
>   
>       /* Now calculate the new entry */
> @@ -1269,14 +1269,14 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
>   }
>   
>   static MemoryRegionSection *
> -io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
> +io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
>              MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
>   {
>       MemoryRegionSection *section;
>       hwaddr mr_offset;
>   
> -    section = iotlb_to_section(cpu, xlat, attrs);
> -    mr_offset = (xlat & TARGET_PAGE_MASK) + addr;
> +    section = full->section;
> +    mr_offset = full->xlat + addr;
>       cpu->mem_io_pc = retaddr;
>       if (!cpu->neg.can_do_io) {
>           cpu_io_recompile(cpu, retaddr);
> @@ -1335,7 +1335,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t mmu_idx, size_t index,
>   static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
>                              CPUTLBEntryFull *full, uintptr_t retaddr)
>   {
> -    ram_addr_t ram_addr = mem_vaddr + full->xlat_section;
> +    ram_addr_t ram_addr = mem_vaddr + full->xlat;
>   
>       trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
>   
> @@ -1592,9 +1592,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, int mmu_idx,
>   
>       /* We must have an iotlb entry for MMIO */
>       if (tlb_addr & TLB_MMIO) {
> -        MemoryRegionSection *section =
> -            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MASK,
> -                             full->attrs);
> +        MemoryRegionSection *section = full->section;
>           data->is_io = true;
>           data->mr = section->mr;
>       } else {
> @@ -1991,7 +1989,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 0 && size <= 8);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> @@ -2012,7 +2010,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 8 && size <= 16);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> @@ -2532,7 +2530,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 0 && size <= 8);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> @@ -2552,7 +2550,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CPUTLBEntryFull *full,
>       tcg_debug_assert(size > 8 && size <= 16);
>   
>       attrs = full->attrs;
> -    section = io_prepare(&mr_offset, cpu, full->xlat_section, attrs, addr, ra);
> +    section = io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
>       mr = section->mr;
>   
>       BQL_LOCK_GUARD();
> diff --git a/include/accel/tcg/iommu.h b/include/accel/tcg/iommu.h
> index 90cfd6c0ed..547f8ea0ef 100644
> --- a/include/accel/tcg/iommu.h
> +++ b/include/accel/tcg/iommu.h
> @@ -14,18 +14,6 @@
>   #include "exec/hwaddr.h"
>   #include "exec/memattrs.h"
>   
> -/**
> - * iotlb_to_section:
> - * @cpu: CPU performing the access
> - * @index: TCG CPU IOTLB entry
> - *
> - * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
> - * it refers to. @index will have been initially created and returned
> - * by memory_region_section_get_iotlb().
> - */
> -MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> -                                      hwaddr index, MemTxAttrs attrs);
> -
>   MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
>                                                          int asidx,
>                                                          hwaddr addr,
> @@ -34,8 +22,5 @@ MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
>                                                          MemTxAttrs attrs,
>                                                          int *prot);
>   
> -hwaddr memory_region_section_get_iotlb(CPUState *cpu,
> -                                       MemoryRegionSection *section);
> -
>   #endif
>   
> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
> index 9bec0e7890..c0ca7ad77b 100644
> --- a/include/exec/cputlb.h
> +++ b/include/exec/cputlb.h
> @@ -43,7 +43,7 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
>    * @full: the details of the tlb entry
>    *
>    * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
> - * @full must be filled, except for xlat_section, and constitute
> + * @full must be filled, except for xlat, and constitute
>    * the complete description of the translated page.
>    *
>    * This is generally called by the target tlb_fill function after
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e79e8e0a8e..cce3f16198 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -214,15 +214,17 @@ typedef uint32_t MMUIdxMap;
>    */
>   struct CPUTLBEntryFull {
>       /*
> -     * @xlat_section contains:
> -     *  - in the lower TARGET_PAGE_BITS, a physical section number
> -     *  - with the lower TARGET_PAGE_BITS masked off, an offset which
> -     *    must be added to the virtual address to obtain:
> +     * @xlat contains:
> +     *  - a TARGET_PAGE_BITS aligned offset which must be added to
> +     *    the virtual address to obtain:
>        *     + the ram_addr_t of the target RAM (if the physical section
>        *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
>        *     + the offset within the target MemoryRegion (otherwise)
>        */
> -    hwaddr xlat_section;
> +    hwaddr xlat;
> +
> +    /* @section contains physical section. */
> +    MemoryRegionSection *section;
>   
>       /*
>        * @phys_addr contains the physical address in the address space
> diff --git a/system/physmem.c b/system/physmem.c
> index a340ca3e61..c163d6b856 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -748,31 +748,6 @@ translate_fail:
>       return &d->map.sections[PHYS_SECTION_UNASSIGNED];
>   }
>   
> -MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> -                                      hwaddr index, MemTxAttrs attrs)
> -{
> -    int asidx = cpu_asidx_from_attrs(cpu, attrs);
> -    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
> -    AddressSpaceDispatch *d = address_space_to_dispatch(cpuas->as);
> -    int section_index = index & ~TARGET_PAGE_MASK;
> -    MemoryRegionSection *ret;
> -
> -    assert(section_index < d->map.sections_nb);
> -    ret = d->map.sections + section_index;
> -    assert(ret->mr);
> -    assert(ret->mr->ops);
> -
> -    return ret;
> -}
> -
> -/* Called from RCU critical section */
> -hwaddr memory_region_section_get_iotlb(CPUState *cpu,
> -                                       MemoryRegionSection *section)
> -{
> -    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
> -    return section - d->map.sections;
> -}
> -
>   #endif /* CONFIG_TCG */
>   
>   void cpu_address_space_init(CPUState *cpu, int asidx,


