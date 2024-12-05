Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F079EE7716C
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 13:31:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJBx5-0001Xf-DZ; Thu, 05 Dec 2024 08:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwH-0001Av-RR
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:42 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tJBwC-0004mM-Hp
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 08:30:39 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7fcc00285a9so1015476a12.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 05:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1733405416; x=1734010216; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLgtztetBuUsnaL2tJEoRsda3i+NqJYZAQKdlx7Mq50=;
 b=XD0M3efvyVdCEh7KQe+z1ylZDGpecZMG/YoU2Ut7a3TvSrVFbyTh0YDugy954TU0BX
 gqYO7/etX0W6zFLBc1C2B4Z+mV6S5vQ3jdoMZ2XoUWsTLhLEMTbuv55hCyUhCy9joGXJ
 BB53HWpncqzj6EspN32Zg8N0WjaBu3NOXIVlojGKmeFxJgIvGU0Q/ZAdHDYf9idCe7sO
 05urGa9ILQF19DsYrcHxtsfnNSiTE9XliIXkH8fkD6PIOa4Aldc5OUvzjKfEDcX+rChz
 BjxfEA82krb7fQpbBgV2LzDPE7utcXJLYSk1ftEDeklp9v08Hhj8VmUDaPIVyApvd6Fp
 EJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733405416; x=1734010216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLgtztetBuUsnaL2tJEoRsda3i+NqJYZAQKdlx7Mq50=;
 b=eU8U52ke8jlWH9JiumSiaZy/3lYa9YxZDTDOKbAPkxQciC1TcUBAzc/OAZPCtlOTZw
 XFiD1vDd1uJfN5gyOR0BvVq4qpRICxMm1Ijfjbuo1BRHtevEFbei0uIXuzG5eUOKuGsv
 hJ2IF0FwCdMLLM71pFwlYFwaTkpjGA8XgCxqy3ufzDLF1Fu0rIypp4hxTmJScmT2xLqe
 UjuSOuF9h0EdW1Bz4Dg8zTrmDCBD3CXHAEex89hGR4wMmP8lOUeb5+iFBcZKYr/wFXhM
 u6wNo7QSkiZ/gJZ6m6eFo8klq1Ga15fxlNrGJXcKERC4vfILPQXm3x52kUaKy4EajrKZ
 YadQ==
X-Gm-Message-State: AOJu0YzCWRV8h+6zPd1tlw0j4QQV4NNi2psp/ReL5AB9s99cxjGVWsSh
 a0srd9FsJapQ7dDck2KLKNptnyoQFx/X9jXYGueAlGGLusrdvh6g4ZMHhVNhoa8=
X-Gm-Gg: ASbGnctaJOoiztbsC1WhCjTl1tG+aObfEjruyTEMgRxrhFYwBx7BvBDzRPV31on7atj
 os4tEL9tw/lFLE2dmpQRRjJ4iXgi6kV27AItAanK4MiJFgsQmChgrzbfeoUgaWBQc0WUSTUB7rg
 6V/j7OztiXPXZNftgq7lN1PD1pdePKnVrjNs9Jb9Gi8qB8+hyhOB/6juvacc/AEkX7g837HdbBF
 K7yoNbZ27UnEqCQ0kIfVtUKa+5xSLDycQ88RYr97leeDBx/xbW4GX55VF+YJXnboBkArbuK/Dvu
X-Google-Smtp-Source: AGHT+IGHxpybGPiWy0FC/x22A+iQLOLf+Cs4TKycrW9xbSF1dOPptMFf0mGNvJ5ZizvQhs92nVcVEQ==
X-Received: by 2002:a05:6a20:3945:b0:1e0:db67:e9f9 with SMTP id
 adf61e73a8af0-1e1653d0cc7mr15382855637.22.1733405416103; 
 Thu, 05 Dec 2024 05:30:16 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a8f512sm1250315b3a.126.2024.12.05.05.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:30:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-10.0 02/11] hw/riscv/riscv-iommu-bits.h: HPM bits
Date: Thu,  5 Dec 2024 10:29:54 -0300
Message-ID: <20241205133003.184581-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241205133003.184581-1-dbarboza@ventanamicro.com>
References: <20241205133003.184581-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Add the relevant HPM (High Performance Monitor) bits that we'll be using
in the next patches.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/riscv-iommu-bits.h | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index 485f36b9c9..298a060085 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -82,6 +82,7 @@ struct riscv_iommu_pq_record {
 #define RISCV_IOMMU_CAP_ATS             BIT_ULL(25)
 #define RISCV_IOMMU_CAP_T2GPA           BIT_ULL(26)
 #define RISCV_IOMMU_CAP_IGS             GENMASK_ULL(29, 28)
+#define RISCV_IOMMU_CAP_HPM             BIT_ULL(30)
 #define RISCV_IOMMU_CAP_DBG             BIT_ULL(31)
 #define RISCV_IOMMU_CAP_PAS             GENMASK_ULL(37, 32)
 #define RISCV_IOMMU_CAP_PD8             BIT_ULL(38)
@@ -191,6 +192,52 @@ enum {
     RISCV_IOMMU_INTR_COUNT
 };
 
+#define RISCV_IOMMU_IOCOUNT_NUM         31
+
+/* 5.19 Performance monitoring counter overflow status (32bits) */
+#define RISCV_IOMMU_REG_IOCOUNTOVF      0x0058
+#define RISCV_IOMMU_IOCOUNTOVF_CY       BIT(0)
+
+/* 5.20 Performance monitoring counter inhibits (32bits) */
+#define RISCV_IOMMU_REG_IOCOUNTINH      0x005C
+#define RISCV_IOMMU_IOCOUNTINH_CY       BIT(0)
+
+/* 5.21 Performance monitoring cycles counter (64bits) */
+#define RISCV_IOMMU_REG_IOHPMCYCLES     0x0060
+#define RISCV_IOMMU_IOHPMCYCLES_COUNTER GENMASK_ULL(62, 0)
+#define RISCV_IOMMU_IOHPMCYCLES_OVF     BIT_ULL(63)
+
+/* 5.22 Performance monitoring event counters (31 * 64bits) */
+#define RISCV_IOMMU_REG_IOHPMCTR_BASE   0x0068
+#define RISCV_IOMMU_REG_IOHPMCTR(_n)    \
+    (RISCV_IOMMU_REG_IOHPMCTR_BASE + (_n * 0x8))
+
+/* 5.23 Performance monitoring event selectors (31 * 64bits) */
+#define RISCV_IOMMU_REG_IOHPMEVT_BASE   0x0160
+#define RISCV_IOMMU_REG_IOHPMEVT(_n)    \
+    (RISCV_IOMMU_REG_IOHPMEVT_BASE + (_n * 0x8))
+#define RISCV_IOMMU_IOHPMEVT_EVENT_ID   GENMASK_ULL(14, 0)
+#define RISCV_IOMMU_IOHPMEVT_DMASK      BIT_ULL(15)
+#define RISCV_IOMMU_IOHPMEVT_PID_PSCID  GENMASK_ULL(35, 16)
+#define RISCV_IOMMU_IOHPMEVT_DID_GSCID  GENMASK_ULL(59, 36)
+#define RISCV_IOMMU_IOHPMEVT_PV_PSCV    BIT_ULL(60)
+#define RISCV_IOMMU_IOHPMEVT_DV_GSCV    BIT_ULL(61)
+#define RISCV_IOMMU_IOHPMEVT_IDT        BIT_ULL(62)
+#define RISCV_IOMMU_IOHPMEVT_OF         BIT_ULL(63)
+
+enum RISCV_IOMMU_HPMEVENT_id {
+    RISCV_IOMMU_HPMEVENT_INVALID    = 0,
+    RISCV_IOMMU_HPMEVENT_URQ        = 1,
+    RISCV_IOMMU_HPMEVENT_TRQ        = 2,
+    RISCV_IOMMU_HPMEVENT_ATS_RQ     = 3,
+    RISCV_IOMMU_HPMEVENT_TLB_MISS   = 4,
+    RISCV_IOMMU_HPMEVENT_DD_WALK    = 5,
+    RISCV_IOMMU_HPMEVENT_PD_WALK    = 6,
+    RISCV_IOMMU_HPMEVENT_S_VS_WALKS = 7,
+    RISCV_IOMMU_HPMEVENT_G_WALKS    = 8,
+    RISCV_IOMMU_HPMEVENT_MAX        = 9
+};
+
 /* 5.24 Translation request IOVA (64bits) */
 #define RISCV_IOMMU_REG_TR_REQ_IOVA     0x0258
 
-- 
2.47.1


