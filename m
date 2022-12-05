Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p28fk-0001Ux-4Q
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 05:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p28fb-0001Oi-8F
 for qemu-riscv@nongnu.org; Mon, 05 Dec 2022 05:25:56 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p28fZ-0006el-9O
 for qemu-riscv@nongnu.org; Mon, 05 Dec 2022 05:25:54 -0500
Received: by mail-pg1-x531.google.com with SMTP id 82so10149668pgc.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Dec 2022 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zB5FySSx6euLoSWlKajVrTOjnC47nf8napcAvoicps=;
 b=KQS6ZbugJRURe1yiJY6zxxSPU0BIGJWPcq3uEdUhZPETDAsR8BuuDzFiOAp8RRnAKL
 JrObatX+Ly+BfAp0VrRCFrtTy0FToRyvIcq3NrUPQq5oBX/DdOOcW4cvzwuQfW2OkaCn
 MF+Oz9gpx4/HrJYV0CrtF3SCQRGCuIFDrVyn3fIGLAwzv82ekd1LkNc+9qV2IWhkjYRX
 gxhLf27RH2a1zw3FW3rVUCgGGT8YHmG3GvihttVDQvX6j+uh2mHX6jNuFcVhF35bVUJn
 ATqJoMecukPg1byREHux5RBMmxT+1RZ4WgbAz9mUSYzAQt1hF4+AwgVooP6UQxQvvOny
 LFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zB5FySSx6euLoSWlKajVrTOjnC47nf8napcAvoicps=;
 b=RkGT8eAJQboJVETsyhpPTUvusKp953O9JmAi035yhXWoRMSvONGDxn4E3Fm9jKlOzA
 nmLGQ7pxdkltCqTp9Wg9kdzXjCnVv9/4CYrKZEjvJjCX9uZQVSfEAgYNa5b1qvnVcsXf
 58vnqnwiWloV0NjfEUCS57chHQmWf/SWM9WxWH99VKezxRhQ5EtACGZbyS/+EqQMgvcx
 qe8WVpfZ3HYuOxHg6kSqNfB7UkZ0PeoYouMcoMzSBfUCR95QgYfk8hUuoc0AYHhlrfwr
 ZbUooU6JAw8fNVvqJIcQ/N5df+Z3hXQgJJtodlXwHBrkBs7tpAoMfR1En+Q6LzqHUmb0
 BZZQ==
X-Gm-Message-State: ANoB5pn2IKKLi2fPMlpVXhJ2KYC7asy0f55AqGni5T3cHX1dIsUxXm2h
 3bLKkLZ9otwRAjuN0f6iM7bTWQ==
X-Google-Smtp-Source: AA0mqf5tWPzIptXItnBccYG4g6PbH/mDJbllmu5IT4bdzmYTNR7LnqtXzRfiKWJ/rOflCNmdu45OKg==
X-Received: by 2002:a05:6a00:26e3:b0:576:1b46:3ff6 with SMTP id
 p35-20020a056a0026e300b005761b463ff6mr20184222pfw.1.1670235951766; 
 Mon, 05 Dec 2022 02:25:51 -0800 (PST)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 ca12-20020a17090af30c00b0020bfd6586c6sm8905807pjb.7.2022.12.05.02.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 02:25:51 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 2/3] target/riscv: Extend isa_ext_data for single letter
 extensions
Date: Mon,  5 Dec 2022 15:55:08 +0530
Message-Id: <20221205102509.504520-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205102509.504520-1-mchitale@ventanamicro.com>
References: <20221205102509.504520-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 05 Dec 2022 10:25:59 -0000

Currently the ISA string for a CPU is generated from two different
arrays, one for single letter extensions and another for multi letter
extensions. Add all the single letter extensions to the isa_ext_data
array and use it for generating the ISA string. Also drop 'P' and 'Q'
extensions from the list of single letter extensions as those are not
supported yet.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 042fd541b4..8c8f085a80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -41,8 +41,6 @@
                              (QEMU_VERSION_MICRO))
 #define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
 
-static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
-
 struct isa_ext_data {
     const char *name;
     bool multi_letter;
@@ -71,6 +69,13 @@ struct isa_ext_data {
  *    extensions by an underscore.
  */
 static const struct isa_ext_data isa_edata_arr[] = {
+    ISA_EXT_DATA_ENTRY(i, false, PRIV_VERSION_1_10_0, ext_i),
+    ISA_EXT_DATA_ENTRY(e, false, PRIV_VERSION_1_10_0, ext_e),
+    ISA_EXT_DATA_ENTRY(m, false, PRIV_VERSION_1_10_0, ext_m),
+    ISA_EXT_DATA_ENTRY(a, false, PRIV_VERSION_1_10_0, ext_a),
+    ISA_EXT_DATA_ENTRY(f, false, PRIV_VERSION_1_10_0, ext_f),
+    ISA_EXT_DATA_ENTRY(d, false, PRIV_VERSION_1_10_0, ext_d),
+    ISA_EXT_DATA_ENTRY(c, false, PRIV_VERSION_1_10_0, ext_c),
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
@@ -1196,16 +1201,23 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
 {
     char *old = *isa_str;
     char *new = *isa_str;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].multi_letter &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
-            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+            if (isa_edata_arr[i].multi_letter) {
+                if (cpu->cfg.short_isa_string) {
+                    continue;
+                }
+                new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+            } else {
+                new = g_strconcat(old, isa_edata_arr[i].name, NULL);
+            }
+
             g_free(old);
             old = new;
         }
@@ -1216,19 +1228,12 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 
 char *riscv_isa_string(RISCVCPU *cpu)
 {
-    int i;
-    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
+    const size_t maxlen = sizeof("rv128");
     char *isa_str = g_new(char, maxlen);
-    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
-    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
-        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
-            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
-        }
-    }
-    *p = '\0';
-    if (!cpu->cfg.short_isa_string) {
-        riscv_isa_string_ext(cpu, &isa_str, maxlen);
-    }
+
+    snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
+    riscv_isa_string_ext(cpu, &isa_str);
+
     return isa_str;
 }
 
-- 
2.34.1


