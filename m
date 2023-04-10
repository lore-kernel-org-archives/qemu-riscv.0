Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plqtq-00065L-35
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 08:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1plqtm-00063t-83; Mon, 10 Apr 2023 08:45:30 -0400
Received: from forward201b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d201])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1plqtj-0004Eo-Gu; Mon, 10 Apr 2023 08:45:29 -0400
Received: from mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:2e14:0:640:2cd1:0])
 by forward201b.mail.yandex.net (Yandex) with ESMTP id BB0AB46CFF;
 Mon, 10 Apr 2023 15:45:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id GjTsr15WxCg0-4kWX4wq7; 
 Mon, 10 Apr 2023 15:45:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail;
 t=1681130720; bh=ws8UZbWZ43H9WIfvrwofpDwLMb//4wQVSXRDrM+/i28=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=wbzrNoiQjGBTEVnodvdVLW36GiMCQ4JzzmkC5IuIymvTZEPq1NB7UjBjQBXuBIAzM
 0ItCkMoHrqlE4/XHs0b8w4zhGdwRti+J6f2qcexwz6ajFy0jeO341MX5STD75oNNIe
 HaZN8y/DNzAlQloYb86vg1ve9w1CIbINiV37FDxU=
Authentication-Results: mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net;
 dkim=pass header.i=@syntacore.com
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v3 1/2] util/log: Add vector registers to log
Date: Mon, 10 Apr 2023 15:44:50 +0300
Message-Id: <20230410124451.15929-2-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410124451.15929-1-ivan.klokov@syntacore.com>
References: <20230410124451.15929-1-ivan.klokov@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:d201;
 envelope-from=ivan.klokov@syntacore.com; helo=forward201b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 10 Apr 2023 12:45:31 -0000

Added QEMU option 'vpu' to log vector extension registers such as gpr\fpu.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 accel/tcg/cpu-exec.c  | 3 +++
 include/hw/core/cpu.h | 2 ++
 include/qemu/log.h    | 1 +
 util/log.c            | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..0dca69fccb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -319,6 +319,9 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
+                if (qemu_loglevel_mask(CPU_LOG_TB_VPU)) {
+                    flags |= CPU_DUMP_VPU;
+                }
                 cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 75689bff02..7c9d25ff45 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -545,11 +545,13 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
  * @CPU_DUMP_CODE:
  * @CPU_DUMP_FPU: dump FPU register state, not just integer
  * @CPU_DUMP_CCOP: dump info about TCG QEMU's condition code optimization state
+ * @CPU_DUMP_VPU: dump VPU registers
  */
 enum CPUDumpFlags {
     CPU_DUMP_CODE = 0x00010000,
     CPU_DUMP_FPU  = 0x00020000,
     CPU_DUMP_CCOP = 0x00040000,
+    CPU_DUMP_VPU  = 0x00080000,
 };
 
 /**
diff --git a/include/qemu/log.h b/include/qemu/log.h
index c5643d8dd5..df59bfabcd 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -35,6 +35,7 @@ bool qemu_log_separate(void);
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 #define LOG_PER_THREAD     (1 << 20)
+#define CPU_LOG_TB_VPU     (1 << 21)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index 7837ff9917..93dccee7b8 100644
--- a/util/log.c
+++ b/util/log.c
@@ -495,6 +495,8 @@ const QEMULogItem qemu_log_items[] = {
       "log every user-mode syscall, its input, and its result" },
     { LOG_PER_THREAD, "tid",
       "open a separate log file per thread; filename must contain '%d'" },
+    { CPU_LOG_TB_VPU, "vpu",
+      "include VPU registers in the 'cpu' logging" },
     { 0, NULL, NULL },
 };
 
-- 
2.34.1


