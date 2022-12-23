Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLm-0008EM-MS
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLZ-000855-TA
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:42 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLX-0003OT-LO
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id r26so2787221edc.5
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LI/n4u5LUhjp6De0boykaSc6l5EIrMwbdsuLyGbuI4c=;
 b=jkDRWmGfjbRCeMzkzSuhuqfD2i0hv6iOZiznnfHdTrvjtGeC0awCAEELb5/+9cXSbn
 6XFx6g35DveQHyeCIftsk9aiyRBv8ok0V8Zxlzhsb4CnQOgNhsSOoIvdbQKTc4eJVWZY
 NydVAaco5+31DELNjbAEzGfR6iCeP+yW38XU9mIUd6OUJuk2McPcW58FlliWBg6+h4kx
 mA4f4ILQmspYGwmXBTH7T8rj5Gz6qJSFONLUBIiCdS9l+xX510//yGfBh0iytt/rtuTE
 eWH6ZvOqCFK8K9FYnODg/Lf1qCm+3wPL2hhRXQ6w5MW7qR+IMtNoN3BLyjjgN5FyYPTN
 p0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LI/n4u5LUhjp6De0boykaSc6l5EIrMwbdsuLyGbuI4c=;
 b=3sBNylMtCFx3l/9HlUUr7iV9C0BhGKlLhsW63OBXI0voQFOIGj2DndwmHBzi7XJYkB
 He/y8Xgpk0j985My5f2YUcGd++lB+ocnwLJwb+GO0BT0kVZscuGNxf3i2xBPTr0o4+4d
 W0i3OiE5h1qdAjGlBVu44/8W+9sYPjf2gE+H/p25VtfEK5IkepP4/e8gdRBmZ+QlKA3Y
 RkZEy6ouZP6J5ikpwOWfmJvEs3/O5WdoiLgR6vVLProV5dWIEcx9rg/GZOMhFFP2USMr
 SlipOOzys8JJvB/ow9x81PL0PU4dVIMHt5Le/f/cub2p9VoJ/m02hhedjcyVO3JaoGdh
 cBUw==
X-Gm-Message-State: AFqh2koZ7E7dCTy2N6S87LFYvSZ/zwBOc2lKr76ZIJgAvM38aghpO+yR
 86oh2+eso1d7M891r6akVIyMinZDYRnW9YUW
X-Google-Smtp-Source: AMrXdXv94nltIRWAmhWM3Ju+D75lddwACNXtD9MLXEctcg8c7OecdXS4KZriGlLxAZLpLNKe8YQ7PA==
X-Received: by 2002:a05:6402:380d:b0:47e:eaae:9a5b with SMTP id
 es13-20020a056402380d00b0047eeaae9a5bmr6639557edb.42.1671818437908; 
 Fri, 23 Dec 2022 10:00:37 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:37 -0800 (PST)
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
Subject: [PATCH v2 13/15] RISC-V: Add initial support for T-Head C906
Date: Fri, 23 Dec 2022 19:00:13 +0100
Message-Id: <20221223180016.2068508-14-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:43 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds the T-Head C906 to the list of known CPUs.
Selecting this CPUs will automatically enable the available
ISA extensions of the CPUs (incl. vendor extensions).

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>

Changes in v2:
- Drop C910 as it does not differ from C906
- Set priv version to 1.11 (new fmin/fmax behaviour)

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c          | 31 +++++++++++++++++++++++++++++++
 target/riscv/cpu.h          |  2 ++
 target/riscv/cpu_vendorid.h |  6 ++++++
 3 files changed, 39 insertions(+)
 create mode 100644 target/riscv/cpu_vendorid.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a38127365e..d3d8587710 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -279,6 +279,36 @@ static void rv64_sifive_e_cpu_init(Object *obj)
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
+    cpu->cfg.ext_xtheadxmae = true;
+
+    cpu->cfg.mvendorid = THEAD_VENDOR_ID;
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1311,6 +1341,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 897962f107..28184bbe40 100644
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
2.38.1


