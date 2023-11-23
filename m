Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB90C5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 19:17:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6FB4-0008Ub-W3; Thu, 23 Nov 2023 14:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FB0-0008ON-Ny
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:15:50 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6FAz-0003kn-4A
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 14:15:50 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ce656b9780so8459515ad.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 11:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700766948; x=1701371748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzVLyJhe38kZFUDSFuU/9rcqCOh/CTumw3tEFLT/sDQ=;
 b=onNyqg0Bxqn7U0lYW/c5TXeDW9gWGwRxIED+3wLOTonEahbimy5iwtvCobFG56peEm
 6K0Ey4bAKZBlR0vE+gV4FbAnGAY2U5pFvi4FE4UdzYI9nfiXkveH/r/f8Ii2Qr9SKecW
 UelQIVbzx0PY29mst83wYtEpl9yifo8aVcw5Cm+iLy7BrUDoq3EBZxjLbFQpZHxXhDlL
 9VLtjlVDPS6kyQOK3kV/R23NzatYM5wqfFzGiG0ChgHKVgOvqPucMljLzJf215KaT6Go
 FuQFkSVLJORe197neNGhMU4pGQHOM69VBeVRU8Xqjkv8QrjZsGXw8hgIfg0GowExzXgR
 GO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766948; x=1701371748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LzVLyJhe38kZFUDSFuU/9rcqCOh/CTumw3tEFLT/sDQ=;
 b=vq2MiV9iDv8yV19s05eUaEY8wa4SXriKBOp6V2tsX1RXHDojJXi7OxlR0UnARc8aXA
 tVzJzKi6/2wfB5Q8Q7RuA9ZOzgXXj/S553moFDgznDAIg7H5WJsWsJOZZiz3obMONDU7
 yE89Q708vG1RZLTR9W09ZDq/fpBDRshZ++hdKhQXIS45ydScHe1E8SRLBPtX9Gyidg1Z
 59rTY+pHoLw0yTFhplFCTzVmR5R6cvcyCDrZYgZfgSgeQgS7ZtAJpEV0HR8yDZIVk8xa
 NgnfhDmzC56PnnkjUSBTLd006BYYV6NUbbE5c5S9Ftd8EEg5oZoG4T0jKRMyIiExYD6h
 4DSQ==
X-Gm-Message-State: AOJu0YzC6hbRgLgSdvegLrlJNXIaA9ABTkv2Fo3NhMQ9ucwaC1cDkYgB
 GbrBujsM5d7MJjjWnb2zYMZmsQ==
X-Google-Smtp-Source: AGHT+IE+yame+jBp2sa+nHl3H/sz6JSu3lqKs3lArrXzETxJ5BbxIHz55Ct6TZxeWNEbOA0y1a23MA==
X-Received: by 2002:a17:903:22d2:b0:1cf:6bc2:223f with SMTP id
 y18-20020a17090322d200b001cf6bc2223fmr388837plg.51.1700766947694; 
 Thu, 23 Nov 2023 11:15:47 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902eed500b001bc21222e34sm1680760plb.285.2023.11.23.11.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 11:15:47 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 3/7] target/riscv/cpu.c: finalize satp_mode earlier
Date: Thu, 23 Nov 2023 16:15:28 -0300
Message-ID: <20231123191532.1101644-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

Profiles will need to validate satp_mode during their own finalize
methods. This will occur inside riscv_tcg_cpu_finalize_features() for
TCG. Given that satp_mode does not have any pre-req from the accelerator
finalize() method, it's safe to finalize it ealier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 29a9f77702..a395c77bda 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1056,6 +1056,14 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifndef CONFIG_USER_ONLY
+    riscv_cpu_satp_mode_finalize(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+#endif
+
     /*
      * KVM accel does not have a specialized finalize()
      * callback because its extensions are validated
@@ -1068,14 +1076,6 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
             return;
         }
     }
-
-#ifndef CONFIG_USER_ONLY
-    riscv_cpu_satp_mode_finalize(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-#endif
 }
 
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
-- 
2.41.0


