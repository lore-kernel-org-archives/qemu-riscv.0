Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A575EC61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6ciy-0001vC-7K; Fri, 24 Nov 2023 15:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cil-0001pD-7K
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:15 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cij-0005Cx-0X
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cf8b35a6dbso16226875ad.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857451; x=1701462251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDx7CihmMug2nERaxt5AnpiI7wwqcAp4vifPhFotZv0=;
 b=LBKWnPWTZk6TSZ8l7POnVIu+QauMqmNuS2q4h5Du1Nua8gSm6jpcZTCxDZs+yXvwaU
 mYVbf1RSz78aGyNtGtAjRvs76xwcMDO6o92Ns3o4p1R5bbS+/9x+LMoD91Z3QKkY/urx
 7+zyIE5mIvMkbLVv0vruJfj3fLEr8jO9xuqedo2vctiQTnWZa4M2H93qM4FKLY7o4/So
 rf3ZJWSQc4SV7ook0b+W80iumktGR6tAxU4Wf2ypACJPfztn/OJCiT4oRt7ZpyRJzD5k
 PcmACj6s67IuquPw1MVq/KXp5hflObCFdH+wiRNNNhZsS1RivS2WPpYXpNL8mPZ5BYva
 Wy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857451; x=1701462251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RDx7CihmMug2nERaxt5AnpiI7wwqcAp4vifPhFotZv0=;
 b=XK9Fg5t3J+75J7frTDbCEhMT4GtxmTvvb0U8Rkc1t0H2WBX/GRoB1WxDUzA8yucA1o
 2IVZFeRdqkNbJEGbfje+UHFwIklVhNlTV0NEnJLIktolZPRQlD1V/8+GKE5zLEaPwqLi
 aKNKPEQ4cP5+Yf4Zf+MiCspQYXA36dW62FLXbFYlLf3tauyQ8SZ+8dNrem9rW8R5KJ5M
 gUGqap7NnoxLapLyztPHdnMRUJ1FtA+CUR3lyEO/1XyQG+iY0JM0ChzB95rT6mQKwaHs
 86VcYJG7H8YdBYZ8V7XtCIHWl8C1JdRo6aY5Lm1Srgozr8lzIe8T4OS3wH6cOrnBMoAH
 4Ojg==
X-Gm-Message-State: AOJu0YyO6zv2jO1YqlD++6D6uYdnJ9T6D/aY4izJs/13NYJRmXs+XavX
 J0M7GRRfZ6lq1KN2T3A6Mz4cDw==
X-Google-Smtp-Source: AGHT+IFrf4d4AWlVWrtRde/4do0KkYeR9hasRzf1WuKoOuIYF1tyJJeXjSXorCXF8Mh9rrrTPx8wQw==
X-Received: by 2002:a17:903:228e:b0:1cc:345b:c7f5 with SMTP id
 b14-20020a170903228e00b001cc345bc7f5mr5305292plh.23.1700857451541; 
 Fri, 24 Nov 2023 12:24:11 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 03/18] target/riscv/tcg: update priv_ver on
 user_set extensions
Date: Fri, 24 Nov 2023 17:23:38 -0300
Message-ID: <20231124202353.1187814-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
References: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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
index 7670120673..aee98db6f8 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -114,6 +114,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     g_assert_not_reached();
 }
 
+static void cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
+                                        uint32_t ext_offset)
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
@@ -757,6 +777,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
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
@@ -886,6 +914,10 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (value) {
+        cpu_bump_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
+    }
+
     isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
 }
 
-- 
2.41.0


