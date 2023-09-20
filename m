Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF12CE79CD
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:25:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qivGO-0005gI-DF; Wed, 20 Sep 2023 07:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGM-0005fa-Ll
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:20:58 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivGL-0002DB-3N
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:20:58 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bf0decd032so4645602a34.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 04:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695208856; x=1695813656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29CXHps3Zqp4qnuZZFbf9i6nyFjwkzzwGbOnN7RJ9eU=;
 b=ScgwkZbuO2ZH+P3BKahoNLAkzy6cbcu/w/MYxq2y6Fh0nZhRMx5KysP8cFGE3E/q1l
 b6AIdMWug1nNstSQfSnPTHID2meH91qW4+BoUg+E0yE190LWsOEQY33CVqr4lH5xyRof
 Kd3cod9tjNTPDTQ0T4mQtyN1DVnQrxxyw2ijsZLP3cl+ZpxOQ5MftpjF9h8xbpoWbHR5
 EJoJnZOVtcBW1fy82w5i93nyjj5kLmr8lvd1ePU5hYfKUdP+spaJAcXFhJE6laRJHLE4
 WErq61MzH64pq/xRB9BbAiIUOn4zI74DjbnPIJmDf4sDedzspychsHIbyVia+iwV+nV1
 yoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208856; x=1695813656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=29CXHps3Zqp4qnuZZFbf9i6nyFjwkzzwGbOnN7RJ9eU=;
 b=rJ0ZMmy7wgd6Wj+sTKc0tE49ZsNwDMQE+7CxgLNf5hQXWjA6gRXOcOl9wYJKD4vf4M
 DyXevlG/czsXhtEZjrYQdu5uzXikMBciMpc2ICNQruIv6BYUFrPXJPnaATE7qG4M8se7
 6gqh1I1Iy8fkLj01YoAb+d+DFSO08u+bOZAuZ8XAaG0XH9/gTmTapiiSTmW1j/4P36T9
 XDawUtBRNMBWWCXa5RLoL+XKyXfQqFYGHFq+EXKyGvz8yYKtcKTes4nEkcwdDeIjenbJ
 P86MqDRm9nnqrShzMl9FZi7jwEdlBHxCNdK0ijmRETNra5S8ezwBGvlrmXXryQzrsZ69
 03eg==
X-Gm-Message-State: AOJu0YyEYXVgs8TedjHawLBTpJX8pm22sKFuD9sCnrxFAlcIpz8YxuQC
 e/k5K6CTkDBodveI0Kl8O1TEog==
X-Google-Smtp-Source: AGHT+IHEyvmwlf2eVfPiSAoDdPIfG5dXun5TgLUT7VyTP5HfccVVu1sF6aOTAAzb+kznGn7FsQb64g==
X-Received: by 2002:a9d:6396:0:b0:6bd:749:f5cc with SMTP id
 w22-20020a9d6396000000b006bd0749f5ccmr2257092otk.26.1695208856006; 
 Wed, 20 Sep 2023 04:20:56 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a9d7c84000000b006b45be2fdc2sm5863955otn.65.2023.09.20.04.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:20:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 09/19] target/riscv: make riscv_add_satp_mode_properties()
 public
Date: Wed, 20 Sep 2023 08:20:10 -0300
Message-ID: <20230920112020.651006-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920112020.651006-1-dbarboza@ventanamicro.com>
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

This function is used for both accelerators. Make it public, and call it
from kvm_riscv_cpu_add_kvm_properties(). This will make it easier to
split KVM specific code for the KVM accelerator class in the next patch.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 5 ++---
 target/riscv/cpu.h | 1 +
 target/riscv/kvm.c | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dc9b3201d..50be127f36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1115,7 +1115,7 @@ static void cpu_riscv_set_satp(Object *obj, Visitor *v, const char *name,
     satp_map->init |= 1 << satp;
 }
 
-static void riscv_add_satp_mode_properties(Object *obj)
+void riscv_add_satp_mode_properties(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
@@ -1589,12 +1589,11 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
 static void riscv_cpu_add_user_properties(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
-    riscv_add_satp_mode_properties(obj);
-
     if (kvm_enabled()) {
         kvm_riscv_cpu_add_kvm_properties(obj);
         return;
     }
+    riscv_add_satp_mode_properties(obj);
 #endif
 
     riscv_cpu_add_misa_properties(obj);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9dc4113812..cb13464ba6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -726,6 +726,7 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
 extern Property riscv_cpu_options[];
 
 void riscv_cpu_add_misa_properties(Object *cpu_obj);
+void riscv_add_satp_mode_properties(Object *obj);
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e682a70311..e5e957121f 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -1323,6 +1323,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
     DeviceState *dev = DEVICE(obj);
 
     riscv_init_user_properties(obj);
+    riscv_add_satp_mode_properties(obj);
     riscv_cpu_add_misa_properties(obj);
 
     riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
-- 
2.41.0


