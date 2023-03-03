Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zh-00005q-Og
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0za-0008QD-UM
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:19 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zZ-0007m8-I5
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:18 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kb15so1814952pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832936;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhVcyaR+wUHNG6/4VyYZTf+bfbXlrY349GdOzrTycmU=;
 b=dgk9U7kLWVlJ9PxwoGsoKY/S6CAm//dppwNf0gBPZcwvTkwRVLafmFrl0OX1yiTSv1
 RDufYx3H2iyE3J5PbUWJLOjXMQ9X2IZ/M34pxbq/cF1o90gZs/LapXoRopE8CCIvLrpb
 NLci7//FwpH4VP7HhT2IhQKD3/L+gMlrFrlQgxI4xcOhfm9k9pNVV6L/WThjB26OjgwL
 74zbFwqB0gJYNKpzJQskMe+GFLxYG0/bmOT6dUq2kfLqfwt3ewy1DZfBDSh1vFJdQ1v9
 WHi08ow15G4hUgp3D0sIacskFBy31KLtQ+9Ntk41pFKSG6SHaq5jf85eDikAnLi2IiU6
 P//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832936;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhVcyaR+wUHNG6/4VyYZTf+bfbXlrY349GdOzrTycmU=;
 b=ID8zxGRTzwg7l4tfenekvUDxGIJFDlegkUZydTgGYEhK3FHfrd8dn7MXFlkfcRVSZg
 AgNPgjhwH1BXEyQFOO3Wbj9mdwa57wi7ys0G0SM8PQLynZJPMEk9LVsKrjYR8x1Mnydc
 gWoa0iZNTRkSmPoyYl7E/1tMvezQZJxumZTbBJj5eM1IZWtltx7BVOZXimVwJ4VrW7az
 rq2dfeiVwDfB6MybYNsT0IuPpPaxYtomUNoW2hZWPuFZc1Q1jimTNQog64DX/UzmWwn9
 GqyaxAFfR6CDjnIgI4R3WxKS8DQ462A5IjU2+VJ0D+xWLlyZE1LLh7Kk2Z9WLpYIm8vb
 w13A==
X-Gm-Message-State: AO0yUKXhCZhj4p8bcvwFEOdGj0dp3sTL0oYOZI/3f3pwDjGHBl4BQrnU
 GOuVevxMR+YU7tanUSv4rgj8P3SMzvt5b4f/
X-Google-Smtp-Source: AK7set+S1HNkb2BFMOesMBPEGQQepTlPKZbLQVOcRVUKIEhib1EqOiCqhXvXJOsYsvz7OTS6aRnz8A==
X-Received: by 2002:a17:90a:194c:b0:237:ae98:a47f with SMTP id
 12-20020a17090a194c00b00237ae98a47fmr5195634pjh.1.1677832936545; 
 Fri, 03 Mar 2023 00:42:16 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 lj10-20020a17090b344a00b00233e937fef9sm1035279pjb.18.2023.03.03.00.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:16 -0800 (PST)
Subject: [PULL 44/59] RISC-V: XTheadMemPair: Remove register restrictions for
 store-pair
Date: Fri,  3 Mar 2023 00:37:25 -0800
Message-Id: <20230303083740.12817-45-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 ristoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:20 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XTheadMemPair does not define any restrictions for store-pair
instructions (th.sdd or th.swd). However, the current code enforces
the restrictions that are required for load-pair instructions.
Let's fix this by removing this code.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230220095612.1529031-1-christoph.muellner@vrull.eu>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index be87c34f56..cf1731b08d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -980,10 +980,6 @@ static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
 static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
                              int shamt)
 {
-    if (a->rs == a->rd1 || a->rs == a->rd2 || a->rd1 == a->rd2) {
-        return false;
-    }
-
     TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
     TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
     TCGv addr1 = tcg_temp_new();
-- 
2.39.2


