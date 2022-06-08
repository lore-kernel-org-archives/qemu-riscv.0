Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyyLE-0007Kx-PB
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 12:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyLD-0007H6-7J
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 12:15:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyLB-0002hv-78
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 12:15:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e24so19062208pjt.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F1BlHwxHbfY/C4222yO65hgm4xlwPThU0/mCoqEm5qw=;
 b=UQdfvxepNyvUtrQEbyH92tFvMYraH62ntQjbdgP+mQ5G/bt6lBGTsNihWlEbGd7oyk
 vrOtbonkdsohQcDm4URi4/fNPWi/o0ge05K5GmWO23uPD8QeFwx/STLiTXog58B3ND90
 w7tc6eC8HCBJyZF6lE9CAUtVLsb1ejKxt/jfATZyyOBSiMyKL9qyja9Aq843HeKFNHVF
 GoeK1nXWNCWViK6CaWLO6/gF+s3dd1owISCFq6NkNdXP/OKaKcMwck8rHx05yz1bvsYV
 8qBOTh5oxhbHDu2bNvzuBBqKmf40o+xb5XZuhQyXwU/Y3F4YHxWLLNirU+VJMsemz+iJ
 99yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1BlHwxHbfY/C4222yO65hgm4xlwPThU0/mCoqEm5qw=;
 b=wZkJnukZSAgnDl892DSN+zcQ/Hpw23YBJM7Ila6vct5MXQl6QHdEUmWZEOl2mAxnBd
 hSioOUoXM6s1k5gRj6qRNUB2gMs1F1kkVZPXI/gCCTnoGJ05vMn+t3UZOYq+st7W29Ot
 rtk24Fseng1REo7T4mlB1zLRaCpUuufv/54OfoY7H4PY5myVcHp7sZ7OTIfOOHn+OYnS
 ygPtdSbYUSpvLtcFls2N1ycSbFD8GgbrOP67fMvO+HWLaCUWaKvdGWE6e+KcmFbITdNw
 o5PAu3j68866iRrnC0BDRueAsxh3+q5H8IvdIgc9deu3Bjr/0tv6UDZqlShFTFl8bbaE
 wFSg==
X-Gm-Message-State: AOAM532PxN2kVOdMT0h32SWaSeayG9N3kZCZF6JjqmaMwAoK5X+2Yla9
 j5ICIsn4btiSHSg/YvJ6sfAs978l57vUyw==
X-Google-Smtp-Source: ABdhPJyxQOCk/9yu9p/UlBCh8UNMTWuhkJKp0RaoLZBBKGJ8bCjYLyV4V11vlL5vC39gq7HJGfxlTQ==
X-Received: by 2002:a17:902:ab87:b0:162:26cf:bf7a with SMTP id
 f7-20020a170902ab8700b0016226cfbf7amr34179234plr.168.1654704927858; 
 Wed, 08 Jun 2022 09:15:27 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.162.103.97])
 by smtp.gmail.com with ESMTPSA id
 k189-20020a6384c6000000b003fcde69fea5sm13374843pgd.81.2022.06.08.09.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:15:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 4/4] target/riscv: Force disable extensions if priv spec
 version does not match
Date: Wed,  8 Jun 2022 21:44:05 +0530
Message-Id: <20220608161405.729964-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608161405.729964-1-apatel@ventanamicro.com>
References: <20220608161405.729964-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Jun 2022 16:15:31 -0000

We should disable extensions in riscv_cpu_realize() if minimum required
priv spec version is not satisfied. This also ensures that machines with
priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
extensions.

Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
device tree")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 57 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9f9c27a3f5..953ba2e445 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -43,9 +43,13 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
     const char *name;
-    bool enabled;
+    int min_version;
+    bool *enabled;
 };
 
+#define ISA_EDATA_ENTRY(name, prop) {#name, PRIV_VERSION_1_10_0, &cpu->cfg.prop}
+#define ISA_EDATA_ENTRY2(name, min_ver, prop) {#name, min_ver, &cpu->cfg.prop}
+
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
   "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -513,8 +517,42 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = -1;
+    int i, priv_version = -1;
     Error *local_err = NULL;
+    struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY2(h, PRIV_VERSION_1_12_0, ext_h),
+        ISA_EDATA_ENTRY2(v, PRIV_VERSION_1_12_0, ext_v),
+        ISA_EDATA_ENTRY2(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
+        ISA_EDATA_ENTRY2(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+        ISA_EDATA_ENTRY2(zfh, PRIV_VERSION_1_12_0, ext_zfh),
+        ISA_EDATA_ENTRY2(zfhmin, PRIV_VERSION_1_12_0, ext_zfhmin),
+        ISA_EDATA_ENTRY2(zfinx, PRIV_VERSION_1_12_0, ext_zfinx),
+        ISA_EDATA_ENTRY2(zdinx, PRIV_VERSION_1_12_0, ext_zdinx),
+        ISA_EDATA_ENTRY2(zba, PRIV_VERSION_1_12_0, ext_zba),
+        ISA_EDATA_ENTRY2(zbb, PRIV_VERSION_1_12_0, ext_zbb),
+        ISA_EDATA_ENTRY2(zbc, PRIV_VERSION_1_12_0, ext_zbc),
+        ISA_EDATA_ENTRY2(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
+        ISA_EDATA_ENTRY2(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
+        ISA_EDATA_ENTRY2(zbkx, PRIV_VERSION_1_12_0, ext_zbkx),
+        ISA_EDATA_ENTRY2(zbs, PRIV_VERSION_1_12_0, ext_zbs),
+        ISA_EDATA_ENTRY2(zk, PRIV_VERSION_1_12_0, ext_zk),
+        ISA_EDATA_ENTRY2(zkn, PRIV_VERSION_1_12_0, ext_zkn),
+        ISA_EDATA_ENTRY2(zknd, PRIV_VERSION_1_12_0, ext_zknd),
+        ISA_EDATA_ENTRY2(zkne, PRIV_VERSION_1_12_0, ext_zkne),
+        ISA_EDATA_ENTRY2(zknh, PRIV_VERSION_1_12_0, ext_zknh),
+        ISA_EDATA_ENTRY2(zkr, PRIV_VERSION_1_12_0, ext_zkr),
+        ISA_EDATA_ENTRY2(zks, PRIV_VERSION_1_12_0, ext_zks),
+        ISA_EDATA_ENTRY2(zksed, PRIV_VERSION_1_12_0, ext_zksed),
+        ISA_EDATA_ENTRY2(zksh, PRIV_VERSION_1_12_0, ext_zksh),
+        ISA_EDATA_ENTRY2(zkt, PRIV_VERSION_1_12_0, ext_zkt),
+        ISA_EDATA_ENTRY2(zve32f, PRIV_VERSION_1_12_0, ext_zve32f),
+        ISA_EDATA_ENTRY2(zve64f, PRIV_VERSION_1_12_0, ext_zve64f),
+        ISA_EDATA_ENTRY2(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
+        ISA_EDATA_ENTRY2(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+        ISA_EDATA_ENTRY2(svinval, PRIV_VERSION_1_12_0, ext_svinval),
+        ISA_EDATA_ENTRY2(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
+        ISA_EDATA_ENTRY2(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    };
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -541,6 +579,17 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (*isa_edata_arr[i].enabled &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            *isa_edata_arr[i].enabled = false;
+            warn_report("disabling %s extension for hart 0x%lx because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
+        }
+    }
+
     if (cpu->cfg.mmu) {
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
@@ -1011,8 +1060,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
-
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 {
     char *old = *isa_str;
@@ -1071,7 +1118,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].enabled) {
+        if (*isa_edata_arr[i].enabled) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.34.1


