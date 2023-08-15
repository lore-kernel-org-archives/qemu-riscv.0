Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC5C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:37:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0mV-0006N4-F5; Tue, 15 Aug 2023 16:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mU-0006Mo-Um
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:36:46 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mS-0000z6-Mh
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:36:46 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bd0425ad4fso4867525a34.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692131803; x=1692736603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0dU/wef67XGoB0gAFv8TUXnVp8TlOWHmFk+0Sr/Zmg=;
 b=Cr7hx77/wBXlh15wIOHXOVdO8psf/5VOzxKC5ljS0bnmqSowc+PM7UwcG4gD4SkgYX
 E9AA38rJ7lx288YQgtSSqjwCVBO5qkBc1RcwxGiZiBndRHOk96Ni3W9l9qBNTzMFQSIb
 f9q2YhW61chzwB45BddCrOlVNBSNjlqage3x3eUK4LyL892cD9FjWI/urRhqj7Rs/fQM
 729YbdRifbIl5C3Wg2IZUFwsmRb2CrrHHRHkEkIAyMCM+2AcpAKFnA7mxx9BIdNci8Ai
 YQh+8oNz/XGK+DVLERrIAJrFUtotmSrZTTnqNToBL9gPcTzB9lGcXGBBwpSmhRNUiKnU
 extw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692131803; x=1692736603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0dU/wef67XGoB0gAFv8TUXnVp8TlOWHmFk+0Sr/Zmg=;
 b=PjChfnddyeZ3oI/8xQhRbsGKE6lhI0C9edqoJcIvOEM1MbLaZ2RdN+Xa8PsKAMw/nT
 ui0DDvdtI+0FSvANgodqcBjCWh4ntQvbxKgHC8JFovl19lq10O7tW4UQWg8yG4zu8sv4
 B2xHBZXWuFLoVgLbMO8thLCTduMsD3fduE02lO8K6+PPkm6AFMi0d3f7mSDhpUWelybV
 LsJr+wegNJKv/PPWtyQEW5+ywzL5mPDn/O+L7Khr+Yd+LVwQ4ewAXeZdcTcf4g7YWpbv
 jHFRoG/jY98KpQS9AdS7PKwEbEs1e6OJq5Kg2pvTfd2rs+fl0UF3kN5DhG755F/lTM8z
 LMrw==
X-Gm-Message-State: AOJu0YwrTRYp5l7o7UrpNXA9puOlc3U59tYmOIsE/yL3vXtVxBjXWRHB
 pM4o/TMtfvKG/2NBJyBtwBaQww==
X-Google-Smtp-Source: AGHT+IEC3Ma9pkFBQ1vGIDxJxdOGkyUpUYRYH4YAQEM1q509Tpd5dUI8aa2sfCiGF75VzVVP6hn2hQ==
X-Received: by 2002:a9d:7e91:0:b0:6bc:b80c:bd53 with SMTP id
 m17-20020a9d7e91000000b006bcb80cbd53mr12222675otp.38.1692131803630; 
 Tue, 15 Aug 2023 13:36:43 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a0568301bcf00b006b94fb2762asm5526849ota.23.2023.08.15.13.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:36:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/8] target/riscv/cpu.c: use offset in
 isa_ext_is_enabled/update_enabled
Date: Tue, 15 Aug 2023 17:36:28 -0300
Message-ID: <20230815203635.400179-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815203635.400179-1-dbarboza@ventanamicro.com>
References: <20230815203635.400179-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

We'll have future usage for a function where, given an offset of the
struct RISCVCPUConfig, the flag is updated to a certain val.

Change all existing callers to use edata->ext_enable_offset instead of
'edata'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3930c85341..d78afe99f1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -151,18 +151,17 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
-static bool isa_ext_is_enabled(RISCVCPU *cpu,
-                               const struct isa_ext_data *edata)
+static bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
 {
-    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+    bool *ext_enabled = (void *)&cpu->cfg + ext_offset;
 
     return *ext_enabled;
 }
 
-static void isa_ext_update_enabled(RISCVCPU *cpu,
-                                   const struct isa_ext_data *edata, bool en)
+static void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset,
+                                   bool en)
 {
-    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+    bool *ext_enabled = (void *)&cpu->cfg + ext_offset;
 
     *ext_enabled = en;
 }
@@ -1023,9 +1022,10 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
 
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
+        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset) &&
             (env->priv_ver < isa_edata_arr[i].min_version)) {
-            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+            isa_ext_update_enabled(cpu, isa_edata_arr[i].ext_enable_offset,
+                                   false);
 #ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
                         " because privilege spec version does not match",
@@ -2274,7 +2274,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset)) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.41.0


