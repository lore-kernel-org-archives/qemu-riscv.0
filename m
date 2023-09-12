Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A6BCA0ECA
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 13:29:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qg3Om-0003HW-KE; Tue, 12 Sep 2023 09:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Oe-0003BD-SS
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:43 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qg3Ob-0003wo-RM
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 09:25:39 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bf2427b947so3591859a34.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694525137; x=1695129937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPB8Q5NlppSdfi0+ut0VqBbWb9jhPK5yJP3ZV8PISZA=;
 b=VfPGlj7BlRMDptJXMKaVidxLQU1YigtRCqbbpeUe/3XIzWMPDb5X9wtXJXMCOhxWCn
 kLbjDtUa87zJiDfajkZZLCu6qyIVj85Ob8J3ki6mSIHVateU+QHwlaIQW6u2s9g/1QOn
 1UKWGBZ7jlBvku2fyOOVYzxkdZ5WMyvFWV77T7Lfmr/BhzKcSFSZbjSKUO5XmBkGiVmJ
 ZKv5PC9nFUORVqEt3//MPbwXKnj75Ho7TDIInhJEjokcZ2PK6suttrVTLaD+7W+ThIO2
 GGvWYcUIgjSMLBr1aC7Y2l3bvwMpPzZ4F6rqM6Ap/1tIdE5bi8NMVPC1oT8ILqxPykWm
 Avhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694525137; x=1695129937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPB8Q5NlppSdfi0+ut0VqBbWb9jhPK5yJP3ZV8PISZA=;
 b=ra97o8Mi67UfVRNxOmcTIFiOaruhrNu4miqoPsxWGoaeINzk1JrE6+dHlzV8As7gxG
 5LJ4wyi9C6oYdExvt829aPt6m2u1g5sPTRuJ5OFqfeHH+wdqikoo19PAOnNg9BIdnF1/
 sycMUNI93OCbM1R6Y45DG6xZQjtgiKeLLUqGqlfu8ibHkhmRauiIMHFEMPm/L/sxIBve
 WzufioZzaAAjU/BWUCJwJjXA6jQJbMS/SC+r8PvSBbe6w7eYkGuZ3qAtXq+j17EeBQZk
 CI43hu6n/7YvkQ5u6U/qXmI3Y4iDP+vpFGo3BWyF6X/abkwXChCV+YJvgGFCnLg3O6Ik
 FiFA==
X-Gm-Message-State: AOJu0YxlRMh3wEesgjG7LaJVTeH6ZWIOLVH1M/WZ4mSDd9cIKARW/Xr9
 GOqiXbU1MLctbqBL5VNKCwnJJQ==
X-Google-Smtp-Source: AGHT+IFdjUm0n8gxVj5bYVuzBQIS2+CuaAftPRD0m87+yhEvyXnbG4mGel3J7OYGQE6MJjNyzss9Yg==
X-Received: by 2002:a9d:66c7:0:b0:6bd:a47:7bb6 with SMTP id
 t7-20020a9d66c7000000b006bd0a477bb6mr11599710otm.14.1694525136853; 
 Tue, 12 Sep 2023 06:25:36 -0700 (PDT)
Received: from grind.. ([177.9.182.82]) by smtp.gmail.com with ESMTPSA id
 p15-20020a0568301d4f00b006af9d8af435sm3991255oth.50.2023.09.12.06.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 06:25:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v10 19/20] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
Date: Tue, 12 Sep 2023 10:24:22 -0300
Message-ID: <20230912132423.268494-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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

Add a new cpu_cfg_ext_is_user_set() helper to check if an extension was
set by the user in the command line. Use it inside
cpu_cfg_ext_auto_update() to verify if the user set a certain extension
and, if that's the case, do not change its value.

This will make us honor user choice instead of overwriting the values.
Users will then be informed whether they're using an incompatible set of
extensions instead of QEMU setting a magic value that works.

The reason why we're not implementing user choice for MISA extensions
right now is because, today, we do not silently change any MISA bit
during realize() time (we do warn when enabling bits if RVG is enabled).
We do that - a lot - with multi-letter extensions though, so we're
handling the most immediate concern first.

After this patch, we'll now error out if the user explicitly set 'zce' to true
and 'zca' to false:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64,zce=true,zca=false -nographic
qemu-system-riscv64: Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca extension

This didn't happen before because we were enabling 'zca' if 'zce' was enabled
regardless if the user set 'zca' to false.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b041d3c5db..fb8e4d6a8f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -195,6 +195,12 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
+{
+    return g_hash_table_contains(multi_ext_user_opts,
+                                 GUINT_TO_POINTER(ext_offset));
+}
+
 static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
                                     bool value)
 {
@@ -206,6 +212,10 @@ static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
         return;
     }
 
+    if (cpu_cfg_ext_is_user_set(ext_offset)) {
+        return;
+    }
+
     if (value && env->priv_ver != PRIV_VERSION_LATEST) {
         /* Do not enable it if priv_ver is older than min_version */
         min_version = cpu_cfg_ext_get_min_version(ext_offset);
@@ -1847,6 +1857,12 @@ static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
     MISA_CFG(RVG, false),
 };
 
+/*
+ * We do not support user choice tracking for MISA
+ * extensions yet because, so far, we do not silently
+ * change MISA bits during realize() (RVG enables MISA
+ * bits but the user is warned about it).
+ */
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 {
     int i;
-- 
2.41.0


