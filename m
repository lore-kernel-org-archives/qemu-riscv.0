Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D859C021B8
	for <qemu-riscv@archiver.kernel.org>; Sat,  1 Mar 2025 17:38:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1toQmx-0003vJ-Bf; Sat, 01 Mar 2025 12:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1toQmv-0003uw-4l
 for qemu-riscv@nongnu.org; Sat, 01 Mar 2025 12:38:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1toQmt-0002De-KG
 for qemu-riscv@nongnu.org; Sat, 01 Mar 2025 12:38:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2fe96dd93b4so6153308a91.0
 for <qemu-riscv@nongnu.org>; Sat, 01 Mar 2025 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1740850685; x=1741455485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d//s6Iyign0gPuEjM1mBLCE+ph1NFY+WQmvm+d2SWk4=;
 b=jNGzS0R5zr36j5eXdw/MlkXyLZlzOmBdO/2WgNiPZNkXd2h3x60DVofAyvPZkF4UYl
 KI3xKaIK92xXFdzzC7qE9aR3T7rpRECvNjAG80dulNLYm/JQlbY2uD14Bd+WqH4mv8Ir
 1wkbYMMB0Jhsdca3NWZDpBWPAy4oOad+Bi/PE6KwWYtjNgG12OL2/Hil5J71NuXewP5E
 C7jFgREQ6F8AWkRpUFFCTBw1LvAd+OsWbqjLqqiJjuqKUGqfgh4kByRboS4F/SJ36oHx
 eVSPQ4GXFYGcFT8lQt4He4GA0m+vWJJlm9eRKU7LA+dwO3UacobPJmu7VebZKp3cMsYD
 rsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740850685; x=1741455485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d//s6Iyign0gPuEjM1mBLCE+ph1NFY+WQmvm+d2SWk4=;
 b=aWLpn/QQFl8aMKDsyOlX1BecPB4uENjThPsnvkWFtTtzqYhhJGulDx57G8SHbEy7pY
 EYAW3MDTTmr49NtuijcmSoA8IcoVncpLhTfqLnkWpQ7V1yiVQDsrjjcNd02jWl8fUITi
 2WJTpjg8DVKYJVp+I4Gvhwa5sL2fTz8gmR/sIYvZIx50EI8Ct3wPmgrNJmuBjzePSdSl
 jAI0GoXKP6U63fMlwU3Lj2f7C5wcddYnuXOvGvPAo6aCdSynL1mFzlz9oQHEGbQu2/5j
 8aNV45j7/RokFvCAQi5A91+m+tVS3xRXXvK9ZdF0DHqdTZeY3r6Kfa69W2uJBo+nz7aV
 EcFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV140JLG5pS/lZ1dY433iHPZ4wz+wWv1yMJaumeA5At6Pmv+Z4KFOLs+PR2JQf5tmkmvuQtxx/hsQR3@nongnu.org
X-Gm-Message-State: AOJu0YyJcXLgaT0sqctTLDPQxzHPGQLajMMNGOTVwUjfiDcQJrspN9DN
 59GdE5wNDs//43harRBOozJJ6TcJQh1Bg2cSaSX/QlbLtzAJTX/hyYsliDnud24=
X-Gm-Gg: ASbGncs/bEQ5wZM+v4fQlVdG0QRJg+ud5nR9cQGk2gwCGLJnDNq4vkz3joxlkF4T/g2
 YLTtf/RVSesRlNAi6UTBakwkNZEjOdihdaXJk/7vzaqeA+M12ZvzI1uUMZYeeTI4ukTDYtZFvWN
 9aQSU1x5TfUZ4og1tjAFeOZ0AfafK4T515IkFqzpVpDv1mg2NwQua4MxRdq9GliNC09dxjQqx55
 AXDAljjC4rIfpBYjalogEyFRf3zeesvHArryQCtOUv6JrAyvTTZcskUwSTJfoLqoogT3pDLrkdt
 kVCH2DpsPBjVgW4Ppv16vdE98IKrfiLR7YjpvEpjJyRsM35sEun5vFZlj6XiuxExCY5qQQCM
X-Google-Smtp-Source: AGHT+IFcYg7fv4dIzzj+zH5PBGRo2Gt6iRhOBXeyzKmiLrfAwqIy9qSzYJGRIEKA0oolWORjYgo7oA==
X-Received: by 2002:a17:90b:1b4f:b0:2fa:22a2:26a3 with SMTP id
 98e67ed59e1d1-2feba5eda81mr12252927a91.6.1740850685483; 
 Sat, 01 Mar 2025 09:38:05 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fea67530dfsm5877781a91.8.2025.03.01.09.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 09:38:05 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH v2] hw/riscv/riscv-iommu: Fix process directory table walk
Date: Sun,  2 Mar 2025 01:37:51 +0800
Message-ID: <20250301173751.9446-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x1030.google.com
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

The PPN field in a non-leaf PDT entry is positioned differently from that
in a leaf PDT entry. The original implementation incorrectly used the leaf
entry's PPN mask to extract the PPN from a non-leaf entry, leading to an
erroneous page table walk.

This commit introduces new macros to properly define the fields for
non-leaf PDT entries and corrects the page table walk.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu-bits.h | 6 +++++-
 hw/riscv/riscv-iommu.c      | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index b7cb1bc736..1017d73fc6 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -415,12 +415,16 @@ enum riscv_iommu_fq_causes {
 #define RISCV_IOMMU_DC_MSIPTP_MODE_OFF  0
 #define RISCV_IOMMU_DC_MSIPTP_MODE_FLAT 1
 
+/* 2.2 Process Directory Table */
+#define RISCV_IOMMU_PDTE_VALID          BIT_ULL(0)
+#define RISCV_IOMMU_PDTE_PPN            RISCV_IOMMU_PPN_FIELD
+
 /* Translation attributes fields */
 #define RISCV_IOMMU_PC_TA_V             BIT_ULL(0)
 #define RISCV_IOMMU_PC_TA_RESERVED      GENMASK_ULL(63, 32)
 
 /* First stage context fields */
-#define RISCV_IOMMU_PC_FSC_PPN          GENMASK_ULL(43, 0)
+#define RISCV_IOMMU_PC_FSC_PPN          RISCV_IOMMU_ATP_PPN_FIELD
 #define RISCV_IOMMU_PC_FSC_RESERVED     GENMASK_ULL(59, 44)
 
 enum riscv_iommu_fq_ttypes {
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index d46beb2d64..76e0fcd873 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -1042,10 +1042,10 @@ static int riscv_iommu_ctx_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx)
             return RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT;
         }
         le64_to_cpus(&de);
-        if (!(de & RISCV_IOMMU_PC_TA_V)) {
+        if (!(de & RISCV_IOMMU_PDTE_VALID)) {
             return RISCV_IOMMU_FQ_CAUSE_PDT_INVALID;
         }
-        addr = PPN_PHYS(get_field(de, RISCV_IOMMU_PC_FSC_PPN));
+        addr = PPN_PHYS(get_field(de, RISCV_IOMMU_PDTE_PPN));
     }
 
     riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_PD_WALK);
-- 
2.43.2


