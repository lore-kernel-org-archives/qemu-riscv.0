Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF42ACDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:47:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqypP-0000V4-Aw; Thu, 12 Oct 2023 12:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypO-0000UI-Cs
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:26 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypM-0004ab-KU
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-694f3444f94so933626b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697129183; x=1697733983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D450GvVsUxyAWTsRT23YkGSGJwCkzWDn8dzA+f817Dw=;
 b=ZfvaGre9S0xOZTlm8xyy6Dl/yPAf0gLQbQkZzTW7JFMyKQ+ww9fjurfBGSQboWlFpO
 yKt1ERcEq/n9+Sh5uq9/C7MSWNOBmb61+ENZDgSq2RKCK7WrEjp7PKlpeokJ2Alg/ZXY
 hLuw17pNtGzF61SuXiVkKer/FORlYqxSBZqt/9JOA51ja2mNn69sYdZ+kq5nupj+0y0f
 7mDH2qOtN1w7XImoFkJhD1/iKOTgxAWr4wQJZKtt0lLippoCCUDWayOUMNmD5tpnDVwU
 dHDdSZw79zJMCHYcfLpcZw0dYkWpMvOxChHHnZoUuvn0UF1+Okitav9nGp7uNj20wBE5
 9Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129183; x=1697733983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D450GvVsUxyAWTsRT23YkGSGJwCkzWDn8dzA+f817Dw=;
 b=QrP2P8uTBfmUV/V23wfyNZvP4JKntyjB8CVAWhKljoxcDWTrMvduPk1GiGZ3yaR7O9
 SQPo7mpGrC7v8j4IgmbkmAF7LCO4JOa9aptuSypRMIX965ECzsZYzilFqf+onBiAxzpZ
 VsJ8F43eGtCdH0DFqzkj4mq2zc6jMXRyle1gsDtrb+s7Gwrbk4sGBHn2QiVZoM3qEJRd
 ekvTQI6G896yJGN49KHgdY4Z/mS2eQ35hsIOH0HJ8lh1NtXT9wS+utYIAw6oVUnF87OA
 KgZ059n1gUPzHao+iS4DwNmEIgY6Y9qqpCzl3bXdmVHZ2S2eUTB/FFcA+F303I3CVmqn
 M4Fw==
X-Gm-Message-State: AOJu0YwzeGbFd6b6VE5hraWMY9Rlc8DwKq0ygbCaIydaPZLxtUxy/C7v
 Az4l+vb0NMKAOUXatq/fagOwng==
X-Google-Smtp-Source: AGHT+IGvvy3+LipDm+XJOvnkGVgMAo2xAgPSgVjb8KLAlb/vW3u9Z2hvBhrQOTNqKf8egw1dC/rB8g==
X-Received: by 2002:a05:6a00:1506:b0:690:cd6e:8d38 with SMTP id
 q6-20020a056a00150600b00690cd6e8d38mr30695097pfu.25.1697129183439; 
 Thu, 12 Oct 2023 09:46:23 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 g5-20020aa78185000000b0068feb378b89sm12416805pfi.171.2023.10.12.09.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:46:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/4] target/riscv: rename ext_icboz to ext_zicboz
Date: Thu, 12 Oct 2023 13:46:04 -0300
Message-ID: <20231012164604.398496-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012164604.398496-1-dbarboza@ventanamicro.com>
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
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

Add a leading 'z' to improve grepping. When one wants to search for uses
of zicboz they're more likely to do 'grep -i zicboz' than 'grep -i
icboz'.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c                             | 2 +-
 target/riscv/cpu.c                          | 6 +++---
 target/riscv/cpu_cfg.h                      | 2 +-
 target/riscv/insn_trans/trans_rvzicbo.c.inc | 8 ++++----
 target/riscv/kvm/kvm-cpu.c                  | 6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 54e0fe8ecc..1732c42915 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -268,7 +268,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
                                   cpu_ptr->cfg.cbom_blocksize);
         }
 
-        if (cpu_ptr->cfg.ext_icboz) {
+        if (cpu_ptr->cfg.ext_zicboz) {
             qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cboz-block-size",
                                   cpu_ptr->cfg.cboz_blocksize);
         }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c9020653cd..46a256fccc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -77,7 +77,7 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
  */
 const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
-    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
+    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
@@ -500,7 +500,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     cpu->cfg.ext_zicbom = true;
     cpu->cfg.cbom_blocksize = 64;
     cpu->cfg.cboz_blocksize = 64;
-    cpu->cfg.ext_icboz = true;
+    cpu->cfg.ext_zicboz = true;
     cpu->cfg.ext_smaia = true;
     cpu->cfg.ext_ssaia = true;
     cpu->cfg.ext_sscofpmf = true;
@@ -1285,7 +1285,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
 
     MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
-    MULTI_EXT_CFG_BOOL("zicboz", ext_icboz, true),
+    MULTI_EXT_CFG_BOOL("zicboz", ext_zicboz, true),
 
     MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
 
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index e6bef0070f..208cac1c7c 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -64,7 +64,7 @@ struct RISCVCPUConfig {
     bool ext_zifencei;
     bool ext_zicsr;
     bool ext_zicbom;
-    bool ext_icboz;
+    bool ext_zicboz;
     bool ext_zicond;
     bool ext_zihintntl;
     bool ext_zihintpause;
diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
index e6ed548376..d5d7095903 100644
--- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
+++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
@@ -22,10 +22,10 @@
     }                                \
 } while (0)
 
-#define REQUIRE_ZICBOZ(ctx) do {    \
-    if (!ctx->cfg_ptr->ext_icboz) { \
-        return false;               \
-    }                               \
+#define REQUIRE_ZICBOZ(ctx) do {     \
+    if (!ctx->cfg_ptr->ext_zicboz) { \
+        return false;                \
+    }                                \
 } while (0)
 
 static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index ad48c9bf30..5695f2face 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -214,7 +214,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
 
 static KVMCPUConfig kvm_multi_ext_cfgs[] = {
     KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
-    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
+    KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
@@ -808,7 +808,7 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
         kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
     }
 
-    if (cpu->cfg.ext_icboz) {
+    if (cpu->cfg.ext_zicboz) {
         kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
     }
 }
@@ -901,7 +901,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
         kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
     }
 
-    if (cpu->cfg.ext_icboz) {
+    if (cpu->cfg.ext_zicboz) {
         kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
     }
 }
-- 
2.41.0


