Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poBdx-0000Dv-Dd
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 19:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdt-0000Ag-NQ
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:45 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdr-0004GU-3C
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id lh8so10824685plb.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Apr 2023 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687122; x=1684279122; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bpw5Fx7dmthfquNbuUVSAAfHNtvItRyRpeBujBbvg2E=;
 b=rEq+MThuu9r9ZLLQX6H9MJfW5ytgicAWOhTxIwClasW4w2XBUbbeonqYtrQZWxryfO
 aJfwLUeEqFQULYHRMMD+OtCfgjV/GEvcumbWTg4NAzrnsSXo9A1m3lgjy+XnPL++p3Zj
 BuuhYgeiiG4xts6d6SSsMEvBL8vNInCO3MpXhsNQghWekTIllAMZZPy5Npxw5So191x2
 qPCpCDrcNE9d8mSPmWEJaREIOzvcj3dJ5UXSWRPDySfqEN+GQLBNHk4+5Bnnlp4TZwcW
 EGkG4uXZIzhdZn9mY3lDkkQSPlYAmBvq1USg5HbqjI8pUttDl2gPoPhkSGMSPCwSaW68
 Ia+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687122; x=1684279122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bpw5Fx7dmthfquNbuUVSAAfHNtvItRyRpeBujBbvg2E=;
 b=UrUglAeiTpVI2lec5VFRt4DQ+zaJxo4HmFYATKOTDuo2GIS4Dkj2x8bTiZiMcskKVY
 co5B0iLoKPK7gt+ag2xkIZ1sxnKkQ5owghUE9KdzLbMsOIpni3j+k4oevYsruJjSjDxH
 dWf5rLtxnpYsE/sm3YmtEJ2WNxhd1bVUxGGIl7nzTGr7yLy1YbJL4jirEGkhyDznypQR
 T5gYfpBQM7Y1b4xh+hiurnmLvaSbNB3Rdj0id8+vYEw/5XoZ8WykwndSSDFCCOt0HNyg
 CJ5+CUz/p5DXktxcnEIxCovQnIheSJ+dx+5d2/qz267jE/sPFHv3n0ggnz+3V/GLIQX5
 7rzA==
X-Gm-Message-State: AAQBX9fJT8RTFXSrwgoQsN7ll/4fdf93PKMTfdYmm1KhUihvSTm8S6ew
 +vwQZXtGCOr6bip8qKdAHZoTUA==
X-Google-Smtp-Source: AKy350ZZn6PbjkNAVzrmxCzz6LRwWGLqhfYREju2cjRH1sPKZwcX3s3h0mSxPr+vLmp2/TZXzY6wQQ==
X-Received: by 2002:a17:903:187:b0:1a2:87a2:c910 with SMTP id
 z7-20020a170903018700b001a287a2c910mr13224999plg.53.1681687122413; 
 Sun, 16 Apr 2023 16:18:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:41 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 6/8] hw/riscv: Kconfig: add CBQRI options
Date: Sun, 16 Apr 2023 16:20:48 -0700
Message-Id: <20230416232050.4094820-7-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416232050.4094820-1-dfustini@baylibre.com>
References: <20230416232050.4094820-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=dfustini@baylibre.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 16 Apr 2023 23:18:45 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Add Kconfig options for CBQRI and an example instantiation of capacity
and bandwidth controllers.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 hw/riscv/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 6528ebfa3a3b..04de0273888b 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -45,6 +45,14 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
     select ACPI
+    select CBQRI_EXAMPLE_SOC
+
+config RISCV_CBQRI
+     bool
+
+config CBQRI_EXAMPLE_SOC
+     bool
+     select RISCV_CBQRI
 
 config SHAKTI_C
     bool
-- 
2.34.1


