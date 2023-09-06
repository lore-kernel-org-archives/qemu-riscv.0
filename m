Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF18EB8FAD
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:20:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdofx-0004Yz-69; Wed, 06 Sep 2023 05:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofP-0003lo-SR
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:54 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofK-0005ph-SE
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:41 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c4c5375329so2608713fac.2
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991858; x=1694596658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpZa0iWCJ6Q3Y42umjT0f9ZHtNXPSNR12/TkaEKqKow=;
 b=ILvA0U/8Nc7bMgPFZLahyM2zoKCdSG6YDTQHRc4+uJ3bvLJ1zQeFO/x62R/sc0gafh
 fBnemxDQou56YehX5hrN04lD3B905p6EG1CZD7UKiVp1fa3TvXUE6AcRy4fqJlHDKKRv
 LWVHThJsMgAD2ppwDuokVvaVuBKxelDrIAgumXmGGV+Oj0QakjXOEmaOTbd1B3iI+WMN
 MC/ZmKnrKwlO1D0lYCHjl8i/iyNvadkRiWxQKywfR05g3LgC2bTs/VJJG+gSVPXkmZoM
 fk596ONNtkK4RqNmyFU3Zh99eUcBg4hf7WQnRyF84nqy0VhXHAXltaIekFQAe8cb+Sh0
 Ajlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991858; x=1694596658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpZa0iWCJ6Q3Y42umjT0f9ZHtNXPSNR12/TkaEKqKow=;
 b=MnbmmlVOiF39gmr9v7kmb0PK1kuO/LgfVoXKflJbdHvS+n/ipJ+3TWSbtzttXsG4Vw
 sbrJ3lWwmzlxB9xY2LV/9AmoU50ZqGdMZoTEnOilhL/ggoota7ZWGqHnHZbFhyicYVhF
 1NW/tEc1OZeLxG+zdeoWlj5avm6jT3H4Lvbo2M3d+y010c7YL3+WmD+zWfnxVeBUTqEa
 a6SJc+GS5qDe+C+VIslnkTyzL1npGh3hQRiB2wMssf4QHgzjrEZ+BIEmldTbJTzK4fxd
 Fg7He8/Up79s5B9Uz83Bk8MdUrZ5IGFPGKJSs8F0Z7SxaVAaiWXWO+2PM/FLRRbvoy9z
 9qrw==
X-Gm-Message-State: AOJu0Yw+37MDAp7WY/fHz3gUJ+vBYzxOylsABKiFgS0lecc0REbmcoUe
 hC+0ppKu8HdhdCEsPPjys+0IC16OWL714K6/Eq4=
X-Google-Smtp-Source: AGHT+IGHthC/FNruDYmwhtA3VWtemvpQlUJp6+ZdMThpsvOy+eASv/fzqR5p6qNaENpDwj22GrtzCg==
X-Received: by 2002:a05:6870:b48c:b0:1c8:cb3c:8866 with SMTP id
 y12-20020a056870b48c00b001c8cb3c8866mr18087379oap.46.1693991857528; 
 Wed, 06 Sep 2023 02:17:37 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:17:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 13/19] target/riscv/kvm: do not use
 riscv_cpu_add_misa_properties()
Date: Wed,  6 Sep 2023 06:16:40 -0300
Message-ID: <20230906091647.1667171-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

riscv_cpu_add_misa_properties() is being used to fill the missing KVM
MISA properties but it is a TCG helper that was adapted to do so. We'll
move it to tcg-cpu.c in the next patches, meaning that KVM needs to fill
the remaining MISA properties on its own.

Do not use riscv_cpu_add_misa_properties(). Let's create a new array
with all available MISA bits we support that can be read by KVM. The
array is zero terminate to allow us to iterate through it without
knowing its size.

Then, inside kvm_riscv_add_cpu_user_properties(), we'll create all KVM
MISA properties as usual and then use this array to add any missing MISA
properties with the riscv_cpu_add_kvm_unavail_prop() helper.

Note that we're creating misa_bits[], and not using the existing
'riscv_single_letter_exts[]', because the latter is tuned for riscv,isa
related functions and it doesn't have all MISA bits we support. Commit
0e2c377023 ("target/riscv: misa to ISA string conversion fix") has the
full context.

While we're at it, move both satp and the multi-letter extension
properties to kvm_riscv_add_cpu_user_properties() as well.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c         |  2 ++
 target/riscv/cpu.h         |  3 ++-
 target/riscv/kvm/kvm-cpu.c | 22 ++++++++++++++--------
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 51567c2f12..665c21af6a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,6 +38,8 @@
 
 /* RISC-V CPU definitions */
 static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
+const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
+                              RVC, RVS, RVU, RVH, RVJ, RVG, 0};
 
 struct isa_ext_data {
     const char *name;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 950c2301f2..24d12a9503 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -43,7 +43,7 @@
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /*
- * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
+ * Update misa_bits[], misa_ext_info_arr[] and misa_ext_cfgs[]
  * when adding new MISA bits here.
  */
 #define RVI RV('I')
@@ -60,6 +60,7 @@
 #define RVJ RV('J')
 #define RVG RV('G')
 
+extern const uint32_t misa_bits[];
 const char *riscv_get_misa_ext_name(uint32_t bit);
 const char *riscv_get_misa_ext_description(uint32_t bit);
 
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 492b97d19b..44eff1e544 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -394,6 +394,8 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
 
+    riscv_add_satp_mode_properties(cpu_obj);
+
     for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
         KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
         int bit = misa_cfg->offset;
@@ -409,6 +411,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                                         misa_cfg->description);
     }
 
+    for (i = 0; misa_bits[i] != 0; i++) {
+        const char *ext_name = riscv_get_misa_ext_name(misa_bits[i]);
+        riscv_cpu_add_kvm_unavail_prop(cpu_obj, ext_name);
+    }
+
     for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
         KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
 
@@ -425,6 +432,10 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
     object_property_add(cpu_obj, "cboz_blocksize", "uint16",
                         NULL, kvm_cpu_set_cbomz_blksize,
                         NULL, &kvm_cboz_blocksize);
+
+    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
+    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
+    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
@@ -799,7 +810,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
     }
 }
 
-static void riscv_init_user_properties(Object *cpu_obj)
+static void riscv_init_kvm_registers(Object *cpu_obj)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_obj);
     KVMScratchCPU kvmcpu;
@@ -808,7 +819,6 @@ static void riscv_init_user_properties(Object *cpu_obj)
         return;
     }
 
-    kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
     kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
@@ -1280,13 +1290,9 @@ static void kvm_cpu_instance_init(CPUState *cs)
     Object *obj = OBJECT(RISCV_CPU(cs));
     DeviceState *dev = DEVICE(obj);
 
-    riscv_init_user_properties(obj);
-    riscv_add_satp_mode_properties(obj);
-    riscv_cpu_add_misa_properties(obj);
+    riscv_init_kvm_registers(obj);
 
-    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
-    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
-    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
+    kvm_riscv_add_cpu_user_properties(obj);
 
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if we have a specific KVM handler for the option */
-- 
2.41.0


