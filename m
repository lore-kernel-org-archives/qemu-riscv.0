Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69BC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:45:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weVxf-0006Rn-UR; Tue, 30 Jun 2026 06:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwx-00068k-7S
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwp-0004wq-IA
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-37fc01a7835so1528344a91.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 03:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1782816249; x=1783421049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWB1VMpEOQWXHjt4fAXcLPtGgLfNKt45L82Gan4wey4=;
 b=LBRvqTy89tYyzv+9k9yxa27miV04iFvnrHcC5R/z/taxKSp04miZ0KcdIxG+5FbHAF
 r0psZJ9map5kZ5Y0rXz8pjJ+pZeDb7VvK4e8xuKZ9tDXrFD1bVj16HV8+jg5Oe17zotv
 rox6DEJxFZW+qpOAfHpUCglloQAuTW/pjTwBJCeZMKIj9lhGt/YcbqAd/oqiO7+W3VLo
 +iicYW2eAPUDxcghJ68+mmW1KcsrWsK9/9VybNdzLQlvZ9yRt3dL/kSeuczUNfJqRg3D
 4Zx2tIs+Fg5lE4uKGFsgFDVQPBNwoWBCZIWoZL4rmvfcBLnDksJ58c1/Hk4CiP76PZP7
 Kpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782816249; x=1783421049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oWB1VMpEOQWXHjt4fAXcLPtGgLfNKt45L82Gan4wey4=;
 b=pzw4rmofzdSiiRd/w25L0g/cKTxO/0R07rvfem7bfVc4EFl7cMyxBaK0fdbdGhZ5HQ
 tdRIUedPo0XYbinHoxu7jfttVKAZBXEX4pWUC33XFN0LM6fXZd9fmZm6yPhhqE2PQmBi
 ON5z9yf9qhDDPpWNw/IREgriDSJUE1AHS1WCDixgExglNcw+WAwHyc603Kmxf4VTzLbc
 yLrHjX6o2ZpGkhJ+/4fAUd93UN+qqdzBgoqlkyKXO6tZOElcZjDDymIVKE9kbTjlaudg
 fMian0WjuDc7+4P/xAZRuUxX6dS5oF1V1joWQwq3FwwT+AczsbDlJwO/ZXQtaDoXy/5G
 xhEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1/jY6is8l/Hv0gl7Eu+Wi/nCPhfbB2dU1Oe3gaq9KSGRjUSTvVCJZY4qzvQvrXupC4tHaJTLj3qAz@nongnu.org
X-Gm-Message-State: AOJu0YzfGJMDttmPBOgIbhFbE2puTFsmhdW5f+8K2uFPNboilbqNwLjD
 hOz79Jrq0+Cy00jEEb1UJs6M+0Oy/e+5uzttwH+1tKJw69R6fiveeb+q73jh/sKN0nSFaCBl345
 zmeKP9Ddd1g==
X-Gm-Gg: AfdE7cmupaokwqYBRIsBkOMHZTXSfdRr7LNNtcDRnIco/z+BH+HBI/XD3aD6r+X2CEw
 osKGKNbvOhtWF/WC4aNu7bDsjtfjQi//4tz0DhOIiCsWY8X0cA8S1FpxjXXmOYDHdPizKf9Uqm2
 PhmGh5zYJiFgzaHYhaetFVojf9IvlghXyQrdfJEiell+aB8OwZbYwMUpQQMMIoGO4oJx8lBzPUZ
 I2RjD7O7xLFEKW47sq8oneFW5GsZ/7R2nUysptIB9DCFKIZQiPZQuL086SWOAofRuhJXN+Q6UFC
 vR6+3VrgUshR2uiqApfkZQcF68/u2tZiDDTJVp/7f4HFORI1Fs8XGU1F/eDdhCro94xBHDhbTGp
 mZWb6TSab4Llm5T+7uD3NK4Ny7wx0DkJ60mThWhthS28566awJGp9Lf6vOW1Ad1P2bDcpz9CyR8
 Ebvlbt/IkqVq8AmDoha8rV4qGdOTTPyonqkjC5Xp76ZZylhSaHpA==
X-Received: by 2002:a17:90b:2d05:b0:37f:9cdf:f039 with SMTP id
 98e67ed59e1d1-380527bcdc7mr2226233a91.28.1782816248814; 
 Tue, 30 Jun 2026 03:44:08 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbf95be56sm1274745a12.16.2026.06.30.03.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 03:44:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 5/5] target/riscv: Update Zicclsm ISA string and expose it
 as a CPU property
Date: Tue, 30 Jun 2026 18:43:50 +0800
Message-ID: <20260630104350.748267-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630104350.748267-1-frank.chang@sifive.com>
References: <20260630104350.748267-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Update Zicclsm ISA string and expose it as a CPU property to allow user
to turn on/off Zicclsm extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a3cccdfed3c..8735a5ce846 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -144,7 +144,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
-    ISA_INTERNAL_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, ext_zicclsm),
     ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
     ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
-- 
2.43.0


