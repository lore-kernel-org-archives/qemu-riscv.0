Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6B9CE7AB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:59:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpqJ-0000oB-M1; Mon, 25 Sep 2023 13:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqI-0000n3-4b
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:58 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpqG-0002Ee-EK
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:57 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-578a91aca06so5423018a12.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664675; x=1696269475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nj6OwZ0oE0h4rMXiVHPydgLZMcuLmtXGaJHicDsuVXw=;
 b=ORm8a7Iq2vZ3lEcZt6iqLSQmEfyrjgTidrlGC/Nr5p8KbefxAWJXp8uVewBsrTvPCK
 ay4uujoCofvoNOZPO9UXB2XckCRrV7X+j6WfQvJN5RzygOBE7C/PsY8VfgqsMDAic6OI
 omcBLGg+7QyDmHwmTGqrpeO3sLTKwCl6y+CspCcGZfjz/Mym88mJfG+QOFKf/FgqpI/p
 Qmshok11x54mdykWzvPNHyXv1+86MvMeAhBiBCW8+1OwYGvM8IhzX5qX2wrNtpdkMAEI
 fvl0J8Gu/pXzPe5YZPTVqZrwtj936l1s3xBoxvGLLPVSvcR9Zds+AOmA4LuXhX817YOG
 fZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664675; x=1696269475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nj6OwZ0oE0h4rMXiVHPydgLZMcuLmtXGaJHicDsuVXw=;
 b=ppuETL6IgxkRkk6sJNunp5wOOi+b9QGahV53Vx8f92rpLc99nFr1EOFEUIGHrJgTqx
 50geq1FTYfChk7t4u2h1l+1xZ2GiTOZ0yg3JE3CP+J1FTLx357Mr1hFsjEryzAeILN4q
 2b6WPDnXb7oejA2wXsHjej6h0kE7TOb+b+yZlo8u4h1WZhJlwdRcIhT8mowuTyrZB/oA
 X+lbu+g/htwLWBQfpeNyNRuQQvO4GonxJe36wj1UnYAc2t0j2W7RJpMmB51AQMCGFyWv
 eNR6QEuqSC837CA96M+W45//xJUiyeQAcpfwVwsDpXz/sNlm6tyaXuffeoYH8KY2j2cq
 m8cw==
X-Gm-Message-State: AOJu0YyKfs01QK2I77x27Jh6Hg0JAxoFlgRxLN7cu58oOxYxfMoySMLR
 ykSWrJulJSU39NNf6bKOQcxjhQ==
X-Google-Smtp-Source: AGHT+IGHxaEXSpVbMzMCIkxeFifiXfeomVP0AtXIvsDQw8khkK6HoIWExeo1mNy3UfJnTlNbIVv2Nw==
X-Received: by 2002:a17:90b:4f83:b0:263:f630:228f with SMTP id
 qe3-20020a17090b4f8300b00263f630228fmr7409021pjb.23.1695664675231; 
 Mon, 25 Sep 2023 10:57:55 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 13/19] target/riscv/kvm: do not use
 riscv_cpu_add_misa_properties()
Date: Mon, 25 Sep 2023 14:57:03 -0300
Message-ID: <20230925175709.35696-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52b.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index cb13464ba6..7235eafc1a 100644
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
index 606fdab223..c6615cb807 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -396,6 +396,8 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
 
+    riscv_add_satp_mode_properties(cpu_obj);
+
     for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
         KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
         int bit = misa_cfg->offset;
@@ -411,6 +413,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                                         misa_cfg->description);
     }
 
+    for (i = 0; misa_bits[i] != 0; i++) {
+        const char *ext_name = riscv_get_misa_ext_name(misa_bits[i]);
+        riscv_cpu_add_kvm_unavail_prop(cpu_obj, ext_name);
+    }
+
     for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
         KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
 
@@ -427,6 +434,10 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
     object_property_add(cpu_obj, "cboz_blocksize", "uint16",
                         NULL, kvm_cpu_set_cbomz_blksize,
                         NULL, &kvm_cboz_blocksize);
+
+    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
+    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
+    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
@@ -801,7 +812,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
     }
 }
 
-static void riscv_init_user_properties(Object *cpu_obj)
+static void riscv_init_kvm_registers(Object *cpu_obj)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_obj);
     KVMScratchCPU kvmcpu;
@@ -810,7 +821,6 @@ static void riscv_init_user_properties(Object *cpu_obj)
         return;
     }
 
-    kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
     kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
@@ -1324,13 +1334,9 @@ static void kvm_cpu_instance_init(CPUState *cs)
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


