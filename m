Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4DDCD6E57
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:20:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wULH2-0000n7-Bd; Tue, 02 Jun 2026 05:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGu-0000cZ-L8
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:53 -0400
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGq-0007k2-Ri
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:51 -0400
Received: by mail-dy1-x1343.google.com with SMTP id
 5a478bee46e88-304d7f31215so4950314eec.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780391926; x=1780996726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcOVA7z761sRU6mzSlK4g0qMB5qPdXRWmaIP73uflqw=;
 b=V1N7agQXjFvn7TxbMUM5oQwRRdCuJ13e2gYM36xkXCT1moUR8wwatkwUs6h7KwzTr5
 x55pUPtzJcxeC3BLotT0cJvWW3pbTnCyR3vg6tsPHmj6OmMVhEP9Sh3izmCbTocl42HD
 36vD72V+EiYd8XoMwiJZVbjU65mbyQ7x0Pn6Nu/Ly0HB779y9kuv/Be0CwH3K8JB43Lm
 McQeame5kzwDC2Wml5ZIifSkF5a3vM5oP0JZw9aJ5dH/BYe0ph1eRHz3nC9QBH+mNbEm
 fEG8gjOIAAyA4mwr+BZOkNgHfXOpUFKf6EVnHLjrgjn+w5itQQo31aVTQiVXDCKnuAsO
 Un5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780391926; x=1780996726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HcOVA7z761sRU6mzSlK4g0qMB5qPdXRWmaIP73uflqw=;
 b=jGpAd7ahnMh2yObu/gdpUAgCHHdD4THB8/tv8K3TKCVrdvEkdCFipKow2jQ6/txli9
 zOKZRtfwBLHLbnd8iqv4lDPf15UlUGqiE4IUQIVCExmPIV9ysnpQMzYvGYv1XL4yaPMI
 ECuRlctu06pYS9jADbIUANr52poywPPapxrG3TTdrkTF8PY5KSJBrdtFc9uaOeGK5E2K
 pP0sOo0CSw/YOsfOJnVvPosPRJBbBvxPUCG5AwZ+YvT7c/GIOyHM7TZQfDs2E6dtauXb
 OMblAdgaXBih3UfMDwoxv05Ut50CJyiQPajMHM5KLLMAPjuhulgeFMCOxi5q1h1M6mEU
 tvsA==
X-Gm-Message-State: AOJu0Yyv2VoTGfNxh7WZ51/DYAuVn+7ckYpxeImwhVlGV0tZ+5nezxIq
 IC0rqJZwPvRM9wA61YKfMKQ/8YC3JY4/9DScJ8bkeESKKLuB+Z0yC79n
X-Gm-Gg: Acq92OFOeLDFCj1RPjktyqmX8rzzKvMB8YZ8T1CPv55W+FXaHE1ocYY8uR1gQH/v32P
 l85aSeJ7cEFIfXN+sE8pZgLoFdYfMlx5qWiF5pqPDcBPQ5jPSvYlczk4rt23kVqtlDek6RjiBaf
 f0461fjSUNCemf5ZyD5+u/Az/GDlUl37C3GVIiQS74G0cJmu6bDII+4gbX+vuvImYMWxkrzN5Jy
 MVuzDwf+GMaWU7pgX0jk1OFZaL5AMBoWDFfTW8tVNqLLBQq7K8VigaycmNE3hhc+FcEyzw6oO4I
 gyCh3hC3WuiRatp4855QfnOJzBNjomW29TAxv4wjNyvnDTqL4VFCBhsLJ9zA9cpDJnQcWQDuOQx
 z/oyD9NLuXVpAygc9pYn+xh+vLJEIQPFXuzbOmNIp7y3ZpCsAdKYJGjWHoqZlG7z9iJ8ftsx9O9
 PPjfqcSh04goY9ytmAqwGbhfmsK1hDRS41+7cEOw7MqCfcOPkHi7lZGDiyPFLRqBS7HFntFhuW+
 WIv+xEJpgHEP5syQwR5YnpMKw4=
X-Received: by 2002:a05:7300:6c84:b0:2ea:ed70:3ea8 with SMTP id
 5a478bee46e88-304fa6939demr7209201eec.29.1780391926221; 
 Tue, 02 Jun 2026 02:18:46 -0700 (PDT)
Received: from openkylin..
 (ec2-54-176-108-193.us-west-1.compute.amazonaws.com. [54.176.108.193])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c3121sm11419146eec.5.2026.06.02.02.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 02:18:45 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 alex.bennee@linaro.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@linaro.org, Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v3 5/6] target/riscv: build TCG-only sources only with TCG
Date: Tue,  2 Jun 2026 17:17:52 +0800
Message-ID: <20260602091753.3209261-6-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
References: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1343;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-dy1-x1343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Several RISC-V source files contain translated-code helpers, decoders, or
TCG-only instruction implementations, but are currently part of the common
RISC-V source set. This breaks --disable-tcg builds once TCG headers and
helpers are unavailable.

After moving common helpers out of TCG-only files, build the remaining
TCG-only RISC-V sources only when CONFIG_TCG is enabled. Keep common CSR
misa handling from relying on TCG unwind state in no-TCG builds by falling
back to env->pc.

Drop the stale tcg/tcg.h include from common CPU code so no-TCG builds do
not include a TCG-private header.

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/cpu.c        |  1 -
 target/riscv/cpu_helper.c |  6 ++++++
 target/riscv/csr.c        | 11 +++++++++--
 target/riscv/meson.build  |  9 ++++++---
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8ef72a88b1..459e32f4ac 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -36,7 +36,6 @@
 #include "system/tcg.h"
 #include "kvm/kvm_riscv.h"
 #include "tcg/tcg-cpu.h"
-#include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
 static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 752752d520..e53a5d567d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -29,8 +29,10 @@
 #include "exec/target_page.h"
 #include "system/memory.h"
 #include "instmap.h"
+#ifdef CONFIG_TCG
 #include "tcg/tcg-op.h"
 #include "accel/tcg/cpu-ops.h"
+#endif
 #include "trace.h"
 #include "semihosting/common-semi.h"
 #include "exec/icount.h"
@@ -1714,6 +1716,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     return TRANSLATE_SUCCESS;
 }
 
+#ifdef CONFIG_TCG
 static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 MMUAccessType access_type, bool pmp_violation,
                                 bool first_stage, bool two_stage,
@@ -1756,6 +1759,7 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     env->two_stage_lookup = two_stage;
     env->two_stage_indirect_lookup = two_stage_indirect;
 }
+#endif
 
 hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
 {
@@ -1780,6 +1784,7 @@ hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
     return phys_addr;
 }
 
+#ifdef CONFIG_TCG
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
@@ -2004,6 +2009,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     return true;
 }
+#endif
 
 static target_ulong riscv_transformed_insn(CPURISCVState *env,
                                            target_ulong insn,
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 186d32fca8..9a9a148bfe 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2134,15 +2134,22 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
 
 static target_ulong get_next_pc(CPURISCVState *env, uintptr_t ra)
 {
+    /* Outside of a running cpu, env contains the next pc. */
+    if (ra == 0) {
+        return env->pc;
+    }
+#ifdef CONFIG_TCG
     uint64_t data[INSN_START_WORDS];
 
-    /* Outside of a running cpu, env contains the next pc. */
-    if (ra == 0 || !cpu_unwind_state_data(env_cpu(env), ra, data)) {
+    if (!cpu_unwind_state_data(env_cpu(env), ra, data)) {
         return env->pc;
     }
 
     /* Within unwind data, [0] is pc and [1] is the opcode. */
     return data[0] + insn_len(data[1]);
+#else
+    return env->pc;
+#endif
 }
 
 static RISCVException write_misa(CPURISCVState *env, int csrno,
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 4c99f2b802..2f86dbd5bf 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -9,7 +9,7 @@ gen = [
 ]
 
 riscv_ss = ss.source_set()
-riscv_ss.add(gen)
+riscv_ss.add(when: 'CONFIG_TCG', if_true: gen)
 
 riscv_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 		     if_true: files('common-semi-target.c'))
@@ -19,11 +19,14 @@ riscv_ss.add(files(
   'cpu-validate.c',
   'cpu_helper.c',
   'csr.c',
-  'fpu_helper.c',
   'gdbstub.c',
+  'vector_internals.c',
+))
+
+riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'fpu_helper.c',
   'op_helper.c',
   'vector_helper.c',
-  'vector_internals.c',
   'bitmanip_helper.c',
   'translate.c',
   'm128_helper.c',
-- 
2.43.0


