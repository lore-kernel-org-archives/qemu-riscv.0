Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9574AC001DE
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:19:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPNKN-0006lZ-RA; Fri, 28 Jul 2023 09:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJy-0006Su-8j
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:54 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJt-0003VS-AH
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:53 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b9edef7993so1711522a34.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690550148; x=1691154948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDa6yMT5aLs7zW0tfsJSZj3Oa5XrkTDlwa0+B86L+T0=;
 b=o/jT3dcwwh3XR2UtClubXxzuPb0PZMx/IM8yE2A2dbU5GxJYHJbklZveV0lUCscAE3
 DND/M+MOEs51d/UPxlR5PATuFA54g29knTKAJSD3WA2EeNNWL74xMY1jDLNDELIjxP4+
 /GwB2Tkw6+t79OD/cxAC1N1m7U7SpqzLvSOBBc1d7jgSEEjwd/xXbNz2S63inS4hM3Tb
 szDK/PKvOkj3V32STaExe56oKXeGC/VoUAVWII5c3SIg72syF1VO0b5NVdC8p8qDF9/A
 z+hB1C7GDfOnKGPeoDpUznqKCjF9ECWlyYEAYGyQ53R6gB0roie6P8srBX0p3zxuERXv
 QnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690550148; x=1691154948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDa6yMT5aLs7zW0tfsJSZj3Oa5XrkTDlwa0+B86L+T0=;
 b=HuAbBQTZxm7TftJd4jzXdf7DhbUK93d7ygeAQJLssDFEHIuCMoNp5yxzWxMf2mdNG0
 YyOdEwtdeHcY2r2SzhdJpd4iqhmMEGUKMWnrK39v4eQNuvdW+AT+cArYZIvtcOZ/ruP3
 A2YxbI7hF9XZ6PNZEGhS1AAON8xnhaO7mp5qSQVqQVkQG6WdmnZ0vqC6a3BVdW3wq189
 TG6Z4ddmcjIw2NQRU9Ur2HR1nOOhh09G+pvTwp7b9XDNXIVY1GWrfqSv+y1KCvAGC+Wj
 gHdPcz4aVMmVKGTXg/B6ONjY+Odcpa/BaZqHMh7aR+lYmh2pyWdfoqfKqvStfetNB1hN
 9Vtw==
X-Gm-Message-State: ABy/qLZcU4xLABT1Dq9HUJBGgDWD0zf3dqtLXwALZGbZ7W3ODC/y+813
 dMCsX75dx1zxcQLXca/87wf8Ng==
X-Google-Smtp-Source: APBJJlH4AIaa1v4ib38stcZXYfvq6lz2MnGifddJcZA86CgfhmHwX2HrrZd+X22QkKB7AgTtxiboFg==
X-Received: by 2002:a05:6870:f70b:b0:1b7:609f:e0d4 with SMTP id
 ej11-20020a056870f70b00b001b7609fe0d4mr2899257oab.15.1690550147992; 
 Fri, 28 Jul 2023 06:15:47 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a056871cc0600b001b3d93884fdsm1699371oac.57.2023.07.28.06.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 06:15:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 8/8] target/riscv/cpu.c: consider user option with RVG
Date: Fri, 28 Jul 2023 10:15:20 -0300
Message-ID: <20230728131520.110394-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728131520.110394-1-dbarboza@ventanamicro.com>
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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
---
 target/riscv/cpu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 644d0fdad2..72a36b47ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1135,8 +1135,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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


