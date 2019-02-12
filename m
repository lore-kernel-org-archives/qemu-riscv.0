Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gthAt-0005sy-Vz
	for mharc-qemu-riscv@gnu.org; Tue, 12 Feb 2019 18:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gthAp-0005qN-Vk
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:09:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gthAo-0003O2-Uj
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:09:07 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gthAo-0003Mt-OM
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:09:06 -0500
Received: by mail-pl1-x643.google.com with SMTP id bj4so188006plb.7
	for <qemu-riscv@nongnu.org>; Tue, 12 Feb 2019 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jEOwJ39SLu7LPsZGsv/aOl5LdrYLz2G0H5NnL2aHCMQ=;
	b=M/aHQbAjnnOOsuuNq9geohzVH1eCeoXBbYNhPkxzeJpafQi3vXgbuvjeH90rMrXzux
	oF+WIEMt8OROfYqea4RsS/7uVwJkOh4AKNDVpe1t3rZK0LVY2srsIIKfz0x9NyKLKzK2
	th/lEYO0kUluIGrwqkNpLtmmOJYH7m8fwxcGHBk7SKtmu+1mkqCRsj2QIbIR6J9esNF7
	EaVGFKE/3PdHQOiwg4QSG2LVnO9/+tvZ5n87LSdpzPhoY9tau6g/lTp9oS+PBjmIHczZ
	J8YUNVUMd0IvouEQW68GzsthTm1IwE1hjOhr7eJGx7UJbK0yxosIybw7SzMSsx2xe9xD
	DUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jEOwJ39SLu7LPsZGsv/aOl5LdrYLz2G0H5NnL2aHCMQ=;
	b=LXWIn2T+el/LljRoOjYwGePTcj8874Yn8nC4urL4S32jGWXSEkhQ0OggpDOr6JftGv
	wNoAINyeMaetiN/jPnSn1IVLp+9AHWu5kylAbd77V/JPR9+ynySeOL0JlCPT61OB15jp
	5gElM4EdMeDf5PcN4vvD56oUU3sIBdhZcwV1tJVb7DT8vuH4Da80HQMi5r3v8OuGWsRc
	yjufrREW7UImERUWygt7+xRY8iFNdb/ZDw3FHTxoOS9sSo/Cy0CZQmOnloodRA4odBL8
	Su8xue4qN8j97bjeZHoE8zkbwyGrFLoRQ/gT8smSBNkePdlkFgbngnSAEQBuS21gbfdT
	cUZw==
X-Gm-Message-State: AHQUAua5iIcbRM1+wVUI8SKsWgZsOhpVlz3riofIIKRiZQyy23O0l6kW
	RlZ3ljA6TKPg9b/ehkJAlSR91A==
X-Google-Smtp-Source: AHgI3IaVuKKg0G6nti+oZjOHPDbf13zx4rsimZyuq3r0k5nHVnD0X+QFDVVwWHO3W4xQVdirQlaBvQ==
X-Received: by 2002:a17:902:7592:: with SMTP id
	j18mr6356749pll.289.1550012945643; 
	Tue, 12 Feb 2019 15:09:05 -0800 (PST)
Received: from rohan.sifive.com ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id
	145sm20569080pfa.160.2019.02.12.15.09.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 15:09:05 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Jim Wilson <jimw@sifive.com>
Date: Tue, 12 Feb 2019 15:09:03 -0800
Message-Id: <20190212230903.9215-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVabfDYU+2+iDYOeFMBL4+hVFL5q=fSR7Pb=VX1af5xsTNg@mail.gmail.com>
References: <CAFyWVabfDYU+2+iDYOeFMBL4+hVFL5q=fSR7Pb=VX1af5xsTNg@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v4 4/5] RISC-V: Add debug support for accessing
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
X-List-Received-Date: Tue, 12 Feb 2019 23:09:09 -0000

Add a debugger field to CPURISCVState.  Add riscv_csrrw_debug function
to set it.  Disable mode checks when debugger field true.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  5 +++++
 target/riscv/csr.c | 34 ++++++++++++++++++++++++++--------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 743f02c..04a050e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -170,6 +170,9 @@ struct CPURISCVState {
 
     /* physical memory protection */
     pmp_table_t pmp_state;
+
+    /* True if in debugger mode.  */
+    bool debugger;
 #endif
 
     float_status fp_status;
@@ -292,6 +295,8 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
 int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
                 target_ulong new_value, target_ulong write_mask);
+int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                      target_ulong new_value, target_ulong write_mask);
 
 static inline void csr_write_helper(CPURISCVState *env, target_ulong val,
                                     int csrno)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5e7e7d1..de28a5d 100644
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
@@ -58,7 +58,7 @@ static int ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     target_ulong ctr_en = env->priv == PRV_U ? env->scounteren :
                           env->priv == PRV_S ? env->mcounteren : -1U;
-    if (!(ctr_en & (1 << (csrno & 31)))) {
+    if (!env->debugger && !(ctr_en & (1 << (csrno & 31)))) {
         return -1;
     }
 #endif
@@ -86,7 +86,7 @@ static int pmp(CPURISCVState *env, int csrno)
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -97,7 +97,7 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -109,7 +109,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -120,7 +120,7 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -132,7 +132,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
 #endif
@@ -144,7 +144,7 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!(env->mstatus & MSTATUS_FS)) {
+    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
         return -1;
     }
     env->mstatus |= MSTATUS_FS;
@@ -772,6 +772,24 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
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
2.7.4


