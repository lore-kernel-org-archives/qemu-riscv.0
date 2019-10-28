Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7PX-0005Ba-US
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7PT-00054p-VE
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7PS-0003kp-JG
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:23 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41237)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7PS-0003kA-Bw
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:22 -0400
Received: by mail-pf1-x442.google.com with SMTP id p26so3016857pfq.8
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=NTDCXoct0r20MWf46zhs8NOznjZVo4mAIr2TQFqNsno=;
 b=SvAdebdVMX9kWzSmRv9+gk3fa1bjFCWyJonqHKFtYJKtvo5yqILznp+4Xxlfhz4ysl
 dMgv3sQI9MAqmqOFlY7Q6YmOVFKw0vZIaUyqBTK0pnG6CQxgydEyrbX44QlKhgYpk6vv
 /w00HCY2rrArTEDDVKhPRH0U40Qis8SEwubx05AylAKlM4kuxA3Z31M2Ag68Gjz0RkHE
 yET90GyQzQsq1RErMl/RgFZ171WZcei61CI5iJPHywZr6qBY/53J64xAaYjKrQ+RBtAF
 qaNGPQiLcAxTB3UClIW4od2EDffmcYLfbUSADe6PhNG1uQ35WtQ9heu93SRt28PuUvEz
 5zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=NTDCXoct0r20MWf46zhs8NOznjZVo4mAIr2TQFqNsno=;
 b=Y/CsAqb7Lp7tYIICLYWuIKa0t73tIATLH3ClFn5Nh4ohdNNZ08pfZy8xAoxgxLF/TU
 nRQHYSAqSrhhlpA6GDZ66g10NZNRDN4AADqI4EixX6moA91E4EkW13XinkoL/UjqW5lc
 +O7BZhDjQxi8VIKRY43PfBSUYtJgbPnAjaNwfLrgdhyDw0u1VJRbiyHD3skRNc+Us2/D
 5GKMpBn/GojY6SDI2WBcfrCIEoqgYrjjNCASh13D3achLsAUV5pLJxXO8wao0aAJr+qv
 DnupLcT7bdIdMzr6lG7l29Pm7fNfXuX6Y+iReCbzIG1IGqJ24GoA1JhgCCzVwDLn/cqd
 DyPw==
X-Gm-Message-State: APjAAAXROBq+65Ty9q+HCBx3TCnDjLzciewNZkwwHOkMx/6hbfPyHreG
 NvXQgYRDjLHL0O5zJCUP63b45A==
X-Google-Smtp-Source: APXvYqyjqVlr7mXVtsL/tk24DaXugRUC/POwfZuSUxF7FbtAbaW9gr82rekRs2Lx71vvSexEDMy/7g==
X-Received: by 2002:aa7:8e16:: with SMTP id c22mr21089336pfr.116.1572278301380; 
 Mon, 28 Oct 2019 08:58:21 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f25sm15812305pfk.10.2019.10.28.08.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:20 -0700 (PDT)
Subject: [PULL 03/18] RISC-V: Implement cpu_do_transaction_failed
Date: Mon, 28 Oct 2019 08:48:47 -0700
Message-Id: <20191028154902.32491-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:26 -0000

This converts our port over from cpu_do_unassigned_access to
cpu_do_transaction_failed, as cpu_do_unassigned_access has been
deprecated.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu.h        |  7 +++++--
 target/riscv/cpu_helper.c | 11 +++++++----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f13e298a36..3939963b71 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -484,7 +484,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->do_unassigned_access = riscv_cpu_unassigned_access;
+    cc->do_transaction_failed = riscv_cpu_do_transaction_failed;
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 124ed33ee4..8c64c68538 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -264,8 +264,11 @@ void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
-void riscv_cpu_unassigned_access(CPUState *cpu, hwaddr addr, bool is_write,
-                                 bool is_exec, int unused, unsigned size);
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c82e7ed52b..917252f71b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -408,20 +408,23 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return phys_addr;
 }
 
-void riscv_cpu_unassigned_access(CPUState *cs, hwaddr addr, bool is_write,
-                                 bool is_exec, int unused, unsigned size)
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    if (is_write) {
+    if (access_type == MMU_DATA_STORE) {
         cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
     } else {
         cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
     }
 
     env->badaddr = addr;
-    riscv_raise_exception(&cpu->env, cs->exception_index, GETPC());
+    riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
 }
 
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-- 
2.21.0


