Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0604C02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:49:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXxCb-0002F6-Ku; Wed, 15 Jan 2025 01:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXxCP-0002Dj-3N
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 01:48:22 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tXxCN-0000pg-26
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 01:48:20 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21a7ed0155cso109389535ad.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 22:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736923697; x=1737528497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pY9vdP9KrQzzUAagFD6e3VgrnW7ct4SyKNr03/IIzc=;
 b=APIu33dX+r1r094/wA2X+07GFgOGfWwELcfHxvsq7cZeP3lVGzjms/VPRZ9kSZAo+t
 dhKd5QscMjyBPV5j213ykyb2g7Wbce/5hbh764rJDVGbvnsGxIWjuUjBnIQCJU7zBCk0
 wRGWUbsxjea50NdOqaQX3+h+K7V8NC9RIN1haawPace9hUhq8mTXcV/qH1pVPne8c7ro
 /N/yjory1C7pydLFMNTMUQ/7elPPVrNVfrkY9h5XW8JVU6hZxXJ8GqKm7IWHwL6j8dog
 ChDHBq4JHhrcTJN3jKq/+dhWseET/kv0PT+Vzrf6wpACXUc9XU6+6HoWKgrQvCXDfKog
 bi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736923697; x=1737528497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pY9vdP9KrQzzUAagFD6e3VgrnW7ct4SyKNr03/IIzc=;
 b=OEt3TNZKuVaDTvbE+IY0KweWD4HiyzdX1Ban7J1PIUd6Ohyji+0OFre5bj9DSMiLsg
 f/DsOSrOmn+HDJ98nfIaudgYI9NzmVWjWMAakV0i+BYZJUI6cjFjIbOix30zVRWqtxEJ
 SBmrXr5yk2P8aeU1Gl03FXnD1h4OpRTwtFWj+5v9JI6S+H6jnBmoXV+Hrr+T9XT3ysqP
 A5CCII3J1VeFoNq62Ej8WZjfuQvW0yrkh8SCjtGcHXrPmo1OCLQbrszt1fINvWVD1pmi
 lup4QK6b2N/rfu+hV0Sj9rVWR8vSrmokN5rGBejxXzE4hd21xottjIcsfR2uytV20q/u
 wyhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXLdgIGzcYhW0Ce/lMhLPbVJ+sJYAxmdf/uu6cABaidwL0Ql7Jm2hZ5lVy1R8i5EJDNvZfIadzXSPR@nongnu.org
X-Gm-Message-State: AOJu0YzPV2P99sGVg+O0O1kCRhmkrXx+JJD9VhHRWQcTR1vSOzM9Cyw9
 FZIxYsQOPQ/2/Zw1BdV1/fgWe5ol8Yyyanqu3DTWd3elMZYHiBo61WtsoI5b//c=
X-Gm-Gg: ASbGncv0SRBEpEO2WVILY0S4H1WQQrGNNybs+BsSctu9enAP4PwByvSR9Y0R3JWt7/9
 Jx+2F7rS9t/grbP6la0zyof0m6CaT1UTQH/Ou9apN71MJxcqvQ2pWAceoroVOefvQAqPNFhIwnC
 SuDtDf7aqBeTO/XtHQovFoElYtx5eD9kjP8cOaDafusLeWtDZJ4qFnAkujob3pGpfDJ0RjBaacA
 7jGmEOy7V7xcujs2FH2JCKZOt+1eZ7SXot7I46Di+qq4Pa7Arv14FoF89Y+wEg5+oh0TXrqe2SH
 pr+ZcSNF
X-Google-Smtp-Source: AGHT+IHSrZXijupkuYB1HEg2VkUP1gfVxOifl29QPVUUCBNGQj+aMbfxeiD/WzDf5hEeLzmClwiEqg==
X-Received: by 2002:a05:6a20:748b:b0:1e1:a0b6:9861 with SMTP id
 adf61e73a8af0-1e88d0e21dbmr45074921637.12.1736923697324; 
 Tue, 14 Jan 2025 22:48:17 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4067ee81sm8668470b3a.132.2025.01.14.22.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 22:48:16 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 2/2] hw/riscv/riscv-iommu-bits: Remove duplicate definitions
Date: Wed, 15 Jan 2025 14:47:37 +0800
Message-ID: <20250115064737.16350-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250115064737.16350-1-jason.chien@sifive.com>
References: <20250115064737.16350-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x634.google.com
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

The header contains duplicate macro definitions.
This commit eliminates the duplicate part.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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


