Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8C6C3DA42
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:39:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU4sq-0008U4-RJ; Wed, 17 Jul 2024 09:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sU4sp-0008OX-Ct
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 09:39:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sU4sn-0007Ql-Mw
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 09:39:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1fc2a194750so34030775ad.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 06:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721223588; x=1721828388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nfs9IDqgQpVVigMZU11K8UdOmxP2QGM7nTxJBjJv74w=;
 b=h3hZhDEm8ps3HIcANJe0SMW043NsAhDZZgDAta6dcNhO/AD9Zy8r843UTUQs8tZ8n5
 GOtQjPkftk7aH0Sh/HXTofZgDJ+lXA9nXXYvu1QjEoP3B7dDkTNFUd+87YIRIaYd+gRd
 dHJD2aU4UJW8lJyFgmUk4Jj0TPXC+cvbLOHZXjWfoKsNoMAwMzKMb/cJjPwR7Oa5q8C0
 882C6yeKw2E8OI8ZeO4mXZqqLWWSdlUhEsp7MGd8q0TBtDMCq5JXHn2Q+2beEME+egkj
 yAVw75p05ZhM5+UXnVf0qvzlDBalNPsyZf0N/hR7kO1Jg5qvK44dykeB0lhQY08m3C44
 B6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721223588; x=1721828388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nfs9IDqgQpVVigMZU11K8UdOmxP2QGM7nTxJBjJv74w=;
 b=UG1yddnP2dZWP+pOOivDrA9hTcx/F68ACOBbCgTzhjwZYXYSBxfQjok3ZVAgD2aWXm
 8Sx3LbgRy0yZZ+KxMmxQTyOjtThotOka0ImjNj0J8gbcj9Fxf948KOVzsKHko8QJyZUr
 0D4LBfTwJEE+g/Ve+69CRzCoQEmsFWXZzcq3VnFEqy9aHyLq647cnOmdwcNXYg3LeQ/t
 UK70XM0D5nf0Jkg/ccuBtY+U8grLMSjX5yuMec2lAEkRHaamZ5ktXYM15f0u74kWU/p1
 rR9LzgoKNobcm2h08YVh7ScKNJ5ZdRZH2i+iz+i+VnTica0I18LSBl3Q6NmbYCNvDNhR
 gJSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiKK5u25RyCWkS0I9e/ijI+zW1ZmdGNKRjGvk1rb2meaLkAAQbvyE98P1u1raCsW1JPq87dZZMWOoY/Ayd6+kojqEwgnA=
X-Gm-Message-State: AOJu0YzznYB4B3Hc6VdgVFFqRYx3nXx0l+bgpb1VH/khGv4q6sYmA+a9
 KafmjWqgqyggRSEjb71xVpWorb8pS18xSZoaRB1O7ofqid09Ka3UGtF9uTuijrs=
X-Google-Smtp-Source: AGHT+IE8pc+hJ9pD+Tt81iKqmPfRNNbZNqlasHOE/UP9cJmMOu7HUIy004Z4Qo7CKRfgVJ67kMIDCA==
X-Received: by 2002:a17:902:db01:b0:1fa:d3d:a68d with SMTP id
 d9443c01a7336-1fc4e17c7d9mr16685155ad.22.1721223588113; 
 Wed, 17 Jul 2024 06:39:48 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc5aa6esm74903495ad.299.2024.07.17.06.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 06:39:47 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v5 1/5] target/riscv: Set vdata.vm field for vector
 load/store whole register instructions
Date: Wed, 17 Jul 2024 21:39:32 +0800
Message-Id: <20240717133936.713642-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240717133936.713642-1-max.chou@sifive.com>
References: <20240717133936.713642-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x634.google.com
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


