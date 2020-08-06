Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRX-00023x-6T
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRS-00020m-Of
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRQ-0007mD-Ie
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id t6so6294716pjr.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FGOh+A6IVpmY/plCM7TtdvaB7Halabe2EZ+P5FsPKfw=;
 b=dOAlFjYdOyh1yqGbOHNJn0JUtzch5/HEHGD2QQZsm3/HCTwvCXhPTRB+fzdhbTYsB/
 inn/7/fTymhDXAoHykgwSSqn71COBD/Fug+Z/OOxhWIxd+7yeuVLnrHcaYjqjGIb7hq9
 OBLfyLr0HOeKT7HxX/qRBSaVnnquB93ej0gAUaNrIbYUKcQNOgS2M89yUaQu76enmxIc
 sEjYf0jAQCJCvXQN9aTnHsZfltckUTwe/qBQTWmEsYvYCRQ99/6jaPbZZQNRvqRbo6Ll
 Y0WUsjuVf6rcUoSXvGvUN2uPCBxT6NJnotvvNPMR8BxESnFPptZTXOIssAga6hPrx/rE
 K9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FGOh+A6IVpmY/plCM7TtdvaB7Halabe2EZ+P5FsPKfw=;
 b=I6fhdeNwkQGRudLBwpwLwFwSLmdce9v7UItP1fKOUglbsd7b3NJ5/s+XxpDgAlVC4g
 KONwKewMImCFdjH7ifuE6zWfZv0QNDQXA0sNEc2AiAC4FyNPG8MyXo++FXYFsC4rfLCJ
 Re8C5s+ob3QhE1YFlKQDJiB0Qijib1AwBaF1J6ePQuBXzU0PgXOLZB+ekr899AJ00rcg
 0Jtv99c5YUmdZbXQxp6ezs/maZ3LHnvpUyIamy5GSJo60sWpwpCZjr4TfIRZEMOag4Qq
 35et3hibXCCjycjlZl2TsrpWEvdScIxTWRZMV6mVcoy1xFzJcb8RiQ5Aj/CuMs03gq1r
 zGWw==
X-Gm-Message-State: AOAM5336gXzugQrD8jWoIMqOHf4FDYw2/e1PEnIdvlci8IxEpn7cm80Y
 +is0exR4VOynLHzHLedOMZLICRBop8k=
X-Google-Smtp-Source: ABdhPJwbaFlpC5O91Xz5GM5vCZPUj1L31VJcPeHEb1AUuC8Wbsh1xTt/A/TFmdPuP86X16BPDscZbQ==
X-Received: by 2002:a17:90b:4acd:: with SMTP id
 mh13mr8060142pjb.147.1596710886460; 
 Thu, 06 Aug 2020 03:48:06 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 18/71] target/riscv: rvv-1.0: apply nanbox helper in
 opfvf_trans
Date: Thu,  6 Aug 2020 18:46:15 +0800
Message-Id: <20200806104709.13235-19-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2020 10:48:11 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 525aff06815..8a6050f6b32 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2156,6 +2156,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2169,12 +2170,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    /* NaN-box f[rs1] */
+    t1 = tcg_temp_new_i64();
+    do_nanbox(s, t1, cpu_fpr[rs1]);
+
+    fn(dest, mask, t1, src2, cpu_env, desc);
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
     tcg_temp_free_i32(desc);
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
-- 
2.17.1


