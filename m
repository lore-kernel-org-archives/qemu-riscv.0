Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onvk9-0004b2-Ab
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 01:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjm-0004OT-PX
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 01:47:34 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1onvjV-0003j7-Ui
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 01:47:30 -0400
Received: by mail-pl1-x632.google.com with SMTP id g24so378273plq.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Oct 2022 22:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZxjLBFOBniLUEOzOFd8zqTQ1srgxqp3aaC0QMoX4tA=;
 b=XnCAcDGSiTnyZA22UXThJi+AxeIVa4jSH8olG8CkLcosxGa8ZgsNWMYtFt348egGlk
 4kFFFgbx8+8m/nKqWl+/e3WcQmzcm6WnS53jzOkL2sidwornPFOJiiWdcBJ82jq2AH9x
 7UTMKmAnpsjmXugMTxlTStLKE+4/eJotMHdWbFiSCKmvMk8/cJ1BF24cyKr4Y0g7Ls6x
 5umi52P+q2zXfUScG0PIKQbPutoIInD3IY/zk6xutiVqcp0fQ4HuQW9B6pSNoyamae11
 98orWAcTqMJBmH4BCaJ+MLXs5en9cgZTPKGUBd0KhTnzAb5b5MOmAyPf6vH3apPfwAyR
 ifjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZxjLBFOBniLUEOzOFd8zqTQ1srgxqp3aaC0QMoX4tA=;
 b=ooa/Y0f7D17baGH9MkF7JH/45cckqSMLiegrSmsdP43Gq+IKIPmF53FqJh67df5MTN
 9EXbvN/5RlAE/PgaP68UqvnuIFW0xlSBNMpeguVUVFhYyIHSBbJHXuGKFi/0x3vr2f4p
 dOHEydszjQoXlYNes6arwNIh+ZZTmkG5zeEAClrn2QoDLXNCPLCyxWfKFWHr0Onc86vN
 dku0MbXhr1s5MvQn3fNEXPwXxaNVpeFDxFrbwNt2E1ky3ylmHsEkyXDRXOq8qE0IJpmJ
 qtEkutFIs/zJytehGuxDPYRpXRlheRdR31cZxzNNIba8A0uklMj9RKT/r1JIG606zRIE
 v6ig==
X-Gm-Message-State: ACrzQf2vRHFzZvyOTX0GjwZXbTGqODY5pMzDx+AwK3Jo19FKRzyBpD2M
 bI0pe1nmAAksYCec0OFPdRHWNg==
X-Google-Smtp-Source: AMsMyM7qJxhprpg1BMA/yPDQOiHBfkrSbB+zANClLJTJBlUo99Vmtiv1i0OlC8BVQyRVsS/IDtPEUw==
X-Received: by 2002:a17:903:32cd:b0:185:5421:a5d6 with SMTP id
 i13-20020a17090332cd00b001855421a5d6mr48017940plr.99.1666849631532; 
 Wed, 26 Oct 2022 22:47:11 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:519a:c85:c94:7c26:ac49:6811])
 by smtp.googlemail.com with ESMTPSA id
 188-20020a6204c5000000b00562784609fbsm328217pfe.209.2022.10.26.22.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 22:47:10 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v1 2/3] target/riscv: Extend isa_ext_data for single letter
 extensions
Date: Thu, 27 Oct 2022 11:16:48 +0530
Message-Id: <20221027054649.69228-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027054649.69228-1-mchitale@ventanamicro.com>
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 27 Oct 2022 05:47:43 -0000

Currently the ISA string for a CPU is generated from two different
arrays, one for single letter extensions and another for multi letter
extensions. Add all the single letter extensions to the isa_ext_data
array and use it for generating the ISA string. Also drop 'P' and 'Q'
extensions from the list of single letter extensions as those are not
supported yet.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e6d9c706bb..35320a8547 100644
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
@@ -1182,16 +1187,23 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
@@ -1202,19 +1214,12 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 
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


