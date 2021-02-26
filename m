Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTlD-0003rZ-Hn
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlA-0003oY-74
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:45 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTl8-0003BD-JI
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:25:43 -0500
Received: by mail-pf1-x429.google.com with SMTP id j12so5303138pfj.12
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bJ+S3ap95F74JbPgQCZTsjNjQ93ImQ1CF2ZRHxOkewg=;
 b=WgebFkyjNSa44QBKNnBTJVzUjLoiq2wxVA31M9X9uvkJQeaMmy7wL7DJsEUfYtNeHr
 jFAGoCeZQnFbK4mOLsyDi+b4c8Nc7g7eZKVCRt4unp+MzHrpVWqkcEg3Oue+z9Z9Ek/c
 gzvohOYX0pnti20PrD+7dPsj0yr7xIoLC5anovugvwdN1gYA6tAIHntpkY4hnZeLsSz7
 oEgZyl3LKio7BOXtGmkYmeA431IRiayf8uSLUYPZkWoV5mrk3IpZZ0bRhkyz8gLLjRw4
 MKAz1fgSotrbV/yM5x4wfK/bB5Y5xX9ZmpO5EPk5NkAYWHI7p/7LZbM8UKKiyBXUwOCH
 Qb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bJ+S3ap95F74JbPgQCZTsjNjQ93ImQ1CF2ZRHxOkewg=;
 b=dbOUhDnfWLwP3oyp6LcHrK5B+VTLjb9ZO5XEhd635/yB34tZJz1RWNt5PXijipQoc7
 TYYif9QKNnysgmQLrDkhO0E7zTxnhdVq1MMSc4k8z78hH0qY15RYGQixqOp2WARfeNWH
 N32YRvlslERQZqu8rTi91mxuN054ia2gbE4JossD5Wpl50RlJtZw3kdQbGpadqp8EepY
 HkI/wZr9LHx+kyGQWmotN8OhI1fvFrtVE5AlLdz/aG/JOra1c5XaaXMXmeXLiACeF3LF
 j2l3yWhjd2dfrO4v+x9ItWOw3grAI0Nw0PpN/0FcxDNDDpWNxgIjJo9Q/yXQF97OBvjQ
 WKXw==
X-Gm-Message-State: AOAM532re/x0ffJjm81cznGr7JUTuu2J5+UVi8MfoFshl28CHNAsASGj
 ZpFfG7PqC5xSuNILejk19xM0aCCKMX4pUg==
X-Google-Smtp-Source: ABdhPJzCpvueHqcp1IJB38FFtyAchRYg/TcwpZpR48ofS/xbEJzWiyE/xJBQjtz66a6bUEBRy9xYJw==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr1064508pgp.68.1614309941436;
 Thu, 25 Feb 2021 19:25:41 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 71/75] target/riscv: set mstatus.SD bit when writing fp CSRs
Date: Fri, 26 Feb 2021 11:18:55 +0800
Message-Id: <20210226031902.23656-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:25:46 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e0f1106d909..0082db9cc0c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -209,7 +209,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return 0;
@@ -232,7 +232,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return 0;
@@ -256,7 +256,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
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


