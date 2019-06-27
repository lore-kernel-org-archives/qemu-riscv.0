Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWFs-0001YD-LF
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFn-0001WP-GG
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFb-0006na-7F
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWFR-0006aH-3O
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id c13so1180411pgg.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jUXXdmFSNX/hvuM0z5WGc23QfyAO7JYoqYw1PuN09oU=;
 b=Va8aytJuMjZqhtr8r6bQQMyPLiotlltF2mqhZ+IIhphna1RvMt37wzufTdfG/addu4
 kxq32/gQUqK677DonO/LRA4pSj8ykIfPbLwkHxuVAcPRfWQFwgL9EsZBDk26brjNeqPS
 0dKd4WPyZXBQ8QA9OguRmkxIzbrRTSQXQ0wLiuViQ+fR07rTy8qeZrzvuMXAz4l6oYKm
 I98YcoTYlmeCQmL6e31AVqOSbNROnWMO64jD/IjuuKAAKSNS+wz8uVe/O0TDDAxsNoEB
 el91T4MkAA8ZxcMR8ahkei2GFUuwntMCXXDLxQAzO1DDBR7tUUZF5PPVSsx2nKFfboe6
 lH5A==
X-Gm-Message-State: APjAAAXFaXV0OxHHcAgPSgiCbsOz2IiHkGIBN2igTsUb1HlPNsI4PHse
 UTD0xE6XFLTwHX9FqPXg+i/TwL5iwUULQg==
X-Google-Smtp-Source: APXvYqwQHGWSi5dQ3ZNIi59TpZXIwgAa73Mgr6WM9PldSQ9IL3PqR2z+jBZxZz56eoNToDxxzmV1Rg==
X-Received: by 2002:a63:88c1:: with SMTP id l184mr4300973pgd.376.1561649012380; 
 Thu, 27 Jun 2019 08:23:32 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id v13sm3821903pfe.105.2019.06.27.08.23.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:31 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:41 -0700
Message-Id: <20190627152011.18686-5-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Michael Clark <mjc@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 04/34] target/riscv: Implement
 riscv_cpu_unassigned_access
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
X-List-Received-Date: Thu, 27 Jun 2019 15:24:05 -0000

From: Michael Clark <mjc@sifive.com>

This patch adds support for the riscv_cpu_unassigned_access call
and will raise a load or store access fault.

Signed-off-by: Michael Clark <mjc@sifive.com>
[Changes by AF:
 - Squash two patches and rewrite commit message
 - Set baddr to the access address
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 16 ++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0632ac08cf35..5b9fae608cca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -482,6 +482,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
+    cc->do_unassigned_access = riscv_cpu_unassigned_access;
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b47cde501766..2e743312536b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -259,6 +259,8 @@ void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+void riscv_cpu_unassigned_access(CPUState *cpu, hwaddr addr, bool is_write,
+                                 bool is_exec, int unused, unsigned size);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8b6754b91798..0bbfb7f48b79 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -375,6 +375,22 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return phys_addr;
 }
 
+void riscv_cpu_unassigned_access(CPUState *cs, hwaddr addr, bool is_write,
+                                 bool is_exec, int unused, unsigned size)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (is_write) {
+        cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+    } else {
+        cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+    }
+
+    env->badaddr = addr;
+    riscv_raise_exception(&cpu->env, cs->exception_index, GETPC());
+}
+
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type, int mmu_idx,
                                    uintptr_t retaddr)
-- 
2.21.0


