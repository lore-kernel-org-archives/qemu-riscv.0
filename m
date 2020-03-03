Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlo-0004RC-WD
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkY-0001lW-W9
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkX-0004L5-W7
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:30 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkX-0004Kp-R1
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:29 -0500
Received: by mail-pl1-x631.google.com with SMTP id x17so497309plm.10
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=dPJ9PIVmXWg5PPkPFCD2Z/Ek444prHrmA3NLPOaiVyc=;
 b=nT/GxoRvW0mVjcPi8nNIMMS6rvMQF57vXDS1/vt6ITFUUpwiQPAyBy4JLA8TJKNPkX
 KzukUrwyLzpgB8d1Se03t7rPJYSVhgwnKTD4N8kKfLch4RW2sCRmM3CLAfHNsaQCsD+T
 g6fPqnnTKGLuaYCtE9RHoz54nJoa8jLhvdyOcDzmim21HKfgS/yxis3MqpP5iJAfz5dB
 VWJFczhC1yJAePMWoWEhJ4QC2J4AySb/xgU8MP3hFJNwalagNsHKqD5rcsWJ6IL2CRrE
 Icp9+uKu6tBp8SPkiXcgCefiWoyaktZhuTn6OCTPS2K5a0iUII4pAPuVi/gTpbvB7pwa
 hDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dPJ9PIVmXWg5PPkPFCD2Z/Ek444prHrmA3NLPOaiVyc=;
 b=OY7biD8NwCxYFcQah0lpdMLkdDUQZA8G5nIJmfSflie3KXioZOreh8Y2OC29/S1USW
 T5AkeaiiwEAwNhv+Rzo96X+c+nY+n+y5/bhRLT4+c7yG8O05eDJeQruj0KQd4YuD/QAn
 hBSWU/Azj0hFKAlnfNSGOcpFdMuIEZqWmSjhGjbJzfXOUyiLcXXAUxkSHVnms3oV9iSE
 6Vp4T4mZ/uph/NRDXYbjTc2Aqux9C9Fcn8BYhKWJkaKXpwgvxCGXPugfYwegHGb6ZRn7
 jJiTBUQ0vB1e5DEBFcM0it6pZgS3Tx2Le58hSGYmtP4fxUCVX3a6lrVgNFDcYhM1w8ft
 qruQ==
X-Gm-Message-State: ANhLgQ3X5w8dWjmu3HrFtGj+852cYSYHcCfTT571+F5sicjJQWX0od7O
 W8IJoU7wgtGCVB1DnNsgjW6zfySNbseGVw==
X-Google-Smtp-Source: ADFU+vsmG70ZPllkr7PucjKutAoAb3BKaC7mz4QLoDpdvrQIVvTNMMlECLHUD14e3I2PPHiid4Wsdw==
X-Received: by 2002:a17:902:ed14:: with SMTP id
 b20mr1727849pld.197.1583196568345; 
 Mon, 02 Mar 2020 16:49:28 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id x65sm9197758pfd.34.2020.03.02.16.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:27 -0800 (PST)
Subject: [PULL 18/38] target/riscv: Add support for virtual interrupt setting
Date: Mon,  2 Mar 2020 16:48:28 -0800
Message-Id: <20200303004848.136788-19-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::631
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:32 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9d5a06499f..ccf67aca05 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -37,13 +37,36 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
+    target_ulong irqs;
+
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong pending = env->mip & env->mie;
-    target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
-    target_ulong irqs = (pending & ~env->mideleg & -mie) |
-                        (pending &  env->mideleg & -sie);
+    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
+
+    target_ulong pending = env->mip & env->mie &
+                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    target_ulong vspending = (env->mip & env->mie &
+                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
+
+    target_ulong mie    = env->priv < PRV_M ||
+                          (env->priv == PRV_M && mstatus_mie);
+    target_ulong sie    = env->priv < PRV_S ||
+                          (env->priv == PRV_S && mstatus_sie);
+    target_ulong hs_sie = env->priv < PRV_S ||
+                          (env->priv == PRV_S && hs_mstatus_sie);
+
+    if (riscv_cpu_virt_enabled(env)) {
+        target_ulong pending_hs_irq = pending & -hs_sie;
+
+        if (pending_hs_irq) {
+            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
+            return ctz64(pending_hs_irq);
+        }
+
+        pending = vspending;
+    }
+
+    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
 
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
-- 
2.25.0.265.gbab2e86ba0-goog


