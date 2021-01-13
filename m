Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaMZ-0007H2-2r
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMW-0007C4-Is
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:36 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMU-0003xs-ET
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:36 -0500
Received: by mail-pj1-x1029.google.com with SMTP id md11so565790pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=LVR+9xYUeJP3+5goOWtTo4wgWX8Q+1tyB1Yqi5Ear6C45DbP13FLQ38lI7oLDEIA53
 MxhlBslwopbaiImWSC7yWbYxpMsvN+VIiI5x9RdALJKSFM/XxmkFuBJB7Uv1BqRGYLV8
 d4QqzussJsY9wmIxzxPHLec2h5WJ1eMWyEejt0nJMK/mmImtmCooOHYpHx8fXhKTFrQq
 iigrSW+b7JcGCTXNjkVwczEaBpSQ7gJ3HdXbd04XYOBE0QB4AF64D+Km5OHkctuCA+ig
 z4sf8AIHlb1zDrauJjA5fM/Gq0H44+33FTzrvEjfsQWHcYkvztcZUFCYjGAVQ/TwWYJ9
 uvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=j4nOc+QtZOILvrjrNLLC8h1M5F9k2rOOQyF0MGDMQxUX+8F4CMTCUvsG0DxTKzusy/
 5BX7sFUa4V7w8+lAbidUUXpPoyOjzkr4Jl9nC7M2CEN2N9c1evUb9s76jUtGoDf/pDGz
 UpyMUPkwRQ287e9sCoH3/zMRjzpqoAodNSysRVbwmtV6VMEYdOVepwfjxpSeuyoXup2b
 4t6oCQYEA/xrGlhyoyo3xNTjEbaEQvwZnzUsDIECVMp+DhM4h12TdqApem1pOrBHX2VD
 02Z0CKmXm8/r9FRRC7vsK1ue2oLYaFqe1Xmj5sd0bXzcngsYCaEdvFS2OjkfMjwuYyAr
 U8Jg==
X-Gm-Message-State: AOAM53375/kjeVD2cdy7Xm/N+VVxCH1gVoTcy9Fv440UQ8VRzVrFxBiK
 K0eKKq4V4lx2RPDokoOL6whSmQ==
X-Google-Smtp-Source: ABdhPJySBmtuVaVT2nGjf2DSQgQTF87I3q1vSVyGJDlHq7Z7Os3bjnh+Sa/Zp3c4m/usxx62Fue7wQ==
X-Received: by 2002:a17:902:c392:b029:dc:3e1d:2316 with SMTP id
 g18-20020a170902c392b02900dc3e1d2316mr810255plg.50.1610522073199; 
 Tue, 12 Jan 2021 23:14:33 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:32 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 07/16] target/riscv: rvb: sign-extend instructions
Date: Wed, 13 Jan 2021 15:13:39 +0800
Message-Id: <20210113071350.24852-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 07:14:37 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d64326fd864..938c23088eb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2aa4515fe31..1496996a660 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,18 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


