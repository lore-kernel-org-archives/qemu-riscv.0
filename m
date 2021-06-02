Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1loWHe-0000g6-IN
	for mharc-qemu-riscv@gnu.org; Wed, 02 Jun 2021 15:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1loWHZ-0000cy-ON; Wed, 02 Jun 2021 15:12:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1loWHT-0001tw-KP; Wed, 02 Jun 2021 15:12:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id j14so3371109wrq.5;
 Wed, 02 Jun 2021 12:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAa/+EzoUulBLTSh6AZhoZXdy3/J+ZdK8xOisZ5wF38=;
 b=eduxVdH0ycvHmAD1tQ8qOjrw2LaGPNA5dLZypIkLfopXTzvciKGDdRJWcChUO6M1pi
 NqzZMBWmab8wXG7MyHKvmkNXV0MoH0Z860Zqb7Hgj1sREEODY3szSIfQ28a14xFBUTP5
 kc8WQMvmyWUlMssa4+5Tu/HUfh7RigUHTChpBDFbm0iIGNAn00+rAbIpYdX77jjPmBYH
 fe+lckw9S+WN0XRStdlKIn3xPn4uL6gCWBilArn32rHB0GVAm/2n7/h/MsMh+Fbiihps
 535GOFrYmRVH1qgr2jCPeCwi0PdEqRufQulv8tFuw//EJpQDskXESocFC15nRuUPYhQf
 +zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAa/+EzoUulBLTSh6AZhoZXdy3/J+ZdK8xOisZ5wF38=;
 b=iP3cjp2RbF1BS5VGjJlFkqhrZonyh2mN+B9HoCIsH/tbg3E8sAsP+LxkUyqwCQoOso
 uV4iDrk8WdnoajXxOM4OWm/Ixm4H5vDKgrGt42yd7CkdGSqCBKuEWUforejPmJaarFkG
 Se956Rsitm9/uoeUx7PEptFncRbhBXbH3NpO4oK7gYREXautuidBzfzyt7LnoN9dI2J/
 gbxkyZMLmpuHEQ7/JOdqzo5oUMIjSJkBpJg7wfnfhvj9W9VVJmO+p15hM0gdV4NG/KeL
 r7VpKmFrdyqyqKqc+4sGzFSFszYHJqQwyrlSbRlBeYSVzl1o5x3hocVpLP1x6312/3r4
 6WxA==
X-Gm-Message-State: AOAM531jCHTSgulYN6925REg+RjvNMhoXuoye+mYqZA4vXY4McOfntPP
 PUTvUNz3Zn2R12hz8BPXJXgaI5adSJMZlQOw
X-Google-Smtp-Source: ABdhPJyMcBMAfPlTres+M9qVjVp0CUy01HtaHMOLH4qCs2kjwQxEMDHlj2wYvyKtb2OFQMDOkAr4SA==
X-Received: by 2002:a5d:4531:: with SMTP id j17mr7770239wra.303.1622661113899; 
 Wed, 02 Jun 2021 12:11:53 -0700 (PDT)
Received: from asus.. ([83.144.170.28])
 by smtp.gmail.com with ESMTPSA id n2sm635304wmb.32.2021.06.02.12.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:11:53 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 1/2] target/riscv: fix VS interrupts forwarding to HS
Date: Wed,  2 Jun 2021 20:11:24 +0100
Message-Id: <20210602191125.525742-2-josemartins90@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602191125.525742-1-josemartins90@gmail.com>
References: <20210602191125.525742-1-josemartins90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=josemartins90@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 02 Jun 2021 19:12:03 -0000

VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
not delegated in hideleg (which was not being taken into account). This
was mainly because hs level sie was not always considered enabled when
it should. The spec states that "Interrupts for higher-privilege modes,
y>x, are always globally enabled regardless of the setting of the global
yIE bit for the higher-privilege mode." and also "For purposes of
interrupt global enables, HS-mode is considered more privileged than
VS-mode, and VS-mode is considered more privileged than VU-mode". Also,
vs-level interrupts were not being taken into account unless V=1, but
should be unless delegated.

Finally, there is no need for a special case for to handle vs interrupts
as the current privilege level, the state of the global ie and of the
delegation registers should be enough to route all interrupts to the
appropriate privilege level in riscv_cpu_do_interrupt.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
---
 target/riscv/cpu_helper.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..592d4642be 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,36 +38,24 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-    target_ulong irqs;
+    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
 
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
 
-    target_ulong pending = env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
+    target_ulong pending = env->mip & env->mie;
 
     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
     target_ulong sie    = env->priv < PRV_S ||
                           (env->priv == PRV_S && mstatus_sie);
-    target_ulong hs_sie = env->priv < PRV_S ||
-                          (env->priv == PRV_S && hs_mstatus_sie);
+    target_ulong hsie   = virt_enabled || sie;
+    target_ulong vsie   = virt_enabled && sie;
 
-    if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq = pending & -hs_sie;
-
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
-        }
-
-        pending = vspending;
-    }
-
-    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
+    target_ulong irqs =
+            (pending & ~env->mideleg & -mie) |
+            (pending &  env->mideleg & ~env->hideleg & -hsie) |
+            (pending &  env->mideleg &  env->hideleg & -vsie);
 
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
-- 
2.30.2


