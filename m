Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ0SS-0007nr-9r
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 01:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0S0-0007XR-7Y
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:30:33 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ry-0000mF-Ao
 for qemu-riscv@nongnu.org; Thu, 09 Feb 2023 01:30:31 -0500
Received: by mail-pf1-x432.google.com with SMTP id t17so722082pfj.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Feb 2023 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slc2qEJKHDUPCqJbT+o4fG/GNXtlIN4HHpf/pKqJaTw=;
 b=FpWYYk/+rObx8lj8TiUpzTGreHoqDxf0meG0ATcWaJEIBQyKv4sfm/s8Yhiotq4tZw
 V/XWiUCLWMfyv++0IrQxElMBNBWWhGlPWkS94HuLnoTE1YYFxx6EZfUAnWIX2M0/yBwm
 L0DGybx/GMc8JKTIey1tmlqXisSRqHFLw6jHSJO3pTDIy0QDd8WSVwxw8TXQaukURNh7
 0nmYyfW8LAUgbrqfHeLrg/Rsi+WglTE3kUFMFAsLJzKxaMHCpcEEsyIMZGQwv+Y4Zb80
 da9cnRWbIWYsYhGCOSfHbZgBgUl7TQ+LIuo/lhy8tc771Sv3gRRZhJjRfzyCmh22UIfL
 EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slc2qEJKHDUPCqJbT+o4fG/GNXtlIN4HHpf/pKqJaTw=;
 b=5jsmHiO0aWgzYTYEJsSf3j/0jp5XbVFE9iw1J2UkE/f97+MTmB4AcvHzJFfO+7f4yu
 hkMCc6P+cEKM3yJTUiKhWSOkte0vqvMUvQKA6QqyNJsn2XEFVxgt6m2RL99UrPuSsXz/
 lAB0/Zyyc/SpLgEv99B5ICz0+MQib3p0YDreReCvGmATg/Kb5r8opv//Ip355lVw7lSc
 PcGDMo4J7q42txdvp6c8b9DQGo4jQYJ1zogzZtcwCs2Ho0W4s9WZeAVVQKr+IY/d+Rl0
 la70Kzf6T2y1YLLxWgm6qWxaKZbyDK46I4Ox+HLw3G745YPiVTKj14oFKyYD97qGsMvv
 MuEg==
X-Gm-Message-State: AO0yUKWQcxIz5pPXoBErZKsceD1ybl0bs8cZ4+LzMQ9OCrUfkp2AXrUg
 rp2C3Iv4fWxRpsLEqrdThXNEQA==
X-Google-Smtp-Source: AK7set/A7D+BkYZDhyi+L9nqEefqaNyFJWmscGPQA23xnsPgoqPtMaybiQ2AyGA3/EF5GJdiM1hasw==
X-Received: by 2002:a62:520a:0:b0:5a8:44b1:7396 with SMTP id
 g10-20020a62520a000000b005a844b17396mr4414023pfb.15.1675924227118; 
 Wed, 08 Feb 2023 22:30:27 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:26 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 4/9] target/riscv: helper functions for
 forward and backward cfi
Date: Wed,  8 Feb 2023 22:29:42 -0800
Message-Id: <20230209062947.3585481-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062947.3585481-1-debug@rivosinc.com>
References: <20230209062947.3585481-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2023 06:30:34 -0000

Implementation for forward cfi and backward cfi needs helper function
to determine if currently fcfi and bcfi are enabled. Enable depends on
privilege mode and settings in sstatus/menvcfg/henvcfg/mseccfg CSRs.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 18db61a06a..d14ea4f91d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -568,6 +568,8 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
+bool cpu_get_fcfien(CPURISCVState *env);
+bool cpu_get_bcfien(CPURISCVState *env);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a28816521..a397023840 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -30,6 +30,7 @@
 #include "sysemu/cpu-timers.h"
 #include "cpu_bits.h"
 #include "debug.h"
+#include "pmp.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -40,6 +41,56 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+bool cpu_get_fcfien(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* no cfi extension, return false */
+    if (!env_archcpu(env)->cfg.ext_cfi) {
+        return false;
+    }
+
+    switch (env->priv) {
+    case PRV_U:
+        return (env->mstatus & MSTATUS_UFCFIEN) ? true : false;
+    case PRV_S:
+        return (env->menvcfg & MENVCFG_SFCFIEN) ? true : false;
+    case PRV_M:
+        return (env->mseccfg & MSECCFG_MFCFIEN) ? true : false;
+    default:
+        g_assert_not_reached();
+    }
+#endif
+}
+
+bool cpu_get_bcfien(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* no cfi extension, return false */
+    if (!env_archcpu(env)->cfg.ext_cfi) {
+        return false;
+    }
+
+    switch (env->priv) {
+    case PRV_U:
+        return (env->mstatus & MSTATUS_UBCFIEN) ? true : false;
+
+        /*
+         * no gating for back cfi in M/S mode. back cfi is always on for
+         * M/S mode
+         */
+    case PRV_S:
+    case PRV_M:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-- 
2.25.1


