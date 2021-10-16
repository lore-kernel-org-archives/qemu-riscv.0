Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnGj-0001SO-19
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGP-000190-7o
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:29 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGM-0006Gi-Mz
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:14:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id d23so11684031pgh.8
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=vqN5B88gt4UxlDLREu1jcSDEbUOGA2R6NktQT7Pt4xW+PBm7gMFevvzSH39AyUEUaW
 HRcIkCPayRz718iOu36b7wkj61s95TqWfb0zcCF4SX0udn5WyubeeRwckE9+IBaynMNh
 o77/rxL/ySA7FVn+LVn+9rS0jsUbjovAcNGGopa42pkoOeWRBywNo7ypnBtskEWkXDUs
 VSf9mnMxOw6OD7pGz1/a+sKBvrudfCVpB+Bt7Mkv0JcDBZkJKp/nDi9B7IVAw6aiQBN7
 rEXyYtpN/yKjC2SXqX6oYH4SyyppYcgdxevBGv5dpSlbmRGRt2vG8g44wdCis9gmgn2j
 IxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHU6Zq495CGWvucF4SFdns/LDCGAVtayMjBnfRKFC6c=;
 b=xKHNTN+uD1xyoRvJAVRl9uUPuvW3fc/6GV5d8uqFPX3vYwghnoKQnFtcljyUbzqUUa
 VJetQlxC7fp5hEPEVvkrjvcEilEFoWgjyCMhKzTS0OmIJCk2I7QkZMVoE8mufT7D6+aP
 2+6iSorFczS1P/otkOEt7q7++N2CfiO7REsGU8sexJuAaeh8VAU2D4ZbxFAQXtrzq4IL
 b+zhVLEACn7y91+QOur3UZRMlYUejWNlJ0B3R/U6/bGoNkTuVMF+u72QwPKoWDB14rnA
 RPwC5EofHViHzW7tQdAtV1njNI6Syj70cldKgwTp3G6jcgVUjHEnH/LXUmkNehy5Ja1G
 axGA==
X-Gm-Message-State: AOAM530wRgXZnyRqRxJHOJw8EBb2MiVNvqMRo28YEcYqNh8ik9g+gi3t
 vyyW5ncXp+xAgUWY+lkGtFidag==
X-Google-Smtp-Source: ABdhPJwfq3uSsS1sBvbwMGIDdH1h7UHr9gkp5F+2YE6Xu+lkmIUdzqtW0CocWBlq77twn4HLr7bn5g==
X-Received: by 2002:a62:7bd5:0:b0:44c:72f5:5da4 with SMTP id
 w204-20020a627bd5000000b0044c72f55da4mr18755681pfc.48.1634404465337; 
 Sat, 16 Oct 2021 10:14:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org,
 zhiwei_liu@c-sky.com, frank.chang@sifive.com
Subject: [PATCH v3 11/14] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Sat, 16 Oct 2021 10:14:09 -0700
Message-Id: <20211016171412.3163784-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 17:14:30 -0000

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 66dd51de49..c62eea433a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
+static void gen_rev8_32(TCGv ret, TCGv src1)
+{
+    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
+}
+
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
+    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
-- 
2.25.1


