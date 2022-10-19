Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olGcr-0004Ci-4h
	for mharc-qemu-riscv@gnu.org; Wed, 19 Oct 2022 17:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1olGcp-0004CH-Hx; Wed, 19 Oct 2022 17:29:19 -0400
Received: from netc0.host.rs.currently.online ([2a03:4000:58:d86::1]:51282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leon@is.currently.online>)
 id 1olGcm-0005Lm-PK; Wed, 19 Oct 2022 17:29:19 -0400
Received: from carbon.srv.schuermann.io (unknown [IPv6:fdcb:20e8:f36d:3::1])
 by netc0.host.rs.currently.online (Postfix) with ESMTPS id 4FE921EA93;
 Wed, 19 Oct 2022 21:29:08 +0000 (UTC)
From: Leon Schuermann <leon@is.currently.online>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=is.currently.online;
 s=carbon; t=1666214947;
 bh=z1J7TtMUAHdxTPhbsgXblay8Xi7fOhew65CSGvYpssc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=5CRwhV98MszwQmq7HlhEZvMet8ov1Dcmgpd2H5cNOpOMuYgTPE/3T+bPQP0lStSJM
 umNlPeZX5bMiERTwodZCWXqHmEbP555Fi8nElzUfvi3f5NMz1DqskCD9vS2KVHReoO
 CeB/HGVAArEiXIzF6WO78nwIME0Q19Nc8KqFseQk=
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org Developers"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/riscv/pmp: fix non-translated page size address
 checks w/ MPU
In-Reply-To: <CAKmqyKMfZXarM1g8PdhAqcgZzDyq6RY3R94cYhOo80WXiCv5aA@mail.gmail.com>
References: <20220909152258.2568942-1-leon@is.currently.online>
 <CAKmqyKMfZXarM1g8PdhAqcgZzDyq6RY3R94cYhOo80WXiCv5aA@mail.gmail.com>
Date: Wed, 19 Oct 2022 17:29:04 -0400
Message-ID: <8735bjqz8f.fsf@silicon.host.schuermann.io>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a03:4000:58:d86::1;
 envelope-from=leon@is.currently.online; helo=netc0.host.rs.currently.online
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FROM_SUSPICIOUS_NTLD=0.001, PDS_OTHER_BAD_TLD=2,
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
X-List-Received-Date: Wed, 19 Oct 2022 21:29:20 -0000

Alistair Francis <alistair23@gmail.com> writes:
>> @@ -310,10 +311,17 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>>      }
>>
>>      if (size == 0) {
>> -        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
>> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
>> +            satp_mode = SATP32_MODE;
>> +        } else {
>> +            satp_mode = SATP64_MODE;
>> +        }
>> +
>> +        if (riscv_feature(env, RISCV_FEATURE_MMU)
>> +            && get_field(env->satp, satp_mode)) {
>>              /*
>> -             * If size is unknown (0), assume that all bytes
>> -             * from addr to the end of the page will be accessed.
>> +             * If size is unknown (0) and virtual memory is enabled, assume that
>> +             * all bytes from addr to the end of the page will be accessed.
>>               */
>>              pmp_size = -(addr | TARGET_PAGE_MASK);
>
> I'm not sure if we need this at all.
>
> This function is only called from get_physical_address_pmp() which
> then calculates the maximum size using pmp_is_range_in_tlb().

I'm by no means an expert on QEMU and the TCG, so I've spun up GDB to
trace down why exactly this function is called with a `size = 0`
argument. It seems that there are, generally, two code paths to this
function for instruction fetching:

1. From `get_page_addr_code`: this will invoke `tlb_fill` with
   `size = 0` to check whether an entire page is accessible and can be
   translated given the current MMU / PMP configuration. In my
   particular example, it may rightfully fail then. `get_page_addr_code`
   can handle this and will subsequently cause an MMU protection check
   to be run for each instruction translated.

2. From `riscv_tr_translate_insn` through `cpu_lduw_code`, which will
   execute `tlb_fill` with `size = 2` (to try and decode a compressed
   instruction), assuming that the above check failed.

So far, so good. In this context, it actually makes sense for
`pmp_hart_has_privs` to interpret `size = 0` to mean whether the entire
page is allowed to be accessed.

> I suspect that we could just use sizeof(target_ulong) as the fallback
> for every time size == 0. Then pmp_is_range_in_tlb() will set the
> tlb_size to the maximum possible size of the PMP region.

Given the above, I don't think that this is correct either. The PMP
check would pass even for non-page sized regions, but the entire page
would be accessible through the TCG's TLB, as a consequence of
`get_page_addr_code`.


In the current implementation, `get_page_addr_code_hostp` calls
`tlb_fill`, which in turn invokes the RISC-V TCG op `tlb_fill` with the
parameter `probe = false`. This in turn raises a PMP exception in the
CPU, whereas `get_page_addr_code` would seem to expect this a failing
`tlb_fill` to be side-effect free, such that the MMU protection checks
can be re-run per instruction in the TCG code generation phase.

I think that this is sufficient evidence to conclude that my initial
patch is actually incorrect, however I am unsure as to how this issue
can be solved proper. One approach which seems to work is to change
`get_page_addr_code_hostp` to use a non-faulting page-table read
instead:

@@ -1510,11 +1510,15 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     uintptr_t mmu_idx = cpu_mmu_index(env, true);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
+    CPUState *cs = env_cpu(env);
+    CPUClass *cc = CPU_GET_CLASS(cs);
     void *p;
 
     if (unlikely(!tlb_hit(entry->addr_code, addr))) {
         if (!VICTIM_TLB_HIT(addr_code, addr)) {
-            tlb_fill(env_cpu(env), addr, 0, MMU_INST_FETCH, mmu_idx, 0);
+            // Nonfaulting page-table read:
+            cc->tcg_ops->tlb_fill(cs, addr, 0, MMU_INST_FETCH, mmu_idx, true,
+                                  0);
             index = tlb_index(env, mmu_idx, addr);
             entry = tlb_entry(env, mmu_idx, addr);
 

However, given this touches the generic TCG implementation, I cannot
judge whether this is correct or has any unintended side effects for
other targets. If this is correct, I'd be happy to send a proper patch.

-Leon

