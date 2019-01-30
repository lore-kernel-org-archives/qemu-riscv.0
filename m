Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gog3n-0005DB-26
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 21:57:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gog3k-0005Ah-32
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gog3i-0002NC-68
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:57:03 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gog3h-0002F2-Tb
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:57:02 -0500
Received: by mail-pg1-x543.google.com with SMTP id j10so9703981pga.1
	for <qemu-riscv@nongnu.org>; Tue, 29 Jan 2019 18:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dyQp7WYIQoR/0pB4WTQ9+GYSyxD2vlBr4mIEE9Ut8xw=;
	b=gd9RbLyaLY5nQc4qg30ZFCsP88dupJ9wJL6IpaZr0exB55LI8JeqDpn2IpCWjTIhKT
	EvTRdQo8le3CvDqlsQXQKSq1RnVr6SpM1gqowxfDYbizWdLy/yj3i7M03WC6cLvxZnbL
	yivIHsngkWaNSzq531bLgh+L3JsgGfeyoEtoTHCeS0tKZkqP85SGF30F3nX00XyZXQwF
	FJTe091r/g6IZAWXBvAfMG9WqCfzhZzX4A1j0EquIC3kS2meszt1VK/GXRI19BxYNl2F
	UCSRjjgXLKZSTEF9AArnsg1c238pJj8qrf2PEMVAtl6lh4d+L3oTrjpAfDHHp25lYpoX
	h3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dyQp7WYIQoR/0pB4WTQ9+GYSyxD2vlBr4mIEE9Ut8xw=;
	b=eXpXYAqqFeOblnedOCXNxTpn2SOu6uWpE8y3ICHoPsLLJJrv4Z3hI5i7IK+MSWcdJX
	4NTcHoiZJrLcA4ak8cqCo85pU8pIJXpUdRtFuXMmvshUjpMQU6bd2UyIx7Iih2IHUTgy
	7SVz28KiimfdcNXIEqyehbLuOJsBwDrklfcmoKESF/zva0HEKR7JoTKES+ufpHoWj+iE
	Oy5SwC7fp1zdGb7bxgIliejF6QRKiryvJg5YxVpXgjiL1fvoQqBlN/xuuOX01lCuPkzP
	k2F2Dq9XtnxzoWKf+TsASHCkf4ac/FmDzKs5FbH8wZwZr5oIlwOCMhG9EY4NBPZlAGeO
	pwkA==
X-Gm-Message-State: AJcUukcgqJEpHHK334Qtca2aTGF4oT3AyTjDeXnapNiNHe/Q4OiIZaDf
	YGgDpGmQ4BtCzJkNn9exHgz4kwt4xQE=
X-Google-Smtp-Source: ALg8bN4LTJCI4y2hJOesfcrJcV5BdHDgGdeV9Kxe84ewwGnMoMI/843nBwvB8A4mgnW9micnHOguvQ==
X-Received: by 2002:a65:4784:: with SMTP id e4mr25506084pgs.12.1548817009557; 
	Tue, 29 Jan 2019 18:56:49 -0800 (PST)
Received: from rohan.sifive.com ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id
	k15sm208052pfb.147.2019.01.29.18.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 18:56:49 -0800 (PST)
From: Jim Wilson <jimw@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Jim Wilson <jimw@sifive.com>
Date: Tue, 29 Jan 2019 18:56:44 -0800
Message-Id: <20190130025644.12754-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH 4/5 v3] RISC-V: Add debug support for accessing
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
X-List-Received-Date: Wed, 30 Jan 2019 02:57:05 -0000

Adds a debugger field to CPURISCVState.  Disable mode checks in riscv_csrrw
when true.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 target/riscv/cpu.h |  3 +++
 target/riscv/csr.c | 16 ++++++++--------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 743f02c..faa46d0 100644
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
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5e7e7d1..04e6b59 100644
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
-- 
2.7.4


