Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWMl-0001TQ-RR
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMX-000890-Tk
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:50 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMP-00074j-Lh
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:47 -0500
Received: by mail-pl1-x634.google.com with SMTP id v11so2040050plz.8
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
 b=wqCQ2XqRqzMwN4CQ1dMPlJbwaxJMem8BYVNyRiptWNHYpZxnGZeVHhk43Xi4vzKBrI
 CUpIExMkypOscQNrlsDv090uQq0bnoJjvnBXcJ1KF43910HLsXYnN+vvdaRHOxlK58Vc
 rlRyFHxYDH7UXsLf0t3TqLyfX1HnowEAljpUYrqY5NRJudz3SrBK5YAzo6L8ZraZFzTd
 YioOkzvnQotfLB7lh4GOfujgB9BanYK5Dgve/G7GIJU+PpEmsrIRU3IsoNzZ4sw1j7Tl
 Nx1kQDJiaSCKUDlbQ2xossFWsnn8RnXdY7qFOMUO1qWedArYZes1DZjV6IcqJT6XIFJy
 U0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPI3gM35f9kqtK6SwX2bfmUKEAAhOjVzMIqtanR4H+c=;
 b=n+iZrS34jrIQLFg+Hwv7QMZZtnsdY4UEvNe6iqKU94BhH61QKT5k1zMCE5lMoNd6J5
 GSRFUwQZk/x7c52ardBe6Ve28F+npDuZPLAZpaKNFnlkl6w0rTKdc+WlXAp8K1KTUFoo
 szxzJzZOtw3KQ39BjalNpFZ+cpJ/b2QsHKhwQ6fhvwV2IAvcD4eXUFeL67J5FVKb4VXM
 77BmsZ8nJrw9J9NngVaQgOBaRkdmoNoXC9G+eSM8RcKbrzX4clllO3UbHz4ejHzcfXIj
 1f50UaoibIADHchZH4oBoLt2IbukGsPQJuZpRDQPP/n2A9Bj7Clptg/V3O8BW4e1bIys
 SSSw==
X-Gm-Message-State: AO0yUKX3G+WgPtmbC7Q0tgikmWog4O/ZUwbUH4tyaEPNF0yYtFcaOa9u
 w2DJ5prxrv44GCqNtmao5s/LEQ==
X-Google-Smtp-Source: AK7set+cHZgZ9smcIv6j8Un9B93wLmCFNoFSWI6wVkFonR3TZr73cTl22mtuaWd/H5zgiuis1RoBIA==
X-Received: by 2002:a17:903:2903:b0:19d:2542:96b7 with SMTP id
 lh3-20020a170903290300b0019d254296b7mr339748plb.39.1677476858650; 
 Sun, 26 Feb 2023 21:47:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 43/70] target/ppc: Fix gen_tlbsx_booke206
Date: Sun, 26 Feb 2023 19:42:06 -1000
Message-Id: <20230227054233.390271-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:47:50 -0000

Fix incorrect read from rD.
Avoid adding 0 when rA == 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f74f3b8f0d..52b812a01f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5867,12 +5867,10 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
     CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
-        tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
+        tcg_gen_add_tl(t0, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
     } else {
-        t0 = tcg_const_tl(0);
+        t0 = cpu_gpr[rB(ctx->opcode)];
     }
-
-    tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
     gen_helper_booke206_tlbsx(cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
-- 
2.34.1


