Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C110DC001E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:39:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0mo-0006T2-P9; Tue, 15 Aug 2023 16:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mn-0006Sa-EN
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:37:05 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0ml-00012Z-7Q
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:37:05 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bc9d16c317so4646204a34.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692131821; x=1692736621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8deuqh5eHIj2FHewW59VdrgAhpra1h/RLuoM54JKMYw=;
 b=kHemkt5j0IGNn9s/7QzEEpMm0Egdiu4YUexfAMjVGVWL4yBHcuzuEQsNBK0PthWllo
 k3lfa63xiEa9HYrOJaFBnuOJMpm6nq7I6fAf7Rn87uVjX03OPTRxTG3kqGp5y0O5Y3Qv
 W7MRBCqv0LaEQPKUgtrbFMVX+kb4G61HD1YlgqVuHoOJIkPIBmB6StigVj/1s3yi2OwI
 xYnNSlZGa0OdED9R3PwzqWnI5rJIlZmeyPsrGiT8Fzx1QV/OCkipR3knLAvHBNzPL51Z
 FcQXiE61/a69XJeljxYFWm2RZ6ECNq448DcAiDDGCPycXFtGe5FrXSqfQ9GcZvMuz0hP
 EFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692131821; x=1692736621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8deuqh5eHIj2FHewW59VdrgAhpra1h/RLuoM54JKMYw=;
 b=FUu2afs2Pnb/1Lgl46LqxjeZVP/LGhuqDLm3TAUZ3B+FaW5KDgkKO/OsZyy5Ma7MPi
 iFjSwH8J/dVnWIHYP6Yn2924Dsfl5w11F1wJ+dSKS0g3B0ei/ziLgiE0afkpkHXWId/x
 h2GMxtROFtmO4mnZhDQ6+6991gw36Y+TZ8uMyuokLmk32a4L66FGV2e8YybAgF5UT5pX
 r60qq9PtegbpQux3heSoc+k4SV/48srYaCBAWSXh0T97Xv3gflPXtEYe6IXoMtsm+yVT
 iWHYEzQ3VTLIAVnaBF9pcwBKJN4Qh3PgAVTZAGJlEEnbY1T77JGWB9oa5xypPENVR2Ef
 odDg==
X-Gm-Message-State: AOJu0Yxg1/hjfAgk+aTUh0N+R80EfxzBhKSnHN29eJa0zh2V0xWaPsUm
 Rz5Ea7Zw4nA2U6QFHBgaJuMJkw==
X-Google-Smtp-Source: AGHT+IG8EkLOb53fUZIR+9+KBVDsZ3bVH+gGWI2/6Gi0CvtnyppoXtkno1q7TFloP8W7Exetdffjxw==
X-Received: by 2002:a9d:4815:0:b0:6b9:304a:e778 with SMTP id
 c21-20020a9d4815000000b006b9304ae778mr14130748otf.34.1692131820999; 
 Tue, 15 Aug 2023 13:37:00 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a0568301bcf00b006b94fb2762asm5526849ota.23.2023.08.15.13.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:37:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 7/8] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
Date: Tue, 15 Aug 2023 17:36:34 -0300
Message-ID: <20230815203635.400179-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815203635.400179-1-dbarboza@ventanamicro.com>
References: <20230815203635.400179-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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

For example, we'll now error out if the user explictly set 'zce' to true
and 'zca' to false:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64,zce=true,zca=false -nographic
qemu-system-riscv64: Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca extension

This didn't happen before because we were enabling 'zca' if 'zce' was enabled
regardless if the user explictly set 'zca' to false.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 52c9b04cd5..d779660739 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -185,6 +185,12 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
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
@@ -196,6 +202,10 @@ static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
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


