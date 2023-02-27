Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1t-0008Em-Tb
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1g-0007S5-UN
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:17 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1e-00079Z-8B
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:16 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so3837768pla.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=X+pP2vR6DKKUY7zIJxV0IG+zHr4jj06M02ffECX3vuC0mTcHEe2cgIixGrKHVjrrc1
 bGUaZYz0rdCz035oqhwlOD29cqcJQNFX6Lw0EA2dhduyWqFCL/7tDMytP4WO/cnrEbmR
 9i3ATwg1xAyuwDceVVAKXpoOW3zDTnweKJYaXOniWXMA6wJUIQVvW0IepPzgNHOgkopK
 xDriqG6segjZDhA3FYXTIOHH2mkb8iDkM5oDhxR2RzjNjeOU++xLsQRjxYQyTZYZFOW5
 eGdQw0vdpva2uwdg9uzdpO8jiQCUgkyyNpzEogfXlBO4+1ppwCRkfw0asTYcW9vPMzVT
 YL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=af4GWmVriMI2As+c4+H/LJnQ1RI+z1mOCHmv55ZHjbNPRr6+FrFyt3mcWQvhZTSIDQ
 1oz6jPuWggRRmTR4pz7b1f9nh2+O2TxA5Hakvzt40lnrSYTitEcwrb24H2PB8z+fjFQt
 6v2a0lnp6UifI73OYmXgG99E36+FxsgzNWDaKwRxjFcdti9HzEThVvx3jkSv7OUyE3iI
 Zg3WHrR9QQhM+ZQwy9WkIgoR6E3k9/IsioB5CQgoziugWFQO/H7CR5NiBGbAoihQJyyu
 LlDaBfF/ue6y2DLU0FKy5cFg1VX+S6t3mLn/5BnrtCQQ7neQK5GcdJb5r0eIEkeKoHpM
 Y2aQ==
X-Gm-Message-State: AO0yUKUsYtlGPBPuC+p6cqpzV1SAEPtIa003i0Hor8BumTKoiqzk/BIk
 tifNqta1LOtx/FSCST6TPLQ+Og==
X-Google-Smtp-Source: AK7set+/92daBnjQjxBJuU5+gl4PwZziYINYQJxL1fmK7kC0r9mPtVgt2AyuzCLpbTEK1JNE/WixCg==
X-Received: by 2002:a17:903:1205:b0:19a:b151:bf68 with SMTP id
 l5-20020a170903120500b0019ab151bf68mr27857055plh.38.1677475573454; 
 Sun, 26 Feb 2023 21:26:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
Date: Sun, 26 Feb 2023 19:24:12 -1000
Message-Id: <20230227052505.352889-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:18 -0000

This variable is not used, only allocated and freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate_v10.c.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 5e9d1c0fe8..4f03548365 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -800,12 +800,11 @@ static unsigned int dec10_ind_move_r_m(DisasContext *dc, unsigned int size)
 static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
 {
     unsigned int insn_len = 2, rd = dc->dst;
-    TCGv t, addr;
+    TCGv t;
 
     LOG_DIS("move.%d $p%d, [$r%d]\n", dc->size, dc->dst, dc->src);
     cris_lock_irq(dc);
 
-    addr = tcg_temp_new();
     t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, 4, t);
     if (rd == 15) {
@@ -816,7 +815,6 @@ static unsigned int dec10_ind_move_m_pr(CPUCRISState *env, DisasContext *dc)
         tcg_gen_mov_tl(cpu_PR[rd], t);
         dc->cpustate_changed = 1;
     }
-    tcg_temp_free(addr);
     tcg_temp_free(t);
     return insn_len;
 }
-- 
2.34.1


