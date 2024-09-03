Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06800CD342F
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 06:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slMoa-0005oy-OH; Tue, 03 Sep 2024 02:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1slMoR-0005mW-Hn
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 02:14:47 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1slMoP-0002GH-VF
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 02:14:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-714187df604so3421810b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Sep 2024 23:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1725344084; x=1725948884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wR1GACgrZzM7YYzeZtxjDqa8lje9TmssIu2+ZZwLLUw=;
 b=itAqn3IBH9Pd7Hr835jNdeq6p3Hvn7oBRBM5SzC9kzrq9cyL7+xGtvnHPjvQFLOzO2
 96agnkj0a2g49kex52TGHzp8Xcf+EnJsvw3d95SPYu5rv/wbih7UZVcuvn656+uwgg3M
 1VkaKtqIYGr+o98IzOyT/dyGdOnhmeIRwsoC9GhK4AS+7euZE0vmaPWiBqIJ7RSG6scF
 iRV4SQVm67YsFIKFZVgtZnIkJJwPoS91nqAO5NczJI5ECSuahU+MI2ieYme2mUGUiZUf
 ofRcQx2oVl1gvag/OxenjVheFoyybCRuaIAnTyDRlH1vW1XrvfYw2TAOI6QNgAJos5Fe
 55Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725344084; x=1725948884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wR1GACgrZzM7YYzeZtxjDqa8lje9TmssIu2+ZZwLLUw=;
 b=KWKSichqHyzq3cF4aeYxJwCM9aydFCvu7djajQlG7gzNNEmtH1NCJ9gssu1kyZ8RQo
 6RZ/0xKYXb8zqmYh28eCyJs2ae4aJJYSOTXs/YzFDg1qVAktNTGt6REh/eJvfMqX0B4b
 3eLPbl5ssfLkBYo7mRB+JD7L//4ScBmAu8AaKl/rAwZoHUbYoIHIYvFBiWp25vL94/Kv
 WQvkgR14fid9y3fOK9TK1hnZlwp415nFQY/koOU2YI+o0O0MmA5V0iZVzb5F9QJ9cnuQ
 vRz/jtaj3zkSfRjB92/kaTNs4df0yXWKm070tWqNe5S8vRtqocnFFRysBi/jFnPqhodl
 QR2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHbHCneNyK3LkhiVCxgQBrcpN2o09V7P3iqfmr79uadgClABJe/GDKMOkFAwPotEKww8Z37BXRrfv/@nongnu.org
X-Gm-Message-State: AOJu0YwG/1b9DSVbrGmkVQQtO+MVgJoZ90uRiQqEuTWttcwOqqRj+rbR
 hWWAvwPgKDuPH9j+HUYGuNDaebgAsQWch6UQi6BVXeNmN72unm/QM05EoErHAT8=
X-Google-Smtp-Source: AGHT+IHnrqov/tdCdxu/H9D4C2PmIbQlFgcZjWjC/5cJOCXrVSACI+28gYp7QCRK+CCzgoZlqmfGtg==
X-Received: by 2002:a17:902:e551:b0:205:753e:e2e6 with SMTP id
 d9443c01a7336-205753ee47emr102309515ad.16.1725344084629; 
 Mon, 02 Sep 2024 23:14:44 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20524c16145sm60467145ad.98.2024.09.02.23.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 23:14:44 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Fea.Wang" <fea.wang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 5/5] target/riscv: Expose svukte ISA extension
Date: Tue,  3 Sep 2024 14:17:57 +0800
Message-Id: <20240903061757.1114957-6-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903061757.1114957-1-fea.wang@sifive.com>
References: <20240903061757.1114957-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=fea.wang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add "svukte" in the ISA string when svukte extension is enabled.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fc3f75e826..a568194317 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -197,6 +197,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
@@ -1597,6 +1598,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 
 /* These are experimental so mark with 'x-' */
 const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
+    MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


