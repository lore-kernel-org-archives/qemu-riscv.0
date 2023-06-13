Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57426EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9B7W-0002CU-U2; Tue, 13 Jun 2023 17:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7W-0002Bt-4S
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 17:00:06 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7T-0006nY-3M
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 17:00:05 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-39c82204e62so3111650b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 14:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686690000; x=1689282000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYaVWv8GHKldx7H8e2qrZO0GFJvC2VkmhQVsLqD8/jI=;
 b=fQ2Tqpx2VNvGWbu4GUvZblWxIwTN6Tbuqoy/Enq4ZaYi7Oya28MZfuxzQvEHjTaSZC
 zCtyXJIJ421npX5PbfQYgWw6Cn8nFwTneRlROVJaHbr2PEFlmxBIrHS09gdbtl5Xz3Wg
 1NqVGZxLN5Q2+TvfIqLvRcny+T636fuQFo2UAJyP87gQX+0sGyNkJI0wxVPujpvTxUMX
 QJ1Tm4RTvZn5lndGKQxCUj5V8Ka3rckdXBks8l5nqLBwuUpHeg2LMqKNqUbYoc5cXhjF
 0DKjHYViV0AZUioe3SnmTgZ1NkzwTR9S5a/HEXQAYYMjcN96s2MFBoXv2nAqxqKHXIDU
 FCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686690000; x=1689282000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYaVWv8GHKldx7H8e2qrZO0GFJvC2VkmhQVsLqD8/jI=;
 b=hDY45jFDKbgvafzrAYpvpHcdOCrNIh+H7z8XXsV1/o0fMlbNAiB0lGaV4MCBuTmHpr
 3Jidjw9ffbNtgN6O0QLL8JgprFnL53c8BHUOnqRAJ6ieim/tNArYrcE4E30t/i1ibMwI
 CCfGv2mqehJq41CVAkuNq/NGljnxf5TIuNEd4mzO8HEFiEOo4MDxXI2iVku3M3U0nuDw
 BX+5Rurt6b7ZzmeP7Y3jODbyefWh4bu6A0fJkwV2pEOHHTDVlfH9EzLejnN85KN/dtGl
 Z7z5FuUV2L9trJ5s2lnCDAzoD9X3vjICrqtAwHQkBza186hR1iieBabCxM7t5tue6dQb
 meUA==
X-Gm-Message-State: AC+VfDzFY/B8O/H8gRrHp1a5+LFKgI11on3yFFLld60Ri2MVYsLINNmc
 fxaijE18byO6SNJsAr9ctpK8Cg==
X-Google-Smtp-Source: ACHHUZ64PtxrDP/YEJKBBjfEgxQRJXUwSW2oNBfhqLHxqKMRJH7UUGs1cZh1xUBB1/V8gzPq7p6FZg==
X-Received: by 2002:a05:6808:1b06:b0:39a:be57:964b with SMTP id
 bx6-20020a0568081b0600b0039abe57964bmr10494933oib.13.1686690000077; 
 Tue, 13 Jun 2023 14:00:00 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 q82-20020acaf255000000b003982a8a1e3fsm5619514oih.51.2023.06.13.13.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:59:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 15/18] target/riscv: make riscv_isa_string_ext() KVM
 compatible
Date: Tue, 13 Jun 2023 17:58:54 -0300
Message-Id: <20230613205857.495165-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613205857.495165-1-dbarboza@ventanamicro.com>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The isa_edata_arr[] is used by riscv_isa_string_ext() to create the
riscv,isa DT attribute. isa_edata_arr[] is kept in sync with the TCG
property vector riscv_cpu_extensions[], i.e. all TCG properties from
this vector that has a riscv,isa representation are included in
isa_edata_arr[].

KVM doesn't implement all TCG properties, but allow them to be created
anyway to not force an API change between TCG and KVM guests. Some of
these TCG-only extensions are defaulted to 'true', and users are also
allowed to enable them. KVM doesn't care, but riscv_isa_string_ext()
does. The result is that these TCG-only enabled extensions will appear
in the riscv,isa DT string under KVM.

To avoid code repetition and re-use riscv_isa_string_ext() for KVM
guests we'll make a couple of tweaks:

- set env->priv_ver to 'LATEST' for the KVM 'host' CPU. This is needed
  because riscv_isa_string_ext() makes a priv check for each extension
  before including them in the ISA string. KVM doesn't care about
  env->priv_ver, since it's part of the TCG-only CPU validation, so this
  change is benign for KVM;

- add a new 'kvm_available' flag in isa_ext_data struct. This flag is
  set via a new ISA_EXT_DATA_ENTRY_KVM macro to report that, for a given
  extension, KVM also supports it. riscv_isa_string_ext() then can check
  if a given extension is known by KVM and skip it if it's not.

This will allow us to re-use riscv_isa_string_ext() for KVM guests.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a4f3ed0c17..a773c09645 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -44,11 +44,15 @@ struct isa_ext_data {
     const char *name;
     int min_version;
     int ext_enable_offset;
+    bool kvm_available;
 };
 
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
 
+#define ISA_EXT_DATA_ENTRY_KVM(_name, _min_ver, _prop) \
+    {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop), true}
+
 /*
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
@@ -68,14 +72,17 @@ struct isa_ext_data {
  *
  * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
  * instead.
+ *
+ * ISA_EXT_DATA_ENTRY_KVM() is used to indicate that the extension is
+ * also known by the KVM driver. If unsure, use ISA_EXT_DATA_ENTRY().
  */
 static const struct isa_ext_data isa_edata_arr[] = {
-    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
-    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
+    ISA_EXT_DATA_ENTRY_KVM(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
+    ISA_EXT_DATA_ENTRY_KVM(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
-    ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY_KVM(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, PRIV_VERSION_1_11_0, ext_zfhmin),
@@ -89,7 +96,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zcmp, PRIV_VERSION_1_12_0, ext_zcmp),
     ISA_EXT_DATA_ENTRY(zcmt, PRIV_VERSION_1_12_0, ext_zcmt),
     ISA_EXT_DATA_ENTRY(zba, PRIV_VERSION_1_12_0, ext_zba),
-    ISA_EXT_DATA_ENTRY(zbb, PRIV_VERSION_1_12_0, ext_zbb),
+    ISA_EXT_DATA_ENTRY_KVM(zbb, PRIV_VERSION_1_12_0, ext_zbb),
     ISA_EXT_DATA_ENTRY(zbc, PRIV_VERSION_1_12_0, ext_zbc),
     ISA_EXT_DATA_ENTRY(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
     ISA_EXT_DATA_ENTRY(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
@@ -114,13 +121,13 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
-    ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
+    ISA_EXT_DATA_ENTRY_KVM(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
-    ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
+    ISA_EXT_DATA_ENTRY_KVM(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
-    ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
+    ISA_EXT_DATA_ENTRY_KVM(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
-    ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY_KVM(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
@@ -586,6 +593,7 @@ static void riscv_host_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
 #endif
     riscv_cpu_add_user_properties(obj);
+    env->priv_ver = PRIV_VERSION_LATEST;
 }
 #endif
 
@@ -1981,6 +1989,10 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (riscv_running_kvm() && !isa_edata_arr[i].kvm_available) {
+            continue;
+        }
+
         if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
             isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
-- 
2.40.1


