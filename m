Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A825C88CB2
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:18:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZIbQ-0007gu-U8; Thu, 24 Aug 2023 18:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbQ-0007gU-1d
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:14:56 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZIbM-0005wj-Pz
 for qemu-riscv@nongnu.org; Thu, 24 Aug 2023 18:14:55 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-570db728a48so234232eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Aug 2023 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692915292; x=1693520092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7j5xIUzMLaGd+jjgAwhGcwkt4kW+A6Q1AbkmCfi1ylU=;
 b=lvDpTW3A5gb4Keno15GQpycbl3b1IW72xb0G7hPOizEmBcOV1zukQ9JyNzcYDwZqWs
 n3l2ktxSFjN+QhjkMrogAV5OKF8WUFo2//GHABaDzvtctoPcEC+guVNvJVpi6hwsXo/5
 gdK5+tAhyKf6n30XYh7CRoAZhZD+emGD+YtLg+b1WIBmeriqTQuc3vLAtRM0L0i8q0a0
 laQDLn8DHiSbWPW5hEYh9ORNYoiRBiEA6YC5m2KIJ48K9vSD8IhH7fmU3Ea2B9k928Zr
 bimvCUjyG9B2kbYrklaIkdunTj7AeUdquX2BpxoyQYsjX8Xkm+G7x+/2GykbCNKHT+3w
 wsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692915292; x=1693520092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7j5xIUzMLaGd+jjgAwhGcwkt4kW+A6Q1AbkmCfi1ylU=;
 b=THXhWHLcEJRzCzjwz1fs42EoIK6POsCVjLpUORx1uJaruPDattadT/pg1SIv9WPF6G
 RUEzpwyu4vmvjdCs6gNIXFCL3715oajNeO2RrQQs+31PMzg0ClnLV8g/BV7dU9tTE+yD
 p2NlkwwpT+D4F1zI4u73cMWeWtSVeSU+f+y09OKYxzZpFpTVJGtGmwfQpe2ETiPbqoBO
 78cheBP8gXyd6t8BYUP+Y2kdQrMVc2w5I3TtkRViezuv2ufAIBAtIPfhOIZMCUNDfHTc
 QmDfxO7L/3yHgW2C8yyNZP/nXfWlQMD1GEegxDqejYeq2WBL3+oKWYDCwN+gtZA0wdRn
 AKaw==
X-Gm-Message-State: AOJu0YyMVU4s0BIOu2kxI5S4ZgUmUOBFgJXWsqCd0l+gjvOrMMlqb/z5
 f5RRJ72CGS/4lHBmcGA7HResow==
X-Google-Smtp-Source: AGHT+IHnwCc3MbsiPxEwq2Kl5i0tEP23vAYMXoOAfI0I+VnGftzaWLnCmKnmJ+EaGn5O8cOPDM6pKw==
X-Received: by 2002:a4a:275d:0:b0:56c:dce3:ce89 with SMTP id
 w29-20020a4a275d000000b0056cdce3ce89mr3264003oow.5.1692915291799; 
 Thu, 24 Aug 2023 15:14:51 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 o129-20020a4a4487000000b00565fcfabab8sm256338ooa.21.2023.08.24.15.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 15:14:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v8 02/20] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
Date: Thu, 24 Aug 2023 19:14:22 -0300
Message-ID: <20230824221440.484675-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824221440.484675-1-dbarboza@ventanamicro.com>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
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

After the introduction of riscv_cpu_options[] all properties in
riscv_cpu_extensions[] are booleans. This check is now obsolete.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a4f95991d..6aac3ba1d1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1970,17 +1970,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
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


