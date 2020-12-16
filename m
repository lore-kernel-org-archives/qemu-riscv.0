Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpM9Y-0006s7-4O
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9W-0006pr-IM
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:54 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9T-0000wx-M1
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:02:54 -0500
Received: by mail-pf1-x42b.google.com with SMTP id c12so15606647pfo.10
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m9+UgyEv7/CO9wcFF/2mGY7NcDjbZFpPGSL5WyqYbRw=;
 b=jsfAMlRog6lr6cdtoc9VTj6pNRdzO4yqrLP5tqp+NF246t74gF8RvEeCtItq/IbVkD
 HUvpdmhBKRrRMz9LXReWPKsnIX76OmS0//ah+cJ+c54FhRWMnYqOcBtiaLdXhgOLM3wG
 AWDjE2wgfDuiWcDQ6AYp9+quGjTDBT6Gv3mBtqIDcp7tn1LDROjkWd+29y3ePh1h+xs9
 OYgcz3TAxQPqOmSjAhSEwmkdlfCOHB3F76AAJ8M+Rr9527yLqJMYY4rvA5Uaw7ZJpkoK
 /iFpSUsZDpmpr0KLIC+pXpWEeN1ItmOSur/r8f6Ur6SoTqhJq2aAI3oMIlE8jBQ2Ach1
 Bg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m9+UgyEv7/CO9wcFF/2mGY7NcDjbZFpPGSL5WyqYbRw=;
 b=FjziVnaKqHQY0+rKdyyHUavftXjY0LFcATDbnSWekrmIwb+xMyZtjvOOhTE3yU+aG5
 9JbXhPxx/v5olVWTf/1I38TVhBbrJv2AVAH9U+cZQRQphTurFqlB3dXpC0Jj+DziJXQS
 mIV7Kk0j30J42PUN8IVwis2M6T/z2fNO42EezmxQEhvJuPbRzUEPeYmUdbTTkCO9Yuo2
 kjrZmeBque0s7Ntjk+EImalDQ/ulqC7v2HsrEsCCvN3213W+bUQ7T8+0LsPQolMqLNOv
 /8ANtSLyrM5Wl7eAL1aqRUYuj+wyPLsFTN3vydgFjNgPZUDrnUUPbpNFsZrbyWqlEokP
 pbTw==
X-Gm-Message-State: AOAM5328/rem+4eWft0OXEFm0spTJYQ8x8LQy6u8uWMbRqTpn3VPOTHI
 Xg8DhtB39P5re0HHIdRzSj6kTg==
X-Google-Smtp-Source: ABdhPJwzeBY1gBzUwhdqUUFhWehU/YRnYD79VWMt1PES/Cywi7zIbVmqItA88iu2AbVoQdD9oiEFMg==
X-Received: by 2002:a63:2406:: with SMTP id k6mr31526592pgk.453.1608084170397; 
 Tue, 15 Dec 2020 18:02:50 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 07/15] target/riscv: rvb: sign-extend instructions
Date: Wed, 16 Dec 2020 10:01:32 +0800
Message-Id: <20201216020150.3157-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:02:54 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0d6a8a1c0a5..4baafed21f1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 pcnt       011000 000010 ..... 001 ..... 0010011 @r2
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index bd66c2ad84d..5ea0f0ff81c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,19 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, &tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
+}
+
+{
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


