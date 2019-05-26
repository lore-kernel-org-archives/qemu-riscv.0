Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUhxJ-0003XW-K7
	for mharc-qemu-riscv@gnu.org; Sat, 25 May 2019 21:28:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhxH-0003HK-0z
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:28:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hUhgF-0006Od-E6
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hUhgF-0006O5-9H
	for qemu-riscv@nongnu.org; Sat, 25 May 2019 21:10:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so7074276pgp.11
	for <qemu-riscv@nongnu.org>; Sat, 25 May 2019 18:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=bfzh+MZSvmEZNQxWgTa76qcItrVzLJNNgdvUdoTR8cc=;
	b=kTS7GYrk1M3uaG8EjenKSUwatQXmYhodrxpGqazviyiZc0E+5D4ZdeOwtq8xF4olln
	m47f9lCmB3APm5PnTn/JtiYmDcu4wgIEhMT5uznGjRFZSiTqGqZXLaxTtCqBnxGjRkbM
	DUY618HLPLw/hzpR34ZET494E5cQfaJajFm3mtin8BbOjBeH6r8voTWmHKVr5phyqe2X
	xe1L0EFz2ty/6HXHh0VFzUt/sEiV+4lkjt73BdDq/4pEhgWIBbRnwmpo249vQC+WB31w
	HVQ5rLdTrVxkvYcQdGMkCzVSqH+hlt18v6BqKNJWL3oz5Mh3xo0OgdrYD8TWXA9f6wqL
	OQVA==
X-Gm-Message-State: APjAAAVkV8vjlcgHkAuA+AqKSQtZbqrzkX32mapudy0Bn5yCf+SDuiaq
	0XpJvoUI23PmMnceXpYo/ULav06YXaY=
X-Google-Smtp-Source: APXvYqyFAmvr2ZnxR9RzHhk9CKgWsvCJCzeJzqr7CJHHs223C6ARSyjNDqf8d8d6nWvjRBXzFjWC2g==
X-Received: by 2002:a62:5e06:: with SMTP id s6mr65039168pfb.193.1558833029855; 
	Sat, 25 May 2019 18:10:29 -0700 (PDT)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id n9sm6879354pfq.53.2019.05.25.18.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 18:10:29 -0700 (PDT)
Date: Sat, 25 May 2019 18:09:39 -0700
Message-Id: <20190526010948.3923-21-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526010948.3923-1-palmer@sifive.com>
References: <20190526010948.3923-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 20/29] target/riscv: Trigger interrupt on MIP
 update asynchronously
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
X-List-Received-Date: Sun, 26 May 2019 01:28:08 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

The requirement of holding the iothread_mutex is burdersome when
swapping the background and foreground registers in the Hypervisor
extension. To avoid the requrirement let's set the interrupt
asynchronously.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++------
 target/riscv/csr.c        |  2 --
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 41d6db41c3dd..7318da289f6e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -82,10 +82,31 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
     }
 }
 
-/* iothread_mutex must be held */
+struct CpuAsyncInfo {
+    uint32_t new_mip;
+};
+
+static void riscv_cpu_update_mip_irqs_async(CPUState *target_cpu_state,
+                                            run_on_cpu_data data)
+{
+    CPURISCVState *env = &RISCV_CPU(target_cpu_state)->env;
+    RISCVCPU *cpu = riscv_env_get_cpu(env);
+    struct CpuAsyncInfo *info = (struct CpuAsyncInfo *) data.host_ptr;
+
+    if (info->new_mip) {
+        cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
+    }
+
+    g_free(info);
+}
+
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 {
     CPURISCVState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    struct CpuAsyncInfo *info;
     uint32_t old, new, cmp = atomic_read(&env->mip);
 
     do {
@@ -94,11 +115,11 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
         cmp = atomic_cmpxchg(&env->mip, old, new);
     } while (old != cmp);
 
-    if (new) {
-        cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
-    } else {
-        cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
-    }
+    info = g_new(struct CpuAsyncInfo, 1);
+    info->new_mip = new;
+
+    async_run_on_cpu(cs, riscv_cpu_update_mip_irqs_async,
+                     RUN_ON_CPU_HOST_PTR(info));
 
     return old;
 }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e1d91b6c6049..f9d8d150e012 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -555,9 +555,7 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     uint32_t old_mip;
 
     if (mask) {
-        qemu_mutex_lock_iothread();
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
-        qemu_mutex_unlock_iothread();
     } else {
         old_mip = atomic_read(&env->mip);
     }
-- 
2.21.0


