Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRQRa-0007h3-7n
	for mharc-qemu-riscv@gnu.org; Tue, 30 Mar 2021 22:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lRQRX-0007e6-T6; Tue, 30 Mar 2021 22:18:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lRQRW-0004kG-D8; Tue, 30 Mar 2021 22:18:51 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b7so27708353ejv.1;
 Tue, 30 Mar 2021 19:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q44kQ6H/QJ3ONt0zZiwt63N3MoHJrKyZ/y+04+ZwvJM=;
 b=G0apw0MrhthdLyX5Y/XpFLDZIRtY8QNMLDkES376TwDUvXxfm4Hhe7yyPAyT1vnmxG
 eBSejJLCIOpieiEPgAEg67iXJxNXU1hoeaLDF3ZcBmxiaZG5r8oY7B+uxahPJaB4sdJy
 5re//SSOd7u+N7O+Xw4FWi9QtNR2qBYE99DfYNLC3uI/GvfyWYa5pvJ8Cs+OPtbDZoC5
 rSz5xcHg+Rd8SPrWrSNoOW580RXjrDfEZuzl4/DdGOIh5WL9cvffNYOVscWjWh+oDzD7
 Wp2vOqQTzmUxvsEwcuqYuVE6W/y+MSzKdbv71uFGGYD0MthMZ3fs8IhfJFlmONI8gigV
 k83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q44kQ6H/QJ3ONt0zZiwt63N3MoHJrKyZ/y+04+ZwvJM=;
 b=PlaqdKXwLFLkHoytl/MEPpmCArEvpY+tAN63i+Dz0J7MJVcQjGfik4Fw5pfj7i/x0n
 toLJXqn1IJbVkGv6Kp+aRzB6qlnfWVqr72LI+Cy5edolwh/aSfyOIcqGzawCgK290683
 LXQkzWMmGVi16/vQShVpXoAxUfp9oLhDaUD+hRVKS+XqnK5BPS5cKTXUuMuiEfTvqfPF
 MGu6ryAvkRUxpEeisBwtzPENYfAxPcfGBHcJVDBn8Hv88hBsMRqzZNjAWi6OEVCPyOYb
 W67b96/c20zk5MCdE24d9tKaQGDFiIkYa7Ylesg1dU0fSEMSpmidO5WinoJvDQfUUraL
 GtIQ==
X-Gm-Message-State: AOAM533Xe9rC6eNVK/SbDoHROAzdGCOUmRDIyvxdm8sWKejIdnL9SimZ
 2Upwd6ntaU/wl/U8x9aylg6qfQRXLYY=
X-Google-Smtp-Source: ABdhPJx1vTK8DIa2znDXNhCMSE4SCu3f9xRCsCmZsNn5SHMQGw70dKSgO5eaoE1NLQV5/p461f6rRQ==
X-Received: by 2002:a17:906:5689:: with SMTP id
 am9mr1076578ejc.298.1617157128757; 
 Tue, 30 Mar 2021 19:18:48 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id a26sm496211edm.15.2021.03.30.19.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 19:18:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/2] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
Date: Wed, 31 Mar 2021 10:18:25 +0800
Message-Id: <20210331021825.537484-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210331021825.537484-1-bmeng.cn@gmail.com>
References: <20210331021825.537484-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 02:18:52 -0000

The following check:

    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
        return -RISCV_EXCP_ILLEGAL_INST;
    }

is redundant in fflags/frm/fcsr read/write routines, as the check was
already done in fs().

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/csr.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2bad396f64..7c24318f75 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -193,11 +193,6 @@ static int pmp(CPURISCVState *env, int csrno)
 /* User Floating-Point CSRs */
 static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = riscv_cpu_get_fflags(env);
     return 0;
 }
@@ -205,9 +200,6 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
@@ -216,11 +208,6 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = env->frm;
     return 0;
 }
@@ -228,9 +215,6 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
@@ -239,11 +223,6 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-#endif
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
     if (vs(env, csrno) >= 0) {
@@ -256,9 +235,6 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
     env->mstatus |= MSTATUS_FS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-- 
2.25.1


