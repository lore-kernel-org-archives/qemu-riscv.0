Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B63BC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:33:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUG-00078l-Nk; Wed, 12 Aug 2026 18:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUF-000776-4D
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:51 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUC-0000sq-FR
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:50 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cbeeaac53a9so946480a12.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573907; x=1787178707; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5H3dS6eK0R1hQKtnqZU8IILtlkBrVMAi0I3A2QXrcD8=;
 b=qFmevy8I8/cuvwW52Hp1CPVJSox2eiNv2JjpvfxCY/V4h17Wvf1warqozRA+iD4fqS
 YGfN2qQmPrRpXTBwA4Gnu5QiT1Npyesgew/+Vp1A2xS2WRrWKJN+SUBKhqe+VUUXdThO
 cXazdAeNlPclYLBdvmwUOhteXt764YCJ7XxGcMtCULkh7LsSxqk/Q6+m4udo3MZJ3KO+
 X9BEbD0Oag2hnOmEoOfELItiFist+emdIVeAGcHxqd86Di8v/f/gFLrS1skrqj4bfizb
 yQYyqSSuQe6pPr837CaXZ7hj5XL7PYwxriuW5CgHZxUC6ic0hu+ecVP1nPSd/zn9P8LG
 9UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573907; x=1787178707;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5H3dS6eK0R1hQKtnqZU8IILtlkBrVMAi0I3A2QXrcD8=;
 b=Pq0xFaCdcQvjoPfYzEPSO7A3UuIU2m2L8oRTxu2c96Xrx7RScBLQNrCuNSaX6zkjmK
 YCs3o5hIQf8eYK/hLsvjpFB0dyinV3sSiILAEelfbPv6U23w55NOfbUpPPUJaD8ULyC1
 ixMAKsDwEhsbxjIeGyispDzuvSeEdgDIIU01utnP+4Ibn1qN268u8xUaNMDyOtuEZ2Kr
 Umb58L3Xg1gt9CFxB6tehtkI4/Y79Jr4BnV6kLml7rqKKTsm3s/1SYsk/E9oYQjAkgbn
 XEvbQGZMzmT4LnLFj0n/WYNpYZ6XZP7F9okeiUFoK6ROL4y7RMiJ+GrtAcxUUTBUspaL
 0p/Q==
X-Gm-Message-State: AOJu0YwgJV3z90OC767RoGzK1CAL48s+RevN88IZtlYFic4xputNXZjb
 5L7CkbFmAnhPjg8oZG3mDvkXQePq5nnsAmPfpxiYtYX87OdUCYJB0Ffs4FAcGP/pJog+T+pAYid
 bxLi8
X-Gm-Gg: AR+sD13wTtM/YmBMK3QRySeEvxsE9xF5k9xAWXCeuBYtqkgvNKyuVEN4kFdn5wzkovV
 noqz1rwLskLR7Nwj3u01TlmQLGMgz9Ez0GglOCgW/AZtSLvZ+BQoY2qW0oPBaJo+TXHA4opT4Ds
 8IdSV6m3FJc+ruZWy8MKv2LYc69l1nEKLWY1zAwuayCV/fGaP9GVc4wfFL23MU/8msIGXKGbE33
 C8Wj1exv/CD5/Yveie4ka9OTmpGDf5RaoETgABbM4VeM5VbXOjyS/H4ogM07t4WL5cLA5UuKoXA
 007ivIcbIOt1fE7PBkfRlNJ992oC97c2QUU2Vlv4OrhxlBdNjLm75wHTMJmA0I+XtlHf0T1fWrZ
 oZn9KkfwTMZHJQSSUIRKQqUVFFkz4BmQQ4FE7Mr2gl8Ms9RxsMNzK0ZtsO6JjdqdArTCQyeKHx+
 PuFF2yjVtj5gxzrX4RG6cQ3OX+c5pRABDd1lm7jUJZP32Vn+y03yHDjzrEeFMe0/6UuFuMdkKWr
 qRAAB29dA8FYSrZkr/8
X-Received: by 2002:a05:6a00:bb0f:b0:848:51b3:f3c2 with SMTP id
 d2e1a72fcca58-84fc7505093mr849893b3a.33.1786573906793; 
 Wed, 12 Aug 2026 15:31:46 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:31:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 03/52] disas/riscv: Tidy dec initialization in disasm_inst
Date: Wed, 12 Aug 2026 15:30:53 -0700
Message-ID: <20260812223142.349142-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 012f90fce6..986dc6b752 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5441,10 +5441,11 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
 static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
                             const RISCVCPUConfig *cfg)
 {
-    rv_decode dec = { 0 };
-    dec.pc = pc;
-    dec.inst = inst;
-    dec.cfg = cfg;
+    rv_decode dec = {
+        .pc = pc,
+        .inst = inst,
+        .cfg = cfg,
+    };
 
     static const struct {
         bool (*guard_func)(const RISCVCPUConfig *);
-- 
2.43.0


