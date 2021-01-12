Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGEJ-0007lA-Lc
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEA-0007fj-Iu
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:39 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGE8-00007x-CR
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:44:38 -0500
Received: by mail-pj1-x102c.google.com with SMTP id y12so1264588pji.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rTUYJ57I+T88FoPrNwc3za/XkjTvEcN7a7OWqN6Yw/4=;
 b=G9kWNElbLk+4ZnEbLb0SK9HdJRlAJNwBsKcOvHj4iz+xd/Vc8zCHVJmu6id1JyT4Qi
 SDDsZTWOA4iR5VrLa2dDsbDhcsjrBqAerMbSUdVvXTXQFqkg472ooYrtb996QiQoGLBG
 DUpNtHtNaQ0iGoLbrfKlgvY5bKn9XmxqBSlYsMNM8GfAmAodAxXCcJTaBRzicPvT1UuJ
 WcEqqVL80b7WjjWY9XfVQqzExdtC//EBMlQQoYAI2UmRI6sMlZtwop50D7hgNq85fjZy
 VuJazs56EZDwnucmpMa0/+XLZWgF8Z1euf+Lv1A1bT8jCMccggnvZ0N8npYZDRYSgeLu
 Bo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rTUYJ57I+T88FoPrNwc3za/XkjTvEcN7a7OWqN6Yw/4=;
 b=ZkIYuEKaSXNffqXsq69prwEw6CzzHOgsySVsLcdAuL9vybTDChJxbhr+WrwoSv8zbi
 kD96u84BtLq/9MI9KdspB7o6j8fl+hiwHdq4Edzk/QyFExFy3rtCtFUJds+8dN2bxEsM
 OIIC/Sf3LJWmOgs4IIscSXEwkmHTZNw3W4/mIVaMYu3t1gwCrg0KZbFMP3CRHp61ECqk
 ifWp6yxCC/0+hfArWUJ/eUPjQHxac0hy5f9awE+9KyIRtH0xIdD4dQN1Q3jCIOZQ86IR
 89jyNt21/sMDYuCqtGAVTMBd4jbPk2ai9iHmv+PgpR6CU3QwRU1noLaTIfMvW9JJlBLK
 TBXQ==
X-Gm-Message-State: AOAM532pcpt+wuEmYocFIsbW5f4t2+kdHjV+GMHOSB2dBf459JQoluRB
 uPl4CMV9xuzdKU/MGP69EklBVA==
X-Google-Smtp-Source: ABdhPJyPPGQo7M3CFuJ2R8flALdCMtI1oUncOs91nOQL7Q3Xy0eXVHrt9ofruFBA7TrDbwQruQkSlA==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id
 r7mr3806991pjr.33.1610444675018; 
 Tue, 12 Jan 2021 01:44:35 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 67/72] target/riscv: rvv-1.0: set mstatus.SD bit when
 writing vector CSRs
Date: Tue, 12 Jan 2021 17:39:41 +0800
Message-Id: <20210112093950.17530-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:44:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 28c1ce7928a..176010674e8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -301,7 +301,7 @@ static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = val;
@@ -320,7 +320,7 @@ static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxsat = val;
@@ -339,7 +339,7 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     /*
@@ -362,7 +362,7 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
-- 
2.17.1


