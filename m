Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSU-0003Uk-EY
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSR-0003ML-7r
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:11 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSO-0007xZ-7O
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:10 -0400
Received: by mail-pl1-x643.google.com with SMTP id bh1so14211554plb.12
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZKAl9PO46LZJ4bQ695RquDoityy5/63I6FwO7ZGsZPg=;
 b=CNiC7tUhaM/V0zMtPzx+IktUkze6UhqNcOUvsRtNt5hGeihyOgeDLitRbV9rEQoHB6
 Dcf1yGdA8Qs2wo080NnMwaAA0wEblb96epp/d2fpvxHOF38U+RsIeS5Oe+y7qSxYGk/T
 fe5uMU3CjEXStA7F/B8rW5PsGJc2vSHzA0N7jNSlk25+lvFzPjU8YdqoVTBFMhTsZEvI
 CJ5Fd0h1pzhAoPI5YIqMLLG+uqhOu5vJU+zn02+iUfZKdWTh4NR/VArPP9kgYLSrbtLo
 MXVHL3StDVSrxTeezXV7ItDs1ILHFR1dpRMIRnjRRUCMXKdnSx2J2igjNKE1pRg307eI
 hQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZKAl9PO46LZJ4bQ695RquDoityy5/63I6FwO7ZGsZPg=;
 b=IPG7PksGM0e3e4IPpLIRm/efsXbNpiIMjLx+PdSyO9634dZzJOsFlJFKsC8DYAhaqe
 EBO+TMHO79LY94WYFGQZbcg+qCztaMKo+1iYMVldMe444ajoW1/7bnNdB29c9sfcljjl
 pAljRsgsSrEn6PS6NsIWj8M+nAw2G9rtDRtccLypgz88SkLreB/ttapsp5+PJuO0KMTp
 H+KypzYZHVobJ/EDX5FzJnIBYzb1/Q2I7qop11ZvQ+4SD41m60r/XOMKabtrtHdZI5E0
 YcRDTf5bD2UVRCIyhNBfQhGfGMCkjR67RnjfCLWrsGIgzYgBz7uWHW/ZnIPzNU2Nu/99
 gTKA==
X-Gm-Message-State: AOAM531hz6e/tpsOWdIGLty9RWVE1qflABuHP9sCowMmqSgT/AqGz8WB
 pkfP3Hmy8wLtEdDZ27OFgU0b+Q==
X-Google-Smtp-Source: ABdhPJzAbcp43Tslb1kz4UqR5537XETXM+pf92APi5K+pNeta6hF5cSeN4R8AL6eutMQLF7iDVrkzA==
X-Received: by 2002:a17:90a:eac9:: with SMTP id
 ev9mr7543733pjb.106.1596710946882; 
 Thu, 06 Aug 2020 03:49:06 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 43/71] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Thu,  6 Aug 2020 18:46:40 +0800
Message-Id: <20200806104709.13235-44-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:11 -0000

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 68634298fa5..a22db5f2f13 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1901,9 +1901,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.17.1


