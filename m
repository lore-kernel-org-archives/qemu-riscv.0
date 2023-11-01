Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764BCC4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyI2m-0002bD-7Z; Wed, 01 Nov 2023 16:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2l-0002aC-1k
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:27 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2j-0000fO-IJ
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:26 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-da30fd994fdso1228122276.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698871344; x=1699476144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K359glfS+eWj+oJdfLPBDj+kA+tlcXin2KqqlCog67k=;
 b=bNOBN0rvW8uYp0SCGSP4L1fpbV46T4UdPYVnvDtCa/1HI0qXfdao1gh/NKaYorgUJ+
 TiBlok7N1UKbn9y+rB5bOYRovCF6zuaVF2c0Z2b9MJmyheGEtBBie7YXNfdPK2FaPAt6
 U8Wj6yir4yoH1oQMTlq+ijevBQ7jac8rs549hyXLabIDgn9thPWClFf5u6kdEgJGksbT
 helnh+390EKBf/2GkcaMP6AsL0fFo9+KBlg8vJP3ZSTBMlRbz3NaZFnbPNiltBoEjYuy
 5fTMeCwnvL7Qib1+0lYDvf3mpoxjcsVHdh5zOiq6e3Gmyq6OjPQSfiYBBaLqiEXI4mGZ
 IVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698871344; x=1699476144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K359glfS+eWj+oJdfLPBDj+kA+tlcXin2KqqlCog67k=;
 b=QtixW0+yYd01K+xu9srOQnCTsVOFKieEJit9U5/UvOz67O0ZvmsiwRdzSPfBu4KqsQ
 VL2ZQKyiF3qivvADnyjfNHucfObgyzihiT8ZIDye3RwnUj72pmTPV00UYmqVpQ16OWux
 Tr/Me4bnIu4n9/x6qygGaBcB7xabtmAk1PHTtEdbbDnF5CU/ZISU4ZgQ5CuYEqPi0O9U
 DuPHWHDmJJiqOsDhJhGl+nAPlZrzppW5KRUBLlpoz380DxVUAISp91bwlsMbpdJlVKK4
 HsdBTLOg690dfOZ6uYHb14zQEpCIQKB/mMBKFWGfz+J4P8t67tluJ8K/mdbkdTnyX6T0
 230w==
X-Gm-Message-State: AOJu0YxNSWaOJqYLFV5yv10QrEtQCiVZnFq7NHhQjXSr2MvZLa+dudEr
 EgtVkbrvfPkwTImVp0Jf1tmbgw==
X-Google-Smtp-Source: AGHT+IFz2TU4fY5iZqim2D9+BtH8nAONPfcCnzWdqTID5y4fWpbZJOa35SBvwIIR5okz2y8W9IHUOg==
X-Received: by 2002:a25:328f:0:b0:da0:3e30:49bd with SMTP id
 y137-20020a25328f000000b00da03e3049bdmr5592771yby.24.1698871344515; 
 Wed, 01 Nov 2023 13:42:24 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 z187-20020a2533c4000000b00d9cc49edae9sm329724ybz.63.2023.11.01.13.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 13:42:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 05/19] target/riscv/tcg: update priv_ver on user_set
 extensions
Date: Wed,  1 Nov 2023 17:41:50 -0300
Message-ID: <20231101204204.345470-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101204204.345470-1-dbarboza@ventanamicro.com>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2b.google.com
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

Change the setter() of multi letter extensions to allow user enabled
extensions to bump the priv_ver of the CPU. This will make it
conveniente for users to enable extensions for CPUs that doesn't set a
default priv_ver.

This change does not affect any existing CPU: vendor CPUs does not allow
extensions to be enabled, and generic CPUs are already set to priv_ver
LATEST.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f54069d06f..b88fce98a4 100644
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
@@ -829,6 +845,10 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
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


