Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA1BC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:48:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2pl-0006r5-F6; Tue, 15 Aug 2023 18:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pj-0006qa-Uw
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:15 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2ph-0008Iy-No
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:15 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bcade59b24so4868755a34.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139692; x=1692744492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOMe29cQF2wDUzsUpAhXMdDgBLedr0DT4vrKcm/eM6Q=;
 b=VmD1A2FBOYULK5oakH/1MaL4+DaWEdcfIdkxJFzt2Wot0ug+VgC9qBI1ZrS6PNfCmA
 dRyXPET00QTAazgA2b2nvQefQJL7ERuEQN5teIHCPX4+kkfLxEYrntyd/eEjNiNUjcGH
 MTtTcjHnUaehCbYeEG3BFTURWI40ByulaJ0SZuNlxfc4YKzFFTH5cXOzYhZGMsoFD+8h
 SZenH0jS8oj61qwH6d8Epwb98H8DzzI23HhOUOn1xNj5W4kx/OaEJkUbarrqQI8MeSnB
 s5NuFBPXBnXWN7MqiesmWCLpYwMKVH81dHSiSyFbJdKVNvCcC9QlPjdz7sUta9ig2Tkq
 Zn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139692; x=1692744492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOMe29cQF2wDUzsUpAhXMdDgBLedr0DT4vrKcm/eM6Q=;
 b=FYBIq6VYOb5Ck7msyAThSFQfLg6PbbRtq+6AilXGhAmmgY7TT7XV8PdOUX++elWM0+
 jpfkzRXcWvQcf8bLpiEn5aTfbukNqV2aD2GQ7e5p4wbvixg2bonwua80HkwnPFkUEYnl
 iW8zymqCgWRMEH9+JyVk7YTkok0z9vMEwdiQaCkrLYcpCp/rEcwPe80vN+ksCMgFz6uO
 76nUkDIIIBrz8oYuL9k9AoKBs0wjQ3q++1i0H5esOuEaGzv5xamOHrr4Iz+8w+EV4g0+
 IJy8jIWspDEsD7X6rJW9dZDOVzrWd1V3MJnDKn00hMaySuQkEy8BRFwdcYoqKr0h2iMJ
 hNsQ==
X-Gm-Message-State: AOJu0YzOBi2Ve4q2fDnYjnNth/PglA/SjAuD5O/+ggmnmynY0ry+DiHN
 R2clfoAk7o8Jq5metveVyaFyVQ==
X-Google-Smtp-Source: AGHT+IHUCwktIOVBiB+z/PFYAGj6d29Ks4krgtxJLUJf7WLwTCciiXSaf79sltsLQqrht7XHw+v96Q==
X-Received: by 2002:a9d:7985:0:b0:6b8:6785:ed0b with SMTP id
 h5-20020a9d7985000000b006b86785ed0bmr65372otm.30.1692139692731; 
 Tue, 15 Aug 2023 15:48:12 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a9d4b09000000b006b9f26b9b94sm5655668otf.28.2023.08.15.15.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:48:12 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 8/8] target/riscv/cpu.c: consider user option with RVG
Date: Tue, 15 Aug 2023 19:47:33 -0300
Message-ID: <20230815224733.434682-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815224733.434682-1-dbarboza@ventanamicro.com>
References: <20230815224733.434682-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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

Enabling RVG will enable a set of extensions that we're not checking if
the user was okay enabling or not. And in this case we want to error
out, instead of ignoring, otherwise we will be inconsistent enabling RVG
without all its extensions.

After this patch, disabling ifencei or icsr while enabling RVG will
result in error:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64,g=true,Zifencei=false --nographic
qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2bab425f9f..d608026a28 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1133,8 +1133,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
           riscv_has_ext(env, RVD) &&
           cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
+
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
+            !cpu->cfg.ext_icsr) {
+            error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
+            return;
+        }
+
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
+            !cpu->cfg.ext_ifencei) {
+            error_setg(errp, "RVG requires Zifencei but user set "
+                       "Zifencei to false");
+            return;
+        }
+
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
         env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
-- 
2.41.0


