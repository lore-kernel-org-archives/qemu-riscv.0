Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E35DCCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL9U-00063X-TC; Mon, 27 Oct 2025 07:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL9M-0005lr-9f
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL98-0007bR-J7
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:12:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-63c0eb94ac3so8012793a12.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563532; x=1762168332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOQRbM60FQe2Gg4TBOEVmKU1rzcMDNuOtCzGhYSu6Hg=;
 b=D9yrHUZozII8lBJ54xpM6x0256JhtSKHpgrhOfN/mlXPCutadiB27RBOUtWWKt6FXF
 SkJztFa+qGuw9iSwxXNU4Vv/IaXjGZ6uSgkggRi5zgs233QdICBsYKSCXTNt6R0aqfro
 RQGEzLcCFOa75pg01vslor0aR6MVeIvWZnucUVrljrFr30WVnZgYELVdoHKh57gcI9WH
 qkJRk/XzTn5IZ0DfCxkwlQLh7kzBrqVeiOK1wWEvqjTx4qkOqDoEri+GSGb5Ul9RT00H
 FuryH/3Y17XyRqj3P3hnNzfIrSJGbnHg0f+cuWgTvsjnFkXTCl+zNdJDNM0KuEtr1A0a
 NCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563532; x=1762168332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOQRbM60FQe2Gg4TBOEVmKU1rzcMDNuOtCzGhYSu6Hg=;
 b=mAEbmcn49ELQ+4I8xoaqQynzCoca95G5JZ2l1CWECtMI/xwvHFQR/NoTotMnSim9El
 4IYAuJnb6zPmyCssA61FmlgVsrpx3dR++bQcg7KkB+x4MDAB9CCdZsn+jrguzjrZogu0
 OP2OxX7bzHXwc2ZOc/+uPwpuM7kZVO94H7xClULGhgQ1+eEUrgIsZzd7Yvj+w+9MlK5O
 kO2VIadtpBlhmPnvqjZ9H3p5Gyf8h1k+/cY6nKxD9ftgpS0Z5jClUYiZe7o/WydXaKFz
 yuycrUeJ4xnRK6z+s0B/IBCIY5bAe2QLebgUsQOnSX5zksBqudyh/gUD4OK/DbFj+S/A
 CMxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7XvjTIIg1TJl2T5gdKXP1X7fTON5GETJx9S6olCET3CD4QhW8RysReQRWxYvlZGYwDsdL24JL5Qv+@nongnu.org
X-Gm-Message-State: AOJu0Yw9KlMVuGpPMEXIbWI3VkRMvYR4+jNK7QIO6W/vzauRqv8smLho
 xtN/KJTNPzyR2zRmSZSE6hetAnbd8Y69xeRRFDf6ltTLV54wVPEdOS3OhVGb5rBTCYg=
X-Gm-Gg: ASbGncvIwENcqg6N+SGSPuH3gOr2EXtTZJ/4bsMRwGULMF2HZKEQjQvmKWim+fsCK+S
 GHBIOS+WKHrT8Xwa7sqeaCk1htXPcuZux4PEmn4nmhK0l7dmKlFgmx3xm7DZJoCrJcwDLs0zq7h
 bT4H8D6zrZ1zOhNpc2Y8Zfsdc6KtWGbmrS3TRLzMosbF2OMoI+PzpT7Ri6tsJHOrYFcIFGZeT+R
 n+cAn3XV4VL1biCq8tF9XvPZpPPbZ29zNfnkNcph7Puywpwi46pUKx5JWNAqhnEe6oQAWf8iVoA
 J0pU7ZxDU1iBya5COuGGJClRYWczCEchl1tlVm0tDhYN/GKh5tlzzw0q5Ye6zMfcK6MWFST9kwv
 KGHtUOGvpxG4/3PvQF2SFmMT4NwEXCSGMhz23aV0LINCYnF1m0akRuybOL3MEr5A/GzJsC5To+I
 jkFJkPXNRte6Q=
X-Google-Smtp-Source: AGHT+IH4PDPfoknGAMNh6qUlBg4iUvE8gsQC5JitQIK3kaMz6NHG7UP3emaCgcbIBB99Qsiw0VvCFg==
X-Received: by 2002:a05:6402:34c5:b0:63b:f5cb:e1fa with SMTP id
 4fb4d7f45d1cf-63c1f64fd4emr33960935a12.11.1761563532196; 
 Mon, 27 Oct 2025 04:12:12 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efd0fabsm5738233a12.34.2025.10.27.04.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:12:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 28AE360DA5;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 22/35] target/riscv: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:29 +0000
Message-ID: <20251027110344.2289945-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for RISC-V targets.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/cpu_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 360db133e21..c4fb68b5de8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -36,6 +36,7 @@
 #include "cpu_bits.h"
 #include "debug.h"
 #include "pmp.h"
+#include "qemu/plugin.h"
 
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -2175,6 +2176,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
     const bool prev_virt = env->virt_enabled;
     const target_ulong prev_priv = env->priv;
+    uint64_t last_pc = env->pc;
     target_ulong tval = 0;
     target_ulong tinst = 0;
     target_ulong htval = 0;
@@ -2197,6 +2199,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_SEMIHOST:
             do_common_semihosting(cs);
             env->pc += 4;
+            qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
             return;
 #endif
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
@@ -2466,6 +2469,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                         prev_priv, prev_virt);
     }
 
+    if (async) {
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
+    } else {
+        qemu_plugin_vcpu_exception_cb(cs, last_pc);
+    }
+
     /*
      * Interrupt/exception/trap delivery is asynchronous event and as per
      * zicfilp spec CPU should clear up the ELP state. No harm in clearing
-- 
2.47.3


