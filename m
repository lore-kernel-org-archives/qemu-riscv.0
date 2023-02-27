Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJN-0007C0-M7
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJG-0006th-Ps
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:26 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ6-0004lW-TK
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:26 -0500
Received: by mail-pf1-x433.google.com with SMTP id fd25so2816616pfb.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jL4pgNANfuKMXeC5MxlI1VBXfKn/ZH3qWozXHmWvjwc=;
 b=AubVIYB8izX+nN3mZvh5FVQkgK91M8d39Z1G9nsPEiFGm1y+vMAESoAbDzjw9t5jVQ
 ecaWJLHTWVcI3SpVF4wEVUlyGanlTljml1WjQkyPD2h6yo8aySjdyZ8FHvud1HGPOPG0
 8qA5jmGrmGVY2xbjHJ80vyuaUgwGfbV3FHVLlkmN+blvwxAokV2lWAW3qoJvCzwAW1H2
 m2pBGszC2miouWoxhuL6kPy0/jFMdMjPqe0qiXrmm+tXRrXhVGwM6aPr3VSlK0eiNk7s
 22f7J5ZWnZOoRzHPvaOjMEK3X9A70SO9AEMV65svS7rALt7RyDcQ7BWeHhYtiAKE9eWd
 Hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jL4pgNANfuKMXeC5MxlI1VBXfKn/ZH3qWozXHmWvjwc=;
 b=RI46fedegVvS8e4+la9o817RZabNLBKpRMnG2Wu3JT7HuKtc8flHeL82Zh9oOgwlPS
 pfyWpXa2hRkYEvFwXtj+gzynqpiT0j8KgU+Fec9kO+rfjhDbq6AQ9DnJnBCr+4oxVFsz
 T4wqrIgMHyP0bkVkDsMhY7dGLwDsRFS2jT8iE9fYi3Oi83WDc8YCdz4rPIykg60SN4PS
 3bhxn2FPSdEub/lAckL5iswcoa4v7MnzJ1dwNuAv4ekpRzn4GYK7uPi3Z6gLHiADs2Wx
 tLKxzDN3EA4BrDEZGQzV7NX06LnUC8nIuU8UxxZ9LXn6tWVFd5bf3IZ2V/hPa1ueiXzn
 uG8g==
X-Gm-Message-State: AO0yUKWG9vryDWDzImBEa/DGoXDxQ9N2zcbuKSgC+dOnqMoBwKIATDra
 8hI5uu2uptTdWm+u6DS8TeeDSg==
X-Google-Smtp-Source: AK7set8HAtlYy4TLkBHyKJ5MWudZz5u+uW9Y1Sorgz9qd6RC3CjgVT6WVBCe6ugk3Touv696q5cBDQ==
X-Received: by 2002:aa7:9dc7:0:b0:5a8:5424:d138 with SMTP id
 g7-20020aa79dc7000000b005a85424d138mr22258676pfq.16.1677476648662; 
 Sun, 26 Feb 2023 21:44:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 32/70] target/mips: Avoid tcg_const_tl in gen_r6_ld
Date: Sun, 26 Feb 2023 19:41:55 -1000
Message-Id: <20230227054233.390271-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:27 -0000

Allocate a separate temp for modification.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5c5660da5a..bec0a26c83 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2964,8 +2964,8 @@ static void gen_HILO(DisasContext *ctx, uint32_t opc, int acc, int reg)
 static inline void gen_r6_ld(target_long addr, int reg, int memidx,
                              MemOp memop)
 {
-    TCGv t0 = tcg_const_tl(addr);
-    tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_qemu_ld_tl(t0, tcg_constant_tl(addr), memidx, memop);
     gen_store_gpr(t0, reg);
 }
 
-- 
2.34.1


