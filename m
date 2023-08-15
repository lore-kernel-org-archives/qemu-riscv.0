Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F14AC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:37:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0mn-0006T1-WD; Tue, 15 Aug 2023 16:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0ml-0006Ru-Ft
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:37:03 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mh-00011o-3W
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:37:01 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bd066b0fd4so4000951a34.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692131818; x=1692736618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sM11NGamBxV0Qh9cz3vCR8Wu3FJz2LD3eLcHOffGpt0=;
 b=MKuApwV+IOfmawTrqA2r9D9RPYrCNe0ibcLv91sF4mNFuyoX0vZ2AcUNKh9Gn7VoQE
 mZ3TTbAPeblCtczrFqm9CLTPGhCcni2WbNTRqNOug5bvLe0yO9z16b+8Mb86LvanXszR
 IyI1gQFC/4f3NwhOXQ9hll6pWQTG6IGpZz+e7WDFHrxc66T7uh65zeov9KZcQ3DngteT
 zls78Wp5KQ7vz3Gun5Ma91gJ8y1yJ3202xiEx41z/PQbiFaDPa2ajZpfhpMR84KId+oh
 hbr/r4znroatMI5kdJFdQ03tw6m+sl4wIbNiFGI4+0tSD8dqgdSadeGwIxmKeWhllXY+
 CF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692131818; x=1692736618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sM11NGamBxV0Qh9cz3vCR8Wu3FJz2LD3eLcHOffGpt0=;
 b=QcWtQhlHRVelMo/67thV8Zusontwc9Db+B7d/sqA7MxZe/YE8SDDZTsO+sdAyQl35e
 yRfRQsHx93ex7b2wIxHl7nM68BEAtxVsNYZKZ9IXtIhtVVAy0cIKAs30o4UGcoYHk8N/
 +EIc4mT4x7idaNY6Z3Sp/2wRJIfaBfLpj0jAb53+8GVzIfCmFzofacD8g9mE6rExRKZs
 dQoeIX2sf0S3U/ifoKeoDThaC4GUQiahdP0as0l+C0Q1h3WOSkcUtezeTx8Wnn95OGog
 RPmd6wRPe59KmAk/KOuw43OnYAzV/3725mlY/k3Z7U/9SjbL8RrmT8qzYTPLW1MioTQX
 eUHA==
X-Gm-Message-State: AOJu0Yy20/H0QZ9R1dtQx4sRWdSsE09gToZCKsBqI07BxEninlwOsriS
 GosiS8V9pFeGJ4oPxUkjYmNiQFQLI1v4H1iyPP8=
X-Google-Smtp-Source: AGHT+IEufeyRaYLLtvV4qR43dA5GtidhGoFnQU+FsbLOPf7YXA6RfI2Elkk4fmRjnpuzAUkpFDW12Q==
X-Received: by 2002:a9d:6a56:0:b0:6b8:8f20:4cbc with SMTP id
 h22-20020a9d6a56000000b006b88f204cbcmr10927578otn.13.1692131818101; 
 Tue, 15 Aug 2023 13:36:58 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a0568301bcf00b006b94fb2762asm5526849ota.23.2023.08.15.13.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:36:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 6/8] target/riscv: use isa_ext_update_enabled() in
 init_max_cpu_extensions()
Date: Tue, 15 Aug 2023 17:36:33 -0300
Message-ID: <20230815203635.400179-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815203635.400179-1-dbarboza@ventanamicro.com>
References: <20230815203635.400179-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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
index 195a3ce7e6..52c9b04cd5 100644
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


