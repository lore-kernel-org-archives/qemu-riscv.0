Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzBfM-00012L-PV
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 23:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzBfF-0000zn-CX; Mon, 11 Jan 2021 23:52:18 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:44038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzBfC-0001iH-Qg; Mon, 11 Jan 2021 23:52:17 -0500
Received: by mail-qv1-xf35.google.com with SMTP id d11so408083qvo.11;
 Mon, 11 Jan 2021 20:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u8DEazBQHMt8t61oENXWf0bQTSKivVZaKe9kaYJ0ezY=;
 b=tL/hMN3EClj+1ynhfLMvUcQtPIH8RFAu89O6h6746UP4u/kehK4JVE+wV3+cUrUlZP
 FsRDl7ehXms5hi1ihSMIo7uvT+XcOCA7WKOQfz7unH9/FXcqacwv9PZ/1DyMJpjKgvRi
 NKgmD6jacMd808Wwbbu0MHJBQfWh7n+B2s2rgnelS5GHAzo6P6c+FUFx6UwjJsyxayXe
 bLr+w3fj1DdCBP1++X2neMfCWbaqA6pXEnQj8+o3zb3HIJzsvXotLDUecLD7lQ1OvMQD
 FTpCMpZzJCYt1HfJRRhg/OPPlTsjI5xY/aWOmFpn4g9VKjqm/wDbNUxo81HhYrfI0qIk
 gWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u8DEazBQHMt8t61oENXWf0bQTSKivVZaKe9kaYJ0ezY=;
 b=CAlnwGTnZBWw0+QJiJ7xhPgNe2MPQyzyR4FBrcHkvwkBfihqoyej/AYQYieSvDQVVs
 tgK98Bj4YfGzn0vfirLFGhHQPyFuFSIqXi3wxDCKkJ9NEYh0oeAvFm59guzffXK2+hq+
 PEONYdHIAjAUyAvI8b1WIM+mH22TGajzbBR2rzHQRJguXhUVVZPTgqUtKxlCzrrRR6Ip
 nqfFXWZ8/K7ut/1bpVRUq8BLSIR0Z8QN7arpmPBjtX5WVfyQaTN10e71we7mOcS52zvF
 DYfFLW65UziZ+0GbODghjmy/1Kd1GTTFETt5hUeqNjG2QuOQMyuyHq6MM36kJfJmIo/w
 xjvg==
X-Gm-Message-State: AOAM532Ii1w+J9Lq3kAo3gYfWRsIZ1Nv5f8uSNVcgO8AssMMH8dnhCve
 hOnPKrm3PMluQYpVycIWGiY=
X-Google-Smtp-Source: ABdhPJx4yAKYQpSPWLPPYhjO8zNqc+Z7vNl/FaN2R/S1tG+/nAIfoBWQw4Enpy0NtMX5UlUAwA7L0Q==
X-Received: by 2002:a05:6214:13a3:: with SMTP id
 h3mr2943759qvz.5.1610427133647; 
 Mon, 11 Jan 2021 20:52:13 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id b67sm863814qkc.44.2021.01.11.20.52.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 20:52:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/4] target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
Date: Tue, 12 Jan 2021 12:52:01 +0800
Message-Id: <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf35.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 04:52:20 -0000

From: Bin Meng <bin.meng@windriver.com>

In preparation to generate the CSR register list for GDB stub
dynamically, change csr_ops[] to non-static so that it can be
referenced externally.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/cpu.h |  8 ++++++++
 target/riscv/csr.c | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2649949..6f9e1cc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -482,6 +482,14 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+/* CSR function table constants */
+enum {
+    CSR_TABLE_SIZE = 0x1000
+};
+
+/* CSR function table */
+extern riscv_csr_operations csr_ops[];
+
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ab82e..507e8ee 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,14 +23,6 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 
-/* CSR function table */
-static riscv_csr_operations csr_ops[];
-
-/* CSR function table constants */
-enum {
-    CSR_TABLE_SIZE = 0x1000
-};
-
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
 {
@@ -1378,7 +1370,7 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
 }
 
 /* Control and Status Register function table */
-static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
+riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
     [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
     [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
-- 
2.7.4


