Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EA5C54E64
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 08:35:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rofmf-0004Fx-4X; Mon, 25 Mar 2024 04:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rofmd-0004FH-VC
 for qemu-riscv@nongnu.org; Mon, 25 Mar 2024 04:34:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rofmc-0004KG-AT
 for qemu-riscv@nongnu.org; Mon, 25 Mar 2024 04:34:19 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1e08512cd8dso25551225ad.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2024 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1711355657; x=1711960457; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mrj6QbutmGeuBYJneEN3/5WQcvkoHJqfVwPVz+DzQ1c=;
 b=ktt5cfErgpTp09CINtcmV+1vm8Uggud+yRJuxa+sFcpMXRmsNpUf1y1QNWhLw+XuBy
 Hto7jKLbuSRPc0at3+mVsROKIrUgnAg+kQFMOmPzeqvgSRnLG/Ip1DvMtjJIXVjX8aS2
 FGkUwY/OX19H8KhsFA/er7ZGaSkvAhY0zoBGRjJqTuJkQmNPxxmg4wwV1VVM8zYspoNd
 bu/6z6pm6Lm5Oyb/dBxaiqiI+4U4h7jsO9ogbuLGGImcpV9MemtGO+pqonz/skfpELWX
 X4y6nhrg65NA70iC1htGoNogsVkkaBIoLu8xUuiPx69EF7OwEkEswMmTTIWr+e39Gjn3
 SyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711355657; x=1711960457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mrj6QbutmGeuBYJneEN3/5WQcvkoHJqfVwPVz+DzQ1c=;
 b=fqw/yr8+d8T+DF3txPOyiiN+p5BCG83fpzH2n4UAcsOIioNt2tMHMeTe5/Q8cynjCJ
 dChZw9G9ykExF+wm1a06NVtuKRnhMFTBPqQdZ0C10NYcn+2Qqy7hUVlnNHPYHT8ANzE7
 phdjRbwxTHpKxB6X2O+mTJnP2uGMTMwSQdlnlOEKA2SQmdlCTK2F4gf6f5gz5zODt9Z2
 /MGdN8jVJ1ZpPnUHjJOwouEKcFBOCWs2NECivLbYI2+9kJGhV8DtcAO+2YYEwEJJyxUI
 zsDtwfKvWyvCt7lXFc4w6KBOFXJrSoWlpiTyKlNs5oIYWsZKKOb7p/xtiYnJ2QdIWTfi
 YH1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIORoRJUuGrD2EsgYdwkHUQAY5Fl9MX9zBgEVuj6MBbZ14moHQsLY4x/6WTzAzZrPg1sljtTBJgCrbex/DkZBlaUtCQls=
X-Gm-Message-State: AOJu0YzIh9PJACqqy/TTqN1+s9KXt+RG36AXAwrgsU92mpFd9oWkxFwJ
 hH4jKIeL2mfy1waJXbMdxC929QsawFTUZZfP9rPRa0TZ6BdQ7ajizGDpSXqT1ig=
X-Google-Smtp-Source: AGHT+IGe9eVgRtBxyWp43vZUkPqpXHAC5s7Zas8WjEhkUgNznnS5RuSe+N7/e7HLv4iPf4f+o3g/bw==
X-Received: by 2002:a17:902:bb16:b0:1de:eac9:2407 with SMTP id
 im22-20020a170902bb1600b001deeac92407mr6381341plb.69.1711355656996; 
 Mon, 25 Mar 2024 01:34:16 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902684700b001e0287592c4sm4311269pln.267.2024.03.25.01.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 01:34:16 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 4/5] target/riscv: Expose Zve64x extension to users
Date: Mon, 25 Mar 2024 16:33:38 +0800
Message-ID: <20240325083346.16656-5-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240325083346.16656-1-jason.chien@sifive.com>
References: <20240325083346.16656-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jason.chien@sifive.com; helo=mail-pl1-x632.google.com
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2107
Signed-off-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f6287bf892..18e1ae66f4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1477,6 +1477,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zve32x", ext_zve32x, false),
     MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
     MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
+    MULTI_EXT_CFG_BOOL("zve64x", ext_zve64x, false),
     MULTI_EXT_CFG_BOOL("zvfbfmin", ext_zvfbfmin, false),
     MULTI_EXT_CFG_BOOL("zvfbfwma", ext_zvfbfwma, false),
     MULTI_EXT_CFG_BOOL("zvfh", ext_zvfh, false),
-- 
2.43.2


