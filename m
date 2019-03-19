Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EUO-0007y8-TB
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:09:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EUM-00078U-RB
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGB-0004Tj-VG
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EG9-0004QB-U7
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:27 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 8so10220151pfr.4
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=AfrpmFU4zJeKr3uQSC8qaYdPkzHlFljCCAEe2HuODIU=;
	b=kT5n9ToHCCJV6GDanKPsUJ3vlHQ/E6KwgsSMrP+2PSWeASPwhtrNRIv/NFeN/X3odS
	RsPt5S9tYu3ostLsJOVUHBg8DvboWBtrlykEFeKfr3sIKvYUUYLqnjMGWCl7mlvul0m9
	qXgdZc30QXXYr4wYlmX8IuKmN53udXE7d1bnqJ9q2Sy2CyCD0EY17TW58574SzravVDp
	s3YLn9lPbTnx2401F9w3W2dDoutT/iBqlseK9qGbpEWBl6jh9EQTzaOLslnI0FCtvqGB
	h9uEtdJ2ObAgWxvCf7GPEDUi9ntrRtBLTGS/NDALvHzqs/dPHighdS+HDhnbqZbdsEiu
	rg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=AfrpmFU4zJeKr3uQSC8qaYdPkzHlFljCCAEe2HuODIU=;
	b=bx8BZ66EyimGJD2vBjn4Ju3MDK2lwtKhBibNaJxf0aqoTF8OsunxZz6BUdnxog+UuA
	aVKkoEo73GFmIs8HjfzE712hQNCGfFSKPiypGleFw+aRKroeKGcAGhMPx7ee9ZbrHbyv
	IdavW+fvL91VLASQFSmiJX2ppxKnJIjXPtAcpZA4KgX2Vc9Bom4LY3LGUNscOYbLW6hE
	KDA+X/aPSRqgfmkK/Kb4Ql5IydUBp3ZmM+6uyciT2YObcu9maSfAXmT3tzWa42yIRKjl
	Dtuq5BPt8o+BZjgbCU7sTV/NB3SN+rHWDNHqHN1cxGGbui13uOqktXFxcpTC9SZk/sUN
	sViA==
X-Gm-Message-State: APjAAAVmQJScVuxYMVd62Kb+XyhhYwZV2A+okErTOmWzWc+wOyL79/aE
	KOfBYrvJ+N9vagp+34n/NHdzAUmFwu0o0obG
X-Google-Smtp-Source: APXvYqzUhW+A38RB5GCynrdUNOmbEOXEZdgHBJGuSGBQRIhbIsMcCVJ9N4zXQzDhRiIHl5X2dnwXMA==
X-Received: by 2002:a17:902:e113:: with SMTP id
	cc19mr25988489plb.179.1553000063505; 
	Tue, 19 Mar 2019 05:54:23 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	x5sm15972293pgp.68.2019.03.19.05.54.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:22 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:48 -0700
Message-Id: <20190319124803.13826-5-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Jim Wilson <jimw@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: [Qemu-riscv] [PULL 04/19] RISC-V: Add debug support for accessing
 CSRs.
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
X-List-Received-Date: Tue, 19 Mar 2019 13:09:08 -0000

From: Jim Wilson <jimw@sifive.com>

Add a debugger field to CPURISCVState.  Add riscv_csrrw_debug function
to set it.  Disable mode checks when debugger field true.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190212230903.9215-1-jimw@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.h |  5 +++++
 target/riscv/csr.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c2aebf13251..4c5de30b3721 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -172,6 +172,9 @@ struct CPURISCVState {
 
     /* physical memory protection */
     pmp_table_t pmp_state;
+
+    /* True if in debugger mode.  */
+    bool debugger;
 #endif
 
     float_status fp_status;
@@ -293,6 +296,8 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
 int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
                 target_ulong new_value, target_ulong write_mask);
+int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                      target_ulong new_value, target_ulong write_mask);
 
 static inline void riscv_csr_write(CPURISCVState *env, int csrno,
                                    target_ulong val)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 960d2b0aa951..9a40b4c7baed 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static int fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -92,7 +92,7 @@ static int pmp(CPURISCVState *env, int csrno)
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -103,7 +103,7 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -115,7 +115,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -126,7 +126,7 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -138,7 +138,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -150,7 +150,7 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -827,6 +827,24 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return 0;
 }
 
+/*
+ * Debugger support.  If not in user mode, set env->debugger before the
+ * riscv_csrrw call and clear it after the call.
+ */
+int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                target_ulong new_value, target_ulong write_mask)
+{
+    int ret;
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = true;
+#endif
+    ret = riscv_csrrw(env, csrno, ret_value, new_value, write_mask);
+#if !defined(CONFIG_USER_ONLY)
+    env->debugger = false;
+#endif
+    return ret;
+}
+
 /* Control and Status Register function table */
 static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
-- 
2.19.2


