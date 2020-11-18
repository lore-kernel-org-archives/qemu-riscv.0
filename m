Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItR-0001dE-TT
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItP-0001Y5-V8
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:43 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItO-0004od-3b
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:43 -0500
Received: by mail-pg1-x535.google.com with SMTP id q28so709788pgk.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b19CZAEI8TLcaimkbnhMiT5NLY0b6d5KIKU1WBHcNlk=;
 b=V+8Iyr0Z7WjMjX6RH+2jq7e0JlOvaBJxZ72xG1eUQoJV794ukfTqiqE5XulkIsR3Tf
 v3R7TRSDPWFx8gUKoVV0WBHLtXKT6tmh/tw1GEGBMbPTkYY8/6L+XwUywSsSyskKqSWI
 3ngJtpgk0JAQNJG06FQWKKiphEX1y0YjHGUwn10uihE4bJRawtl2EK4dDIBuZFbCX99h
 NrXsMXXlKGofFpVgYRFvSk5lO/3776yRycqG4Le8hQUfiuHXagLetJpXD9pZ76sR2N07
 ZZawXwYGUBwe7KvmwIBvWIv6eLNKqdRSoFj7zERPUt1xnkPWFhf9ay93vP/3/KrWn+cE
 p0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b19CZAEI8TLcaimkbnhMiT5NLY0b6d5KIKU1WBHcNlk=;
 b=axf0StHaFgMH+zuQDO1KUYdHc7pkh0jNqR+5WZRdXjm4EbbnZm8q9PnBbC/xFA8b3d
 EMVGUa2baKIUUBT0I/JNR/33kCEB0fVbUUax7ROuW8r16IlibByFWdig/XYxkFxfzjhI
 gg+ORCQO4Ds/FS+5soNygr0l6YpWFJ53hytxFW7raFr+OoacgO0oIpR9JZNUoMQejS8z
 WbRbczjzV5hHyjZhgmEdCAkvT01CMgOzxDaG3K+agxC6dBSVuKNatJfYjNf3Cx7T+eUV
 sxC93ew8Q5zJGVjhMJ8JC47z/0YfQbpzUQJQay6BMwezgm/RdmeyekeHwhTOPrxR/K3m
 IN4g==
X-Gm-Message-State: AOAM531wHXb9lY6DMaV28b1fc+8kjYKx+CgaVl3YwT5aC64Ie1vcViPE
 XRuKHMfl/kXFXh2dZGG9tFAS0g==
X-Google-Smtp-Source: ABdhPJymXct9URcNJVjLUXOyDLEb9+0rvdVQeE9kz7CZ5ARRVfqfSIWxbYIRgAj87nwdG1UvKUU+HQ==
X-Received: by 2002:a63:de57:: with SMTP id y23mr7297831pgi.62.1605688360833; 
 Wed, 18 Nov 2020 00:32:40 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Frank Chang <frank.chang@sifive.com>
Subject: [RFC 07/15] target/riscv: rvb: sign-extend instructions
Date: Wed, 18 Nov 2020 16:29:45 +0800
Message-Id: <20201118083044.13992-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:44 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 372476f1d2c..626641333c6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000000000 ..... 001 ..... 0010011 @r2
 ctz        011000000001 ..... 001 ..... 0010011 @r2
 pcnt       011000000010 ..... 001 ..... 0010011 @r2
+sext_b     011000000100 ..... 001 ..... 0010011 @r2
+sext_h     011000000101 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b9a0e39a3e5..bf15611f85a 100644
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


