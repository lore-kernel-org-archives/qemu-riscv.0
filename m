Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1E9C54743
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 23:22:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sj5TV-0004Ic-3t; Tue, 27 Aug 2024 19:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5TD-00039b-IV
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:19:28 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sj5TA-0000sh-Vn
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 19:19:27 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-201ed196debso54428335ad.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2024 16:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724800763; x=1725405563;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGGmvWw0RY1iWRrruhF6H784nJTg3545+D6bTLHJ0CM=;
 b=R+B8PPk5vS44DYMhHUw1Br30BOZwvxtrog/4nDVcQuGoS/t+oZUI/TFZvdZvkjeR0t
 x9LQigZDs4wNv5SMchBtSKK+7ZjI8hExoUL3USDXdnWDa5XukGYNynR6JiaY7adgPprK
 YdhkbPTQ2ShD0Bzc/wiUWWRMOCL8eb1voq5Dy1qO3OfBzrcCCfke73feLiBW4VZRPTTG
 Mcyc1HE2DJbTJ7EEyeNZoeuy7GYveG5gFNUtzHSHNk2D1c8CvB+zPIaQu+CFRsW3kknb
 cnhrBy8BwRbFM6pPaGj1VsAGztHVfDHsQOqm49JLX0JLl3549nozYz8YdpgmuGujviIX
 Gc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724800763; x=1725405563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGGmvWw0RY1iWRrruhF6H784nJTg3545+D6bTLHJ0CM=;
 b=Bqy3Ixwccrnm9l077QxufjzzAu2gp0py9XNRbVIzNH9d2S4ngjTbS9kB43eGcfcEd/
 FY/MlwCL5hrtVsVlhUwOnpImi7cx0p+OON8ai5u2MWCunXEhldPR5cVcAlf8ymfdEU+a
 3LKUbbZNi1JS0mrd/jTwbPqdsGoghX0j1bIukov4gAMgv8JtOA3dVOU1igM4YxbHnKe6
 VRBFGt0ymCCw9IuRfhBr7KfW9Ue+93du71X+i1w7X6qfl0lpx6CJzwbpoOcQ8nknc69A
 y50HHlE0rByIiWXjzl2cfH+PsomziTG+T5yRiXCeF6JdaiWeXPnOSKI08s3dTXcyRmFl
 +phw==
X-Gm-Message-State: AOJu0Yz506jRawgEVygU+ZkkdGIm+1qbQPWstnO5My/YbhI/nVoTAg+6
 lo6mdl8N3ZwRyZoIemC9y0a7SwqA0RUvCkFdwDVoRY7Yko1qXh2pOcN6GFJ9G4Kadrr4graRPQ2
 r
X-Google-Smtp-Source: AGHT+IHfX2UEhSLbQ+A+InwOt04wzuJXJKfegKZlrVewVNzS8PQTnKt7bmecIv9OnJCOQw/LlClwMg==
X-Received: by 2002:a17:903:2302:b0:203:8b7c:c8eb with SMTP id
 d9443c01a7336-204f9c87c1amr4792345ad.63.1724800762932; 
 Tue, 27 Aug 2024 16:19:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0ee6179sm57785155ad.92.2024.08.27.16.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 16:19:22 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v10 10/21] target/riscv: Expose zicfilp extension as a cpu
 property
Date: Tue, 27 Aug 2024 16:18:54 -0700
Message-ID: <20240827231906.553327-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240827231906.553327-1-debug@rivosinc.com>
References: <20240827231906.553327-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62d.google.com
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
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2d031e3e74..8e1f05e5b1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1476,6 +1476,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
+    MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.44.0


