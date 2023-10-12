Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD0CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:47:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqypN-0000U0-4a; Thu, 12 Oct 2023 12:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypL-0000TJ-P9
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:23 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypJ-0004aJ-PR
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-690bd59322dso929220b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 09:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697129180; x=1697733980; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kbiL7XRqM58601ZYE3/9TMgvUQo8Pg37nN1Viu1U70=;
 b=BDiu2F1iKHRhV3NmL/N4tMsOcLOo02TPVkDc2pDOSxZXM44liesa69VfhGMZxTm2WJ
 tadO2xUNWAGbw6eryQCufsq3lfb2JBYZQBz+vTsUlX+s3y6uEyf8bnNva+dGqpSddNRk
 pO0SEjewGzkewZyDYz2UX0/laQCikZk1A1vhGYR1DoeyRXdC6eZte845jTILe+YJZiar
 dd60m7RsoyQv9t9DFZPX7Z2UFFgO14JGQ60j3movak9nT9QQuwGfaXQdAP55Eq1cTL7G
 fj6TvPhrPRvPcvpRzeht+PmIdirZRljG3iBF8ECKDj4XBVk7+iT4xqjAZuTUtmzBSLaO
 SM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129180; x=1697733980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kbiL7XRqM58601ZYE3/9TMgvUQo8Pg37nN1Viu1U70=;
 b=gCdo9dpp+e/tkA9vFLwwOluCTRhwTv75XN7xlGgTs1fkDjmmAU89IrxzcnFLnYEz9R
 uFdcAUn+Cih3nrtFW/KdCntz3nHqvt1FrlZmQJRvlM8yA2gv8qgx2Ukwy1uHRuRLWWOF
 oa5BQWc9BD6td8I2tFDxv/hWUyP9uC0J5qyRhpmd1Q9pu1seZqYYWKmdVO8ql8DlUZMn
 KijYunFCifWxUbEz0BDAbfPY/ZlG3rQELRCjiZgMtFOo9bpJv5hppWnxB+oYcm5jfQrm
 W7ou42yJXLXofW+ZIEXM8+Q4eegiGIe2oBqxwJKyAF0k+1WQquGeT8ZKiH4Kj67s1Kq9
 yJgQ==
X-Gm-Message-State: AOJu0Yzrs5FzVPTUj4BTUd3eTc5JlctV6bdWr6Yg+YMcVgjkivTPMMKc
 TnwmVKUCIKwk6feG0w6E7MmmGw==
X-Google-Smtp-Source: AGHT+IG2YbpdcTivgqoar+K+DGpdA1XTyakpe4VK8U9GVVNz+DGEpoMYURmuwdHWQng25U3YgOMPmg==
X-Received: by 2002:a05:6a00:1a92:b0:690:bdda:7c35 with SMTP id
 e18-20020a056a001a9200b00690bdda7c35mr26329423pfv.1.1697129180398; 
 Thu, 12 Oct 2023 09:46:20 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 g5-20020aa78185000000b0068feb378b89sm12416805pfi.171.2023.10.12.09.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:46:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/4] target/riscv: rename ext_icbom to ext_zicbom
Date: Thu, 12 Oct 2023 13:46:03 -0300
Message-ID: <20231012164604.398496-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012164604.398496-1-dbarboza@ventanamicro.com>
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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
of zicbom they're more likely to do 'grep -i zicbom' than 'grep -i
icbom'.

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
index 9de578c756..54e0fe8ecc 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -263,7 +263,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
 
-        if (cpu_ptr->cfg.ext_icbom) {
+        if (cpu_ptr->cfg.ext_zicbom) {
             qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
                                   cpu_ptr->cfg.cbom_blocksize);
         }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fdbbafe7b3..c9020653cd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -76,7 +76,7 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
  * instead.
  */
 const RISCVIsaExtData isa_edata_arr[] = {
-    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
+    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
@@ -497,7 +497,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
     cpu->cfg.ext_zifencei = true;
     cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
-    cpu->cfg.ext_icbom = true;
+    cpu->cfg.ext_zicbom = true;
     cpu->cfg.cbom_blocksize = 64;
     cpu->cfg.cboz_blocksize = 64;
     cpu->cfg.ext_icboz = true;
@@ -1284,7 +1284,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zhinx", ext_zhinx, false),
     MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
 
-    MULTI_EXT_CFG_BOOL("zicbom", ext_icbom, true),
+    MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
     MULTI_EXT_CFG_BOOL("zicboz", ext_icboz, true),
 
     MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 9ea30da7e0..e6bef0070f 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -63,7 +63,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_zifencei;
     bool ext_zicsr;
-    bool ext_icbom;
+    bool ext_zicbom;
     bool ext_icboz;
     bool ext_zicond;
     bool ext_zihintntl;
diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/insn_trans/trans_rvzicbo.c.inc
index e5a7704f54..e6ed548376 100644
--- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
+++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
@@ -16,10 +16,10 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#define REQUIRE_ZICBOM(ctx) do {    \
-    if (!ctx->cfg_ptr->ext_icbom) { \
-        return false;               \
-    }                               \
+#define REQUIRE_ZICBOM(ctx) do {     \
+    if (!ctx->cfg_ptr->ext_zicbom) { \
+        return false;                \
+    }                                \
 } while (0)
 
 #define REQUIRE_ZICBOZ(ctx) do {    \
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 090d617627..ad48c9bf30 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -213,7 +213,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
      .kvm_reg_id = _reg_id}
 
 static KVMCPUConfig kvm_multi_ext_cfgs[] = {
-    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
+    KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
     KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
     KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
@@ -804,7 +804,7 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
         kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
     }
 
-    if (cpu->cfg.ext_icbom) {
+    if (cpu->cfg.ext_zicbom) {
         kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
     }
 
@@ -897,7 +897,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
         kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
     }
 
-    if (cpu->cfg.ext_icbom) {
+    if (cpu->cfg.ext_zicbom) {
         kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
     }
 
-- 
2.41.0


