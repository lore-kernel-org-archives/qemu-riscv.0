Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9198C41513
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sHlIQ-0000Bg-U5; Thu, 13 Jun 2024 10:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sHlIP-0000Au-0w
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 10:19:21 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sHlIN-0003bJ-E8
 for qemu-riscv@nongnu.org; Thu, 13 Jun 2024 10:19:20 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1f70131063cso10526115ad.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Jun 2024 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718288358; x=1718893158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNUjy3Lyly2ANVQLK35XiynkZqf6DtnuQXKWv8PGktk=;
 b=iN80wjiCwCPOt9q5EXvOxGA6KTtEcP8DeVIy90fTHUriN1HjButDIhpLvVpLOS2TxT
 aHZht/JfMf7OpUrIoIAr/ApZeq7DXPnp4dxw2DoHbJrMcOhJMlTry3MUtS64wlUXRsW6
 Q96u+RC5oR7vPCg90aLhqGjNnR91/XktTk/wfLSmhtYZSPJT9pM03kzNKcEloFCE1D8l
 JBbh8GpgZFiw6BbTkieCZP6Wi7VGKWeiRykmAQmXZgcNkOl/DaoL0dcf+Ibv5C/pOdWk
 s0Ty2tcgpThHLTzKv0ixZmDmconanSEvAEf762Xp+cjAdT/sV6A+eolIAHJY31J+U1AQ
 Wmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718288358; x=1718893158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNUjy3Lyly2ANVQLK35XiynkZqf6DtnuQXKWv8PGktk=;
 b=nCos7ZjcDINlBR+465lW3FVT11STw4u8eniGkgg+w6CUmWnwqTvRtLdNYttlCB5L2k
 FEvzXrfXmBbGPlVRAv+y9iTPpyVUWCiO5CdpREngHG1TaNbq+tcy147SC+QTFcLdMTfi
 nq07cpnOSzoby2r4+8a0Z4avI3DyrZFOft/3bog3qGgvQUDSZHEN4OBqONv7T4Q+q5Kn
 gNP88Lc+tEPGg9OTFCW61dLCz2Ocksw800d0PZ3YgkogWBir8GRe3fIoYF049+KqIG/U
 dkHD9E9jWjXFq6OTdPi3DoFPemRji6ujqJYrqD6u9q8W0NM9VBUvlLMKzP0ImBX7anlu
 kwGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6H1IZnMmjiJWhaKjTYEWOI0P94Nyl4KWHXZtWHUG3I7S3FaTSU4mhoWjFq/SdUOD6wIwlMRsOo+yU7SVMrPFk8A+RwQY=
X-Gm-Message-State: AOJu0YyI1DgAVDNCoIAqqE7nFGhGh2g6M1uhq0oY1bbvBkMY1kXUMpr5
 Ka7e5pSQ1jr2Rz/LIv/I1jAwVtFb1nCPuHXIubZynn4JO/JvBbZpFcdy9baoetU=
X-Google-Smtp-Source: AGHT+IFyjAoh+fd9xQLCP3YENN/jZKZV4kWs86hCpMm4quKYFJ09IdIvgKf1e4Ae6OMfZt57tXJuCA==
X-Received: by 2002:a17:902:db11:b0:1f6:869d:25bd with SMTP id
 d9443c01a7336-1f83b678f7bmr55187435ad.37.1718288357878; 
 Thu, 13 Jun 2024 07:19:17 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f2fe6dsm14386975ad.257.2024.06.13.07.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 07:19:17 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v3 1/5] accel/tcg: Avoid unnecessary call overhead from
 qemu_plugin_vcpu_mem_cb
Date: Thu, 13 Jun 2024 22:19:02 +0800
Message-Id: <20240613141906.1276105-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613141906.1276105-1-max.chou@sifive.com>
References: <20240613141906.1276105-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x634.google.com
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


