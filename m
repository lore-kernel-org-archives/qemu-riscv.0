Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWHm-0001hO-6k
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHk-0001b7-Ds
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:52 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHi-0004lQ-RW
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:42:52 -0500
Received: by mail-pf1-x42d.google.com with SMTP id cp12so2045151pfb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pAAJQpTXusO2gtYYECFwL93OVrfV+/mCd8k9ZuweJc=;
 b=l72pf3K+0P8HFUOJ3ikYaBCT7Py0e11WlKG6xrkJG3v1JAzC3zgQzGJ1uFLmLbzS1t
 VMZ+OnN0z4/Kt/qAvaIzPAwO6KA171Vh92VeXvE3SnxkuJ1hs5SJE27Bd45iVvmkBd8A
 MpNYeT6vcBrKVnRFVcFAsRlPvwPsTGXo2FIsaFADpUT0qNCMQ5IL35VZS0hVw34A7Tv3
 PonTlT9Y+z/yNlsMvKtddu38aeD0BV1A2xPYUPJtvxus2nxkkL3MZr24k6tjeLQKnDN5
 H3CCJgas6M0gtNl3Ephmirh0w93IcxcxIoQ0VMn8I2KbngVQakjVdtZiiIEOCMrJHiav
 3M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pAAJQpTXusO2gtYYECFwL93OVrfV+/mCd8k9ZuweJc=;
 b=x0yINFse+6wAJ4A4yXAVOoBp7Qo4V28HNiCF9H7pInYWyQyxX80ykpflVO2TJRfhmn
 MxNwyrQhnIfpQmxfJ0hKxRLhBEC6i0VteuKapm+u3q/Dy5ATuLMuEa8sT7TS+9SY0PTV
 rY++unzQyX4WB6UX7CTzS+k7EFUWoe6dOKS57bqE6qlAbwQGFPdiVe6EZu3JdJtd5GLY
 Q/wMiYzlaompqFLPT1EF2XLlFXeyeXiyK3KeZAimszteB/c4/v+6wjczUUD3ZbNSOyVE
 PQHz41/ufI5cA7fU3OUcDEUdWGHqaeOnYMxJv25ubzIx5gO1iErDxI9QgZwyZaET5omz
 ar9g==
X-Gm-Message-State: AO0yUKUG0Z3M549wBBHuyXvGP8rt264Ly9IA+nVMw2leXrh+QyjVtugN
 e2F4qfylcBkKotkKYbvKOWWgJg==
X-Google-Smtp-Source: AK7set9NsrvusZTGyF2nrgm7EB8vsmGpLvbDoEQzoSRNZQngMryKF58Go4lNJ632/G3gDjJtgU18zA==
X-Received: by 2002:a62:19cc:0:b0:5e2:434d:116b with SMTP id
 195-20020a6219cc000000b005e2434d116bmr9630626pfz.23.1677476569461; 
 Sun, 26 Feb 2023 21:42:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 02/70] target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
Date: Sun, 26 Feb 2023 19:41:25 -1000
Message-Id: <20230227054233.390271-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:42:52 -0000

While this enumerator has been present since the first commit,
it isn't ever used.  The first actual use of round-to-odd came
with SVE, which currently uses float_round_to_odd instead of
the arm-specific enumerator.

Amusingly, the comment about unhandled TIEAWAY has been
out of date since the initial commit of translate-a64.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 24e3d820a5..90cc324f71 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1111,10 +1111,8 @@ int arm_rmode_to_sf(int rmode)
         rmode = float_round_ties_away;
         break;
     case FPROUNDING_ODD:
-        /* FIXME: add support for TIEAWAY and ODD */
-        qemu_log_mask(LOG_UNIMP, "arm: unimplemented rounding mode: %d\n",
-                      rmode);
-        /* fall through for now */
+        rmode = float_round_to_odd;
+        break;
     case FPROUNDING_TIEEVEN:
     default:
         rmode = float_round_nearest_even;
-- 
2.34.1


