Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FC2C27C75
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:51:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHobo-000743-4N; Thu, 13 Jun 2024 13:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sHobm-00073R-OG
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 13:51:34 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sHobl-0002c7-4z
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 13:51:34 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-70436ac8882so1038666b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Jun 2024 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718301091; x=1718905891; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNUjy3Lyly2ANVQLK35XiynkZqf6DtnuQXKWv8PGktk=;
 b=WJe6yDdcZVauWtyHsgD+g/Rfgk/clMWldRQoGl+MRbGCqpPRALDTeJBf2XhTw0ylTU
 ZUU2SUpP/i8Onte0mkh/fXe5hNW9d8FrEMLlsD36ojbu0/nKdKZWCqWIkFG9TfauqXNR
 SKDezjH1vJiI8iutFhIRUi0eRfCKldYayLoagnx1CuDv4gxfIhQsqrNy0uzp3XT1opWy
 KuzEZDWku3NxdK8FIGFr2rOUH0wt+huoW6KFx8AOrvGWVKtP9REqNARduorWYenxSNNt
 08O3das4h5+B4aK9IEo2xnz8HskjnD1IeAs3fkhM4VGUnAuUrru3FDNfcPOwIBj3adTu
 7lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718301091; x=1718905891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNUjy3Lyly2ANVQLK35XiynkZqf6DtnuQXKWv8PGktk=;
 b=NfaJAC1XhY+Y9BYnWim6mRexEIwwhUpAjI7YWPFnv2Wslm+OZ70GR7105xjfVOWFfp
 s8lCtvQycWNBgqnBIxOYJriwQOtGeiEwIDhbGA+IQu2ei6c7DbcuLD8MlR9+XDcmShuz
 uhaigLufhnlWLQEQmPPLjx06FC3wHZvyPAHeoHzQKUtuACQEJY1Ik3UIPJAFwfvfknoU
 dGFnfVdP7yncXlJbKw1c1dxdEvGxkfduuWw6omSYxsuCkccuIRoMi5tYcPRfhWT08C7n
 +xpXICDYJxk5vdSVDah0xVCPIogLMhm0+HXFhAA8JvHM3zYYZcMzeU3anmIpxRg4IXB0
 aomg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsX/A/E0aeTdvST7JKFkLk9OnovQsOGft1ydz1N+462FrBIBLndkkt3neQbbwL26Y4cA1K+2osw5lr0ejCety8AIRH0c8=
X-Gm-Message-State: AOJu0YxtJVTtGePw1sQNOUK2/FvNPdNcB5cgBFV6CgK48gSZZtyVxYme
 djf7rJJs0AGIvLTWVTjyleQm4E4E6b0nTB4ubZvovTjurNMOKPBzXIiW5tYpxxg=
X-Google-Smtp-Source: AGHT+IHYqDK71TEZxwPnnIjXJOgXHegKA+sDf0Qn5rFUdrD+9W9VcTgb8UIvgrZp1pVusHPQ45WoIA==
X-Received: by 2002:a05:6a20:258c:b0:1b6:d979:fb38 with SMTP id
 adf61e73a8af0-1bae7f0c2bbmr653007637.31.1718301091534; 
 Thu, 13 Jun 2024 10:51:31 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e55d7dsm16780865ad.14.2024.06.13.10.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:51:31 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v4 1/5] accel/tcg: Avoid unnecessary call overhead from
 qemu_plugin_vcpu_mem_cb
Date: Fri, 14 Jun 2024 01:51:18 +0800
Message-Id: <20240613175122.1299212-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613175122.1299212-1-max.chou@sifive.com>
References: <20240613175122.1299212-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42c.google.com
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

If there are not any QEMU plugin memory callback functions, checking
before calling the qemu_plugin_vcpu_mem_cb function can reduce the
function call overhead.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 accel/tcg/ldst_common.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/ldst_common.c.inc b/accel/tcg/ldst_common.c.inc
index c82048e377e..87ceb954873 100644
--- a/accel/tcg/ldst_common.c.inc
+++ b/accel/tcg/ldst_common.c.inc
@@ -125,7 +125,9 @@ void helper_st_i128(CPUArchState *env, uint64_t addr, Int128 val, MemOpIdx oi)
 
 static void plugin_load_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 {
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    if (cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
+        qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
+    }
 }
 
 uint8_t cpu_ldb_mmu(CPUArchState *env, abi_ptr addr, MemOpIdx oi, uintptr_t ra)
@@ -188,7 +190,9 @@ Int128 cpu_ld16_mmu(CPUArchState *env, abi_ptr addr,
 
 static void plugin_store_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 {
-    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+    if (cpu_plugin_mem_cbs_enabled(env_cpu(env))) {
+        qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
+    }
 }
 
 void cpu_stb_mmu(CPUArchState *env, abi_ptr addr, uint8_t val,
-- 
2.34.1


