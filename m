Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscn-0006Z2-Qu
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfT-00066W-An
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:11 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfR-0006yV-R5
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:11 -0400
Received: by mail-pj1-x1030.google.com with SMTP id k5so2450235pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SQe+5VvW1r75JMKg4RkRNVzatof7TCQwBrRNcipixjc=;
 b=j4TBxW8RsIbHgyI7CvEUCCqOd2LSblRcBeXjrjPECuPzgWx6W1QpON/+HPUKfjwckA
 JBv9+D20WJVzHaDdvr5mlLCtk+pMRmsf/jST+ndkWp2m54zyi4h7iVnOgxyF9GCMtjZj
 NuPVEVb+F1jTqbjhO+C5/KGgp3MyiPvIWpWm4A8uVTOl6xqq4NiD+J2Vffp2FNZDEHnt
 YXO/VawqxY49MFbh63Gx6qU5VFV+EDQyI4KOESkCG3skmudZ8tX1A1ysPZ2HLQH04E3H
 bDAwl38oi1ujLwS89mAislljrbjVtKzPQ0TA+ZmQy/+WCm0uRejUSSKTofvQp0XCpAz0
 Nfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SQe+5VvW1r75JMKg4RkRNVzatof7TCQwBrRNcipixjc=;
 b=EV5XPjgmNdlp+5rIo27/4+nsfRcVrtYeSgkq6VFG5b1ZSfPlnwEuN+HbOrvjTrjvvW
 Vb/iVeNplE8xx2V2sLO9kXqbrQCxfI5nTqaJCJiLvDy+TlfV4R3VEHDaIiiRJ6yzTm1o
 PXBFJUG8HwUNa3jnSuBbbzwsbDn9PSpfXrkSK7qFVD3Cp4rKmJPQQ9dWtSGp1eLSL3ad
 EyjKTMc6ELjemGLEt8FGJ7TkB1DGFR79jPdT2eXHtAlIaTU65ltkjd1ERq31JZ6q1Hmx
 k1iIAD6tqcru1ub3B7e7SXzDue6+tWoA+kXgPizufFK7AQsob5z8vn3h8iW4ha9w+cVq
 EOOA==
X-Gm-Message-State: AOAM530DWMijRQ81AWbD0HsdmLDKVqB2QaUZsGN80GLWdHEH4MxZOpF4
 EgVtF6NQpJ4xx5+c5AoL9eoW3YMr57FMUQ==
X-Google-Smtp-Source: ABdhPJzfn/MzYeUeYqWcu+iCXv6BX1K3zITB0QBurXdU4c+ivUphmcMtk+V+CoSI5a9x5gz5QhnGOw==
X-Received: by 2002:a17:90a:1a13:: with SMTP id
 19mr4574313pjk.167.1594378448628; 
 Fri, 10 Jul 2020 03:54:08 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 53/65] target/riscv: rvv-0.9: single-width scaling shift
 instructions
Date: Fri, 10 Jul 2020 18:49:07 +0800
Message-Id: <20200710104920.13550-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:11 -0000

From: Frank Chang <frank.chang@sifive.com>

Zero-extend vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 34b0392625..5fa1f0c6ed 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2185,7 +2185,7 @@ GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
 GEN_OPIVI_TRANS(vssrl_vi, 1, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, 0, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, 1, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


