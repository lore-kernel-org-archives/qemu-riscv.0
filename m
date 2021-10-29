Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgTlW-000282-Dw
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlV-00022J-0h; Fri, 29 Oct 2021 11:25:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlT-0007Ud-9J; Fri, 29 Oct 2021 11:25:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id np13so7431757pjb.4;
 Fri, 29 Oct 2021 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j/0Bz9sC5LlRF86e2Ueb8TDuis/APgGgbCBEo842NeI=;
 b=SVw2Gozy3IYk+jU14Nae53QsqV2iPuDEK4GV/5y/dGOWASbU5wNHNlCnfjR8mDFjli
 gP/d9fayszTSf6LmruucKNoV3AvFvzbyENycZMrSf0onHQKo9/yagc9hcvNB7j47IXSc
 1eSsjXRKW4n5G6EoZ7vzftSIIP+ckp9ztQyYKX4fNemppP1j5+TPCEpWj3vAcv7sXlKo
 y0gp/oMnlbYpIJ2+BUPQInNrkO/6XTW/+MG1WuLSB/p+/DNoSkwh0AVUkgDpuVQlr3XZ
 QlNewdf7jUC1cY10+pnEWXUVT93uidOUSYo3JhFx6chtCpSBM/BEtuaphmTOj8nGGhnn
 Uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/0Bz9sC5LlRF86e2Ueb8TDuis/APgGgbCBEo842NeI=;
 b=B2T8DWoNrS6lnYU0Km/EXT2+yRPzerz5ABVr+qW6yXu8vWfolw9CXc9DOxfvYsuOBd
 zfVCvqFFCvMVnkA15hOPCeam8dJ6DJBpZA/lNNzYOrH7zLDqhFFA/X/7FKLtgQBPRGku
 iiyC690VSzwPJRg5uqGNuQR36d9aiizx4xeQqPgt1A+wvQbNrr324OcHT5m5fEnDjC8/
 +F/oUpKSE0xWcRvRw/vK0LQxA3oUG1/vWEXKHVRjoUp06bP9lxXQXee5eKfM2GMh7B3H
 /YnYxxHyx06+N8l9ZTblWG8ryOxFzXpIhEX0THKmV6SHW43iZqPG4JHZVunawO8dfDd5
 deIw==
X-Gm-Message-State: AOAM533W5E3Pt6gwVu1V9cjIhQCLsGpfD96dW2GCMVE78hauE9k1IqV5
 Gs3HbqOhcU/pz7mO99Rocp1O1gDsYWU=
X-Google-Smtp-Source: ABdhPJwy/rNNFqzk5fYGc5cZtjB+Dggi2xhxts073uW38CHyQzCnZ/Rj35Uww6YC2lDbXa9swFRNJw==
X-Received: by 2002:a17:902:654b:b0:13d:c967:9cbd with SMTP id
 d11-20020a170902654b00b0013dc9679cbdmr10394110pln.88.1635521153662; 
 Fri, 29 Oct 2021 08:25:53 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id q12sm6645790pfk.65.2021.10.29.08.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 08:25:53 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 4/5] target/riscv: csr: Hook debug CSR read/write
Date: Fri, 29 Oct 2021 23:25:34 +0800
Message-Id: <20211029152535.2055096-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029152535.2055096-1-bin.meng@windriver.com>
References: <20211029152535.2055096-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 15:25:57 -0000

This adds debug CSR read/write support to the RISC-V CSR RW table.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.c |  6 +++++
 target/riscv/csr.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3a2fa97098..45b054b294 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -563,6 +563,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
+#ifndef CONFIG_USER_ONLY
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        riscv_trigger_init(env);
+    }
+#endif
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e4d65fcd..baa55efc91 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -209,6 +209,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException debug(CPURISCVState *env, int csrno)
+{
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -1425,6 +1434,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_tselect(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = tselect_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_tselect(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    tselect_csr_write(env, val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_tdata(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    /* return 0 in tdata1 to end the trigger enumeration */
+    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
+        *val = 0;
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!tdata_available(env, csrno - CSR_TDATA1)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val = tdata_csr_read(env, csrno - CSR_TDATA1);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_tdata(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    if (!tdata_available(env, csrno - CSR_TDATA1)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    tdata_csr_write(env, csrno - CSR_TDATA1, val);
+    return RISCV_EXCP_NONE;
+}
+
 #endif
 
 /*
@@ -1659,6 +1710,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
+    /* Debug CSRs */
+    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
+    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
+    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
+    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
+
     /* Performance Counters */
     [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
     [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
-- 
2.25.1


