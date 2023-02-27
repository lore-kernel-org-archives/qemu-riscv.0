Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCI-0001Vl-3W
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCF-0001Oe-EG
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:11 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCD-0002Qh-RM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:11 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i5so3857227pla.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=GbCQgYK4QIDZXquSfLjwaM8VLvXl3NZfdSR+K7f4x6xbPqUXXCA7G0bJ/NSehLc62F
 Dy5dzfvd7MGIk11q4Zuo2ARMpBsf5HOCeOKtL7EiqrvpHOHfpZ6n8m/eoSwQrDAZfzH8
 z7dfJ7ANSSe17QNY6USFGaRnwqmUfNfvsgJXZFbEnW7oAeKL+pO6eXmppdbmPMcvaoWd
 Cz4Li5wfB1zJX2lWXlBWeE0b6JgXpkmfaW+XPsmts/oNfe0cwg9UOqa2xI5pCYF6Lm5j
 ej8L+aEYGRfwoAC/Bqt5rbu/+bT+SNFs51Vu1wBFFYpk0u01qzrr4EB4ibkCNENBN1Rj
 bNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=nOrFpm6OB2GjPBDIreI5ReBBHT6pAkxCljlZjWEw2LyIdJphm3yWhuDwOfbMtl6igL
 duaOZwchs51NqmNjMR3I2zqJpDAC1SaRCCRuOU1sn8dawlwGwbp1fBW8Fu4uZrBI0sTK
 ud9QPlEYIgfGReLzZ/SOqXPOstd9aijBzkD+cKPDfJ50yCI0necpmY16q8tVymwmvb2i
 Xvnj95muOfnAuO6W6BaaP69/nNnIDN/qrcXcq5kDRkaYq3nJm1YhVQtVbwM89JWXYhK8
 /FTg40B8BrR0a0OVQ7Fy12DN+ER195Mu3aSRCKxoAujcwp3pdHvwB8khKKjZqg2H4BCf
 k5Nw==
X-Gm-Message-State: AO0yUKUPzgEbmwsmvFyfLMsoxyQqhh/EpDntXt4e5K2y8p9pgCqSTx4z
 mcYlZ4rVFe8z4VaT+F9d9EiXHA==
X-Google-Smtp-Source: AK7set+X6twf+6dc+BmF+qyH9KhM7twYjroLflo/66HPIlYF8hVCb75WwFCJOiKmB0ZbSPkeELL6Kg==
X-Received: by 2002:a05:6a21:869d:b0:cb:fe3e:e20 with SMTP id
 ox29-20020a056a21869d00b000cbfe3e0e20mr12752517pzb.42.1677476228549; 
 Sun, 26 Feb 2023 21:37:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 01/31] tcg: Adjust TCGContext.temps_in_use check
Date: Sun, 26 Feb 2023 19:36:31 -1000
Message-Id: <20230227053701.368744-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:11 -0000

Change the temps_in_use check to use assert not fprintf.
Move the assert for double-free before the check for count,
since that is the more immediate problem.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..06209e6160 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1375,16 +1375,14 @@ void tcg_temp_free_internal(TCGTemp *ts)
         g_assert_not_reached();
     }
 
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use--;
-    if (s->temps_in_use < 0) {
-        fprintf(stderr, "More temporaries freed than allocated!\n");
-    }
-#endif
-
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
+#if defined(CONFIG_DEBUG_TCG)
+    assert(s->temps_in_use > 0);
+    s->temps_in_use--;
+#endif
+
     idx = temp_idx(ts);
     k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
-- 
2.34.1


