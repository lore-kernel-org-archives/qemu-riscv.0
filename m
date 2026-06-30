Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CFAC43638
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weVyB-0006rA-UG; Tue, 30 Jun 2026 06:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwh-00066l-Qs
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:07 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwg-0004pn-9Z
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:03 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c85b73ffb52so1470516a12.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1782816241; x=1783421041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5lNhqIEO4Y4/uK8KijQuDX0PHP8gR1qrz5+KexoydX0=;
 b=V5BrZi09W91xkjScJHLvf//dFzwze5T120wwz4bicmWd3xzqdOlO4nWjhfqskzed5U
 9fIxBCw7CInbNuMlENnduiri0ZJ3lvOCGdePaKVSFO4a9oFrV9NJKYfmx1jNUZkyJf3A
 j7sAHoPnogUNadZcI/hb5PPZCRoPP5VJamyJVs1LL5cRfP9c3NZk/wKNtdaV0DwFyeIp
 WBrwZ/TlNYeId+Wugj9tBEjPFN/q+eIDRYeUui3KRq86sO8asZWlCL0ITr8qdFq9/6sW
 iYXbI/z6uWztSlzwIvnUYkEm7mXNGzL4yo3A0UJxfZU1guXrlLP9rsUHjmW+mY/a1mfP
 kzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782816241; x=1783421041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5lNhqIEO4Y4/uK8KijQuDX0PHP8gR1qrz5+KexoydX0=;
 b=QG4NVX/lHojOc8QnyjOropRo3ii5l6kDthiUT90g8ZkL6LEWlfSkpYVEd2g/wkVhLf
 FBVDYjOIy2MiUwkngixHqHW5wf4/9wqQm+tlCkSb/AAZ8ygsNrJWKNxjxnYQFKjRD4kF
 dJc4WlUpb2MymA9n+h5fjTNm5Ub7fiOrVq4i/xgNxlYpcWfmqRLfl1iKkkPun1pM/0Xj
 hwsk3wVZQFSA/J9lzlN4N6OIVFG6auqcUTvfqsa/9aPS1BM2cXyFz7FPIpjT1BIgzzYB
 4QfWSOo72anBU3m4g/p2Jfq1ip+I0sqvD1UOhwrNWFahFukndrd4ELttGsVfjHIeVYaM
 knvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ99KyTXZkQqZND/bBf/UCtgqia/SpV+NFkZaA/wI1DHu+9s/VnwbDE2KnzOryvQhwG9zsX8pFcPxE2l@nongnu.org
X-Gm-Message-State: AOJu0YxDRv0mGzbZole+3OCPmZJpzvvFiuK2hSqepG0nhnilItMFTYIh
 dzW3jQMT1zbZF/6jcR/maL3dMvUk5hfgq6rZvQOdLUsvfRSWDcqcr+vCsB0+G9R4av0=
X-Gm-Gg: AfdE7cnvoCgay7KWHSYOkiEjEyDDtVakhMuvg1uA3cNjfMQXHDlDggVOlKe7cLsRsfV
 +zfGVZ3zde3SvsNi9Q34j9nEXUIszq5cHZCzO90Bix969vQGEMCpbBxeweO1gH+6i4vN2KnEDra
 aDGIJljd+obUKObDtS5TKaA2h5VIFLMYUBvUF6ajGc1A8zb8c3u8p6bwP6wLEIdrDbV7PVAoNZS
 VHReWt7nmBMHXndmgxcvVym/kUC7TgTSPPBP5QK0GBWT89XF21URj2F5cXWm2VqrToAbYDJcdoP
 S3a8uZEIFMrOKIy5t3jSFaEK9KA+gcb92EYKfcFShAD4LwtRr14IIvwM7tWAYuJc2rzMh9agFgz
 /8Q+gYz37z8jjsB0At/cNia9O3O+QAVVC1BM2i3eago8f/YqKNiP4DJ3z27j5lmGdsrtxdLYK9Q
 g8b044vltn8VtkuRV2LW4SSPWTbmGjQXJYop4ilKP48rezEQ55HA==
X-Received: by 2002:a05:6a21:648e:b0:3bf:a412:ca11 with SMTP id
 adf61e73a8af0-3bfc52dfba2mr2882693637.48.1782816240923; 
 Tue, 30 Jun 2026 03:44:00 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbf95be56sm1274745a12.16.2026.06.30.03.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 03:44:00 -0700 (PDT)
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
Subject: [PATCH v3 2/5] target/riscv: Support raising misaligned exceptions
 for scalar loads/stores
Date: Tue, 30 Jun 2026 18:43:47 +0800
Message-ID: <20260630104350.748267-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630104350.748267-1-frank.chang@sifive.com>
References: <20260630104350.748267-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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

When the Zicclsm extension is not enabled, raise misaligned load/store
exceptions for misaligned accesses from scalar load/store instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e47b16a7fa2..cc1b5dbbadc 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -413,6 +413,9 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     if (get_xl(ctx) == MXL_RV128) {
         out = gen_load_i128(ctx, a, memop);
@@ -524,6 +527,9 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     if (ctx->cfg_ptr->ext_zama16b) {
         memop |= MO_ATOM_WITHIN16;
     }
+    if (!ctx->cfg_ptr->ext_zicclsm) {
+        memop |= MO_ALIGN;
+    }
     decode_save_opc(ctx, 0);
     if (get_xl(ctx) == MXL_RV128) {
         return gen_store_i128(ctx, a, memop);
-- 
2.43.0


