Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3IIf-0000bb-Jk
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 09:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3IIV-0000a6-E6
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 09:54:53 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3IIK-0006MK-1p
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 09:54:51 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 b16-20020a4a98d0000000b004a3868ad011so249697ooj.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 06:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUbdhILV9rysgSulYBvrdZRU/PWdBrpUTO0VEmSZWaA=;
 b=ZyY2FyJBBf+YzaenNXxump39wMWDOOtEH0PlWCmFO7grcVI5DkK5r19HYgPyF7XktV
 apvgwLB5IObpyQ/bPquyjVXYaujrwJlfZ3FEhC6As/AAnvpJbN8JolF8CwBuMPwKB8E1
 OS8UtpK8v0KsFdrgdodjO0Zsp2KzI8g77nMoSRbq8lnLlvdmkbGDI54fWXTAILFFH+ot
 1XsrOMn43pd+Xh32UyMudj6q9S9XdCFnHBq9VRG9fB88Zmbb79WHTQMJmxd1hIZmQGK4
 vQp1fH44guH68InpdjrKMfQkvsjZ+p34cypfhdLQx1/QMbUdG10oZ2BLCtRdRty2MFJy
 uFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OUbdhILV9rysgSulYBvrdZRU/PWdBrpUTO0VEmSZWaA=;
 b=xo+sRIV78L1sOQPbP8eDJEq3bW+qgIN5qD5c8clEh9/oM7v8flZDINwPBdRnuDDkEO
 3+9gOd8S0ohId11AvkcqYPMcHJj/+4dp+gAR9MgnZN4WdQZpOJhvRKJ6O5GSax/AXoeY
 hT968oqqNLGBwbFeCRqLRttzUMfo9GHPg1wkNtHxfMLaynMtKwtiLbmUn5HhNQ3++kml
 qwpvwcwD+R3F9F4swu4y/P3Rg+BDscle8y4nbT/w+oNBWqqUHgvTrtUky5O9Ef28P08e
 3XnRaRbSrDSBbesbUHQkqUM6xcwqNXtS3277WchtV6ABnnGnt8TBJFKVq12VD5BSdTYR
 wepw==
X-Gm-Message-State: ANoB5pnAMmueKsgoCHss0d/i6/wZvnEb0YGxbziAt00YIjxSfGQ0gVti
 7CyNj5qyJXSPjMfmvp3XPZuY4Q==
X-Google-Smtp-Source: AA0mqf4+pnqaSiVW21o0Rnf8Aa8sTegvZweyCIuyeFNtZmNyuOiWvtQRTUZBsVFout5Cep+8ZgqUfA==
X-Received: by 2002:a4a:a982:0:b0:498:c3a8:e0 with SMTP id
 w2-20020a4aa982000000b00498c3a800e0mr1018420oom.8.1670511277489; 
 Thu, 08 Dec 2022 06:54:37 -0800 (PST)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b14-20020a4ae20e000000b004968311a31asm10044225oot.39.2022.12.08.06.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 06:54:36 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v3 2/3] target/riscv: Extend isa_ext_data for single letter
 extensions
Date: Thu,  8 Dec 2022 20:24:10 +0530
Message-Id: <20221208145411.122799-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221208145411.122799-1-mchitale@ventanamicro.com>
References: <20221208145411.122799-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Dec 2022 14:54:56 -0000

Currently the ISA string for a CPU is generated from two different
arrays, one for single letter extensions and another for multi letter
extensions. Add all the single letter extensions to the isa_ext_data
array and use it for generating the ISA string. Also drop 'P' and 'Q'
extensions from the list of single letter extensions as those are not
supported yet.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
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


