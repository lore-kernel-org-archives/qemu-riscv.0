Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlF-0003Ln-V6
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkC-0000xV-9U
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkA-000480-Bd
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:07 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53154)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkA-00047S-6E
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:06 -0500
Received: by mail-pj1-x1043.google.com with SMTP id lt1so556515pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=qaIXh/9YL5Y0Dx2E5H6658/HQOPDjXc++/K5S1NANzA=;
 b=dtBEhQ/y4Q0M72y1cr6UqwUDsaFkah4RZWAy7puhOYKQA6a9e07H/cc0dHL2b29jWH
 RRGqwBm2+xBgAjevVAr9OUWiJ4wuy8qwif0Ltzl2Qfu1R84P5rQc4qGXyoUl1smseCzX
 ni+qv44DqFRR6CsOPslrcBh7g8g3luLD0iW/MsKdmYHWWMUxhYoMan9CS5PkEBUnG4+F
 N4IXM39Wve6PbT29E0Fs8ET5evionQ7tl+cHfkFUvjnqHwjIrIiT07l8Pbt2wmPrh0US
 tZTcPWb9zYImICbPzVi6Aj6Y+y6fGja21oh1uDYm0jmp0It4pVpER7T0JL/xv8Tk34Ld
 heaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=qaIXh/9YL5Y0Dx2E5H6658/HQOPDjXc++/K5S1NANzA=;
 b=AR2MBUFnzgpO6pk5ny9GlWnlYO0ZSXB2YutJapS5/Gq+G23BoL3g/q9LXH7J4mKYnq
 /Z4PS37+hLgv8mi2QE24cEqQgXjayDJPdQKkTVdQrGBRDgkgJ945oMFf0J/3G7DVEE+n
 5WRkQWNxzuoHKrfuOI3LeqW5/S18oyh0oTbAkId/PuDdSg0agtK9Cdmv7SH2r5vJ82fF
 +ydU2LJlN/U4XSau0KGOSym4Mf2Jdb2ri/PVPp843IidsZCgDehh5/DZkBm+5EqK+0Vp
 HOcm1ME1TWbz6snYIQaW2K9s0Y9pbT609ep0sb4+3mxyKVMK/rEzNXht9t1N7nAcAD2d
 XcSQ==
X-Gm-Message-State: ANhLgQ2MzcS909gZHhHHaXBfXWUNf8eQ9GK1DI4mPhkWb9Uqh2eS83zP
 nRmvpDN57izeW8vnWvfI28GPtJQWfLEe8g==
X-Google-Smtp-Source: ADFU+vsZMEe60WYpEducGhkcNOC3MURK33rI2JVPpzf+KzxXoJT99DiHtP49K6GkA8vyTIkOinitug==
X-Received: by 2002:a17:902:7895:: with SMTP id
 q21mr1728126pll.222.1583196544759; 
 Mon, 02 Mar 2020 16:49:04 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id w2sm14035542pfb.138.2020.03.02.16.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:04 -0800 (PST)
Subject: [PULL 04/38] target/riscv: Add support for the new execption numbers
Date: Mon,  2 Mar 2020 16:48:14 -0800
Message-Id: <20200303004848.136788-5-palmerdabbelt@google.com>
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
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:10 -0000

From: Alistair Francis <alistair.francis@wdc.com>

The v0.5 Hypervisor spec add new execption numbers, let's add support
for those.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu_bits.h   | 35 +++++++++++++++++++----------------
 target/riscv/cpu_helper.c |  7 +++++--
 target/riscv/csr.c        |  7 +++++--
 4 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index efbd676edb..2f62f5ea19 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -67,6 +67,14 @@ const char * const riscv_excp_names[] = {
     "load_page_fault",
     "reserved",
     "store_page_fault"
+    "reserved",
+    "reserved",
+    "reserved",
+    "reserved",
+    "guest_exec_page_fault",
+    "guest_load_page_fault",
+    "reserved",
+    "guest_store_page_fault"
 };
 
 const char * const riscv_intr_names[] = {
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 25c0fb258d..9ce73c36de 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -488,22 +488,25 @@
 #define DEFAULT_RSTVEC      0x1000
 
 /* Exception causes */
-#define EXCP_NONE                          -1 /* sentinel value */
-#define RISCV_EXCP_INST_ADDR_MIS           0x0
-#define RISCV_EXCP_INST_ACCESS_FAULT       0x1
-#define RISCV_EXCP_ILLEGAL_INST            0x2
-#define RISCV_EXCP_BREAKPOINT              0x3
-#define RISCV_EXCP_LOAD_ADDR_MIS           0x4
-#define RISCV_EXCP_LOAD_ACCESS_FAULT       0x5
-#define RISCV_EXCP_STORE_AMO_ADDR_MIS      0x6
-#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT  0x7
-#define RISCV_EXCP_U_ECALL                 0x8
-#define RISCV_EXCP_S_ECALL                 0x9
-#define RISCV_EXCP_H_ECALL                 0xa
-#define RISCV_EXCP_M_ECALL                 0xb
-#define RISCV_EXCP_INST_PAGE_FAULT         0xc /* since: priv-1.10.0 */
-#define RISCV_EXCP_LOAD_PAGE_FAULT         0xd /* since: priv-1.10.0 */
-#define RISCV_EXCP_STORE_PAGE_FAULT        0xf /* since: priv-1.10.0 */
+#define EXCP_NONE                                -1 /* sentinel value */
+#define RISCV_EXCP_INST_ADDR_MIS                 0x0
+#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
+#define RISCV_EXCP_ILLEGAL_INST                  0x2
+#define RISCV_EXCP_BREAKPOINT                    0x3
+#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
+#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
+#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
+#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
+#define RISCV_EXCP_U_ECALL                       0x8
+#define RISCV_EXCP_S_ECALL                      0x9
+#define RISCV_EXCP_VS_ECALL                      0xa
+#define RISCV_EXCP_M_ECALL                       0xb
+#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
+#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
+#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
+#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
+#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
+#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
 
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 85403da9c8..a10582b310 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -528,13 +528,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     static const int ecall_cause_map[] = {
         [PRV_U] = RISCV_EXCP_U_ECALL,
         [PRV_S] = RISCV_EXCP_S_ECALL,
-        [PRV_H] = RISCV_EXCP_H_ECALL,
+        [PRV_H] = RISCV_EXCP_VS_ECALL,
         [PRV_M] = RISCV_EXCP_M_ECALL
     };
 
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
+        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
+        case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
+        case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
         case RISCV_EXCP_INST_ADDR_MIS:
         case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -556,7 +559,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
 
-    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 16 ?
+    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 23 ?
         (async ? riscv_intr_names : riscv_excp_names)[cause] : "(unknown)");
 
     if (env->priv <= PRV_S &&
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0e34c292c5..ca27359c7e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -242,11 +242,14 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_AMO_ACCESS_FAULT)) |
     (1ULL << (RISCV_EXCP_U_ECALL)) |
     (1ULL << (RISCV_EXCP_S_ECALL)) |
-    (1ULL << (RISCV_EXCP_H_ECALL)) |
+    (1ULL << (RISCV_EXCP_VS_ECALL)) |
     (1ULL << (RISCV_EXCP_M_ECALL)) |
     (1ULL << (RISCV_EXCP_INST_PAGE_FAULT)) |
     (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) |
-    (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT));
+    (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) |
+    (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) |
+    (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) |
+    (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_9_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_SD;
-- 
2.25.0.265.gbab2e86ba0-goog


