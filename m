Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117E6C07CB1
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:39:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7ZwX-0003x0-Kx; Mon, 27 Nov 2023 06:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwV-0003wN-U9
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:23 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r7ZwU-0005Pq-CX
 for qemu-riscv@nongnu.org; Mon, 27 Nov 2023 06:38:23 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b83ed78a91so2548279b6e.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Nov 2023 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701085101; x=1701689901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HyYNWAP0AMYoeZAQS0uh/Aq/GdjBljujYDiVnxqQaYk=;
 b=fdoS5KSTykh1hny4vd5do+DXbAmZVenqiHbOcQXpaEi5CfSHIoVhKBXgxcqSGYX2mD
 XhJaaFvivilz8ckd3/D87s/rK0eqVatSrSVzgaH6dtzVYNd3A1LNXSy6QgXWVdyIN9WD
 mIkj1eSTaZguaIdUP7broAcTrdJz6K4CITM2HuHNZVDyEqalQhFh1M5D7u4PAk+/0AUj
 XwThOdnwGInITMpiCSk+Z0Ux8Ysuq0zpvWSqAJskLp9U0byYo5b2xAbSLAFNUkfY0gpP
 BGMKmideKXtxnbENn+7HXddRz+2GjdExgE4/BSEmH61FzZluK/YOshW+q6IB9+PAvwfO
 yQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701085101; x=1701689901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HyYNWAP0AMYoeZAQS0uh/Aq/GdjBljujYDiVnxqQaYk=;
 b=fJkbnWCm3oTqiNbBtLn/nasV2K089w4aj9rqUngPT7OIhjtNYk7WJpAnikMeAPQdyO
 OF2gzxhb6lFkc74dJ4wyghXGcI/737UOJ+vjbv8U5bO19rDOz77dTi0OCRe3EgQ0lvPd
 qEpEO/I0//CBlTTd1oGASvnZMlzUhKaYu0s7CD/tC88jArp61cibF7nSj23oHpsc9H8R
 QnnFH9SN6c28D8qK1QrTxFGXNYVls0CO2gp/zPvoeKW57jIPZZyWOT3AbBlFPoA5KwoL
 e+gzDArfDqKQwUS/2vTbqs2olp25FOZsJeo7D461vnm8JGkRv7V5+gykasTSCal3RWN7
 hLiw==
X-Gm-Message-State: AOJu0Yy5a2l0E+oNZl0QKZB/DrSfIGzjJKVru9BNRYJej0jVfxpSa5AF
 Spkdy7VL2T/wJ6T0y6vZZFOq2Q==
X-Google-Smtp-Source: AGHT+IHacOeTNR+63y0IoHOazyuQ1gINepRh7CBOKW7z0noOllvdGvsjGzD2Sf6bn5IOvp22q/TP9Q==
X-Received: by 2002:a05:6808:1483:b0:3a7:1e3e:7f97 with SMTP id
 e3-20020a056808148300b003a71e3e7f97mr14735971oiw.4.1701085100997; 
 Mon, 27 Nov 2023 03:38:20 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a63e94f000000b00578b40a4903sm7618323pgj.22.2023.11.27.03.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:38:20 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v2 7/8] target/riscv: add RVA22S64 profile
Date: Mon, 27 Nov 2023 08:37:51 -0300
Message-ID: <20231127113752.1290265-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
References: <20231127113752.1290265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

The RVA22S64 profile consists of the following:

- all mandatory extensions of RVA22U64;
- priv spec v1.12.0;
- satp mode sv39;
- Ssccptr, a cache related named feature that we're assuming always
  enable since we don't implement a cache;
- Other named features already implemented: Sstvecd, Sstvala,
  Sscounterenw;
- the new Svade named feature that was recently added.

Most of the work is already done, so this patch is enough to implement
the profile.

After this patch, the 'rva22s64' user flag alone can be used with the
rva64i CPU to boot Linux:

-cpu rv64i,rva22s64=true

This is the /proc/cpuinfo with this profile enabled:

 # cat /proc/cpuinfo
processor	: 0
hart		: 0
isa		: rv64imafdc_zicbom_zicbop_zicboz_zicntr_zicsr_zifencei_zihintpause_zihpm_zfhmin_zca_zcd_zba_zbb_zbs_zkt_svinval_svpbmt
mmu		: sv39

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6957b4b9be..fa056fb45f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1560,8 +1560,40 @@ static RISCVCPUProfile RVA22U64 = {
     }
 };
 
+/*
+ * As with RVA22U64, RVA22S64 also defines 'named features'.
+ *
+ * Cache related features that we consider enabled since we don't
+ * implement cache: Ssccptr
+ *
+ * Other named features that we already implement: Sstvecd, Sstvala,
+ * Sscounterenw
+ *
+ * Named features that we need to enable: svade
+ *
+ * The remaining features/extensions comes from RVA22U64.
+ */
+static RISCVCPUProfile RVA22S64 = {
+    .parent = &RVA22U64,
+    .name = "rva22s64",
+    .misa_ext = RVS,
+    .priv_spec = PRIV_VERSION_1_12_0,
+    .satp_mode = VM_1_10_SV39,
+    .ext_offsets = {
+        /* rva22s64 exts */
+        CPU_CFG_OFFSET(ext_zifencei), CPU_CFG_OFFSET(ext_svpbmt),
+        CPU_CFG_OFFSET(ext_svinval),
+
+        /* rva22s64 named features */
+        CPU_CFG_OFFSET(svade),
+
+        RISCV_PROFILE_EXT_LIST_END
+    }
+};
+
 RISCVCPUProfile *riscv_profiles[] = {
     &RVA22U64,
+    &RVA22S64,
     NULL,
 };
 
-- 
2.41.0


