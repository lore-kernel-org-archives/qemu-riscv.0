Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F6FC44501
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:09:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi4Qk-00017k-8L; Fri, 10 Jul 2026 02:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qb-000168-Cl
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4QZ-0001t3-Sl
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2c6b67d5fa1so9535295ad.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2026 23:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783663775; x=1784268575; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l24jeh6mL402UPS1PQ1PqKY5L+GWjbvAW1P9ttSr/yU=;
 b=IImzeWdvK6jG01E/mLCK2WvMXYzNLLb6fGRi4q/5+if4UabJsTzLOEOCPd3wCZ8u8A
 HAXL9YzNlqtAYMPavXfHmZ7hdh8oKB/ECo7oNErx6qaOKFbCYiPdtHyT/Sl9BInhKuX5
 E1zu3okbCW0QXeglOhCWdqFfvao0EwF6yPyY2GF6g1ZgNrkjoR/jkGnV/9QdNrl5yL1d
 1F+n9Zx4d3ffQzD6LZvQpIU0sunrnysCrgvCEM5fq/N6dIZ51Pg+rp5XwB+Lpwi0pMGz
 VVGBy5VNDquWoLWG0k3I8/qUvp/doREcL1WuIM8LZoJnOWBWDJBpsFqENWczZ5QYM9oy
 CgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783663775; x=1784268575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l24jeh6mL402UPS1PQ1PqKY5L+GWjbvAW1P9ttSr/yU=;
 b=NrC+LtKHt6OnDzJM545M3NEO9Go2kw81BMqxwSvqP8tgZsDUxcqfuONsEX5ckUDol9
 Bort9rXl48XiEMtoft6XTFXFXihkA9vN2trvKAJaKvJREimicJhWNyCz051Cda9Bwbiz
 S17ffIglBWA7ny5aLfNAM/j/M3tzjsr1aaEswjN+D4yw07Rmq2mDTNBh518FIjrYb7uy
 6GWP3BAGPurLFz8k0nUSBdYsV6Xgo2e/tPT27NfRzip4m9YnJc/yrUdAZPmachuU8eZQ
 f67kNpvEbmB365ZvKMM39DigeOSniHWjLb0dgz7rw8d8hLyIh71BeZWqTjxyqixRUSEO
 /kLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrEI+LZEnrj8DOZTqZflY7JPHHMh9Z1BLA0+/6tH/6UJzzbJJXrVJ4hiXf1W3fEN7gvrsGrxfRVqVWW@nongnu.org
X-Gm-Message-State: AOJu0YxjohX62TTbe5NeCwgEVKj/0NQL8FyA2XJNceAVoRwrs/2Us+sp
 oJFbXQ5D6QYbNM6kE1rW9L3lLgBCM3BsPAUktllDyQ7mmgqQU/wvJcKySk8VJJBdOQw=
X-Gm-Gg: AfdE7clk7my1zLLtfS3xEOjzsLjYPJbyTH22VYm1MadXOpspoFMfId5yEkteAOCbYYt
 1jaAK2GSHZVtUgTYBme6r2+MsES/MpuITbEutvypCp1qLFeZ9LuFTpzN6KYsixsgbQd6gltGK+l
 pUVdP/sSx0lIFxcrpilEKE1XsaNxw1/+o6hYXktuPC+NTApF/OodKmhzPBHn5fhp5Aog7b/q+M6
 pqoIQdsUFNsWi6mFXQH3sm3GWknAeSH8LvZMx0fPeUDSgb6YU87p2eRK7V+jtLQdkW99BspzcAq
 V4CHxvV1jimKPpMoCLfs5ydhylVGapcUqKfQncTqcTYoa0BP4nY/Ygw+ecquyqvElennn9IAdCh
 oh47+ea+e3HuMx4QvhXeyCcht6ukrlo+4Z/x5Kow5LwEM+YKwlsWqw3gdwsoCgwiepjVnlfv4oK
 VgVpIXTs40nNlRCLkN+ImUazOKgGpjJNBVkXrq+Ds=
X-Received: by 2002:a17:903:1a30:b0:2c9:97a7:71ab with SMTP id
 d9443c01a7336-2ccea4892f3mr110072575ad.38.1783663774620; 
 Thu, 09 Jul 2026 23:09:34 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d59e33sm53344255ad.74.2026.07.09.23.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 23:09:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 2/7] target/riscv: Support raising misaligned exceptions
 for scalar loads/stores
Date: Fri, 10 Jul 2026 14:09:09 +0800
Message-ID: <20260710060914.1227027-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060914.1227027-1-frank.chang@sifive.com>
References: <20260710060914.1227027-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
 target/riscv/tcg/insn_trans/trans_rvi.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index e47b16a7fa2..cc1b5dbbadc 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
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


