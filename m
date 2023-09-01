Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3ECA0FF3
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 19:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcA8g-0001hh-Qh; Fri, 01 Sep 2023 15:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA7G-0008HD-Ma
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:39 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qcA7E-0003WM-A1
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 15:47:38 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5738cb00eebso1423107eaf.2
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693597655; x=1694202455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8Xn0jJXaX08JsG0kfWuawoA09AWxio90yQ9CPlI+S0=;
 b=YcL5BDsu2a0BLRa2tUeN2MQknocTJaI6DoizVjhhfNRbAwABhOv06sLmTUJ4zD0ad3
 Vsi+2OTsJMPtm4zygZm8UkscuFiqJhGvq3NtWGOgwei+avucdv60l5HGFosk+nefuu+K
 5dxE5IdW/Cwr6fp3Gdzu1/hBRQ68+H/V+RO/SmaFAKRsOuHcEi2ML4jdcUTXcNtT4vAr
 B6fYezO7KqvgAk6+gTL/RtTD3yRX2ZTdET7qh6j0wfhW6bNiT2tJHWR93+lGAx3I5+tY
 iZ0h6P3W46nHpE+uzck57gMwAA9/s8pXYSs2RIIEZfaxCRKNKoEyNgElzfra8KtrMftK
 LW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693597655; x=1694202455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8Xn0jJXaX08JsG0kfWuawoA09AWxio90yQ9CPlI+S0=;
 b=iIZctLdPxhj31yVDLCr6rcevQddRwzOP60y7Npbz2yChWm4K0YWUwle/m7MH+C9KjY
 0zkwXlIIFML/IA6A3xvBdssDAuvt4QHLCvTMDtrogWQveT0Kds5HMIKwNUV2xwtmzipo
 oT+5isIqw6UOIDajfuP8c/sET/RRhr8qIK3/7BzwYSWZLy9Vk8BcKBUsJ6nrOQBjjz03
 IMSJ2JWArTmIX+zX7QBcaA58Dg/5M8SXvpaEZ0dpYgILK+lOgsb04zHjviGWS7YxF+WL
 7T1MTeL6QAUgwF55sRxJUR8qK4hrfvJm9br3CRYBd8S+YNQNrcrJf0FbZwpAqCmdkBOB
 MC1g==
X-Gm-Message-State: AOJu0Yyl0zg0CnMDu4wSlHdGIxTagDf2Uun6nZQ06Wh9CVgmb+C1kanV
 o7iY/w5kC+JsoSqEhdI+uJvepg==
X-Google-Smtp-Source: AGHT+IGtQ0kdoEq0f9R0v+qMeyj9EErATQyRBGW7ocgtlFt6w0GOtjaF7JUWduFxI+tJ7lyHDqrBMQ==
X-Received: by 2002:a4a:cb03:0:b0:573:f620:ec80 with SMTP id
 r3-20020a4acb03000000b00573f620ec80mr2974341ooq.2.1693597655313; 
 Fri, 01 Sep 2023 12:47:35 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 h187-20020a4a5ec4000000b00565d41ba4d0sm2303002oob.35.2023.09.01.12.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:47:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 19/20] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
Date: Fri,  1 Sep 2023 16:46:25 -0300
Message-ID: <20230901194627.1214811-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
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
index 617b861258..78382cb5f2 100644
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


