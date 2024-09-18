Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4274CCDD54D
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 17:15:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqyGJ-0006oh-DE; Wed, 18 Sep 2024 13:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sqyGC-0006mG-Fe
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 13:14:37 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sqyGA-0001rF-7I
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 13:14:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2d8b68bddeaso889a91.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1726679672; x=1727284472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nfs9IDqgQpVVigMZU11K8UdOmxP2QGM7nTxJBjJv74w=;
 b=nVjHBfRRHrSQaOhtW3UG2/JaqTM7Z7u6GNj/30UxNRmPySWwJo15aYIu8ZprACuiix
 etjmlT6dl4BV/UuSsW00PXB9wxaLdySZ9p9cQEBWwOc3MXjrOvqNkh9V/PiBMRQnGOSI
 o6lU45e1bm9SB58RDzSBESWfodYnZgl/nSSTHZeOTXzOM1ck/njwmmlIGxgSECRmFaRu
 3Yt1Ayd4WLJdzgh0uVPLlxh3mFkLA8XKb4MqeJ/WuS3dS/pN+XaIgzTQJOgWoR5nOHHk
 EpcI7MjUdtUi0wcJgG+hbHJnJjQLC7AYbfot7EODpYynJF1b+F6pKXlncYZPzKZhyHWo
 onyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726679672; x=1727284472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nfs9IDqgQpVVigMZU11K8UdOmxP2QGM7nTxJBjJv74w=;
 b=ACRT2Y5n79TbTyAsmxWx54bRLIEOsNesH1ujnhBCiMny9Soi5/Uaj/RrF0i2rsM+Ux
 tZyRwGSkO+5mpZEbQdD5Wc6cMYTRqfMnrbn+4oNOo9D9oPUWBXZJO8XhVH6j13fOGmqj
 Tc7wMFfYOeCzo1NeYBOVaxQAtuuZUM6rHnPk440YbvZcZkUmLORLuHe8fmQqDV+FT4Wx
 6/Ic28My0lXgvqHknYWB2sInuDxeiSOYGlD9uPiVYAcYFpGib5N8SKhpV62UArD7AyTi
 TpqJa2B+0GniUikEuGo0dMiW7MX2qP0YptphLakfrtdMZWnZfb6OUpzpDrTJur+BFRTZ
 u4Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRTyhe7RZyHAo2m677KBzH+o48i6QNyC9WxoLncjByj6XJvzyQOaJFabHHYMbqJfjvZOGfZLz1Uo8y@nongnu.org
X-Gm-Message-State: AOJu0YytZAZruOfD17+QtqZC97bF+RsHExJZResaE8vodA7qxVOWHA4O
 SsqQeYo8vC2h0seX8yXNe69GJbjTDzb1hLDzE9X8DVPDYe8SRtPf+3KInCJmZY8=
X-Google-Smtp-Source: AGHT+IGHoIu1KvtWHmKYThUD2uvco8vZFJarhXDHqX59sBe2QqGRkhQkFvNkNPLMJ2YsGEH+VsX7ww==
X-Received: by 2002:a17:90a:d489:b0:2d3:cd57:bd3 with SMTP id
 98e67ed59e1d1-2dbb9f3a7cemr28312007a91.29.1726679672383; 
 Wed, 18 Sep 2024 10:14:32 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd608e2318sm1914577a91.32.2024.09.18.10.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 10:14:32 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 negge@google.com, Max Chou <max.chou@sifive.com>
Subject: [PATCH v6 1/7] target/riscv: Set vdata.vm field for vector load/store
 whole register instructions
Date: Thu, 19 Sep 2024 01:14:06 +0800
Message-Id: <20240918171412.150107-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918171412.150107-1-max.chou@sifive.com>
References: <20240918171412.150107-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102e.google.com
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

The vm field of the vector load/store whole register instruction's
encoding is 1.
The helper function of the vector load/store whole register instructions
may need the vdata.vm field to do some optimizations.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3a3896ba06c..14e10568bd7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -770,6 +770,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
     /* Mask destination register are always tail-agnostic */
     data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
     data = FIELD_DP32(data, VDATA, VMA, s->vma);
+    data = FIELD_DP32(data, VDATA, VM, 1);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
 
@@ -787,6 +788,7 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
     /* EMUL = 1, NFIELDS = 1 */
     data = FIELD_DP32(data, VDATA, LMUL, 0);
     data = FIELD_DP32(data, VDATA, NF, 1);
+    data = FIELD_DP32(data, VDATA, VM, 1);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
 
@@ -1106,6 +1108,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
     TCGv_i32 desc;
 
     uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
+    data = FIELD_DP32(data, VDATA, VM, 1);
     dest = tcg_temp_new_ptr();
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
-- 
2.34.1


