Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24047EEB569
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 08:50:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sofVt-0003W7-PO; Thu, 12 Sep 2024 04:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1sofVY-00022M-Fv
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 04:48:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1sofVV-0000M8-Jt
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 04:48:56 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cde6b5094so4285295e9.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726130931; x=1726735731;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLUH+r45114WMEvaAcjXsA6R1Njb1Sm2E3aFCFu9vyg=;
 b=ElV/01zMqUYpy39PL62iNPFmHUlxOFrGdwFFm84sT2lJp6+nXlBI+PBo7ykLlVAvwW
 nJEtAiAjMd7ndB9mjm9y6oI0MiHQIkuHf9j2ZoTPWxy6WLYE6USTlcvtLQlxSQ6orOgY
 UxvMmNl74a7WM+jEEW5/wdZv0swDGW1oakMrmfiWftjz9NZsWAs/QBf3UDGSZ7vWx2dB
 +A7JawwT4rC58+tAIvkvnkDu2SHCR3P3aJsuSaaaTKZHdM7BERJqcNOWkTBJfXel/xPZ
 HYmAjTFPOW7dfF2C75L+fAR8I2JTmdbC6TJADErs0cV0GZvvUWXTGcJtx5ZdL5OhlJin
 aQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726130931; x=1726735731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLUH+r45114WMEvaAcjXsA6R1Njb1Sm2E3aFCFu9vyg=;
 b=QKacUoUvpG8NuX1fumshk3IyRnXPpB2rfl1xJdcfgGJoJ0NHQ02w3Mu43snZtk5rIn
 xbSHUBfavlI4gMSp08+YoAHjbCBGwXovtLByXB+rq6r3eFTuL1NKo6C5lQYfU4NmNCkD
 sm0gcor2LRfQoUxKi7ae6nemspG/Q/wlMRIn0IcDuGNuxEl/u4shs/7W0FOhwbjl7DtH
 C+vnCzzXnFOsgdW9B5p+wd0rO6sUsBN21anCqOuLqHYs/KfMzKnRLMW581tpjp70MYkP
 3FyXHaUWmvD00KgKp6KQgb0bFtTn99NvVFP1flAmdmjBlf/75UYXIvasco9pRZQU94Hy
 QOhA==
X-Gm-Message-State: AOJu0Ywgb90XmiK+E6qZLtLLqwpVYEsZ53QiMWN0wydOS8v2ABHU2k7Q
 5m921CsYHrcvULzId3zY9mZ8tHeJq0zN7mIxVkVF41bhtPiz6lW5ZLjPyR2zL3EZP2zMg3EwdQb
 Dhn4=
X-Google-Smtp-Source: AGHT+IH1v+QbjLzkKBxfLPQ5n+gRUk1EJoFu/eydGhVZmoWOMghTMZsCRWGtrJSrkIZ1uZ1gAdGaCw==
X-Received: by 2002:a05:600c:1d23:b0:428:eb6:2e73 with SMTP id
 5b1f17b1804b1-42cdb58db62mr16088985e9.29.1726130931030; 
 Thu, 12 Sep 2024 01:48:51 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb33a92sm165637475e9.20.2024.09.12.01.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 01:48:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 10/10] target/riscv: Add Smdbltrp ISA extension enable switch
Date: Thu, 12 Sep 2024 10:48:29 +0200
Message-ID: <20240912084832.2906991-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240912084832.2906991-1-cleger@rivosinc.com>
References: <20240912084832.2906991-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=cleger@rivosinc.com; helo=mail-wm1-x336.google.com
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

Add the switch to enable the Smdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f9b2ce4463..3a3009bd23 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
+    ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_12_0, ext_smdbltrp),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
     ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
@@ -1518,6 +1519,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
+    MULTI_EXT_CFG_BOOL("smdbltrp", ext_smdbltrp, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
-- 
2.45.2


