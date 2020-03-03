Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmM-0005Sk-5G
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkx-0002id-Tl
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vku-0004W3-Bl
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:54 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34187)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkt-0004V4-Ub
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:52 -0500
Received: by mail-pf1-x429.google.com with SMTP id y21so570696pfp.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=L0gAOeYyh4ssRiGbBIUEmt9mPfUm7yjv/MJPi98va64=;
 b=jN5u4Qzmk0XSF1b+OLinbGW6CpUAVvC5i4IvUJo3+uoEAFLMPctWAqBOJs3dSMIInB
 hnO5mNvS+y9IM3mdLZu0KunFnT14wO8MyYAsIkso4AFnYspk/BIIOQWfqRfyIUhn322Q
 9swRQt2DWrQJYyiTuoona+eKMrqbZNN2kqCpQ10XIuT+QtlIimxC9/YU0prmdwHG4D5y
 J0ynL1Efl2bKM5zo4CkLntPbAfL1JvJLMiOpga3CJxehzpWkCcGuaQT2Fiuh6IVneYhh
 ww2UPf3VwNP222NcQ8GyUOnTnKIB+Du30FrczN0hGewGUBBm33u3/YkJGsPasSQRE2+i
 HfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=L0gAOeYyh4ssRiGbBIUEmt9mPfUm7yjv/MJPi98va64=;
 b=j5VbU+pCluFjHeEgSv3V6mlTGTPj52rrNLeTbCipO23VGIsDjqkKTZXdUvmti5rL1j
 tzrkkA4399EgG1w4cheRz2cZHl01Yf9fBC99xaRi0StOOCFTWauHFonfV0osKKiSWKxd
 5yutUUW9E7Vr6JcyiTvDCvI0Vex4Fhd77gyYs8FCCU0EQZhPUkmE/N7ILG/TUe9m4T+x
 15uujPGlQxqOb+4vbg7KAaVferTaNJCmrXiM0xQbK3236170zFPpiAso/uMakuySd0pb
 uTiMQtoyPbKdFve8yFg3u760OgOWZ9HLEkXStqNc6cClNfz26DspD0l8f4eNZlNG1IcF
 qIIA==
X-Gm-Message-State: ANhLgQ28i7aWMcUymyre+BDpjMNkc7mPGQBo67sRqQlBQ3qDUJMyf/fN
 9/jiJzLyjdGltQSuw2liAJ3QRDgYeXVD0w==
X-Google-Smtp-Source: ADFU+vu9D1s4m7d4MgW4humzghf+TfcxJoYeJct7ISzsKy43CI9sHKVgrApuSTJFaUIrsVcP2zqLgw==
X-Received: by 2002:a63:5916:: with SMTP id n22mr1574426pgb.190.1583196589503; 
 Mon, 02 Mar 2020 16:49:49 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id z10sm21620999pgf.35.2020.03.02.16.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:48 -0800 (PST)
Subject: [PULL 29/38] target/riscv: Allow specifying MMU stage
Date: Mon,  2 Mar 2020 16:48:39 -0800
Message-Id: <20200303004848.136788-30-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::429
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:57 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d9a29d702a..8ae1038bcd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -277,10 +277,19 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
  *
  * Adapted from Spike's mmu_t::translate and mmu_t::walk
  *
+ * @env: CPURISCVState
+ * @physical: This will be set to the calculated physical address
+ * @prot: The returned protection attributes
+ * @addr: The virtual address to be translated
+ * @access_type: The type of MMU access
+ * @mmu_idx: Indicates current privilege level
+ * @first_stage: Are we in first stage translation?
+ *               Second stage is used for hypervisor guest translation
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 int *prot, target_ulong addr,
-                                int access_type, int mmu_idx)
+                                int access_type, int mmu_idx,
+                                bool first_stage)
 {
     /* NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
@@ -485,13 +494,21 @@ restart:
 }
 
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
-                                MMUAccessType access_type, bool pmp_violation)
+                                MMUAccessType access_type, bool pmp_violation,
+                                bool first_stage)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions =
-        (env->priv_ver >= PRIV_VERSION_1_10_0) &&
-        get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-        !pmp_violation;
+    int page_fault_exceptions;
+    if (first_stage) {
+        page_fault_exceptions =
+            (env->priv_ver >= PRIV_VERSION_1_10_0) &&
+            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
+            !pmp_violation;
+    } else {
+        page_fault_exceptions =
+            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
+            !pmp_violation;
+    }
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = page_fault_exceptions ?
@@ -518,7 +535,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int prot;
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
-    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx)) {
+    if (get_physical_address(&cpu->env, &phys_addr, &prot, addr, 0, mmu_idx,
+                             true)) {
         return -1;
     }
     return phys_addr;
@@ -583,7 +601,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
+    ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx,
+                               true);
 
     if (mode == PRV_M && access_type != MMU_INST_FETCH) {
         if (get_field(env->mstatus, MSTATUS_MPRV)) {
@@ -610,7 +629,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
-        raise_mmu_exception(env, address, access_type, pmp_violation);
+        raise_mmu_exception(env, address, access_type, pmp_violation, true);
         riscv_raise_exception(env, cs->exception_index, retaddr);
     }
 #else
-- 
2.25.0.265.gbab2e86ba0-goog


