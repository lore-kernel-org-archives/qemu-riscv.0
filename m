Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfNpl-0008Tx-4t
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 10:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mfNpj-0008Ry-5t; Tue, 26 Oct 2021 10:53:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1mfNph-0000sN-2h; Tue, 26 Oct 2021 10:53:46 -0400
Received: by mail-ed1-x535.google.com with SMTP id u13so15514624edy.10;
 Tue, 26 Oct 2021 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=177v4etZMss9oneq1N+W2XzjhuaA6Qejhhcy+fCvpko=;
 b=EllyFSgDarDv1ieQ1iZLcnbYmY1polhBKSy3dLvgyp76GwJ6G9E9WClym292qqj71T
 UJOp4FgC++h2GDjWsZf2LPTkJC5kzfwxFOspuDjy4yv+D4DnaN6GduADSZbY667cYEio
 YGSWXXY2hi9FbFJiUz9sM7EzW5T7HyKSpenwzmtQ1oGen8v1mVwMojlDAX2ImJKW6ec3
 BOPuPKn0GtRFwEnX84Z22QruD9nBBf1mt6+Pw/6+axcYl5OqScFdPc+cf+o2bR/P/RoO
 /HmoBBZcqFSJEc1F2mSfn4FaQkFar4voJn1z/lmNckktN4BmKx/TkyC+/dZkQClGBWWY
 xSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=177v4etZMss9oneq1N+W2XzjhuaA6Qejhhcy+fCvpko=;
 b=wbHqshxEPlyAWngAQ5OUK3uOLdI1GdVLYH78NpM2LeGWXGr8Q6E04UsQbrQIsJee2E
 ONntveJJk2Y15xb83Jgl1j4htV5hFOD8l+YKkCrMlX+o5aBDeV6CwHsGYQQnoWk6ob5V
 TGeb2ohrBiHTmsNXdg2wVAbcLZxscECOdG4Y75Tr6NHU9QPMmIfhNBKV8ey7P6tmBKcP
 DciBKTVKnhseVUcNmt4alHmE5LJWcTNgQ5YK7hxhoZfiXDz0FIAGlTykUr4TSbO1gEI/
 d2OajPPBmYIXSYBBYoBYWjeR8aK9rrzQWXRacSdGBORmXAMHu0okAvtR1YF1kYj+PYYs
 J/Tw==
X-Gm-Message-State: AOAM532YldJZRIRD/UB10ZfhtCZYXA/eCcGFWI3qs1c8QDzEWxU+41s1
 arrreyxT/QuofVfIuUpXRbLQiLUVBBy+Iy0R
X-Google-Smtp-Source: ABdhPJzdMrXYewh0z6znIcpGOA9VFZFYRUz9gSh8UhitROoiQxAgzRdYoCK8c8pEzWR+gh3lGqmyuw==
X-Received: by 2002:a05:6402:26c1:: with SMTP id
 x1mr15041585edd.395.1635259901406; 
 Tue, 26 Oct 2021 07:51:41 -0700 (PDT)
Received: from msi.. (bba177573.alshamil.net.ae. [217.165.4.27])
 by smtp.gmail.com with ESMTPSA id b19sm9182333ejc.107.2021.10.26.07.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:51:41 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v2 1/2] target/riscv: fix VS interrupts forwarding to HS
Date: Tue, 26 Oct 2021 15:51:25 +0100
Message-Id: <20211026145126.11025-2-josemartins90@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211026145126.11025-1-josemartins90@gmail.com>
References: <20211026145126.11025-1-josemartins90@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=josemartins90@gmail.com; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Tue, 26 Oct 2021 14:53:47 -0000

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
index 968cb8046f..55db004fea 100644
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
2.33.1


