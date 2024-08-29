Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FADCA0ECA
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 23:39:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjofH-0003wT-Ul; Thu, 29 Aug 2024 19:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjofF-0003oM-Dj
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjof5-0003AP-0X
 for qemu-riscv@nongnu.org; Thu, 29 Aug 2024 19:34:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2d3ec4bacc5so1624661a91.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Aug 2024 16:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724974481; x=1725579281;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVrxnpz839aLLYnBnHuqeTltn+xpAuxyl7GsFPJsO10=;
 b=KVB/XD2kt6m0QP6VtLzKJdt/AKEG0/Mv5GVk+OklQg5d5LcP/F7iBMqxhD77kheGHC
 CYxrJukDgg0CbsEpnx+VkJhm3un6U9iYfRhZnlWRaQdDLqySOC44vTLx1ab/OduPjzWD
 ddWM9SfbpHetyOYU2YpEDB2ycPEUb/awj5NxVPOLicS3QSoK2t5p7R7qVGMA0BkNIe1S
 OByk1FWa4UNfoxQ+bKxLXah1Mh5NXYJPTCUwPWO29B+rjMzCli8XEQOcVW4YOXIqTg0U
 CzUKDMZRxSxrIbWzLgKAtFYVFaad2ZIrvlhult373auGLE1l6rTOODnH93lanjzbMzYn
 Wmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724974481; x=1725579281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVrxnpz839aLLYnBnHuqeTltn+xpAuxyl7GsFPJsO10=;
 b=HDDV/0mhxPQMVgdOQlLdiZlWC3pE9HYFYFC9SDAyU/QzRoujhN/aadXl6iqrtgHpf2
 pjOvjboBBS3XANb/hcoJUax5gYyp41WI7xlz3E5vb/zyd6gzcnFIxkrym9VkosPS1lOk
 Nd2djr9Qd87WqYhLoNSYdYJKUL9KThp9mmqGY6Dt++RSEfm9GXG+QpRXfpUFRjWNaKrf
 l1GhQ7SyPQc4PBk0yHzF7TT3TOQgnOn0c+10mMioIESoDkfj2EY7YwrYtrk/AV0TPiQ2
 womoOUA6FLGQNEaUeUXNSLPt15r6ptzCfw8+ylpgdtiTRPKh2WYXjeiq3qgFlsTu86cL
 tMpA==
X-Gm-Message-State: AOJu0YzYOQBEdwqoQ34toPTEAnucZYCaIlVo7wh+79o6vciqqi+dAzRJ
 +OMrUJVWV/iDP/XX8XDIrqlLqtbykyvB9fxM/QTks/cdeqwaZnyBUf6Y3bvzS5pvk1f1YfGIL1r
 k
X-Google-Smtp-Source: AGHT+IHOzePZe/EpnOnHVaSSN8/mia56d+9nDGEozYX0PGWueybh60OW0A+m7g3zI8UqiFCq0J2Q8w==
X-Received: by 2002:a17:90b:1c03:b0:2ab:8324:1b47 with SMTP id
 98e67ed59e1d1-2d86b00d063mr717737a91.15.1724974481406; 
 Thu, 29 Aug 2024 16:34:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d85b13df55sm2331074a91.27.2024.08.29.16.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 16:34:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v12 09/20] target/riscv: Expose zicfilp extension as a cpu
 property
Date: Thu, 29 Aug 2024 16:34:13 -0700
Message-ID: <20240829233425.1005029-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240829233425.1005029-1-debug@rivosinc.com>
References: <20240829233425.1005029-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 55754cb374..c9aeffee4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1481,6 +1481,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
+    MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.44.0


