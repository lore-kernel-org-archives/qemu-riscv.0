Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXcB-0005wK-MR
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbt-0005lg-96
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:28 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbi-0003xu-Eh
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id cu2so22934804ejb.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MSeHrtZy6/z9aLfg15MifS4M5qZYg4KlFPrRIZ3XZf0=;
 b=MIoQYfvSWNdemt6ycKWCb67ELSovsbkwArvYG4tXkGuGSxoqJRYws3p5Rb33fG4RJ9
 gaN2MuaUix/YhgkGEPHjAYgiCH8vvL1L5rpDOQWOkwuZx7oc/51bgRAGylF/BZHM9R8U
 /0uVPgYW7D85IlRhRNLGjGAos5TNtZ26tUxb/9ieAZJi9JQwInjv14Wd0zOUWHP6TVpr
 SrZdYKgsRUB0rPGTnMzuwfsMJFYNwgcLCU9x/36ajpk3UsZZDSN8j4wmdSOXyVP9jFmL
 tdAs15pOlpGqE6TnoXh/c9aleVETXuANhs7yZ9kVTP5eeRfw8eU5BGlv+8Z9eJNfdKAp
 scZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MSeHrtZy6/z9aLfg15MifS4M5qZYg4KlFPrRIZ3XZf0=;
 b=12vgDhM8HUHBaZskA+VQlgaXP+6+laqsVXNvR3+2rgj2VlAA67IN52fJqNpowWYacY
 b0QVnPLqwLCiiSi0MoHH8WKobQiEiUMnzbZll9Vm9fF9/dtAlnjxl1OtCm1Ty+ko5Mfz
 /Ysd2adhbrrbg3ab13DGzL1gCKyjGhgHkom0xOQo0vCfJcuC/eST4ycWd+NbLH5tlWbY
 JPDRcZlz2VfVuuSmSnzi/v7Y1st75Kv3aBR0fQICFFIMeO+bzWhtrWRpZUuXiipSJsuz
 IFPslzSc50VF0iqLGh4pccq2i8lo8zLgtmAnWeDy49RDVzhJqgKUBOhanF/0E6AAx00s
 Ol7w==
X-Gm-Message-State: ACgBeo3EA9nkKRDOOA4OIPQi4npHhlM8aOqmSzRcpaoyWyGCuXWvlDcj
 juyjQ2+6nsqBxtCOC/OK3bP67J9zpFg/AWli
X-Google-Smtp-Source: AA6agR6ijj5IvZhfKoNvwLqOIwMB88lXmtKHmmrran4FNtmzOVXKRc2x/1u0jChrqNWsDrPPMCywEw==
X-Received: by 2002:a17:907:2701:b0:741:51eb:2338 with SMTP id
 w1-20020a170907270100b0074151eb2338mr32582029ejk.501.1662466983588; 
 Tue, 06 Sep 2022 05:23:03 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:23:03 -0700 (PDT)
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
Subject: [PATCH 11/11] RISC-V: Add initial support for T-Head C906 and C910
 CPUs
Date: Tue,  6 Sep 2022 14:22:43 +0200
Message-Id: <20220906122243.1243354-12-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 12:23:30 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds the following T-Head CPUs to the list of known CPUs:
* C906
* C910

Selecting those CPUs will automatically enable the available
ISA extensions of the CPUs (incl. vendor extensions).

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c          | 32 ++++++++++++++++++++++++++++++++
 target/riscv/cpu.h          |  3 +++
 target/riscv/cpu_vendorid.h |  6 ++++++
 3 files changed, 41 insertions(+)
 create mode 100644 target/riscv/cpu_vendorid.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 01d85f0f96..1db440e21f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -194,6 +194,36 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     cpu->cfg.mmu = false;
 }
 
+static void rv64_thead_c906_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
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
+    cpu->cfg.ext_xtheadxmae = true;
+
+    cpu->cfg.mvendorid = THEAD_VENDOR_ID;
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1205,6 +1235,8 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,       rv64_thead_c906_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b02f530a6..74b291b4e4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,6 +27,7 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "cpu_vendorid.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -53,6 +54,8 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
+#define TYPE_RISCV_CPU_THEAD_C910       RISCV_CPU_TYPE_NAME("thead-c910")
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
2.37.2


