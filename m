Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzF-0007Er-Vg
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzE-0007AH-50
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:28 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzC-0002Q9-FY
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:27 -0400
Received: by mail-pg1-x543.google.com with SMTP id d13so4638881pgl.6
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SmOcdQ82zJFTbAL8cnYxTUcRRhNx5mYQ8G6z15GLkyE=;
 b=RjfLZ66QqniygkbZBwbvnUwbUZgYbAxU5ascjaeob9xGntsQnzhrTF1mubcPy0OIQ3
 q7AeIO2tbxRwEf9QsYQWdtx2aTD4L8PDk+/SetWu9mk+lRY0t/dAz4KImf46kd7yAOm3
 /eofdOtbxkODj05q0MJtW12DAE/Z/uFFLCVsI55xdfDZzIrDwX9DR8eJ6sANOmwtdhUs
 3tNu7ay7WRixUfDy88xKxQeLKchMUey+k+Rq5oxZS1WFJD1OTqdnzP0TcNl+Cfx2Ne0p
 Pgz3PpeK/GGJyJ423qO+25o9MkJQrjxAB8dRY4KCDLAaj/VkBKoxDERcCeI2KV/XL2n4
 Q5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SmOcdQ82zJFTbAL8cnYxTUcRRhNx5mYQ8G6z15GLkyE=;
 b=h3xUd7IFTTYYcmqNCSF7/Jsf/53cvcdHQ0JCM4jddTxosjOQqikaofuIjapGAon4bA
 JSyMRzIhrn5FO7L2cg+L/yPaZ6LRH75X/GZ2eAx6hRsG4c9v2WlQRvJsePVnuBB4S7IJ
 eD+BlqMcv1Y7W0R7NLOdRK0zDCjmGByngtwjdiclBJ00jLYVD6OPfJbKvP4qxdDRhr9A
 neppPojKnLQmGnxE+AcnSDPSCFAP7NSwe7frpM286u4kYulWvw4/DXlo6qFWLqUYDB8/
 qRvIs9xbD2OjXwH6Neqjh2ue8clilutqcdA2HUZ7LRPxWbq5XW6L1YV1EjDUPBvYBD0a
 Y8wQ==
X-Gm-Message-State: AOAM533cELLbMWBWVl9FVHPBJRFt8ZRU3Hcxw9jq0Gmfok42+x3/3YpB
 7EVSqzhfiswv69bCEtpDTgyFRA==
X-Google-Smtp-Source: ABdhPJy5jQ/COmMVM6eHddLkgWJ/YK2TJmKz5UxnGcClA1w9VuLnBcb5rGkNQcaIv+pTOdYtVNdNhA==
X-Received: by 2002:a17:902:ab89:b029:d2:93f9:54d1 with SMTP id
 f9-20020a170902ab89b02900d293f954d1mr553769plr.30.1601406505320; 
 Tue, 29 Sep 2020 12:08:25 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 53/68] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Wed, 30 Sep 2020 03:04:28 +0800
Message-Id: <20200929190448.31116-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x543.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e2f4de6078..be5978790d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2895,7 +2895,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.17.1


