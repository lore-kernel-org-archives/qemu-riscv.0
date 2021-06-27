Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxTYV-00082n-Dp
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 08:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxTYS-00080n-Ki; Sun, 27 Jun 2021 08:06:28 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lxTYL-0005Ng-6u; Sun, 27 Jun 2021 08:06:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b3so7282109plg.2;
 Sun, 27 Jun 2021 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1u2KBbBAA4PT8ZafOziQE+RSiotw/lRxlnWRgjzLvY=;
 b=HG2q2CN0dN5wnpBsmBat8eO4aNFU/b+ks25BLUfUQ6ppkXpZDplsMonQ8aVwHDK8/d
 eQ0ANB1ubvLYNPU1dL0f72+8hm2EdD0fn/dTVgOix6EoMLGHIUqWkOl5zshUqmj4ncNO
 DhM5S9hvA3NwyAodfi6mI+sCmSGvwTbpFF5NJiems+wcteGW7lpc8m+no4Bsz6yrZqmu
 qltNp6OBQrp6+WNFdkge/Q19rpvcJvXU1w0PtJuJGa149bR8NlfU/78hiMA/w7oQVBa1
 IW5a8vJOi8Ji0u3rPBzDnMw6uBjbT9nFzW7kqSkld1NGLXJQBf9/ZupZxphUjvyol2zR
 3WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1u2KBbBAA4PT8ZafOziQE+RSiotw/lRxlnWRgjzLvY=;
 b=UFUllQTb0ghJcAs1dDDdkzhDtug8MnJmviO3BByxU6m4JcbBTaRUoJR3novdBxu4sS
 B82TWIsK36GgrsYC6w7WJM5tsXVQPYQlpKR4aCcyZXSxjI2dA2ktsefzuasZ9AzGupJV
 hEmTfU1ro1gwz7vF3kSNKCXB6owiDgy0sZDEaQgOA11KCeUTuTvIPAQQIwj+QNltaxiD
 7ym/yw1P7ZcMvOG2A1FXufh6QNOXTZdT0aKs/I1jFy2WZsgjYpBZMvfQeKaSVN8dz8c9
 nEqYrk0ERT7547LTCTwx0y+RSlDr/e/vT6CAZhBocv3uCpn3ERpuqI9CBFZ1ngrWvmOG
 vFAQ==
X-Gm-Message-State: AOAM530j8sh/BPpq4ZWQXWzxvdwcKuA3FpPf9HsgpauszK9DCpTzaiBI
 EK87xowMwlGiond2Hzl16tg=
X-Google-Smtp-Source: ABdhPJwQnkx+oXDxwPhRs7WrLt+u6/6gggfgTMY/7p9DAWP9UXSKD2JaD1WDWiAkTconsp7+nG5xWw==
X-Received: by 2002:a17:903:1c1:b029:125:b183:7989 with SMTP id
 e1-20020a17090301c1b0290125b1837989mr17194066plh.57.1624795571923; 
 Sun, 27 Jun 2021 05:06:11 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id g11sm11098589pgj.3.2021.06.27.05.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 05:06:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
Date: Sun, 27 Jun 2021 20:06:04 +0800
Message-Id: <20210627120604.11116-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 27 Jun 2021 12:06:29 -0000

The following check:

    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
        return -RISCV_EXCP_ILLEGAL_INST;
    }

is redundant in fflags/frm/fcsr read/write routines, as the check was
already done in fs().

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- rebase on qemu/master

 target/riscv/csr.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fe5628fea6..62b968326c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -215,11 +215,6 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 static RISCVException read_fflags(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = riscv_cpu_get_fflags(env);
     return RISCV_EXCP_NONE;
 }
@@ -228,9 +223,6 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
@@ -240,11 +232,6 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
 static RISCVException read_frm(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = env->frm;
     return RISCV_EXCP_NONE;
 }
@@ -253,9 +240,6 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
@@ -265,11 +249,6 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
 static RISCVException read_fcsr(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
     if (vs(env, csrno) >= 0) {
@@ -283,9 +262,6 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-- 
2.25.1


