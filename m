Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPTD-0007HW-CO
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSk-00076Y-W3
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:11 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSj-0002P3-8B
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:10 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so14986227wrv.7
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HHWLUiZToI0AX70Am5kjHM8u39NwJHXGmBjJ+SWShc=;
 b=aBGdg5z9s2o7pISwSLh3a67th55mbtYgwwzrIOycWHSDLm1/7LFkJcQWSaJ7eUX+f1
 0hkd9zaAxorUuWbwbbl4e6UkX6nO64GYwpxbbvWcZRuDKv6wQ1eGfvrLyiLqaLL1HxVU
 unShW5XAUEOF+soOdOjS9Cr3lvC+jQtuJIuC88zi+O7pOgVqo+USBIT/BxqtJTWaqpfc
 5Yx79j/ngavSTytb+X3CgevG6lpiFEvaGbJipwwS6sUSq6FMv/Un95G0sTgNeR41smBT
 dg/UigZMCm3Tonlgz8ceLLWE4Cae6aa4x1OgoajgWJUui2WZlJgozyj8Br82Wq4gjduM
 j/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HHWLUiZToI0AX70Am5kjHM8u39NwJHXGmBjJ+SWShc=;
 b=lFdhLoOyOz+lWHqXDB3h+ySweLhAryrrV1WDHhnPORR4IAaO5He76agr/BwxW9zbrG
 OVoHt3RLvFY3lWkxmuenX8AypaZe2aoFNeVWIxuHNGt6I2q7OSidvm0Rrk4xZ8jKCvLz
 AYyYyE8SGpEPl3BUULQYpM0cU5YvWDmQ4I+XDoM35+53TLpGRyZxVv+fqyiAygfW3Stx
 YVycUZAjPUtY7+jy4x0BkQWTr7KxIil3nsXnVMk998cu8PN2ZFPDQViZynNS6CgcdSDJ
 A1LDFc3fY9uqpfc6+pnk/x8QbROaanQfIghBbY+tBU5xRxK4V4z8uMbBthXW/ccjiySq
 2PxQ==
X-Gm-Message-State: AFqh2koI6+APjKbjxDx/4+awv824gPA+xUXW/fenhyfTynJTA/YElftB
 7pBerMoVX9hKda62gD9rl16kNUO3aL+BXrXh
X-Google-Smtp-Source: AMrXdXvdpMCqZjz6e86BidlPjBHgQHn56xBMUw43xVXX6wOhd8kuxqdGjBECmdFW7R5GbBf7oE7g4A==
X-Received: by 2002:adf:f90e:0:b0:2bc:aa67:28fb with SMTP id
 b14-20020adff90e000000b002bcaa6728fbmr22912707wrr.49.1674590408020; 
 Tue, 24 Jan 2023 12:00:08 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:07 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v3 12/14] RISC-V: Add initial support for T-Head C906
Date: Tue, 24 Jan 2023 20:59:43 +0100
Message-Id: <20230124195945.181842-13-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:13 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds the T-Head C906 to the list of known CPUs.
Selecting this CPUs will automatically enable the available
ISA extensions of the CPUs (incl. vendor extensions).

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Drop C910 as it does not differ from C906
- Set priv version to 1.11 (new fmin/fmax behaviour)

Changes in v3:
- Removed setting dropped 'xtheadxmae' extension

 target/riscv/cpu.c          | 30 ++++++++++++++++++++++++++++++
 target/riscv/cpu.h          |  2 ++
 target/riscv/cpu_vendorid.h |  6 ++++++
 3 files changed, 38 insertions(+)
 create mode 100644 target/riscv/cpu_vendorid.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b18df9fa2a..627512a184 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -279,6 +279,35 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     cpu->cfg.mmu = false;
 }
 
+static void rv64_thead_c906_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
+
+    cpu->cfg.ext_g = true;
+    cpu->cfg.ext_c = true;
+    cpu->cfg.ext_u = true;
+    cpu->cfg.ext_s = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.ext_zfh = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.ext_xtheadba = true;
+    cpu->cfg.ext_xtheadbb = true;
+    cpu->cfg.ext_xtheadbs = true;
+    cpu->cfg.ext_xtheadcmo = true;
+    cpu->cfg.ext_xtheadcondmov = true;
+    cpu->cfg.ext_xtheadfmemidx = true;
+    cpu->cfg.ext_xtheadmac = true;
+    cpu->cfg.ext_xtheadmemidx = true;
+    cpu->cfg.ext_xtheadmempair = true;
+    cpu->cfg.ext_xtheadsync = true;
+
+    cpu->cfg.mvendorid = THEAD_VENDOR_ID;
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1320,6 +1349,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b0ec5fcf9e..134dc29c6e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "cpu_vendorid.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -53,6 +54,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
new file mode 100644
index 0000000000..a5aa249bc9
--- /dev/null
+++ b/target/riscv/cpu_vendorid.h
@@ -0,0 +1,6 @@
+#ifndef TARGET_RISCV_CPU_VENDORID_H
+#define TARGET_RISCV_CPU_VENDORID_H
+
+#define THEAD_VENDOR_ID         0x5b7
+
+#endif /*  TARGET_RISCV_CPU_VENDORID_H */
-- 
2.39.0


