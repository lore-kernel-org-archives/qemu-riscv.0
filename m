Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82693C02183
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 09:38:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXdMc-0000YU-PI; Tue, 14 Jan 2025 04:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXdMN-0000UE-8Z
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 04:37:21 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXdML-00050i-NL
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 04:37:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21bc1512a63so28527955ad.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736847435; x=1737452235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9/JjQJ3HM6kitYi8wCHcCHbHqMkmYFZQmnTTQp1QYM=;
 b=YcGamJu1Y7AUTuI3WMdPlt8ZiU4lgoUfhfcwQypGqKggyoPcg5mEeaSVULp9eRBBHK
 QuZ/b8nZtYAcxuWgAMf+cF3dTp2xBC6oaYXDQyCpMyn+khrEwuI3cATnaOLSxi4lsdKn
 E4PLLNyhYw6yFyCzDe+YFyRve2dpEzeIJfmQP4ofq/WA19uPjwo0rWXfLxVCJQTjG6fy
 6+0voQMGgWLxqUYoIgMm0nHHXPybetUdOrbLBavbiBfzXqxN7oJGpafd/XTiMxuhuhDa
 ONE0FX9ZNR9Fe2e5ImLLRnXB+B42MeECto0Aydx6rGMOZDNCj/YyHawf8jgxmq1ZcrL4
 u7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736847435; x=1737452235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9/JjQJ3HM6kitYi8wCHcCHbHqMkmYFZQmnTTQp1QYM=;
 b=q4ninC34VPKiTmmS3fER6U1BXzA3aH7glarDrZaNNIhoyDr4Q/yo9lCona0Bb/N5Uf
 p/gaLlNZpZbWH/PZDzbBZGXQ+POydmjhTsZDapBRsXUNJsAyFVSNhegUWBbWvXIR/YJh
 fd0Y2ORH2D+4ozyOG9vJlCCxL1h+Ep55A6HmDvriWq340KHYuvPR0O77yBrlyzj+SfPm
 IL/KCwnSK6gSp9nwdyhgyxqIoiCW2Fn5XQIMSMSRhG8O3c0+MIEHMC+3B/xnn6L9PyF+
 O8Muf9DWtFT6o4Dc76n7MqcPY/SKlxKHeQoc9k9JcYRK/UTdF/hhB+mTsX1FEy9f1Cp8
 PziQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkZsCzf25Tw8Ga03nS3v/sgx1t5zkw6qWNU0O+0nTzO2KBMp0WNa28wORXyzVZfUVUnVqVG0BpMkws@nongnu.org
X-Gm-Message-State: AOJu0YwbxNpKqA2UQ5m/6yHodyQRevTSJ1c5DZTqg99vFpYgCBSIVZYc
 P5YZK0fA++2Z/mfSTK+O57h5FuE4keJSGaivtTuj1qFOrXvjzsJrfEwjgPs6GY0=
X-Gm-Gg: ASbGncub9LVIxZHjdhTcBQfGua107kv18gurBqpXh7FVMXt0K/VIzJOOjtSI2DwWXck
 hPX/cxNnQEmGA+txzUhFIoLmijJdKV1Zq9a2fGZPvNSWAMaFS0mPaTV95WnSa6kbcufoLyN59tW
 ho+pnU5feCamCToKrR1dwaggmcrEeT9CAFJEgKt2gx81ACVxpezXbTMNadrltQNgkD/2y2lf85n
 OAAQ7qXzg768R29iNVUEmg2BZljxH1xlA9FRenIilKtfqGo4prQ6dzovYsdky/bfKlPVIiBEQZm
 utgJA2U1
X-Google-Smtp-Source: AGHT+IFD9TBPDpKn2f1NoqV+RF4ZoiMvkPpQe4Nq4LFizSjzfngGhWTa3m/DV7J6HDA5e54bt+tbyg==
X-Received: by 2002:aa7:888c:0:b0:725:df1a:275 with SMTP id
 d2e1a72fcca58-72d21ff51e4mr36320676b3a.23.1736847435587; 
 Tue, 14 Jan 2025 01:37:15 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d40658dccsm7300718b3a.92.2025.01.14.01.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:37:15 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 2/2] hw/riscv/riscv-iommu-bits: Remove redundant definitions
Date: Tue, 14 Jan 2025 17:36:46 +0800
Message-ID: <20250114093647.4952-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250114093647.4952-1-jason.chien@sifive.com>
References: <20250114093647.4952-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu-bits.h | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index 485f36b9c9..de599b80d6 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -50,8 +50,14 @@ struct riscv_iommu_pq_record {
 #define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
 #define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
 #define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
+
 /* Payload fields */
+#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
+#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
+#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
 #define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
+#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
+#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
 
 /* Common field positions */
 #define RISCV_IOMMU_PPN_FIELD           GENMASK_ULL(53, 10)
@@ -382,22 +388,6 @@ enum riscv_iommu_fq_ttypes {
     RISCV_IOMMU_FW_TTYPE_PCIE_MSG_REQ = 9,
 };
 
-/* Header fields */
-#define RISCV_IOMMU_PREQ_HDR_PID        GENMASK_ULL(31, 12)
-#define RISCV_IOMMU_PREQ_HDR_PV         BIT_ULL(32)
-#define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
-#define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
-#define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
-
-/* Payload fields */
-#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
-#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
-#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
-#define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
-#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
-#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
-
-
 /*
  * struct riscv_iommu_msi_pte - MSI Page Table Entry
  */
-- 
2.43.2


