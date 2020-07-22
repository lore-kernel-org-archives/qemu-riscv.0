Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAse-0005U8-F4
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsd-0005R7-2J
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsa-0005EU-7V
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:17:38 -0400
Received: by mail-pf1-x433.google.com with SMTP id x72so863355pfc.6
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dY1VnCufQZpa+aF68DC4K7OikxwvWj2GSrpOqri/zyA=;
 b=YyvwtEWm3SZpOurKdG7x6QNieY/R2CtsObGD8omuXOjGvRxJojJXb+EF1I+mKRQm3K
 xaHGV0jVlugF2DvHiLSaEeJkEXFmxtCPhlda3eKfMlk4kTbnBa07PbjNp2AfiAyXRh+u
 hEClgtM/U8ysFA2wRkI1uZnUdB9Xx3a/hkFUsrApdoA9K+xbODqofsqNG4nxkKbQOtIu
 6B5NvWxEfuY8K71ouCSsx8mg00gESQ549xZ5yAlssFTIe8NBUIwXTTdy+TtJxTz8oHDQ
 83Z+x0V2A67KWIvy4/Ve/ZY6lGV++saI/qWXU+SAQPu5V8yhRr5TyDnciZN3FPuprosp
 83gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dY1VnCufQZpa+aF68DC4K7OikxwvWj2GSrpOqri/zyA=;
 b=XC7PnF8IvWjWOBy1iTGfDVxMi+SEwYssXdPjutWzCQU//igwwXNIRF8GnYU5NDk+5d
 n8OOOD4e4s0GCBscb0xQ3xc0zyMNs8OKKVJ+EdOTuHnGOsdWvRwnCDag9xH9P6k2mkJa
 g/u5f/JxaQNUfrM2e90hcU2II3H75hbkTb4MTw3VBf4iw8jQBuYmic7srXNuUecgoZu/
 Tqf3T8rxBD0wiabH/LTw49RwtllmnoWCFVxzRR5MxbtrrXTaIABIY2tByDLSIiIKl3MO
 cX/fKK3whWo0fXsVdSGtGNGKYUGFvImwQ80gWq8+HICnhC6NVhOWfofCEbK4SHbk3jiR
 ISfw==
X-Gm-Message-State: AOAM533k1Dl1MAnsExvYdI9UkQs5nnKMOJtMSMufvk3cERZcBF9K5kgh
 8JFLbHqnVu8uDKDIN7YYQ2nUyQ==
X-Google-Smtp-Source: ABdhPJxrtBNZoM5PQ7qpaY8LDID71dzKi7yj0Uxp7NqcqUFishirIGLpNK31OpzoiUMoSGd6V20e8g==
X-Received: by 2002:aa7:93c3:: with SMTP id y3mr27667419pff.206.1595409454891; 
 Wed, 22 Jul 2020 02:17:34 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 04/76] target/riscv: correct the gvec IR called in
 gen_vec_rsub16_i64()
Date: Wed, 22 Jul 2020 17:15:27 +0800
Message-Id: <20200722091641.8834-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:17:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 433cdacbe1..7cd08f0868 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -937,7 +937,7 @@ static void gen_vec_rsub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 static void gen_vec_rsub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    tcg_gen_vec_sub8_i64(d, b, a);
+    tcg_gen_vec_sub16_i64(d, b, a);
 }
 
 static void gen_rsub_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
-- 
2.17.1


