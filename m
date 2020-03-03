Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vkt-0002eL-Qk
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkF-00012K-SY
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkE-0004AG-Nh
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:11 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkE-000495-GQ
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:10 -0500
Received: by mail-pl1-x631.google.com with SMTP id q4so511746pls.4
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=9gtHkOPRn/G0hWY+fkaGzSLrGPQLSEWHX9NgBS6eyHY=;
 b=pRcZvka7u0uzqNUAy+nFoOQD+RTdQrOVoEgwYH7pOQVC/7NC5n5d7B1PKT+YwRyg55
 o6zqr36tu3F9u6gKhtcHsL1ZgAP3a3H2JKAeWU+seehNCejiQtunEIBrFn2q6Ec1jutF
 3myTwjQv/W2aPDCbUjEPpBJXiUD8P3gzd1scofLOL1vmY4qz16HlfcWY0/uLy1uUOpls
 nLr+FP2FmWa28BiyA7pDdn8gbgH4SqMRVHBl1Y2MCJRhThWHrBzZ2KqQ+VByqwaKpWDf
 Jz6qu0jaA9gqLa5hx9VCF+kj4TGXYcI+cxf07zu6tf8z5peCBsmUhIjhqP31ivWdGwFS
 032w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=9gtHkOPRn/G0hWY+fkaGzSLrGPQLSEWHX9NgBS6eyHY=;
 b=rhxcY2ynDIAWsYXZtUvqQRsJGFd5vXKGuAPQYpCM8nKd+QpPLF6ltRzDPKdiveW4OX
 oPVj69Xi8/b5NujT+kDX7v2qvSsKRpWpTbgqLHvjdH4kpz9duonzDJ5jjInAvq9rIC9Q
 suWekbWZXk2auYTZ+AQG3pmsINYmvKfXZQtrrHF0rgX8PpDgkm+J/YW9mOkEn5j4KRaF
 GSmD8+h7uuUy4Rj+mC94Y6aXRMtkJ0ciVUKbozfeY8DlVlXg/koxtjJDx/OWKwEY8PZg
 agXZvqayp55zVZSL+zGzkOvZYAh4mR3cLHZsGW2bXMQhX92j9IAnFqD3P6G2/HiD8ncl
 xwFw==
X-Gm-Message-State: ANhLgQ0iAKcZqLdiEU0yLqS5Hep8P9LithW+k0MtrWYriQLKKz75cj6x
 HPve+DSYIGzzVvugWoXlyE9uapFrszi/RA==
X-Google-Smtp-Source: ADFU+vuB9mhoZ8xSzD6D+oYWP9G7R7Qu7RVr2pqT21/ll2ULfY/0bOh/+lSQqYYiZC4b3Qbmn46B7A==
X-Received: by 2002:a17:902:c383:: with SMTP id g3mr1754349plg.9.1583196547841; 
 Mon, 02 Mar 2020 16:49:07 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id u6sm301251pjy.3.2020.03.02.16.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:07 -0800 (PST)
Subject: [PULL 06/38] target/riscv: Add the virtulisation mode
Date: Mon,  2 Mar 2020 16:48:16 -0800
Message-Id: <20200303004848.136788-7-palmerdabbelt@google.com>
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
X-Received-From: 2607:f8b0:4864:20::631
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:13 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.h        |  4 ++++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c7f7ae5c38..a9cbd8584e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -117,6 +117,8 @@ struct CPURISCVState {
 
 #ifndef CONFIG_USER_ONLY
     target_ulong priv;
+    /* This contains QEMU specific information about the virt state. */
+    target_ulong virt;
     target_ulong resetvec;
 
     target_ulong mhartid;
@@ -269,6 +271,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+bool riscv_cpu_virt_enabled(CPURISCVState *env);
+void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index eeaa03c0f8..2cdb0de4fe 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -430,6 +430,9 @@
 #define PRV_H 2 /* Reserved */
 #define PRV_M 3
 
+/* Virtulisation Register Fields */
+#define VIRT_ONOFF          1
+
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
 #define SATP32_ASID         0x7fc00000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a10582b310..e5311160e7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -82,6 +82,24 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
     return false;
 }
 
+bool riscv_cpu_virt_enabled(CPURISCVState *env)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return false;
+    }
+
+    return get_field(env->virt, VIRT_ONOFF);
+}
+
+void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+}
+
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
-- 
2.25.0.265.gbab2e86ba0-goog


