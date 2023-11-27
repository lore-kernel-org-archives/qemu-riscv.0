Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC5C07CB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:40:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwL-0003sk-1m; Mon, 27 Nov 2023 06:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwJ-0003rF-6e
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:11 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwH-0005Iq-1I
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:10 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6cbe68095a3so2851434b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085088; x=1701689888; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFIiKbikcqzRdI/piBFTJ1Oi22cwo4vdUZE7XSpcBYM=;
 b=kzr/ecxw4nXAxdhDJVnAx9qv67J25qEFYlWoKJY5jKKxIgHy7W6wF/7u6nnh/ulP0Q
 V/Nm+f7nd9pmFTOgP7JiWUltC4LepYAqfKRTGtVA4Ip8xC7ap8UWeP1Hnp+CgSYnz1zf
 fuGq9zpyDxyNSWWoonEYC+Q3VcDLAV7bETYEKULNbyydAXLzaz6tY3hcdZNTIc4FqCA3
 LbH7lyYkNywJ9IkAtrvHRMwrwHA82T1RoCkoWcc3lEDDf5W290xXzqax0Q2/7lL5B/kI
 raNosJ3Ktwns+tSuJzxw+qyj6ch6FRAagVLlkKf696CjYCPYqZAy1zUqSMRi07u2mXae
 ULWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085088; x=1701689888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFIiKbikcqzRdI/piBFTJ1Oi22cwo4vdUZE7XSpcBYM=;
 b=Ks7HIfBf/46fuKF54/kAOgu8F7Uy7J4WrEOPfdBk03NyUQecoTd4qDdDmEgnP+ssCW
 4ez0fpnVpDC5NvD83LfWTVU7kJLJdaSKqlalYQcE2vsZpTwV1/mtoAWsB7fsv82V2lWK
 IT4t7/PDj0MfUVnbtqFL5xkvb16ZPB3iOb2sATxbxIz2IqH7+2R3DSzQ/vnxbLOfR1kj
 Tz2DFc+f844kT3dF+xKATTeqKJDo5vJhaaBqdWVzCc+N6WL8No/DjPaTWhudpUjO7mBK
 4YzS0/uP6PzIgnQkow9THz2MPc6VpFN1SlsRzTJxHHMXxSunxayLq/jC5bCaWElLqt2b
 d1xQ==
X-Gm-Message-State: AOJu0YwSS0IOtRMCLyCZlh42gkomKORZfVSBb//37vFq2XyB0RQO2Ko6
 vP8dfT+rp5abN0sQ/1VgI6OI4A==
X-Google-Smtp-Source: AGHT+IEJOsY0Ijav334YjzFjvVmEm0ItSdN6jcFbWMkUAm/F85jAFNAPaRBqYOSeCY4oH4z/ILmqMA==
X-Received: by 2002:a05:6a00:1d24:b0:6cb:aa0a:6fcc with SMTP id
 a36-20020a056a001d2400b006cbaa0a6fccmr11988718pfx.1.1701085087676; 
 Mon, 27 Nov 2023 03:38:07 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:07 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 3/8] target/riscv/cpu.c: finalize satp_mode earlier
Date: Mon, 27 Nov 2023 08:37:47 -0300
Message-ID: <20231127113752.1290265-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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
finalize() method, it's safe to finalize it earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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


