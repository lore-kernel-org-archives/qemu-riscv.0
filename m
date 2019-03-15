Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4meP-0004FQ-1S
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 09:13:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4meL-0004Ch-Nt
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chihmin.chao@sifive.com>) id 1h4meK-0005VZ-0g
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:13:25 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
	id 1h4meJ-0005V5-Oy
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 09:13:23 -0400
Received: by mail-pg1-x542.google.com with SMTP id q206so6461125pgq.4
	for <qemu-riscv@nongnu.org>; Fri, 15 Mar 2019 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p6d0GA99LAXC7XnfUodoVRLVgpyVio+21sLk2vfOc6Q=;
	b=ivWugT+YFCE28S+caPx7XlCIH4qc/vIvfJBuJ7vYnqtam+hSY/FZciHa72+xOOuEk0
	BmpcmRxMWDOa+28PaLXb/975Ddd4cyK/PrzboxFu7IksWAxSRhQDJhwYpsTqRYnRLLT2
	RDDdd8ccOawCi2zCjb3EmXLb5BixCzZWwdB3cQZ9hOYpSu6ItMOlABt0TbE/R2xWlZEy
	tFlyRrU/6b9GF+vLy402x0fv9hpFdjUAEgdRWX7vPp11ymxWdu7y+8IYhGbh7sKJoJMe
	Iiss1pG5BnfXD/HtAbH5OlwMvvz17qId8abgDyqpiALOCOaEMV+urSkwi9fQX4XDXXTk
	BQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p6d0GA99LAXC7XnfUodoVRLVgpyVio+21sLk2vfOc6Q=;
	b=rW9BCQ0U6CvX8z9ldJWVr7xV1478HXMcN1YqmqfmfwaPhB+LYjPsyAS5lxZP593A9Y
	nslxGDx3dHukDUW48s91Z4aqDiYE7CurdAbJN79C7GggksepN7w66+wS6Go6XtCLVYAA
	hFZn2j6UKEWbvBwY5tbxcSFpsLi4REnCycKhyKS1qQNiv6jfrABE+E4IknTQKIHF/OTX
	/9kFFLhNVavKe6FCVQdDnXh6SOW89rHAz4jTM5Yxi7wAODVahNHTFPmM4DxjnTKgZBEr
	rqcLXQ/4y5mzCAV8/gQy5hRM9c9mERlbXGkRUaxZ1rOKZAaZ4tVkwmnuMDQbDAuDcsI5
	3tug==
X-Gm-Message-State: APjAAAV6459sqASmofgwI5Ctb6InZpLfC0Aza0RyiU2C6M8to3r5ONgU
	H9vrKVZJ24gfSffvZKtzEXIpyg==
X-Google-Smtp-Source: APXvYqxLBjZvuOLM8RaMTpffZnQPZqYqAUkbRR2DDw2Bi++MkQtJRLOJYWubuUoxJGYt9I6IhdE3ig==
X-Received: by 2002:a63:fe0d:: with SMTP id p13mr2589493pgh.366.1552645668877; 
	Fri, 15 Mar 2019 03:27:48 -0700 (PDT)
Received: from gamma06.internal.sifive.com ([64.62.193.194])
	by smtp.gmail.com with ESMTPSA id
	f15sm2225401pfa.11.2019.03.15.03.27.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:27:48 -0700 (PDT)
From: Chih-Min Chao <chihmin.chao@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Wilson <jimw@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Fri, 15 Mar 2019 03:26:58 -0700
Message-Id: <1552645619-18244-5-git-send-email-chihmin.chao@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
References: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH v5 4/5] RISC-V: Add debug support for accessing
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
X-List-Received-Date: Fri, 15 Mar 2019 13:13:28 -0000

From: Jim Wilson <jimw@sifive.com>

Add a debugger field to CPURISCVState.  Add riscv_csrrw_debug function
to set it.  Disable mode checks when debugger field true.

Signed-off-by: Jim Wilson <jimw@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20190212230903.9215-1-jimw@sifive.com>
---
 target/riscv/cpu.h |  5 +++++
 target/riscv/csr.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c2aebf..4c5de30 100644
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
index 960d2b0..9a40b4c 100644
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
2.7.4


