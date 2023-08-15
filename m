Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6222C0015E
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0Sf-0001V7-Ba; Tue, 15 Aug 2023 16:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0Sd-0001Ua-5C
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:16:15 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0Sa-0004vT-MD
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:16:14 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bd6a34474cso149478a34.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692130571; x=1692735371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9lSDeBryekDaWv/Vc78YEkpFPDXZkfJPoxtpTCKUds=;
 b=cuPKye4ftSE2bQsWLVzJyFLZG6ZPR9gb1PdO0OuPQyjpL3hw6pPAIAvigzeT9usq8c
 HDFCKGQkl/TSwsinizMo/099CgXhO+JDSmVhsk9lFJwCtsjcaNYj0sS72dKPFywGg6cC
 VuSxLmVmrwAVymAPev7P4iOVA/ksoYf5ONmg8zjXbF6CiBsC+qsyubTRAS1i2MN1anfs
 /jZnFJI8FuEx5jYn0dESaNjqGkEbLvVXpZ8erEsMSfyjgNjkMUkPmIWnUcy72yRJstH7
 YlNmvzqKHRiu7EIOp0FuoEw/PYBJITf6Rdaha5XR456bmVUdjksJ/7ZEPi5xh3q7Wq5A
 3bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692130571; x=1692735371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9lSDeBryekDaWv/Vc78YEkpFPDXZkfJPoxtpTCKUds=;
 b=j2xDeIgkR+MCVWJJXLuncpYMZJoK7PAl1Ido+LbpOEFUNK4E0SUyuihzfzDxqnnTQ9
 eGbWFDIl7Pw3sTTkMeQPacrrfo9mghBwwWLC5T1EDi/yooY+geCo6YQ9WvWi2pU4ELxJ
 Y5lxex//EYcLtmVcnBL2YaHoFxXCpwRGYjhKPgEJrXCmDh9gUhOPrvIsU5NF7hT79CAR
 gkScYIugcMcKERCNcH7iiRfUvcL6ud94k2kBFQSSiqvEnyF5/Ak4z3IDXncdEZ2NCVwq
 uC2gA3E7V0BBNaM0FGL8P1dSYfnDNF1ojkAaOmJUgRe09ZBg8Ae2LAZmb/iHEjbvapla
 ERzA==
X-Gm-Message-State: AOJu0Yx5s0qVuFhbbBzPqI7LGprHSA27wqa/3zvzq00qqkc03POy0Amj
 U7LVp7klhYdUIc5LlcM5bAdaitHboZzyzpX1kTg=
X-Google-Smtp-Source: AGHT+IF/CB18TZq1uMu8r5/ScwM+24/BOl5fxrcZ3vcIzorDYOfK8tBFQT5tWJBtByU4cFPLuuBNYA==
X-Received: by 2002:a05:6870:7023:b0:1bb:933b:e6da with SMTP id
 u35-20020a056870702300b001bb933be6damr15229318oae.27.1692130571608; 
 Tue, 15 Aug 2023 13:16:11 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a056870e80e00b001bb5b2a958csm6658203oan.23.2023.08.15.13.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:16:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 02/12] target/riscv/cpu.c: skip 'bool' check when filtering
 KVM props
Date: Tue, 15 Aug 2023 17:15:49 -0300
Message-ID: <20230815201559.398643-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815201559.398643-1-dbarboza@ventanamicro.com>
References: <20230815201559.398643-1-dbarboza@ventanamicro.com>
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

After the introduction of riscv_cpu_options[] all properties in
riscv_cpu_extensions[] are booleans. This check is now obsolete.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9a3afc0482..f10d40733a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1907,17 +1907,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
              * Set the default to disabled for every extension
              * unknown to KVM and error out if the user attempts
              * to enable any of them.
-             *
-             * We're giving a pass for non-bool properties since they're
-             * not related to the availability of extensions and can be
-             * safely ignored as is.
              */
-            if (prop->info == &qdev_prop_bool) {
-                object_property_add(obj, prop->name, "bool",
-                                    NULL, cpu_set_cfg_unavailable,
-                                    NULL, (void *)prop->name);
-                continue;
-            }
+            object_property_add(obj, prop->name, "bool",
+                                NULL, cpu_set_cfg_unavailable,
+                                NULL, (void *)prop->name);
+            continue;
         }
 #endif
         qdev_property_add_static(dev, prop);
-- 
2.41.0


