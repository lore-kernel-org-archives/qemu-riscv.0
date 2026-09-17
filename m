Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087DEC982CF
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 13:39:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7CJj-0003CT-TH; Thu, 17 Sep 2026 09:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x7CJT-0003BV-N8
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 09:38:11 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x7CJR-00044Y-H9
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 09:38:07 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d747f05ffdso6705095ad.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1789652283; x=1790257083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zwzFyyvJC39ZPVbt9izsra+Ht73D68ICAZtqoph7Sq0=;
 b=SIzxwZERFxmgivJ11h0m/bsIfTUTjICy6bSxb8xklwDbPUW26qe1ddr/FDaa69srMf
 Y1l1EDJDKZo0UjDUWxSUup9AiZMnx1VeSkZ5ZOzx7LznK5nX5f9rj9NYCVLmkrhJZWbi
 w4fw29gB0YRx40cypN0N2EwoNQyl/Q9+vZkDdUVmzFYIFDWCl8/3M1a/xxx/LViGVnB2
 DuV9OQ3F2el62k0+p6xfbW1f1JMPPXDgOc/TdPs24D6H5JZ02ETKdZe2KVZ48SqRBX5Q
 zDeiYgHq9mZEOEbPQzJ5x/c8pZRiF85hiAm8G1g9ep1bOX5B4bT4WTebnM48h++1U1tY
 cBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789652283; x=1790257083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zwzFyyvJC39ZPVbt9izsra+Ht73D68ICAZtqoph7Sq0=;
 b=XJgt7fsdMi0vlHHuMCFrty2zBktt0yMlYDK6fbCTxeUu9jC9pHzenixepgEIP462kB
 7K79WPKntM9d9TnzEFQLex0LNVWePow3ndjWaVTJcnuSQgodPdLdU5uSTvEy53T2dabw
 dwvSaqNiaQPx3VvUhBAKGOIDJhafSQvYeadtg9pvDJ357xyoNTwIUrZ9H57Wypku0G5V
 YHZGoXiMgiU24GLsJpfj5M86XkG2tgVGCaHTnn9nCyZHIqe74rPms33+AZYH13X+Dg1f
 w+mlby0cPxFr/M6pVeioV/YENGh4M6z6JaqcT1pvauUHdfAHsWcd7fdpSXtZaQJ7zN+w
 cCWg==
X-Forwarded-Encrypted: i=1;
 AKwUvByZwU/FGuBYJ1L0je/uAgizo3kSiF2Bkg06kAAukNPVq7lZVJGRcSOR7tg3ENlhnLHjuQQ9LD4rmX+F@nongnu.org
X-Gm-Message-State: AFuF++kfujXaYKxOFFwNut0VTHcPXUavIUVMBL+OhTOREKLpHSGEj3h+
 43uonXqlOgzRr6Yku2+emc8Sa3q2+7Qx0qUWb06vDpqr3txfCHvwWZwfnHD6MYAF78ck3NE3jZK
 fO5Jf
X-Gm-Gg: AYBFou2DD8i9avJD7oEXdBlKXyEURR4RRv3w8tNZWvPju47FQUxOGssVH5ralJHFGxt
 dQNB40AAQyESORQFu0t0ZbpcP5riFAn32TijVHcE96rwm+w2mT9fbWlzNzT0s+BGK1z/+lr+4hR
 CfjEk24MLxiF5A6eejUb2iXxCO2vpkEGyqSMMQ3w2tY8UpRjxOuPQDFuQNYx5J0SEbNI5KfMkN3
 5cbQitVLA/5LkCzkwvsna3xzVTEbYtF99oy2RYfzuXwJL9ZeDb4uxV1azjkkH5JYYsTeD/Xycri
 RpmNmS/zpniDZOpNjR937LGeKkH9XWOCBu+6Q0jHHrmhMa67/gK8f1jOvmrULCu0w/TDqxCPH9v
 J6LVOkplKl3ylbamLxPmdV1BQpDO3B5vWykPpGM44XZlaBUDRwefwdr+icMzuFBa8n1bh4eLdts
 z8vi0d4Gxmb/eUXf6Lw0VqSFvmR8L/HmEuJxReooMc2LRpBMLW2i/Jq+sbE5Y1jdJyHaNf5zk04
 dwCPltJyFLC3cmWAn9NVchRMvsoLzOK00z/Aecv0LTflYXGZMz++5pst9MrfbDw6YaidP62C6+1
 NihLyE6d
X-Received: by 2002:a17:902:da47:b0:2dd:40cb:a054 with SMTP id
 d9443c01a7336-2dd8e73f743mr145968945ad.19.1789652283172; 
 Thu, 17 Sep 2026 06:38:03 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dd89ebe71bsm26539585ad.40.2026.09.17.06.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 06:38:02 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Chou <max.chou@sifive.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2] tcg/riscv64: Set vtype before whole-register vector moves
Date: Thu, 17 Sep 2026 21:37:55 +0800
Message-ID: <20260917133755.1049697-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=max.chou@sifive.com; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

According to the RISC-V unpriviledge spec,
  "vset{i}vl{i} and whole register loads and stores do not depend upon
   vtype."
The whole-register vector move instructions reuqire legal vtype that
trap when VILL is set.

The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
OPC_VMVNR_V.

Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 tcg/riscv64/tcg-target.c.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 2ce9d47a633..e3cfedb579d 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -778,6 +778,10 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
         {
             int lmul = type - riscv_lg2_vlenb;
             int nf = 1 << MAX(lmul, 0);
+
+            if (s->riscv_cur_type == TCG_TYPE_COUNT) {
+                set_vtype_len(s, type);
+            }
             tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
         }
         break;
-- 
2.43.0


