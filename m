Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzK-0007Ph-Lr
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzI-0007KT-BD
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzG-0002Qu-KO
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j19so2025425pjl.4
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JzyTM2tWktA+ljiJEur6MshCGktexIa7148Uh7k2hDc=;
 b=aTDN0kLwKo0oAwZ5lF8VbWmugEX5zoXqFQAyuDOu8Z0HEZDyL+eHA4kfoqNRUsmv5n
 JdSWwP8pz8gyk1jZxJR8r+4fzCy2i0IQnlODx7ldkHAv9yzs+hinZ5clWaVjpUc0JsXN
 fSBofLqplTbgIVFswsd5rxOU4Ikc+AaFzYJnwCWJhCj3yE7DgM3C4tT2GO3wM/sLQAal
 eqNaMJFp98HxFdZrEH9/lO9q7YSwRzDi3Qj71S0M6ZwjLFJX4l/2xqRIuonxuLQ71Rxn
 5Lc7eODcMT5eHlskb1wzyX+v6hO3WOmuravnXr8O6fYpgmP8yHNj2mi/Dihb779pwNa8
 IwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JzyTM2tWktA+ljiJEur6MshCGktexIa7148Uh7k2hDc=;
 b=ilJNUaI2n2KJay+tCH8Lwm866nKAe07JAlacHAFoY9udHmIvpCIj3uqSrqCgVvBVxM
 r8IfvcKHBs50EOVtTegAFK+7lbECDOe5NemOIoinZV4H/ksCJ2tupazARVW8WFwdswAl
 AbLNrZ0zDIqxLr2goAi1cJuKXXr/vnwJCNmmrmmjsXGzLKPoH0+zlXn03PMX9lrGYCrG
 oGeFdloK1i3CPKvdQsRQUQvSPF49sNIMV73RaoAVrrYsokNJscK8H5Qc95f+iGNn01xc
 gk2BWndgNXiM5b7H7Y1Xil7xCcqC1SpZNQADd29PzFycnptPSse1CXA2aWh5SiQlnPkQ
 nQVg==
X-Gm-Message-State: AOAM530oRBjkT0PgMlxiCo54uXK4RdVBrJgFTrpQfcCyl96HPqNcBjXI
 FWQ7JOv2XhDzf6zszWO4oOk/9w==
X-Google-Smtp-Source: ABdhPJynF83gErDjS1rWqXzQCSeWOKu+FUeulOMNMLZkwqF9AvgVS4MxrXZenVWukwN4SDYxcIHqjA==
X-Received: by 2002:a17:90a:1690:: with SMTP id
 o16mr5175384pja.148.1601406509406; 
 Tue, 29 Sep 2020 12:08:29 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 54/68] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Wed, 30 Sep 2020 03:04:29 +0800
Message-Id: <20200929190448.31116-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:32 -0000

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index be5978790d..6df96f4597 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2280,8 +2280,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


