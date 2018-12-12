Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWtY0-00057O-QN
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 20:42:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtN9-0001lc-CP
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:31:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtN8-0001Zd-AV
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:31:35 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gWtN8-0001ZU-3j
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:31:34 -0500
Received: by mail-pf1-x442.google.com with SMTP id c72so8025065pfc.6
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 17:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qmD3hWS8qdSxuuhAyZEMvvljL/S3oPIzQoMSPjk9XJc=;
	b=MXoGar/NDQ6hrfWXSDNArY24yk0OraREUOgUlm0J8DSQdMhHBflvm2OPImBnFHstIB
	ZTDQTUFSbb3VGOT25c+SU7eqbgmo3ABFItr+vzeJJQb4wgWAJoumBsqrAJp3IU77akxl
	rZyESeRROlh+wN+lwjdAEoVTdyOYGgvKTnMythH9PQJzmQZvFd9Y/Y8pefLCLvmUm4PL
	aQuroikLDNCXnFGqMrUSPNMsjh7E3moVRQql/bJIdLl77y8wMM8ha5dPjHCxdrgqUkpw
	BhakKwZ/OpjkYnOa9ScHIC+GGI3OsFcafrvEPJhItFinoJgvbUk7YsinCDCJI4Kq2rpB
	VqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qmD3hWS8qdSxuuhAyZEMvvljL/S3oPIzQoMSPjk9XJc=;
	b=Jb5klIWNeMzp190beSHV/HPI89zW80wdkDBJcwKsaMw1tpKZx5W/uo9Ne22qSYOuXt
	iGJUn76+/w8jgdYu0NVTBCY95XEeLEA7HoeJ68NTMEp86avqWPEO/881dGuDDpdt0MBc
	8CFqjtu4VejGjVyYJgmPE9OD8KvR9tavGg113R64Dq+rJlcGhPOIVTY6+gzp6LWy7Y3o
	v6PE+pTUF6hOxtLmDr4dQe0AsPi5AjM0piXv0sGy39YrH11XeHOgLsro4dFmWzaG6vTZ
	27e4LNGUa1H5+Z4HL6M8YdegC/U7RqxE62snWupO9iLk42NtHUHXQF7xBxR3Nu/jJNdJ
	ymlw==
X-Gm-Message-State: AA+aEWaWrw9NDLkph4dZfB5pDIlcoKCCzlT2jto+hbI9D2MfgW9/no6a
	RxbhVyW3LJxTiY5sWBsvuziSezzXNG/EuQ==
X-Google-Smtp-Source: AFSGD/XQ6aiBYZaw71B/NbUV/U748FraStTWGxl55p4YDGxVIJeZ+Dr4nMlY0sqUcELTRNeMF40CCA==
X-Received: by 2002:a63:eb0e:: with SMTP id t14mr16841829pgh.445.1544578293032;
	Tue, 11 Dec 2018 17:31:33 -0800 (PST)
Received: from rohan.hsd1.ca.comcast.net
	([2601:646:c100:8240:316a:e169:23a5:398])
	by smtp.gmail.com with ESMTPSA id
	t62sm25758065pgb.39.2018.12.11.17.31.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 17:31:32 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Jim Wilson <jimw@sifive.com>
Date: Tue, 11 Dec 2018 17:31:21 -0800
Message-Id: <20181212013121.3841-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
References: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-Mailman-Approved-At: Tue, 11 Dec 2018 20:42:42 -0500
Subject: [Qemu-riscv] [PATCH 5/5] RISC-V: Add hooks to use the gdb xml files.
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
X-List-Received-Date: Wed, 12 Dec 2018 01:31:36 -0000

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 target/riscv/cpu.c     |  9 ++++++-
 target/riscv/gdbstub.c | 71 ++++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a025a0a..b248e3e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -305,6 +305,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    riscv_cpu_register_gdb_regs_for_features(cs);
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
@@ -345,7 +347,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 65;
+    cc->gdb_num_core_regs = 33;
+#if defined(TARGET_RISCV32)
+    cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+#elif defined(TARGET_RISCV64)
+    cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+#endif
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifdef CONFIG_USER_ONLY
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index b06f0fa..2fd82f4 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -31,10 +31,6 @@ int riscv_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
         return gdb_get_regl(mem_buf, env->gpr[n]);
     } else if (n == 32) {
         return gdb_get_regl(mem_buf, env->pc);
-    } else if (n < 65) {
-        return gdb_get_reg64(mem_buf, env->fpr[n - 33]);
-    } else if (n < 4096 + 65) {
-        return gdb_get_regl(mem_buf, csr_read_helper(env, n - 65, true));
     }
     return 0;
 }
@@ -53,11 +49,70 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     } else if (n == 32) {
         env->pc = ldtul_p(mem_buf);
         return sizeof(target_ulong);
-    } else if (n < 65) {
-        env->fpr[n - 33] = ldq_p(mem_buf); /* always 64-bit */
+    }
+    return 0;
+}
+
+static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
+{
+    if (n < 32) {
+        return gdb_get_reg64(mem_buf, env->fpr[n]);
+    }
+    else if (n < 35) {
+        /* CSR_FFLAGS is 0x001, and gdb says it is FP register 32, so we
+           subtract 31 to map the gdb FP register number to the CSR number.
+           This also works for CSR_FRM and CSR_FCSR.  */
+        return gdb_get_regl(mem_buf, csr_read_helper(env, n - 31, true));
+    }
+    return 0;
+}
+
+static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
+{
+    if (n < 32) {
+        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
         return sizeof(uint64_t);
-    } else if (n < 4096 + 65) {
-        csr_write_helper(env, ldtul_p(mem_buf), n - 65, true);
+    }
+    else if (n < 35) {
+        /* CSR_FFLAGS is 0x001, and gdb says it is FP register 32, so we
+           subtract 31 to map the gdb FP register number to the CSR number.
+           This also works for CSR_FRM and CSR_FCSR.  */
+        csr_write_helper(env, ldtul_p(mem_buf), n - 31, true);
     }
     return 0;
 }
+
+static int riscv_gdb_get_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
+{
+    if (n < ARRAY_SIZE(csr_register_map)) {
+        return gdb_get_regl(mem_buf, csr_read_helper(env, csr_register_map[n],
+                                                     true));
+    }
+    return 0;
+}
+
+static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
+{
+    if (n < ARRAY_SIZE(csr_register_map)) {
+        csr_write_helper(env, ldtul_p(mem_buf), csr_register_map[n], true);
+    }
+    return 0;
+}
+
+void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
+{
+    /* ??? Assume all targets have FPU regs for now.  */
+#if defined(TARGET_RISCV32)
+    gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
+                             35, "riscv-32bit-fpu.xml", 0);
+
+    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
+                             4096, "riscv-32bit-csr.xml", 0);
+#elif defined(TARGET_RISCV64)
+    gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
+                             35, "riscv-64bit-fpu.xml", 0);
+
+    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
+                             4096, "riscv-64bit-csr.xml", 0);
+#endif
+}
-- 
2.7.4


