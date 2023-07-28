Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811FC001DE
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:37:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPNK0-0006UV-NV; Fri, 28 Jul 2023 09:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJy-0006Sd-0g
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:54 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJt-0003Si-3d
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:53 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1bb74752ddbso1666270fac.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690550145; x=1691154945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOnI9hH6NlaZaaUBLQ1CH8wjZUIfM0115L0/n42OTo4=;
 b=fu4ufrwxg2vhijt8buawqU/RP6oniT5YH0MQGy6Jnthk7FFIfyg7Pw/d6p3ItxZSh1
 taGn0yhRksbe9wKGnN5TYtmimPhNjKKdXZPwpQ5tZihDirPWJyCfbiHi7hE9OuycEEKv
 5nEwAeOM6UvEDZE1cFSSowRE/MBtWC0YV4xvniV6U7pJfMEADV+xligTYUqVpYwMISBz
 leu7v5oVjER4djNmDdLiO+XZjwA9RHXLIOyIbR3V4GJQ+Pvw/6FmLPcDLu2prEv4vCiX
 VTRz0njjoXE+YvuqCL9TH61eFtcLy2KuIvALfP3ZDSiO7luK4DdrBW8D44GC0PefxqCA
 OtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690550145; x=1691154945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOnI9hH6NlaZaaUBLQ1CH8wjZUIfM0115L0/n42OTo4=;
 b=a/FIZVDryF7DbqAuwwtx8oV4D7NjJcL8YlB+9jaw8pIbrpt3iyCkZgu+sZSRXae0TW
 JfZfrbM7zXhLr2a9/MQXuMqleQ90Nf76YclFOb14bS/FhfNQz0Xk6zbdAbD8obuZc9iT
 W4Y6CnvaPIXm8OYF4Ad88ROh3PDXXrKBchEjkZp310j9/YMprYreMf3RmGN4XKV0+vdg
 QuJbJ7e8iwAxXuIGnfrI47fYA0gZK8oLroKxSzvckElZdYrWjAsz9yvUobbGKWQoqW5m
 6U7akSpdTrBCGfIHMuRE19Koh4/JWuvvsQNVbt1uSxnT4gquIrW/L0mb4sInA47ka2Xj
 BJpQ==
X-Gm-Message-State: ABy/qLbcd87hsdR4ZVUH37b3kDYPjirClglFlculxv9evpjq4PbflkkZ
 esRzSnTOGhXz7MM2lMSs7kEBiw==
X-Google-Smtp-Source: APBJJlEH+bAbhWlP6MwIjmF0E3VKTVXK/Soat3fmbaPbzmXLJa9k46TU1LZau/0uxJ/uRjq7IuAbqg==
X-Received: by 2002:a05:6870:e30e:b0:1b3:8285:153e with SMTP id
 z14-20020a056870e30e00b001b38285153emr2508163oad.44.1690550145312; 
 Fri, 28 Jul 2023 06:15:45 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a056871cc0600b001b3d93884fdsm1699371oac.57.2023.07.28.06.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 06:15:45 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 7/8] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
Date: Fri, 28 Jul 2023 10:15:19 -0300
Message-ID: <20230728131520.110394-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728131520.110394-1-dbarboza@ventanamicro.com>
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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

Add a new cpu_cfg_ext_is_user_set() helper to check if an extension was
set by the user in the command line. Use it inside
cpu_cfg_ext_auto_update() to verify if the user set a certain extension
and, if that's the case, do not change its value.

This will make us honor user choice instead of overwriting the values.
Users will then be informed whether they're using an incompatible set of
extensions instead of QEMU setting a magic value that works.

For example, we'll now error out if the user explictly set 'zce' to true
and 'zca' to false:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64,zce=true,zca=false -nographic
qemu-system-riscv64: Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca extension

This didn't happen before because we were enabling 'zca' if 'zce' was enabled
regardless if the user explictly set 'zca' to false.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a40dc865a0..644d0fdad2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -187,6 +187,12 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
     return PRIV_VERSION_1_10_0;
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
@@ -198,6 +204,10 @@ static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
         return;
     }
 
+    if (cpu_cfg_ext_is_user_set(ext_offset)) {
+        return;
+    }
+
     if (value && env->priv_ver != PRIV_VERSION_LATEST) {
         /* Do not enable it if priv_ver is older than min_version */
         min_version = cpu_cfg_ext_get_min_version(ext_offset);
-- 
2.41.0


