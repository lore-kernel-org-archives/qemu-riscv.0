Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BDAC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:56:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFD9J-0003hE-3z; Mon, 18 Dec 2023 07:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD9H-0003gE-Cl
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:55:07 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFD9D-00053b-M1
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 07:55:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3c21a95e6so2547485ad.0
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 04:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702904102; x=1703508902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+RUCSsGkS2iS/8+VH9VBvNixckTgdtzMOlrBnZRIQeo=;
 b=iihrkcD2UkXUdyjbwOllh6tENYt5EbzJ1+gjCW0cP/R2sgWNA3dgqSzOFdXa7Raj71
 7vASsE/CDtgIGzOQ/I5TM78djArctsruPd2KRCsYDy82jTPwZj6GxO+pxsZl1QA2kB5J
 9UqMHqd+j614gG6xJzLrj1lw4at9I3EruBny03rhFHDtfKVSjormMCfPyKkmCE3xkUld
 JIm24s/ubRkFU8rlnxeF5O1nbfNKUUZgONypAdw/oCSN6PwV4GK/lz8PdzAEFthB1A5O
 cJNamgcgPtH5Elz+0z7Rym9f891YOeKtRHE+hW9HUpaOJBHbFU5m0CmqU6kaqhey+H29
 uyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904102; x=1703508902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RUCSsGkS2iS/8+VH9VBvNixckTgdtzMOlrBnZRIQeo=;
 b=i1dDYc1jdRg8Vx6BB5cXiPWZRshFzd8I7pJ3up0rWF4PWyqZOTsUkfENsvZD752XZw
 wnuXZszBB9MYkDZ1W+TcSupMROhPuRasc+um6l5qzuSIQk/0H/YsuaienRN7vG39nkro
 Az9BXkZaK+SIq+rCIQiLzRBgT+wiGJo99Ixhx6rJ0mXl7xHjHKdMGb1KP/Lcx7NuKv52
 UW5uXumdDnZuVrhYE5u2nNldQVxgysxlUPj6Bb9TP56MXbATiqoNeP38LhmlIoWrpgOd
 qJM3nofc/Ujq5BhYiDiGOFmCs3aBgF4xZv9H9rGwNnjkH/DqIHWok6OvUvoV4VXCIPGP
 4xrA==
X-Gm-Message-State: AOJu0Yxj9/FfiB0n4ErOlMkB+2i59IXwKAd4Fy6A7PAod5gXRbbjdrcK
 I53s14Pg8RoEwjsisGZJfqbRIA==
X-Google-Smtp-Source: AGHT+IErnE9LGCNeTkn/wmWOzIApFqwIcUaDa5VCCB5gNUugpjeqh54qGZ8jAbl6BWYarlVSs/15rQ==
X-Received: by 2002:a17:902:dac5:b0:1d3:c4dd:142a with SMTP id
 q5-20020a170902dac500b001d3c4dd142amr543517plx.53.1702904102476; 
 Mon, 18 Dec 2023 04:55:02 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902848200b001d09c539c96sm7494897plo.229.2023.12.18.04.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:55:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v13 25/26] target/riscv: add RVA22S64 profile
Date: Mon, 18 Dec 2023 09:53:33 -0300
Message-ID: <20231218125334.37184-26-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218125334.37184-1-dbarboza@ventanamicro.com>
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The RVA22S64 profile consists of the following:

- all mandatory extensions of RVA22U64;
- priv spec v1.12.0;
- satp mode sv39;
- Ssccptr, a cache related named feature that we're assuming always
  enable since we don't implement a cache;
- Other named features already implemented: Sstvecd, Sstvala,
  Sscounterenw;
- the new Svade named feature that was recently added.

Most of the work is already done, so this patch is enough to implement
the profile.

After this patch, the 'rva22s64' user flag alone can be used with the
rva64i CPU to boot Linux:

-cpu rv64i,rva22s64=true

This is the /proc/cpuinfo with this profile enabled:

 # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt
mmu		: sv39

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aa33e7a1cf..f57a9ee298 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1560,8 +1560,40 @@ static RISCVCPUProfile RVA22U64 = {
     }
 };
 
+/*
+ * As with RVA22U64, RVA22S64 also defines 'named features'.
+ *
+ * Cache related features that we consider enabled since we don't
+ * implement cache: Ssccptr
+ *
+ * Other named features that we already implement: Sstvecd, Sstvala,
+ * Sscounterenw
+ *
+ * Named features that we need to enable: svade
+ *
+ * The remaining features/extensions comes from RVA22U64.
+ */
+static RISCVCPUProfile RVA22S64 = {
+    .parent = &RVA22U64,
+    .name = "rva22s64",
+    .misa_ext = RVS,
+    .priv_spec = PRIV_VERSION_1_12_0,
+    .satp_mode = VM_1_10_SV39,
+    .ext_offsets = {
+        /* rva22s64 exts */
+        CPU_CFG_OFFSET(ext_zifencei), CPU_CFG_OFFSET(ext_svpbmt),
+        CPU_CFG_OFFSET(ext_svinval),
+
+        /* rva22s64 named features */
+        CPU_CFG_OFFSET(svade),
+
+        RISCV_PROFILE_EXT_LIST_END
+    }
+};
+
 RISCVCPUProfile *riscv_profiles[] = {
     &RVA22U64,
+    &RVA22S64,
     NULL,
 };
 
-- 
2.43.0


