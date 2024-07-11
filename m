Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE10C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sS2KS-0001Cv-72; Thu, 11 Jul 2024 18:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sS2KP-00010f-3m
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 18:31:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sS2KN-0001fX-EA
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2024 18:31:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fb70169c23so12919415ad.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jul 2024 15:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737110; x=1721341910;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rqjlcgIgmq16A+DWwfByj87bRnzwHK8etosGH79pS4o=;
 b=KDois6StV03Q8UlgIbdUnhODv1sGxOcyCeFBGDnag2Ry1DfHDh6QOnHclbrfHURD4e
 xnkCZApVIJCqgCuPj0Gq/OgFAd+mlz2NxCfPh+GHqWwGkhdpir/xzXEwoIllndGEgQrS
 Z28q2fsKv9JYunmFU/tRXQ/aJNS3aHYXBc1fN3V55F6kVYvn2VZKaNYNdodsdyPVd6J1
 bPjpVMqgOdkLfEC793A//Y1eTcq0iI9sPA6uDndd2MMVASOSr/LpquCNNS/AWseVXSfl
 HtJY7YXiRh/sgXPHzmE7OyPPghFYmzFeN+Yq1x6qYa967Ix1bKYGHCh84QHmovh+AojV
 v6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720737110; x=1721341910;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqjlcgIgmq16A+DWwfByj87bRnzwHK8etosGH79pS4o=;
 b=dsFISnSbBShby2Mf53ERl+vcqVCoh8tlxOujYaer6amMX/5xOdISYnFyR64Mf8kBgT
 S/n8oW0FLU3wGakyrL3jecD4zJI5/xMWNaQn2J5v0Vl/m18bLUjfxnj0FRYb8keSWDwH
 WNO55TuhLLD1ajjntkqvMEMrqfxv8DwHvNAlFNz+oq9MG02P/UX/xP3xmSSSW2p4jtpv
 p4wY8LxFaLwme1LCBYn9YY89HWzF69xJ2tH0qkx9exInLpZPv80OCGHN+IkrVxkpcz96
 ZDKryL1zgi7V7W8avXg7EUnKwwJC5UTCK/aXiY/NKpHJPlGoYuIGrw0EmgqDT6Nf5kjf
 CfPA==
X-Gm-Message-State: AOJu0Ywk1wMOKIyCeeJbNbfJaigLYypSFTTsAqGnk4WXBWumiV49b5os
 i9XBd1VTzdCVQ15xvhKCgi6aUj4n46TvrEUl+DugV9cu/CQsm8LRpb2xe0EfSGn/K9zC0E4mXVD
 D
X-Google-Smtp-Source: AGHT+IHicJpJHv6P8ExOwUd2AuxjdQfvUpY5FOT0r1dXGuV6ImK+4MuoBztapO0yrd06Lr2TjzXGkg==
X-Received: by 2002:a17:902:e745:b0:1fb:696a:47b3 with SMTP id
 d9443c01a7336-1fbb6cda899mr89884775ad.7.1720737110269; 
 Thu, 11 Jul 2024 15:31:50 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6b34ca2sm55161565ad.53.2024.07.11.15.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 15:31:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 11 Jul 2024 15:31:16 -0700
Subject: [PATCH v8 13/13] target/riscv: Expose the Smcntrpmf config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-smcntrpmf_v7-v8-13-b7c38ae7b263@rivosinc.com>
References: <20240711-smcntrpmf_v7-v8-0-b7c38ae7b263@rivosinc.com>
In-Reply-To: <20240711-smcntrpmf_v7-v8-0-b7c38ae7b263@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Create a new config for Smcntrpmf extension so that it can be enabled/
disabled from the qemu commandline.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 63f553c92b00..ef50130a91e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1468,6 +1468,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
 const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
+    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),

-- 
2.34.1


