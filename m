Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUXuY-0003yM-Ap
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 13:58:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nUXuX-0003wC-7J
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 13:58:13 -0400
Received: from [2607:f8b0:4864:20::429] (port=39649
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nUXuU-0000lu-9a
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 13:58:12 -0400
Received: by mail-pf1-x429.google.com with SMTP id h2so4685916pfh.6
 for <qemu-riscv@nongnu.org>; Wed, 16 Mar 2022 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8v7GZSVDXRQMCZ/3RkmjshkslXmDrDdI01ZBmPHSvM=;
 b=z70Kcq/v+HJqnSNk+zOGignQAhaybYDRNwasG823YrI1j4DIVkyB0BOVENg128UYvQ
 augJfbkQiqp3NeUdRTNH4iHQOTxHLzwjHoDvKMoIdCVM9JpYWNZiULyEIpLxwkbXhOH7
 QxFpaKsyThSq0AwNwA+wxtv1DZX9iVs+BsjLZKzm4fRgcV0qUYp0tLhZVRE/gkyB/tjw
 cIOPJqItb4as91S4QXGvbHVuQqe/Zb+tP8UKnenYznyLRFKEHncliWrKodxFgAai+rGe
 7jv5ctxXd8xWOLB+EhfjcZLg/iPpe8tVgxAXHrXg1PxCfMJWJ3oiUC+5RFOE/GUYedWg
 pu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8v7GZSVDXRQMCZ/3RkmjshkslXmDrDdI01ZBmPHSvM=;
 b=PNCfZKjdte2prgqfXDdxN9TYR9t7LdEcLRv17FAQ9cuCFOpLJ3kweOn9LFWA66fqF/
 XhzQYdWGAWax2IQgN98+W2GqxExxS4xCqWteQh01E1IAz4n+WIu/7tRgBrZrxKThhX7b
 N1x7MamS8lS+If2Gqd7stxzVV2oXPyWHnW3tQHYBqELsbuuEYuwGDH9u4Tq48ppv2+dT
 tLLorqwOCO//5pGwVUSCLjSFzZvBctOAsmlRWmgyz6KIFWjpWIcTEQYOrjlk1vEfPNPi
 rQAvGU3NC4sUR2uAUzM0Sr2durkyJKHV9GUttVF1Re9fAf306UP3tYCdkKODBlvXM3zu
 bshQ==
X-Gm-Message-State: AOAM531tT2p4m1I/GI2Fs2NDlSU8B/+vW+3F1aqiHnolQiW/vv4tRIRU
 Tee4dKXGgwMV+e4KZ7HDo7jx4Q==
X-Google-Smtp-Source: ABdhPJxcyNKQeNCqY9XuPx170ngP2OdvrHudSkxrQtVQDMLGplcMbsGAldsFpFdXZva0NaVvzgA4GA==
X-Received: by 2002:a63:5014:0:b0:380:132:6b25 with SMTP id
 e20-20020a635014000000b0038001326b25mr587566pgb.211.1647453484972; 
 Wed, 16 Mar 2022 10:58:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f70d5e92basm4053275pfx.34.2022.03.16.10.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 10:58:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v6] target/riscv: Add isa extenstion strings to the device tree
Date: Wed, 16 Mar 2022 10:57:59 -0700
Message-Id: <20220316175759.821785-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Wed, 16 Mar 2022 17:58:13 -0000

The Linux kernel parses the ISA extensions from "riscv,isa" DT
property. It used to parse only the single letter base extensions
until now. A generic ISA extension parsing framework was proposed[1]
recently that can parse multi-letter ISA extensions as well.

Generate the extended ISA string by appending the available ISA extensions
to the "riscv,isa" string if it is enabled so that kernel can process it.

[1] https://lkml.org/lkml/2022/2/15/263

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Heiko Stubner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes from v5->v6:
1. Improved commit message.
2. Fixed a typo for Zfh.

Changes from v4->v5:
1. Fixed the order of Zxx extensions.
2. Added a comment clearly describing the rules of extension order.

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
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ffb7..937ccdda997b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,11 @@
 
 /* RISC-V CPU definitions */
 
+struct isa_ext_data {
+        const char *name;
+        bool enabled;
+};
+
 static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 
 const char * const riscv_int_regnames[] = {
@@ -898,6 +903,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
+#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
+
+static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
+{
+    char *old = *isa_str;
+    char *new = *isa_str;
+    int i;
+
+    /**
+     * Here are the ordering rules of extension naming defined by RISC-V
+     * specification :
+     * 1. All extensions should be separated from from other multi-letter
+     *    extensions by an underscore.
+     * 2. The first letter following the 'Z' conventionally indicates the most
+     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+     *    If multiple 'Z' extensions are named, they should be ordered first
+     *    by category, then alphabetically within a category.
+     * 3. Standard supervisor-level extensions (starts with 'S') should be
+     *    listed after standard unprivileged extensions.  If multiple
+     *    supervisor-level extensions are listed, they should be ordered
+     *    alphabetically.
+     * 4. Non-standard extensions (starts with 'X') must be listed after all
+     *    standard extensions. They must be separated from other multi-letter
+     *    extensions by an underscore.
+     */
+    struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zfh, ext_zfh),
+        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
+        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
+        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
+        ISA_EDATA_ENTRY(zba, ext_zba),
+        ISA_EDATA_ENTRY(zbb, ext_zbb),
+        ISA_EDATA_ENTRY(zbc, ext_zbc),
+        ISA_EDATA_ENTRY(zbs, ext_zbs),
+        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
+        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
+        ISA_EDATA_ENTRY(svinval, ext_svinval),
+        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
+        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
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
@@ -910,6 +969,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.25.1


