Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E80EC47077
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 10:49:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPgzh-0002Ow-Bt; Tue, 16 Jan 2024 05:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzQ-0002HS-59
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzO-0007Av-4C
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e779f030aso10723945e9.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 02:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705402093; x=1706006893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MaCKL0R5moeRlkXLY/7sqgtktL4RrMBUeKuTilPkgM=;
 b=Wq9tDMVhCwZmBTzv8UgdTNY1QjpePxWqeB+nYF42rvJR1cHdJRoNgS5YPU/DQeCUy6
 4iW/x+R4jBxlq2yM1BRmGYfxecZOSENO7rHejm24P4vLvjYqRbHATB4lYYit+3xTxubd
 QRUSNFdPyTH9FLVC+aVDDkLaEPvAeJDeNRGiaJB+ApF8dfw1rIBnWV8j8SZqE+rMaiuX
 SZTIXVG8Ab/iMechv7MJLCnOaNPe9nj3c1Poc8uLR1WbEjyNvO/8EjtzRT+SUargqbRE
 gfZzryHJgNUcWphZUxj24i2t5K8PbR9uszdPkrSjofe9qTzbigUIBwiqeFKk6DcCnMxT
 Wg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705402093; x=1706006893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MaCKL0R5moeRlkXLY/7sqgtktL4RrMBUeKuTilPkgM=;
 b=gRWYUonxDg1v3LzHsCNTIwTxifOiwq0RcouqPfvVTK+G8PRHUMcJQGeG17Zkbrbdpe
 GnDyHHo60GPnjmWwXvgRj/lSf0EQ6eCAmKSFWFJOyumXRQtV7fo/vpwdYdRoi4kmIc2L
 SqV9JN8CFlYt4bODFLATgCYm3EzOIRrW5a/M/HS4B0EZ6l4770/0JB/uINlpKX2VpM0B
 67FhHqaVNcotgoJUIdMRbsJ4te9oQHa9BCzm/Anv0EFy9DLeKmF78XbLiIOH+ROCRscw
 UpcST9gUAskixl1t8Xuc3unOX3hGwtQ0XaiRuuP2tyEnZGf/2HnPpFj3K/hKRrRpsvMu
 8xag==
X-Gm-Message-State: AOJu0YxghgqHaKa7GxD2jHhYcdn5+d/90V2jSq9096em4XM8PD2qXOsj
 sjA97VJ7VPIsmcrLN8rjfckR/M8ehdqOAQ==
X-Google-Smtp-Source: AGHT+IH4GdBf5kyiruqq2I2vwdQVHfdugihOMVyeBhp963vs60idpOALJqGdZKnF+U0sA/F1s5jP5A==
X-Received: by 2002:a05:600c:4b1b:b0:40e:4aae:7e62 with SMTP id
 i27-20020a05600c4b1b00b0040e4aae7e62mr3665445wmp.58.1705402092775; 
 Tue, 16 Jan 2024 02:48:12 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 t5-20020a05600c450500b0040d6d755c90sm18942031wmo.42.2024.01.16.02.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 02:48:10 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A2A1B5F8D8;
 Tue, 16 Jan 2024 10:48:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 04/22] target/riscv: Validate misa_mxl_max only once
Date: Tue, 16 Jan 2024 10:47:51 +0000
Message-Id: <20240116104809.250076-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240116104809.250076-1-alex.bennee@linaro.org>
References: <20240116104809.250076-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

misa_mxl_max is now a class member and initialized only once for each
class. This also moves the initialization of gdb_core_xml_file which
will be referenced before realization in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240103173349.398526-26-alex.bennee@linaro.org>
Message-Id: <20231213-riscv-v7-4-a760156a337f@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dcc09a10875..7ee4f8520f9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1292,6 +1292,26 @@ static const MISAExtInfo misa_ext_info_arr[] = {
     MISA_EXT_INFO(RVG, "g", "General purpose (IMAFD_Zicsr_Zifencei)"),
 };
 
+static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
+{
+    CPUClass *cc = CPU_CLASS(mcc);
+
+    /* Validate that MISA_MXL is set properly. */
+    switch (mcc->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+    case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        break;
+#endif
+    case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static int riscv_validate_misa_info_idx(uint32_t bit)
 {
     int idx;
@@ -1833,6 +1853,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
 
     mcc->misa_mxl_max = (uint32_t)(uintptr_t)data;
+    riscv_cpu_validate_misa_mxl(mcc);
 }
 
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 20062acd0f0..df198ee3a31 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -268,27 +268,6 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
-{
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
-    CPUClass *cc = CPU_CLASS(mcc);
-
-    /* Validate that MISA_MXL is set properly. */
-    switch (mcc->misa_mxl_max) {
-#ifdef TARGET_RISCV64
-    case MXL_RV64:
-    case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
-#endif
-    case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
@@ -935,8 +914,6 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu);
-
 #ifndef CONFIG_USER_ONLY
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
-- 
2.39.2


