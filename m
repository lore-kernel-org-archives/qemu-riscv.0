Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEY-0008BQ-8p
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEW-00087g-Pl
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:45:00 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGES-0000Fp-KP
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:45:00 -0500
Received: by mail-pf1-x42e.google.com with SMTP id w2so1048727pfc.13
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WWTMmoZUWlnaPxhtcISEFdijoQ81F6su0r3I6RoODMs=;
 b=Se3WKIn5O4o2zegzOjar5n4+EkcneC94w9WrZ6MWUjEhAaV0KXnLD4HSjBs/k5M/+e
 DVMQEInrKbl7XQZa0Cz4uMtd0GEkH+35p0oXhpgv2bD7aOvP7mCEdY+jArzpXwo4wqsu
 UbYnBO+8jUDBPPP2/gFuv3ac5tKQoXpu0+oAar7ehdJfdAxRPVF2wmvOTTmCCi0JpbTI
 m5PTb87wAz+PtV93Hhmst4QTxxy8qGFCcILTkylcCJhFFS5UjbJXHtQfJ4ua3hvk3l0O
 B6zy3OEeaVhIrohZ4rXagCHV8RXhbgF6Lj5ntQirxBJZLg8oWTEQEsMiKBIp6UNsG/UM
 9hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WWTMmoZUWlnaPxhtcISEFdijoQ81F6su0r3I6RoODMs=;
 b=eW27e82OwilQvwEvZEs8twO/ZTI2mElDeNDZcJu/wNIxQ9u5cD0IhnyoCc5XhPS3eM
 li2ICOSKYThRG/tzLCAChM4YR/t/TBaJPuh5TsgXqEqoj+ocDmBACc3XBNbKS6nUO4kq
 owynfWoR1FM9g6GRkrkYsGg3bhW88V3+qlhwb+oNofRdQXzDBJUaL2ml+cFI5OkBuu8X
 +Hbrd3BBm0ToUfpQ9eu8Rg1tVp/p+MjaKvR0WuINCRAUaMehaqmGasf93wzSp7ws3hsz
 mdiQDgenDgQ6CKJepkdDX/pRGqaFkBshF4ccE/X5ErZgbYxQFEi9dUWh3ypTyejrsd2t
 4pog==
X-Gm-Message-State: AOAM530vfU6unmvnY6t7WXz2G/QSdSiX5oqfiPGufh63+M8WTcuetGqW
 Ts54ovfH4ATrrcXQ6p58ION9ZA==
X-Google-Smtp-Source: ABdhPJyv1d5ewOb2P3sRQh9OAGvhbXfKWirTb82jIkK3jLkKjmgp6Pwn2bABqmOqZffsB0MYs8ec9w==
X-Received: by 2002:a62:e314:0:b029:19e:4cc:dc6f with SMTP id
 g20-20020a62e3140000b029019e04ccdc6fmr3780713pfh.33.1610444695468; 
 Tue, 12 Jan 2021 01:44:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 72/72] target/riscv: set mstatus.SD bit when writing fp CSRs
Date: Tue, 12 Jan 2021 17:39:46 +0800
Message-Id: <20210112093950.17530-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 12 Jan 2021 09:45:01 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 176010674e8..3baf5c2cf33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -217,7 +217,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return 0;
@@ -240,7 +240,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return 0;
@@ -264,7 +264,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
-- 
2.17.1


