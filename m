Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3CEEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 13:32:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE8nn-0008L8-TN; Tue, 27 Jun 2023 09:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qE4yH-0002qI-5A
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 05:26:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qE4yF-0006Ki-Dm
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 05:26:48 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-666e5f0d60bso2144198b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687858006; x=1690450006;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rg3+TYiUGGtXCa2HJSu+sTNdB9A34AYrcg2a2JyRsck=;
 b=ZuGN+Bt4FX2QTlS3/8Wze1FSx2S09cudvbjm31XNpIhp6JGKBLff5fYwboVS9eA2pJ
 CdxWFio4QIYN0OkSWHC8PgmuxH1DtT5vOPaZAQmYKCPP8a2FMo271pt5py+YQEF+yBBa
 0Yd86WHis/f21avk9o9razLPbk9M4Bpnudv5GhvaaNY81r4OE/OASw2fAYmps14h/85J
 SKLhTnrl06pDM72/N0EMJrYncXMdRLu0G4jpw5jnrghCkhDEv0xkzFNN6eNjh/lcLT2A
 sTbx6lSWDUe4HhEvecAvPn21j8qAauEGqrOHMqHth2TZfj5oRdBH+N53i22+yhEalCyA
 A2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687858006; x=1690450006;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rg3+TYiUGGtXCa2HJSu+sTNdB9A34AYrcg2a2JyRsck=;
 b=R049V4yT2CKRaTkVQFmd3dNYcmtxKqpL1SLslTSXiOYWGqiGYUmOj8PcIL1V0SYahn
 H0a7f2zIoegJZbTYWREflqkIANS83LCcSixWT+5//mrtXqegZItaaphfAR7N5wDpl4sS
 9JnD/vdQkdLUTHpGm9+2EyOxyfALP10YDWmsJynomQlWY/gER99kROS3gAnD0IV9CzWi
 een6oS7NeHcSEXvNYSi8B5keOZwC4MtS+o1yKbxvpuGAUwuAjB13veXbWw8Sd+dWKvde
 5HwNdsyOBWDDWyVQP5bkorqbLWNiu2A/+7mRATUH1fHTp5EysdlIpc/MPFp2J6Yh7431
 VHBw==
X-Gm-Message-State: AC+VfDwvFuKS/VZO3AtJwQtWs2ut2Ma0GAZfG316dEXv5ihDC3w+MyFF
 RJTEjdaHjfUqqY5QVSuQHvWZLLCTid54eNidmsiTwA==
X-Google-Smtp-Source: ACHHUZ71oZEqQXIn2yb4B4Q7oa0LfUfDriTE0yzn10EcQFDh21HiWQesh4NXbijbzL3LVEPhO7BVCA==
X-Received: by 2002:a05:6a20:3ca7:b0:121:bc20:f6c8 with SMTP id
 b39-20020a056a203ca700b00121bc20f6c8mr20923230pzj.18.1687858005710; 
 Tue, 27 Jun 2023 02:26:45 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a62e402000000b006783ee5df8asm2737738pfh.189.2023.06.27.02.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 02:26:45 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH] target/riscv: Add Zihintntl extension ISA string to DTS
Date: Tue, 27 Jun 2023 09:26:29 +0000
Message-Id: <20230627092631.22286-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:32:14 -0400
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

RVA23 Profiles states:
The RVA23 profiles are intended to be used for 64-bit application
processors that will run rich OS stacks from standard binary OS
distributions and with a substantial number of third-party binary user
applications that will be supported over a considerable length of time
in the field.

The chapter 4 of the unprivileged spec introduces the Zihintntl extension
and Zihintntl is a mandatory extension presented in RVA23 Profiles, whose
targeting software stacks includes Linux. Thus the DTS should contain
the Zihintntl ISA string in order to pass to Linux.

The unprivileged spec states:
Like any HINTs, these instructions may be freely ignored. Hence, although
they are described in terms of cache-based memory hierarchies, they do not
mandate the provision of caches.

These instructions are encoded with used opcode, which QEMU already
supports, and QEMU does not emulate cache, therefore we just need to add
a new property for the extension.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 target/riscv/cpu.c     | 2 ++
 target/riscv/cpu_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 881bddf393..aa99781f17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -81,6 +81,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
@@ -1598,6 +1599,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, false),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c4a627d335..c7da2facef 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -66,6 +66,7 @@ struct RISCVCPUConfig {
     bool ext_icbom;
     bool ext_icboz;
     bool ext_zicond;
+    bool ext_zihintntl;
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
-- 
2.17.1


