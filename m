Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FDDC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:49:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2pg-0006oo-8D; Tue, 15 Aug 2023 18:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pe-0006oF-5c
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:10 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pb-0008Hr-TT
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:09 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bc9c01e154so4068715a34.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139686; x=1692744486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61rviudoS0tPwh5erQkA5DyOXPmz9WRzdOuGC0M2QpM=;
 b=QR/QIphGjmBNBtDc7jBpoC9rP1KIPJarq92uYFRfsSHx+MJaFL4ssGxeHbJNCRCE4g
 OaBZl2P2XwJkjeFGjxMq7YRx18bEvulP0puvoOpavjJQ6nJENIpR5cS4N2l+4cQY8Lh1
 jsho5kNTh1jtgisiHm7Md1GlT3N17tiLFSIchyKT0dRC6QGEyKK1jp6gIAY26gBJW/ju
 7su2z57ktK0eP+wyjODpKsynMUsHVwgd2n0u70YlTcZRUlN1h7Tt/74jKWSq8Uf06vtd
 802cLk0EHfdUKjnpto1N3LH9eO3VcCzOq8OzUwZX6qJkzaJ4ABOXM0UV9CpBgx2eYaot
 YVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139686; x=1692744486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61rviudoS0tPwh5erQkA5DyOXPmz9WRzdOuGC0M2QpM=;
 b=LnQ2MkiPBQ3pVLmb1CpgxKq2dmILJ8lFvHfw0nSKtDysL8F6txYpURjand5OFR2dO/
 pBmcH3t1m+lYtb060/ldNplIex4f2HR4CQPOWqaiOagfo8TsZnjT5P3tcFdrW5TEKjgY
 13YKNt5/7esvQv1+bC6sN6++IxzKVb1U5NpvBeRBWBNJLBUch7tgKN62mN+68VrZwI8p
 /JbIwJz+k3A6XbjvYbxMpfoMa3dzf/6utxeeAlcEqb92WCw41gxJL0HNcLv1MI5E4I0A
 LAMdZwVQnJAGfPEN7jqiTuqqGBdvpVgKHguWm3Wpm5vbEYToBUHAeznw+L9PhEp31WXU
 9ZDg==
X-Gm-Message-State: AOJu0Yy7twd4pCliwUmguj70zHyCMDPngf7QYsNhxNAvcnnkJs6u64Vk
 7qbPhkTuWO6dJV0LyNXlEp9MnA==
X-Google-Smtp-Source: AGHT+IEGa4iHbzPBRfHGOBEDgS7iBvwqGV27Qar95TfQXv1DSP0U7oS0lNP77mSEsuqxFc2L01gQHA==
X-Received: by 2002:a9d:5a96:0:b0:6b8:b83c:a1f8 with SMTP id
 w22-20020a9d5a96000000b006b8b83ca1f8mr2075626oth.19.1692139686616; 
 Tue, 15 Aug 2023 15:48:06 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a9d4b09000000b006b9f26b9b94sm5655668otf.28.2023.08.15.15.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:48:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 6/8] target/riscv: use isa_ext_update_enabled() in
 init_max_cpu_extensions()
Date: Tue, 15 Aug 2023 19:47:31 -0300
Message-ID: <20230815224733.434682-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815224733.434682-1-dbarboza@ventanamicro.com>
References: <20230815224733.434682-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
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

Before adding support to detect if an extension was user set we need to
handle how we're enabling extensions in riscv_init_max_cpu_extensions().
object_property_set_bool() calls the set() callback for the property,
and we're going to use this callback to set the 'multi_ext_user_opts'
hash.

This means that, as is today, all extensions we're setting for the 'max'
CPU will be seen as user set in the future. Let's change set_bool() to
isa_ext_update_enabled() that will just enable/disable the flag on a
certain offset.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8be03a536..e24085fd64 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2101,24 +2101,24 @@ static void riscv_init_max_cpu_extensions(Object *obj)
     set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
-        object_property_set_bool(obj, prop->name, true, NULL);
+        isa_ext_update_enabled(cpu, prop->offset, true);
     }
 
     /* set vector version */
     env->vext_ver = VEXT_VERSION_1_00_0;
 
     /* Zfinx is not compatible with F. Disable it */
-    object_property_set_bool(obj, "zfinx", false, NULL);
-    object_property_set_bool(obj, "zdinx", false, NULL);
-    object_property_set_bool(obj, "zhinx", false, NULL);
-    object_property_set_bool(obj, "zhinxmin", false, NULL);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
 
-    object_property_set_bool(obj, "zce", false, NULL);
-    object_property_set_bool(obj, "zcmp", false, NULL);
-    object_property_set_bool(obj, "zcmt", false, NULL);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
+    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
 
     if (env->misa_mxl != MXL_RV32) {
-        object_property_set_bool(obj, "zcf", false, NULL);
+        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
     }
 }
 
-- 
2.41.0


