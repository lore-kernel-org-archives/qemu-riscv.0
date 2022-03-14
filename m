Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nTuLC-0004WE-R7
	for mharc-qemu-riscv@gnu.org; Mon, 14 Mar 2022 19:43:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nTuL8-0004Vx-85
 for qemu-riscv@nongnu.org; Mon, 14 Mar 2022 19:43:03 -0400
Received: from [2607:f8b0:4864:20::c2e] (port=46914
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nTuL5-0003c0-P3
 for qemu-riscv@nongnu.org; Mon, 14 Mar 2022 19:43:01 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso22309649oop.13
 for <qemu-riscv@nongnu.org>; Mon, 14 Mar 2022 16:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSeks/befnjcV91FnqWNg8QtfMjjnlzQW2jDgveO94w=;
 b=LubqPbz5jZncVC1oNUIiXiAoo3KaIfkj5S5q1PjMA1FiSGFk+4rsrtx7qK4y6cPSPk
 gqV/5x1+1ZPx+ojR0kI/3+mOLydE2MhEP8gPeI9lm+uIbFypFRY/pDURHzCX+H7JPN8F
 jhULHxx4QiG2RQNRgDswPVETe/T2RXxi7IOpvXyGrERHlFWfDgOZhIZupQGu6Q3kXW1x
 gnRQl3WJrbqE7gBR6hnEkqbzx6JYCNZMTqZIzZGz6ztPp34e8cov91tYxkXqd4paRUw8
 dnMxUK62fK228M59c/UikTU3Rtmyq6gCmYhUIapTc9wryW8Wx+z7ZpjoG2IE/IJRqpHT
 Zh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SSeks/befnjcV91FnqWNg8QtfMjjnlzQW2jDgveO94w=;
 b=BrYhtSzha8VFKwJrHffheanrH7PRARGW8ffVokIglr5VNHvV2RH8FrIj3b0Orn1Jyz
 oLJ5GoxBDkkuyP9nyPplDmwRRp//vPhADHBT95BkSOWAHLXVu/4A85i7M3PQDonGQVWY
 gnC30sA6HpIKyeMB8WjQpCUAR42M1uwm6ok9E/ZIJzE4ErWVbyjxBT1Z81dx5Jo+0OSe
 8DjsXgIHtWSz3mZmgnc54SO/wmNp4u+hVwxjQ+Mh2I9d6LUHwL3TDqcfZhWRXVB1wwOO
 2JdmgLqToKN7wxuEidDfjZbf/iYsXDLM7vCeTKrJgZJv9b7a2d85HDCsyRe4AUlptbiF
 CcMg==
X-Gm-Message-State: AOAM533Lo7bAANcj2VIxUTpUpiDJ1b5Fmm+i/9PIw5T3Ou9Q/E/G5iSD
 o+2Lq7Ktfi+BZT3VpqRAuMmJPA==
X-Google-Smtp-Source: ABdhPJxQE/mYrHURUKIx0sAF2KsZ0EQHpbbnEsYuPsQJ0Tg2Tp9gkNTADwkiPuAW/NRGVtzI1Lje9Q==
X-Received: by 2002:a05:6870:b52c:b0:da:b3f:326b with SMTP id
 v44-20020a056870b52c00b000da0b3f326bmr574096oap.283.1647301377409; 
 Mon, 14 Mar 2022 16:42:57 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a0568301e7100b005b256697d7csm8114455otr.72.2022.03.14.16.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 16:42:56 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v5] target/riscv: Add isa extenstion strings to the device tree
Date: Mon, 14 Mar 2022 16:42:50 -0700
Message-Id: <20220314234250.846613-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2e.google.com
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
X-List-Received-Date: Mon, 14 Mar 2022 23:43:03 -0000

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
 target/riscv/cpu.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ffb7..097c42f5c50f 100644
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
@@ -898,6 +904,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
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
+     * 1. All extensions should be separated from other multi-letter extensions
+     *    from other multi-letter extensions by an underscore.
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
+        ISA_EDATA_ENTRY(zfh, ext_zfhmin),
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
@@ -910,6 +970,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p = '\0';
+    riscv_isa_string_ext(cpu, &isa_str, maxlen);
     return isa_str;
 }
 
-- 
2.30.2


