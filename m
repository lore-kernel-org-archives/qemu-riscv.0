Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9Iv-000160-4a
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Ip-0000yy-Uh
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:00 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9If-00029i-T7
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:56 -0500
Received: by mail-pg1-x533.google.com with SMTP id 15so415423pgx.7
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=Zgk5gKtL9E6rrgTfbk/2B9Bisx7I4g5EDyoeHjEDYvzSAc5tcr9sBzi4FuzT2gqffd
 xLk6iqJFjHqmN7RgjhX8j0pnGsu4Ii3SBHNU6voopgKM9XXYPoyPwkg2kYTGwBZXj+5A
 PDH3xRaPZP5GuqTGSTXIOV0jJk1o2CmJX6Ov/mYox8OtznKCIGcbmZIhJYwm+HYhC5+I
 mWtnEjDW912ETrDdeE4ZngPT6VZMYme7QoXBp2ZJvKKc1oy9QdewBxwLDxjdnyV6D5Va
 s/XsUPipQJDTNUSASiGZVWI2n3A/7Fft5LW7b3goS7XJ71ByDDGmsjlUYwmI9ROu9rpt
 MqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=hIsIAz4+wNt4cr+YDvMx0MhRhs12x89/dXIMoyYyOntJni/D/yk/HQf7/M8S8hSRde
 +X2KH9KACIBpPwFCLWq8tF5bi5CsOcjqhXwo5kxTRbpLoGhirZIdi/aYzKI9L7KF7TSe
 v75HsHmXjXe8SqIKoMGkCp/u0s4gNxtHiRjXlQfVhcBoCRLiivcD+eSrg8kc2l8QJ9hp
 66GQ/W/y34tq1t3ofCQvQ2iWPYTiBjxxHbG9c0nABz28mDW8iT3TOfO9DNE36h39laQl
 KmNZBURoTUEFU6d6EWHVska+JQed2/+LUZIg/8etSdcqoiyTlSCzdMQqeSP1N4ze2T75
 +0Ig==
X-Gm-Message-State: AOAM533pvtPAlVZT+aafwhxcyLYaRDKffuL+Nqu23RFagNgfyWXPiCYb
 h9chJu6B7b+sC/RMv1bCHdUMbA==
X-Google-Smtp-Source: ABdhPJyvobBozlydY7fRYp+1Du7jq5hU00dgajEyOpbT9dq7uqBfE2K+dbOWwnBjlj5HX0PGVJ0vnw==
X-Received: by 2002:a05:6a00:44:b029:19d:e250:1355 with SMTP id
 i4-20020a056a000044b029019de2501355mr2313984pfk.36.1610418045186; 
 Mon, 11 Jan 2021 18:20:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 07/16] target/riscv: rvb: sign-extend instructions
Date: Tue, 12 Jan 2021 10:19:48 +0800
Message-Id: <20210112022001.20521-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 02:21:02 -0000

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


