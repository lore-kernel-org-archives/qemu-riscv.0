Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMuzG-0000bn-Ro
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 13:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxi-0007Nb-Ad
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxc-0000qM-Kc
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r2so15013552wrv.7
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ygu0duwWgb07Jo+qlRVPI7Zizkm9Hcw3R3ZaXGJeNaI=;
 b=qNun+mwT5euMS4sFRjKoYAChO60wnjplwpbnmPn3tpYGXFOeiXOaU6BWGfC8vQgB+2
 AaveEw1amFVfhQowO1OmQCpHZtFRuxVdSQlmoAUcb0BIMAPj/6/bGGtyrXKZYas7Kpav
 9Xf8pfu1b9jhQBL3wftU1RmX4HtQ6s6hZZwQyaTaowhyi7hmPeG2iefDS9Z4EQvtyNLv
 ddacJEH8Omnr6+OlIF2YLmGdjYP+1tK2/5cBcsifuUEDQNlXSdY4Kuxw9MKrA10Hd/xa
 bda7d5OAqS8BCEHONQhMUzUpYVDpsDTxJkF8nOQ/1GxQ0OtaTLwQIio5U/Ve3YqGCMuc
 HbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ygu0duwWgb07Jo+qlRVPI7Zizkm9Hcw3R3ZaXGJeNaI=;
 b=QyjwWeVBtWs/Hk6PQimmuXCA9tmDYRGYAVYjoRrDya+VQAyPDWGbHlaXZ5hclw9osd
 0BCczpa+d5O+k6wMuqILP1f0Sz5JBrA3eg3QqJgIokID/Kai19o9ZXkndviCCSaqKA8p
 zgXrcpaLI+RqJ5ZpkmmfbUa/Lw9WUMkGI3WVtcj5OYANpLk2njfZtCoHuK3Ttokr7aEW
 LIZOL5Cw21huAeuNm0HrYVtIq1Q9gGNm+UbGw6XFqaqC4+dbnw5AjHVLmrcNeuhj5X+G
 UPaePSvaKsG1C5ZG0Prn8LhQHzmK31PFiw+sEa8FbqfI0OHG0Id71ZUGly0M56KORZSR
 rxUg==
X-Gm-Message-State: AO0yUKXlZwGoLMRlwq237JIo388DYg+tXDwrAOs2CaB08p19h5qCDfw3
 k5n3s9XRveSGBhdl7WKX4AWcfzjtRaRBA9mw
X-Google-Smtp-Source: AK7set+tQF8gd1V9/5n+yNOsc5WalLoz82eXnRAzQqtBI7MewW3ahIUHXBk/B2Cz/HHCc3iPtxlIPA==
X-Received: by 2002:adf:edcf:0:b0:2bf:ed09:abf1 with SMTP id
 v15-20020adfedcf000000b002bfed09abf1mr7746407wro.21.1675188143413; 
 Tue, 31 Jan 2023 10:02:23 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:22 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 12/14] RISC-V: Add initial support for T-Head C906
Date: Tue, 31 Jan 2023 19:01:56 +0100
Message-Id: <20230131180158.2471047-13-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 18:02:32 -0000

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

Changes in v4:
- Inlcude cpu_vendorid.h in cpu.c instead cpu.h

 target/riscv/cpu.c          | 31 +++++++++++++++++++++++++++++++
 target/riscv/cpu.h          |  1 +
 target/riscv/cpu_vendorid.h |  6 ++++++
 3 files changed, 38 insertions(+)
 create mode 100644 target/riscv/cpu_vendorid.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3078556f1b..8cbc5c9c1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "cpu_vendorid.h"
 #include "pmu.h"
 #include "internals.h"
 #include "time_helper.h"
@@ -281,6 +282,35 @@ static void rv64_sifive_e_cpu_init(Object *obj)
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
@@ -1371,6 +1401,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5cc3011529..60478f4a9c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -53,6 +53,7 @@
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
2.39.1


