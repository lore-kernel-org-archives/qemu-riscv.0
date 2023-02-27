Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW8E-0004jG-5z
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6w-00009I-7z
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6r-0000jz-3J
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:40 -0500
Received: by mail-pl1-x634.google.com with SMTP id p20so4320103plw.13
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
 b=eyRpL5pLnUx2CSsFS+1XTRS1ln1JMc4Wno++twKo123HrbFr83X4bGnb298DuobnbR
 j3CuN4u1dDkJ9IpDio7mwkoGIF9rq+5lYm+1CP5kK8VmnAbpwperLc2kzxO17rV8wlKr
 7B/mLFMPhtWFpxtsMrpG9nmpIGUjy2J4WfpBFdTceBZb9LraiG+kb8ryUTQn82T279yy
 0u0z/gAfDvVuwA71ZJMn+jBJpm0aEAVqX7kdQYaGLjMmPf5lMV/y0ZT/a6j0p+aoeVeN
 pLBvcI3W48fs64ufpE1SJv/uG8XbHXXNbezN20emfBhK9oGdSUpnmtfjCqS8X9PwtrjB
 yTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
 b=dzq8u9QhOE6KIw2rBbUuA/eFMushS4kXfEv/70MbdDsdryq5a9kcS7d3u/aGQgZDni
 firDTdb+xR13KNYvYdooqjdI0+pljmq7nfbcmFmBv322jfTu+I8/jYEaJJ/eDp2mjAqs
 0RX0DkGaQ/EeqWhkL3lMMKkkG9maKnPTUrPuu9cWdYD8Kcm4DttW6KQ8pxFYia9JcdKR
 E9kDjSPpD2xBNtszkeO9NJ81+0JsxEBymxHTkCTZbuAWn1cRA/mIFU+VOUXGsAprT+5t
 VIAYf6DnSjIpSBqzZz4icfzx0i5SX4H+/emdjwN0ZFt8R87SA5MMba5SH8m/8SVsWMXY
 WINQ==
X-Gm-Message-State: AO0yUKXU+7tLGO8eF6XvcF9FEv58vvk5flaDDGXpWhVpzwHNPS5Fs3c3
 PI8oQJqHKUc0dzIUXx3XMtmg0w==
X-Google-Smtp-Source: AK7set/a8R81gE8fHnFaat+IgA9u8AlqWM0lRk3Q1bHr35eMct4nQ26Y4dS89Z9IqxJg8+VHY9QbjA==
X-Received: by 2002:a17:90a:1e:b0:236:70e6:ef08 with SMTP id
 30-20020a17090a001e00b0023670e6ef08mr23185655pja.49.1677475896237; 
 Sun, 26 Feb 2023 21:31:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 73/76] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
Date: Sun, 26 Feb 2023 19:25:02 -1000
Message-Id: <20230227052505.352889-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:46 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 733a2fb228..bbeb85832e 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -62,8 +62,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
                        offsetof(ArchCPU, parent_obj.can_do_io) -
                        offsetof(ArchCPU, env));
     }
-
-    tcg_temp_free_i32(count);
 }
 
 static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
-- 
2.34.1


