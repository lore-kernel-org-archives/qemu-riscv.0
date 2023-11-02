Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D951C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:45:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygQw-0006MU-5R; Thu, 02 Nov 2023 18:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygQu-0006Lj-Cw
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:00 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygQs-00035v-Sa
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:00 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a7dd65052aso18298397b3.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965098; x=1699569898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTkfJDvkYoxTBEbJifhirI/L74ZejS3SnvVD4McotF8=;
 b=iSm1/Iwk2j6AXzT+7qJvoz8kWfUsEJbgrFWW2FkrRf2X1nlupIi6EfkCZ0feUDyDh/
 uOftWWEKA5YLOLcfOJPIQ9NH2sSssdbaC5t55Ck6uqLlCU/VflLMtAVCPyCd17FR6WEF
 Ub/L0Spc6zosXPK44G1xwCaeVug2t7JOalMBSJV3PaHGsElTIA0LHNPoWoy67GQFWI8d
 0Zu5li67DwcOr4pAC69Dp2KwaglHLwjON9jmpmShrueaUbeG3os6QC+h16BZ23TOk6BE
 gBwuDNUKMMRaBfW8PuoLRv3BF7ExGXx8AriXScFl0jDR/u6XQLkWDrNtRYvKYSzznm1R
 bnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965098; x=1699569898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTkfJDvkYoxTBEbJifhirI/L74ZejS3SnvVD4McotF8=;
 b=M4Ernpflkg93hk2p6DUEUH//1ibRzyrB8cplSGcEjQkEVcv9oTdoo1HL/CaNI5Z4KL
 gnK1a4OKwEwt5jkFSwLVmNZkGU7QSQwBguuG7V7s/LRhnv1VmTim33ZtZZZUo9XXD301
 WEJmBk3m2PIf2zH7ezVIBQQ8Kh2KMK0V/swTpNVdPSD9GpsaoQcN4CWHBU/050ZU+Z+C
 GR5zowiDIjua6eIfXhNjUmzkLs1mmHLu63Tm+ryzoGLQvWFWymUaKwTWBfCesxckGt3K
 N1eo5csJy45KhcR3jG52db6OoNmY7uz/6fqWzwAoMYLWPjD2952Y98oI2YnRl5DMd9VW
 x8jQ==
X-Gm-Message-State: AOJu0Yy5wB/e5BcSeUUvgo3/hnfEhQH1E+VKoVDJI8UBJs56dLwLwyvH
 ae2mLo4WCWFD/C3wOgQFux+2Bw==
X-Google-Smtp-Source: AGHT+IFLuFKALlq5afzmT/0zQg0lTAhyUN2qQneKhY3IMhKpDJ5A61V1Kpa5MHSWbA+74zSydppVUg==
X-Received: by 2002:a81:65c6:0:b0:58a:83cd:115d with SMTP id
 z189-20020a8165c6000000b0058a83cd115dmr1017127ywb.50.1698965097941; 
 Thu, 02 Nov 2023 15:44:57 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:44:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 03/19] target/riscv/tcg: update priv_ver on user_set
 extensions
Date: Thu,  2 Nov 2023 19:44:29 -0300
Message-ID: <20231102224445.527355-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112e.google.com
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
---
 target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 08f8dded56..0e684ab86f 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -114,6 +114,22 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
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
+        env->priv_ver = ext_priv_ver;
+    }
+}
+
 static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
                                     bool value)
 {
@@ -742,6 +758,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
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
@@ -871,6 +895,14 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
+    if (value) {
+        /*
+         * Note: the 'priv_spec' command line option, if present,
+         * will take precedence over this priv_ver bump.
+         */
+        cpu_validate_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
+    }
+
     isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
 }
 
-- 
2.41.0


