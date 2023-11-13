Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E173C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:41:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2eeW-00067W-Oz; Mon, 13 Nov 2023 16:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeV-00067I-NT
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:27 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeU-0001Tq-5F
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:27 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5bd6ac9833fso3034102a12.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 13:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699911565; x=1700516365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cYVqzO8TRpxKmALsybQRSCPXQl71TGGunhIS2IHSCc=;
 b=X45pBnHA6nFygopiOOeSbPn5vRI0bA7SpRKGCpAqVpY4oDvUWBcuKWXZKag7eIn8gc
 vnuC2CwYG6o5NVnS8nSH9gPx8BfxGezN9Yl2z+jW5P5siCb0U2MaDGSlnQdlYmqyjrSM
 8zjSV0FRdT99ALwdIQ/taZA2OdnTsWRv0kK+rnjcH9jUqn/PpdcKYZsSq9psE/bo0DhZ
 PEqZrcxCd+DMLcLuHsdx2ZbdUAoaW70B1+HZIVDQY8tT5OtsM5Zn/PUGbfCTW8qHtLsf
 e6kTwlfXh5bb1XfG5OWSjcL2cbaj272uDzHHRmsQsC12lfyEQG9cwo4AMeYq2e+PfuNn
 Ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699911565; x=1700516365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cYVqzO8TRpxKmALsybQRSCPXQl71TGGunhIS2IHSCc=;
 b=snk761Z5eDxryNU/dj15o6BUUBOiDqy6zhu3lGu1rANX5aXFL/6BZT+FApTWucXETg
 XqCzYdUt/BB13YV9AZx6VE9SWEjYVorbOB0aiMYpm1bJ9vsaankjGi+U3Jsb/QAm5yz/
 XKr8fNzeYyGEcHd4SILR2W5XjnkXzjCCARoPbvIaSiYwy9z52vxsdh3u9SdkyuQprKQQ
 Sc7A/ZW7AiKHfn+4rj6n2lx7MP+IwdT9r4goEwblj2XJV0q0TO6W6afHthuheY5RvvPZ
 0uKo6DyEBu6L+unYhUPSfVK22uOjSk1tS233oU57frDAM+n72aGVx5khSXZNQ8L9ws4a
 Qs2g==
X-Gm-Message-State: AOJu0YzULa2XKyLF/+wKPgG+OB/Q7/PKC8JJLuGSluhSt06GUIrWOZDA
 k+q5oG0lJd/QGFU0ui9yLKClyQ==
X-Google-Smtp-Source: AGHT+IFEB5VUjapDjOSfyRlzTO8hykZtlUHg8/fUep3SZnlVzXLOBs3mMz7Fwmp0/x7QwlhrBUsM0Q==
X-Received: by 2002:a05:6a20:cea6:b0:185:a59a:d37d with SMTP id
 if38-20020a056a20cea600b00185a59ad37dmr5288314pzb.30.1699911564899; 
 Mon, 13 Nov 2023 13:39:24 -0800 (PST)
Received: from grind.. ([152.250.131.148]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b001c736746d33sm4455423plp.217.2023.11.13.13.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 13:39:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH for-9.0 3/6] target/riscv/tcg: update priv_ver on user_set
 extensions
Date: Mon, 13 Nov 2023 18:39:01 -0300
Message-ID: <20231113213904.185320-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113213904.185320-1-dbarboza@ventanamicro.com>
References: <20231113213904.185320-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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

We'll add a new bare CPU type that won't have any default priv_ver. This
means that the CPU will default to priv_ver = 0, i.e. 1.10.0.

At the same we'll allow these CPUs to enable extensions at will, but
then, if the extension has a priv_ver newer than 1.10, we'll end up
disabling it. Users will then need to manually set priv_ver to something
other than 1.10 to enable the extensions they want, which is not ideal.

Change the setter() of extensions to allow user enabled extensions to
bump the priv_ver of the CPU. This will make it convenient for users to
enable extensions for CPUs that doesn't set a default priv_ver.

This change does not affect any existing CPU: vendor CPUs does not allow
extensions to be enabled, and generic CPUs are already set to priv_ver
LATEST.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 304211169e..c63b2adb5b 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -114,6 +114,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
+                                            uint32_t ext_offset)
+{
+    int ext_priv_ver;
+
+    if (env->priv_ver == PRIV_VERSION_LATEST) {
+        return;
+    }
+
+    ext_priv_ver = cpu_cfg_ext_get_min_version(ext_offset);
+
+    if (env->priv_ver < ext_priv_ver) {
+        /*
+         * Note: the 'priv_spec' command line option, if present,
+         * will take precedence over this priv_ver bump.
+         */
+        env->priv_ver = ext_priv_ver;
+    }
+}
+
 static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
                                     bool value)
 {
@@ -748,6 +768,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
             return;
         }
 
+        if (misa_bit == RVH && env->priv_ver < PRIV_VERSION_1_12_0) {
+            /*
+             * Note: the 'priv_spec' command line option, if present,
+             * will take precedence over this priv_ver bump.
+             */
+            env->priv_ver = PRIV_VERSION_1_12_0;
+        }
+
         env->misa_ext |= misa_bit;
         env->misa_ext_mask |= misa_bit;
     } else {
@@ -877,6 +905,10 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (value) {
+        cpu_validate_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
+    }
+
     isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
 }
 
-- 
2.41.0


