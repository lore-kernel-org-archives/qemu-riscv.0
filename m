Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE2E7716A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 06:27:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNR1G-00031R-LQ; Tue, 17 Dec 2024 01:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tNR1C-00030D-F0
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 01:25:18 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1tNR1A-00054c-2x
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2024 01:25:17 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-725ef0397aeso4336193b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Dec 2024 22:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734416714; x=1735021514; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ao9h6MAmm6BUcuG9oLKvxKpzXvKNCgrPHPGGD/55dt0=;
 b=JzLFZN3TczODuAIAdCrucRzBGhIb5MuifucWHnYElqsAmUCrSsn98oeAJVmantQ0KW
 yvjKOR8hGQGKYS+tPgElLQ2scHvf5g8XZc49Yt2dPwmy4N/xG7YIt53EQ2t+//mWU6/i
 /5BpJoYycpjpVaPePP6rqtta1lMpUiWFT+FpNYES7jjgq+lh0zm88JYHEXX7tO/uwWIU
 7WbKR8Vival65CrS8xQ6niAmZYCbbvmQSZ7pPoC0G0h6z4VJMWPAoWBzsM0S5Wc3tQVy
 TaIoWxtOFtKRnEI+eDoCoTapiZwb7yopHTYRmeg0YbaNFJT3XeeOouT+PhXFptFxRjLz
 uHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734416714; x=1735021514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ao9h6MAmm6BUcuG9oLKvxKpzXvKNCgrPHPGGD/55dt0=;
 b=lDh37DMt4R4vtucDonvbILvR43/OfwwFHBfExK7NDPb0GfJtf7L06FZ/eMfYBdUgek
 aFQU6L9oVH39BFcKpQQlLiJU3Wri+Vwq1ygvIydFaMBMmE6TOfYvfenVWmpWa8zgRchE
 v7J2a1hm9FKrSlrs/sg0smb6c8G7I4TUI2kvmpkF8RrjCGUvA+R3gmTmvA19So+kd0/p
 0dDUmhkKzWW1EM86cxV/7IAi8tEUfIoIo2B77GiA++RTS9iGSjq9UySDuUwHqKKCaly8
 aYsJS0iQOyQ4yV6OQn2UjBEs+Igf0G/xI/A4HXqPTD/sVrasnjq6DRnL8L0whRT/1W11
 /Fvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIFAKoAkc6iTgHlhO2Mdgdg/x+dxgCwjYFCXx41tve5MGjqrZ/TIjetDtXoOWKw2fF09uVyFRi7388@nongnu.org
X-Gm-Message-State: AOJu0Yx2JZRAGIGsNDmTQYZ7q4vSyGgOY1Rkpc/Pw1tsOp2rkuQYVXYD
 ZexdSEKFYR+K4Tv5RzkUyE3i75m+79pHsoJKrNUelw53ST9U3JFqreZ26MkJN1g=
X-Gm-Gg: ASbGncti4uVaM2EsixBHJ0Iusd3GJVXtpNq/K/i/XOt4T5MN+5iixbYO89nWcuCEtxv
 1TBcAevGgIMJTYSl0OxUOjSnOHTC207Hov012mVSi2YMh8s2s1as+dt97zRxaKSPX63lbn3eoIA
 u6lyPNmz4p65PMUOqzCwzbhRjpHyxPIYCMNcmUrYfvoZSAwGLCemlOAhrNwb731R1yv8ZKP2+o+
 8n+Kvu2e6BlYt6rtbNjFC0cyVll2iPIhQlN87fFaSNlljOfvxuwIpcNnFjeTCgavf+4FVrAQ6N1
 EvYW0wFUFho=
X-Google-Smtp-Source: AGHT+IHceF+NCERcd30L/eEI3ORecwFOuuPdPpucKZl3xiJ8hixvPiajKtt/c0yVxFAG5NyKKbJ/Yw==
X-Received: by 2002:a05:6a00:301a:b0:725:e015:9082 with SMTP id
 d2e1a72fcca58-7290c0e17dcmr22978385b3a.5.1734416714123; 
 Mon, 16 Dec 2024 22:25:14 -0800 (PST)
Received: from fchang-1826.internal.sifive.com ([210.176.154.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72925e6e8b1sm4354301b3a.139.2024.12.16.22.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 22:25:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tommy Wu <tommy.wu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v10 5/7] target/riscv: Add Smrnmi cpu extension
Date: Tue, 17 Dec 2024 14:24:38 +0800
Message-Id: <20241217062440.884261-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217062440.884261-1-frank.chang@sifive.com>
References: <20241217062440.884261-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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

From: Tommy Wu <tommy.wu@sifive.com>

This adds the properties for ISA extension Smrnmi.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e6988f44c6..7a4aa235ce 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -193,6 +193,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
     ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
+    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
     ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
     ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
@@ -1621,6 +1622,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
 
     MULTI_EXT_CFG_BOOL("smaia", ext_smaia, false),
     MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
+    MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
-- 
2.34.1


