Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRkZo-0002sg-Ad
	for mharc-qemu-riscv@gnu.org; Tue, 08 Mar 2022 19:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nRkZm-0002rk-8r
 for qemu-riscv@nongnu.org; Tue, 08 Mar 2022 19:53:14 -0500
Received: from [2607:f8b0:4864:20::f33] (port=38539
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nRkZj-0001SP-M3
 for qemu-riscv@nongnu.org; Tue, 08 Mar 2022 19:53:14 -0500
Received: by mail-qv1-xf33.google.com with SMTP id kk16so850030qvb.5
 for <qemu-riscv@nongnu.org>; Tue, 08 Mar 2022 16:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBBQTlG03Akq4NM1Q+Jo0VP7EZdwFfuek/Z9gY5S0p0=;
 b=Fk2AFM9XVxLhMlvpH0Wa4UUBJucfQQuMMQcXUUXmSi5NcErgsnfG6TeYYMroOgbH2c
 KahTTCDnguXfaY7KBuLWeW/dPCCFqnW7Qog8geh0BRwzXJc/y1ow+YuQs4HOpw7P6obb
 cN+LM7ek6ML31DSP6mkyeb6QgCyJak8BKqfvrlR32VHK5snqgZEWwzk4JBAwpC66shls
 vySD9x3E6FxpidelTJEYw80Gf2iDFJA8TWkSa3zXc5sOJynCVgzD3Lx67wsI3CyDPGtM
 ATdWb3UDpYvFpfRN4lCxLQ0/YyCKsMA06a5zdEYG26vKIDtmCQ69en3AXuIh1OawoTf/
 yeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBBQTlG03Akq4NM1Q+Jo0VP7EZdwFfuek/Z9gY5S0p0=;
 b=8CLNmrTY4TKQ1ntu233+8BwqKrMVCnGTuKHDuvelP1+AWEQM59XM++0FHYDC2UfpKB
 +93vHzi7rEVl3xbWgyoSVyHfv8bkDRNMHl7Izk5JgiRf349h8qsvstIbhYrgK44J4YlP
 8LmF+vjy75NWuf/QPbdwJ5wAPwq0ealBR0zgY453XilSXY4Hk8njpkw8i+l9x1dLoeBO
 dXvyApllZqzYqKgiZmTpSK2p2/1+a6YikHLDoZginwZi6VZMur+PLom360sy8Lf6S1Im
 6gZQC8PGbznXGRXVhcN+zuWayC7d/hz7iidlhuj1ZS7IyGdjhNxD2SFL+ItSj2fLJFtj
 K+tw==
X-Gm-Message-State: AOAM5313KXP1Fj+lzmnobYGUAsdNje/Uv1fdMDwNKq4iJbUW93u7dTN+
 tM52SSV8Hz+h+EY+E7C9UefnVQ==
X-Google-Smtp-Source: ABdhPJwCOif3rLSlDTwW2eTE9EPl8Ofv058Vfz3a5ZDNV+rKH2mUI2UTYstvQvog8iW1YZrEsuaGmw==
X-Received: by 2002:a05:6214:1d0a:b0:435:1e7b:6da5 with SMTP id
 e10-20020a0562141d0a00b004351e7b6da5mr14790363qvd.41.1646787190062; 
 Tue, 08 Mar 2022 16:53:10 -0800 (PST)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05620a22c600b0067d247816eesm261857qki.85.2022.03.08.16.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 16:53:09 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4] target/riscv: Add isa extenstion strings to the device tree
Date: Tue,  8 Mar 2022 16:53:02 -0800
Message-Id: <20220309005302.315656-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 09 Mar 2022 00:53:14 -0000

The Linux kernel parses the ISA extensions from "riscv,isa" DT
property. It used to parse only the single letter base extensions
until now. A generic ISA extension parsing framework was proposed[1]
recently that can parse multi-letter ISA extensions as well.

Generate the extended ISA string by appending  the available ISA extensions
to the "riscv,isa" string if it is enabled so that kernel can process it.

[1] https://lkml.org/lkml/2022/2/15/263

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---

Changes from v3->v4:
1. Fixed the order of the extension names.
2. Added all the available ISA extensions in Qemu.

Changes from v2->v3:
1. Used g_strconcat to replace snprintf & a max isa string length as
suggested by Anup.
2. I have not included the Tested-by Tag from Heiko because the
implementation changed from v2 to v3.

Changes from v1->v2:
1. Improved the code redability by using arrays instead of individual check
---
 target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ffb7..2521a6f31f9f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,12 @@
 
 /* RISC-V CPU definitions */
 
+/* This includes the null terminated character '\0' */
+struct isa_ext_data {
+        const char *name;
+        bool enabled;
+};
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -898,6 +904,42 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
+#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
+
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+{
+    char *old = *isa_str;
+    char *new = *isa_str;
+    int i;
+    struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(svinval, ext_svinval),
+        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
+        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
+        ISA_EDATA_ENTRY(zba, ext_zba),
+        ISA_EDATA_ENTRY(zbb, ext_zbb),
+        ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
+        ISA_EDATA_ENTRY(zfh, ext_zfhmin),
+        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
+        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
+        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
+        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+    };
+
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_edata_arr[i].enabled) {
+            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
+            g_free(old);
+            old = new;
+        }
+    }
+
+    *isa_str = new;
+}
+
 char *riscv_isa_string(RISCVCPU *cpu)
 {
     int i;
@@ -910,6 +952,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.30.2


