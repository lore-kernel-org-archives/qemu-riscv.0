Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgops-0007m1-Vk
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopi-0007Zq-J1; Sat, 30 Oct 2021 09:55:44 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopb-0000no-80; Sat, 30 Oct 2021 09:55:42 -0400
Received: by mail-pg1-x533.google.com with SMTP id q187so12728408pgq.2;
 Sat, 30 Oct 2021 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2w2rWkWQgxMSRivPeqxiHaIgdJq2xlXTxmXJwyRNbVU=;
 b=kBuqRk3pFhisJkoLYP3F7OO85R89QnfVoTkgnWAM7I7lV1EWUDkueC7mHfmrpWfHI8
 z6f6/VDv7vOUMW1B0YxCdyoP0eQ8aV3HmHBrEsv4o/J8ymJKzC96z86ef1/eXdPyZPi2
 6T+ZJyKx05wLEHCAH8wilccDuiLJBdR3C5KrmhFiF9cWpIuUo4TEe6F+8Vbl7oNOe4RW
 QduQPZv/MmnQPFW+RnllINM4AChLQbj/gLTlunW5ExwhaMm8n/MqzIi5FNvTwAPNWCNY
 rW+tqoBKr8Bc34Th9CcwWiQtAEu5OuJn1mbNqVRMMCPJjWNReK4n5ythtkfdgTlnl9p8
 1iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2w2rWkWQgxMSRivPeqxiHaIgdJq2xlXTxmXJwyRNbVU=;
 b=SzKKTXmbICM05sHGRZnuLlBNcKJr0jo27KrQftF7NFyt/MCPS7fc+DdaSdBKzCmMGU
 ZpyvjHy6amGb+719GXseS4944zYNS/lgd/XL+URmXFEsNeF+APFpbox3ZIlfTvKiZ9Os
 TFeG2aOWuCFfdHRnwIsREE6uGeba9uGZYx0kphonwcA6IH02sv+5jhu1zWLhxb49DovM
 nSSIQvoywSOqHqszKhZlUOm5uXyIGqdHbIHN3umL/JzZpyXUamDjcp/jQWDI9fU77NJG
 1fgYROM7RQQe9BZoHJC97I8ohAvLu5q+nSnR3u8UDSps4Y+GWVBsqJMBtfMgVPqjHhx3
 uHNg==
X-Gm-Message-State: AOAM531gYrMYmgu8x9h93L8chBt7/C85jQiwR4D3cfuGywkrhKZxJQ6U
 miSJ4p5kSwY5C+hWn23rv8cj9lNJQBk=
X-Google-Smtp-Source: ABdhPJxVGzpx/3p5ghsCFzUzFkQlDr0omFRCR2hBdBm1b0KSzY/Hn9hJqw8Q2oPbCK3c1ww6/oM6Jg==
X-Received: by 2002:a63:a801:: with SMTP id o1mr13023992pgf.23.1635602133660; 
 Sat, 30 Oct 2021 06:55:33 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/7] target/riscv: csr: Hook debug CSR read/write
Date: Sat, 30 Oct 2021 21:55:11 +0800
Message-Id: <20211030135513.18517-6-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 30 Oct 2021 13:55:47 -0000

This adds debug CSR read/write support to the RISC-V CSR RW table.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 target/riscv/cpu.c |  6 +++++
 target/riscv/csr.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 84116768ce..6f69ef4f50 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -575,6 +575,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
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
index 9f41954894..dc47ec8d3b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -219,6 +219,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
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
@@ -1435,6 +1444,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
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
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -1931,6 +1982,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
+    /* Debug CSRs */
+    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
+    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
+    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
+    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
+
     /* User Pointer Masking */
     [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
     [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
-- 
2.25.1


