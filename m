Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B1FC5DF6D
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8k-0008I4-OT; Sat, 15 Aug 2026 16:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8g-0008DE-Rt
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008Il-GO
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38ec1402b05so1702135a91.2
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826267; x=1787431067; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m/W0Rg3ZT8aB8ztQ7+mQ84An4E9x9bWgouBn0XbAmNY=;
 b=Iy9tdufDZg6QSGd72M++suN0Wbm1O55ClOnkdRIbnBebGUSPqt5klV+xyzpeu/CNo1
 bDfCRDUe6LZ/Xs6G5DrlZbee9NK9YmC60b/GfQgFaJAsiqCk5bDxQ0DQLotbOJn7HtJD
 FTOowb6zx+nqEmAaOIjuas+1PuZzRrKT8GXNeQ/nou7mLKY+Y1vHZLdEYycKe1ViotjG
 r+L7n5cuvLxmD6JhbbkPlh2OoGx9PPxX+dyg8ZBDrqpc/z2GPkiPg9lZJJ1sxSiK86Ct
 3gMolW8Y0KQdGk9wzskv4JJ5O6KhrzsXyGFn5xFNP1YpEjHqe0Tn1m+ro+2ue8UfgdP6
 8/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826267; x=1787431067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=m/W0Rg3ZT8aB8ztQ7+mQ84An4E9x9bWgouBn0XbAmNY=;
 b=U54BTkt6vTj1BSq8c3eQw1xXs5T4dsDg1LGdjZ2f9d205NlrNslzIJu3cTT167mUJa
 +gW0xu6BDwwAl/Sj8+2b12qa3kA9QUYLTP4W7tGgBTuvAW0qH0twqUS83Ex7sIL/TGf/
 pxqD2tpZ3u8oycAwxKU/a2cVHcPxt60enKnindduEDQtub8SQTCGN6bSRqHsTmRTzljr
 FHH0zgs+iOwGpUEy7CMszWOOVWDAsnKBC+P/UbqiiVsx+2etxZNe/zApTY5SdI0FbB88
 T9YWcvH5dWfV2b37XOdUUsyXq6g79d8Irqqi2JfeHRkPPqG2foPdkwwiAMHVF6Jpj5O2
 /Z6A==
X-Forwarded-Encrypted: i=1;
 AHgh+RptREAdwTFQGEh7/FLGoy4m5bHF1eTu5wjU3/5beGW0rv8zNB47vxu5M4cxF8iw+BM5cbPcOTJ9UpiD@nongnu.org
X-Gm-Message-State: AOJu0Yxe5vw8UnXcP+vSPD3+4nZcDDUeB3WyPYIZOpgLsN3lEm5Cqa7B
 zeYNZ/uq+tEAOhIa1vNHjfYTOcjsOkFsB1Ocpaar1V2s/nZC1gAAQ0vjOt2yN5LPukQfUM7cWPI
 U0ckx
X-Gm-Gg: AR+sD11LExKwWvba80ET5MdAnthTixvD8ki27IQYVuNRAmL5WmoSWxJc+V9C+/oY70d
 G5f1CV/ZvqKH79UOnc/6CvCbSrZZRa1rVoB3yQQaNEWhyqvJJQFn3VTQjHbj7G3+Zt5Dn890KJi
 +Fxiw00mj6LrlMVpHVdCulG/eNED0oTyF/wLw9fP1zLtgIrcEOYrNBLCDUpWfOvRHAvO/XHPOII
 NWRvTCeZ5f5XmWPgZsmQFmNzeAByh1d14jddrH++kO/wyycevG6oWsddbd3WlDci9rjpjlg0/+J
 IdzLiOKtjHvbvJJxsq7ilzj5X5eIxRRnoeexhMxYkDhA+MpUsPuCmFhIfHDxAKU7VGFb0VSc/bt
 iTE472Y41elKf78kBdHk848hAAuDzCvGzuQiSWx49WjxWzwXE7fTrBh4ub/uXKy6aY2HIVqa6R4
 kMAc0uFMnUk5Qz2FfSC4Fdz1ZUU4uy+k3f0uXok3/5atwbXNGwWsfZHKDve7zLacKJnm1+BPdp6
 MZyF+vhCCLHT9Bn6IaH
X-Received: by 2002:a17:90b:37c6:b0:38e:2e86:ed02 with SMTP id
 98e67ed59e1d1-3933b8f3573mr16229402a91.14.1786826267213; 
 Sat, 15 Aug 2026 13:37:47 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 10/18] accel/tcg: Replace size with first/last in
 probe_access_internal
Date: Sat, 15 Aug 2026 13:37:22 -0700
Message-ID: <20260815203730.1468365-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Propagate the API change down one step further within cputlb.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c2ea31a397..b8c23b2948 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1358,8 +1358,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
     }
 }
 
-static int probe_access_internal(CPUState *cpu, vaddr addr,
-                                 int fault_size, MMUAccessType access_type,
+static int probe_access_internal(CPUState *cpu, vaddr addr, vaddr first,
+                                 vaddr last, MMUAccessType access_type,
                                  int mmu_idx, bool nonfault,
                                  void **phost, CPUTLBEntryFull **pfull,
                                  uintptr_t retaddr, bool check_mem_cbs)
@@ -1375,7 +1375,7 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type, page_addr)) {
             if (!tlb_fill_align(cpu, addr, access_type, mmu_idx,
-                                0, fault_size, nonfault, retaddr)) {
+                                0, last - addr + 1, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 *pfull = NULL;
@@ -1423,7 +1423,7 @@ int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
     assert(addr <= last);
     assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
 
-    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
+    flags = probe_access_internal(env_cpu(env), addr, first, last,
                                   access_type, mmu_idx, nonfault,
                                   phost, pfull, retaddr, true);
 
@@ -1440,6 +1440,7 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
                           MMUAccessType access_type, int mmu_idx,
                           void **phost, CPUTLBEntryFull **pfull)
 {
+    vaddr last = size ? addr + size - 1 : addr;
     void *discard_phost;
     CPUTLBEntryFull *discard_tlb;
 
@@ -1447,13 +1448,13 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
     phost = phost ? phost : &discard_phost;
     pfull = pfull ? pfull : &discard_tlb;
 
-    int flags = probe_access_internal(env_cpu(env), addr, size, access_type,
-                                      mmu_idx, true, phost, pfull, 0, false);
+    int flags = probe_access_internal(env_cpu(env), addr, addr, last,
+                                      access_type, mmu_idx, true, phost,
+                                      pfull, 0, false);
 
     /* Handle clean RAM pages.  */
     if (unlikely(flags & TLB_NOTDIRTY)) {
-        int dirtysize = size == 0 ? 1 : size;
-        notdirty_write(env_cpu(env), addr, dirtysize, *pfull, 0);
+        notdirty_write(env_cpu(env), addr, last - addr + 1, *pfull, 0);
         flags &= ~TLB_NOTDIRTY;
     }
 
@@ -1472,7 +1473,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
     assert(addr <= last);
     assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
 
-    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
+    flags = probe_access_internal(env_cpu(env), addr, first, last,
                                   access_type, mmu_idx, nonfault,
                                   phost ? phost : &discard_host,
                                   &full, retaddr, true);
@@ -1489,15 +1490,16 @@ int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
 void *probe_access(CPUArchState *env, vaddr addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
+    vaddr last = size ? addr + size - 1 : addr;
     CPUTLBEntryFull *full;
     void *host;
     int flags;
 
-    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+    assert(((addr ^ last) & TARGET_PAGE_MASK) == 0);
 
-    flags = probe_access_internal(env_cpu(env), addr, size, access_type,
-                                  mmu_idx, false, &host, &full, retaddr,
-                                  true);
+    flags = probe_access_internal(env_cpu(env), addr, addr, last,
+                                  access_type, mmu_idx, false,
+                                  &host, &full, retaddr, true);
 
     /* Per the interface, size == 0 merely faults the access. */
     if (size == 0) {
@@ -1529,7 +1531,7 @@ void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
     void *host;
     int flags;
 
-    flags = probe_access_internal(env_cpu(env), addr, 0, access_type,
+    flags = probe_access_internal(env_cpu(env), addr, addr, addr, access_type,
                                   mmu_idx, true, &host, &full, 0, false);
 
     /* No combination of flags are expected by the caller. */
@@ -1552,9 +1554,10 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, vaddr addr,
     CPUTLBEntryFull *full;
     void *p;
 
-    (void)probe_access_internal(env_cpu(env), addr, 1, MMU_INST_FETCH,
-                                cpu_mmu_index(env_cpu(env), true), false,
-                                hostp, &full, 0, false);
+    (void)probe_access_internal(env_cpu(env), addr, addr, addr,
+                                MMU_INST_FETCH,
+                                cpu_mmu_index(env_cpu(env), true),
+                                false, hostp, &full, 0, false);
 
     p = *hostp;
     if (p == NULL) {
-- 
2.43.0


