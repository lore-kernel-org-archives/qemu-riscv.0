Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27012C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 08:12:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1scKjv-0005xf-4U; Fri, 09 Aug 2024 04:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1scKjt-0005s6-DH
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2024 04:12:45 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1scKjr-0006oc-P9
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2024 04:12:45 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1fec34f94abso17692215ad.2
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2024 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1723191162; x=1723795962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riPnYasURW77Dz2ZwVlvtuzpt5ZqhwUi415BFr5uQMs=;
 b=BBGlJkyIvFc7cnkwsxndlrhqvwzFDnenCliYCb+Ypt3H8ZX5oEy8j8OhfwsGFSGPiT
 rUo3NCl9bYEm+E+9RaenZOF24Lak+yCiMGnz+a2GuWgy/ceGr5WX1z4nXDP9pBABCDIS
 Ep9dCU0Eev00YAx6zECSa86yact/noFKIbE7Pos7saOrpT8yZ7bLkie83wMWYPC+/gjW
 Nn9paJkRtTbvYcAU+8bd6ZY77IXpTZrqS605SgUGdTt5EMmlyw/WhzuYzPHT8JURn375
 5/GQ/l6o8aF+0J6MqBy/wVFcvQ5D2lNbj58BDgog3XWk5F6IPAuJxt77UTKPb+ap7OIz
 Q0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723191162; x=1723795962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=riPnYasURW77Dz2ZwVlvtuzpt5ZqhwUi415BFr5uQMs=;
 b=RbdDAde42SFrWOIYNYTheMasDvuAbxSUULE5o8WhStcfkEGe7lAzJr2lUKTAypMGEp
 M+CNpK5NiNfP0T/dVA7gH7yKkz7XGwRPsnxBiUt/q96V2HarylW87ORcJl+CwpXDHAOy
 Y+NVJUkD4zf6OXGuZHxI2IYZb40pt4vc+SwNAKtytNu772Ovm5v1dyB6zoByHJXkwxJT
 yQB3swDH54AqP4M8d+7ktG1C91k6J7egK/RLQoSYDI8u+fUwImQf61VwwsXviNN7f703
 8nZNVd+Lsm2Avu0StjPErcRft5OiOWgCCrxC+HPjIbbWhbfRae84hJ7BePl9C5VHtUPT
 BbZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6MV6lss9mHCiUf/zHQZbFALN6EAk5AgqViSXxgZvBoLABxnSD3tYKX9+kB/Rf/CMsZaex6GkecYdR79lMA/GjC37eOcA=
X-Gm-Message-State: AOJu0YyQCVTzDeSfXSd9AADPhlHtyXVtzZz0B86QQlSgxohbefHQJ+Iy
 tG7TosBTugxwgC+VWg6Izw2YrpJbsZyOIU8p6clkDI1tJDPOtmYCzXibWBDtk7o=
X-Google-Smtp-Source: AGHT+IFKKPAYoETCMuKCeXr2CwdLER/abdxO7bgP/hZ5dtBM9pHST60eB95q8yv0siAjyk4XZPhwYA==
X-Received: by 2002:a17:902:fb10:b0:1fd:96e1:802a with SMTP id
 d9443c01a7336-200ae60cf79mr6505065ad.59.1723191162520; 
 Fri, 09 Aug 2024 01:12:42 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff592b6cfbsm136391185ad.306.2024.08.09.01.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:12:42 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v5 5/5] target/riscv: Add Smrnmi cpu extension.
Date: Fri,  9 Aug 2024 01:12:27 -0700
Message-Id: <20240809081227.1588508-6-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240809081227.1588508-1-tommy.wu@sifive.com>
References: <20240809081227.1588508-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x62e.google.com
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

This adds the properties for ISA extension Smrnmi.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 98e6940e93..7ee7b9c4ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -184,6 +184,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
+    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
@@ -1514,6 +1515,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
+    MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
-- 
2.39.3


