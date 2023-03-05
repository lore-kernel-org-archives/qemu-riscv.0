Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYktC-0006Dn-7v
	for mharc-qemu-riscv@gnu.org; Sun, 05 Mar 2023 04:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pYktA-0006DB-6S
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 04:42:44 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pYkt8-0003pU-Ls
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 04:42:43 -0500
Received: by mail-pl1-x635.google.com with SMTP id ky4so7154893plb.3
 for <qemu-riscv@nongnu.org>; Sun, 05 Mar 2023 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1678009360;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlgkKu1CRJZr5VGiduBiYlhIVjAqnmbX22PzeLyT940=;
 b=NDv1hXxikpePKHGjgvBJJAP8eWeaqnMPkbs3DmzHxQjpZfcr/slY5WNrVyt1ytjF0c
 cQA8dTYSVwekejbJvm0go6neLD3TbJANnddxJOxluC2F5mQ/T/SY13RAhjqKk8fMu57b
 Ar5lRr+YpAn8WdfXD2lZQVfHJIdmbqOdQ0dAUHO19TFITmRnJUlrqQuRPJ1GGO4Eo9vs
 s79gqQ61VuNQ968yi08WZJ86w3TSPfWrHCFNCZd3fNsaWTjLOrTlJIujpCszA+6epqq2
 9Tq+Vko/5Aoaptz12BUZ6rj9vnzzIOfGVs4jVeYGhMTPQwvNSWUsEETguYKMmfEo+JZ4
 rUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678009360;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GlgkKu1CRJZr5VGiduBiYlhIVjAqnmbX22PzeLyT940=;
 b=N8TPUqolBaM0KF8NfHph5XbRmCUEbJioY8JJ+dppFQeAasPUcruM6BYpm0yP5/6Jj8
 sghSfBMikTewL4OTqkQqHfKFvmij5ML2HCj20eUBck5ifMtkR7+UOserzBsuoz1MFUOO
 uBXRGQUVNvAS+59RwSlu/NXEOYnWen6uSqo1ZV6djgBaEDkvWYV8dnB2X9sn/nXxVY+j
 0kH7Yqgk1XpP+T6Q06dj8IYOuEmU8Z2/TmdZp0sX23WTMaDamvAuhUqFoKrM1sEo/hYM
 Kv3sCxROC34Ba9latBkFiypwIJVA6xwZpsop7objtT8qkdbRmWtDVwIknPEAC4tzgCux
 mMQw==
X-Gm-Message-State: AO0yUKXPV1mtwXgzrX9NidQJ3uja1CnjfeF0ttHMXtPUHDwO5oUB9/pT
 Mm7vLkL6FMibqgd0wiTgR0h0Og==
X-Google-Smtp-Source: AK7set/TYjE8e3MR4nPsemIxxy7S9bR+y+UDF5cuUBAEnsB1IjUPY2PM5FrPkE1PnklRgpy5SpB9jg==
X-Received: by 2002:a17:903:2290:b0:19c:dbce:dce8 with SMTP id
 b16-20020a170903229000b0019cdbcedce8mr9389284plh.15.1678009360281; 
 Sun, 05 Mar 2023 01:42:40 -0800 (PST)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a170902d20300b0019adbef6a63sm4448469ply.235.2023.03.05.01.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 01:42:39 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/2] target/riscv: Expose "virt" register for GDB for reads
Date: Sun,  5 Mar 2023 09:42:28 +0000
Message-Id: <20230305094231.1616-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Sun, 05 Mar 2023 09:42:44 -0000

This patch enables a debugger to read current virtualization mode via
virtual "virt" register. After it, we could get full current privilege
mode via both "priv" and "virt" register.

Extend previous commit ab9056ff9bdb3f95db6e7a666d10522d289f14ec to
support H-extension.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 gdb-xml/riscv-32bit-virtual.xml |  1 +
 gdb-xml/riscv-64bit-virtual.xml |  1 +
 target/riscv/gdbstub.c          | 12 ++++++++----
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtual.xml
index 905f1c555d..d44b6ca2dc 100644
--- a/gdb-xml/riscv-32bit-virtual.xml
+++ b/gdb-xml/riscv-32bit-virtual.xml
@@ -8,4 +8,5 @@
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.virtual">
   <reg name="priv" bitsize="32"/>
+  <reg name="virt" bitsize="32"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtual.xml
index 62d86c237b..7c9b63d5b6 100644
--- a/gdb-xml/riscv-64bit-virtual.xml
+++ b/gdb-xml/riscv-64bit-virtual.xml
@@ -8,4 +8,5 @@
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.virtual">
   <reg name="priv" bitsize="64"/>
+  <reg name="virt" bitsize="64"/>
 </feature>
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 6048541606..1755fd9d51 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -187,13 +187,17 @@ static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
 
 static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
 {
-    if (n == 0) {
 #ifdef CONFIG_USER_ONLY
+    if (n >= 0 && n <= 1) {
         return gdb_get_regl(buf, 0);
+    }
 #else
+    if (n == 0) {
         return gdb_get_regl(buf, cs->priv);
-#endif
+    } else if (n == 1) {
+        return gdb_get_regl(buf, riscv_cpu_virt_enabled(cs));
     }
+#endif
     return 0;
 }
 
@@ -328,13 +332,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     case MXL_RV32:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
                                  riscv_gdb_set_virtual,
-                                 1, "riscv-32bit-virtual.xml", 0);
+                                 2, "riscv-32bit-virtual.xml", 0);
         break;
     case MXL_RV64:
     case MXL_RV128:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
                                  riscv_gdb_set_virtual,
-                                 1, "riscv-64bit-virtual.xml", 0);
+                                 2, "riscv-64bit-virtual.xml", 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.17.1


