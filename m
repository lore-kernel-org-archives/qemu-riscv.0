Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD8DC04A94
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:48:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2ph-0006pt-M5; Tue, 15 Aug 2023 18:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pg-0006pM-Qx
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:12 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2pe-0008IR-KX
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:48:12 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bd3317144fso3567121a34.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139689; x=1692744489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHZruyGhS61hd7x1Y8uBGx8vYdEXaf7f0K0Y/6jZHbo=;
 b=f56eKBTC4sNCCjFlYrE+mSxa8BlcbGvrOnlGPkfhhf+uV3vGTTMH1nlmaBRmvhvcE5
 0bfzsTrTEUxdI1UJY+R77UEp6in0g6YFp1FzLXIlbWuP39ALP0ynoDyV8CyfFkGI3AG8
 ykU2T5zastD87wRn/VNNcHIRz6jZDa1vUHCWEVU9UrlabAOApzO+YB1GzVYqgANIp5Nq
 83Q6N2dQCToQFgQurKSqQhLKZCHd6B6k1bNDtV48h9KIIIuXF5T4K5JjA7B+Z+Y+X9fq
 /O9fKl5f2+ici+0u1jh0Yd0vlnPHepF2JVBn7SYNm6sNFkMHM4ZMl5NjxFk1f6wAbJYt
 337A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139689; x=1692744489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHZruyGhS61hd7x1Y8uBGx8vYdEXaf7f0K0Y/6jZHbo=;
 b=jlnLP2ri1WexkUdKu09p0mETN3zRvIxXlBFZGm4BX+gcAqFa7C8toxguWsXT4DNyTt
 pv+FxwkZtYBGpFKxysdQ7Ullpyc1HdFndfCeSbakotfjRDXUmhO0D6KMY5ywV8cLuwUR
 jFqdDK/nhRJxi9rb6xELbs1Nrn6ZnryiDt6a4adg7vHqx0yzcMrBjPig+XJVNnRmZKTB
 QweOQR2+Y5Elpi4BJZ+a4YSyGjxiQey9vN/tU45P4P9A9Ew+fspPVG6VY3irXuDN/zHa
 LjzrFqwYG/eQSHDzUtQB9NMHUwWfgPNedENrEEcSRFuTPS0C20pqpYrh3sdzH+03s1dI
 mVsg==
X-Gm-Message-State: AOJu0YzRGmOSV5jl8JbJPDiNE9yY2gCS9hAwJLoMUy6NCU3iL7qEZ6CB
 YNevE1HrrUENuJQQQ6yV0d6Czg==
X-Google-Smtp-Source: AGHT+IF9QtcXGTHFaIGCXV0nkQh7+UaiQEvI8rWtgxClBYsHoEPqNxlpMTLwTicd5iKGBPEUGtW1mA==
X-Received: by 2002:a05:6870:f60c:b0:1bf:a95:7a3f with SMTP id
 ek12-20020a056870f60c00b001bf0a957a3fmr33911oab.54.1692139689630; 
 Tue, 15 Aug 2023 15:48:09 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a9d4b09000000b006b9f26b9b94sm5655668otf.28.2023.08.15.15.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:48:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 7/8] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
Date: Tue, 15 Aug 2023 19:47:32 -0300
Message-ID: <20230815224733.434682-8-dbarboza@ventanamicro.com>
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
index e24085fd64..2bab425f9f 100644
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


