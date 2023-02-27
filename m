Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWEQ-0000W2-Te
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDL-0003Xt-Jf
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:22 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDG-00032p-2F
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:17 -0500
Received: by mail-pf1-x436.google.com with SMTP id y10so2785331pfi.8
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=hx4WLylA/qHlDu5kQdj1q9ukeWDj6boWQxzuqLWxHTPD0v7tbmSLymQx3gbFnBaVC2
 dvtB+Ye1qIQp2J3dCH4MMJH9fwTl21r635hRtqHtrJyc50heVS/3yefF2ud4NUAHzpwP
 zwO/5P0212rBNhtelilOS8swj9WYl/yUVNAsQ6U0ai9dqL9ssKVzpzTbV2yjtqCoU00a
 DRK3z+r7XdE+3sN3lc9v3U3pyaaCBqOr76DX/eZtBM8oSTTFk07fhv9bv9FtePH8fe5e
 AaXOPM2X8aU3ohzS+odFo5yd52h6a08E2w/AOXru0H5PWxunfMkmeP800L1WkOolyFW9
 6cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=iEvQqgZNcX1TxiAHoo/gs4PPwOaKuFY/16UonoK7xIWT/IT/dwqteqME5DZl0h+QA/
 evHJoghNlXUgexpYRMeprY9yt7qVrWsra3Ajmjq26e8REyByyFYBFpPuPnS4P2z8yvHT
 Z9KYddSv3D3NqZVZzaC8V/+UbKZwBSdDIrY/VRp8OV9siaktpGWp/Tpzyh/aDdpKmY5E
 7QlAtPZnptEHF/olWidIzK/noCJKfUWmD55L3YjWhvx2mpKeSRKehXH3nVtomfL0gW6X
 N+RQKYm1nRw7D4eGuyu7J+1sd38ahIKme57kUahSzxKvZqkHUiRqrMT3IQq0VAaX9JSS
 vAhw==
X-Gm-Message-State: AO0yUKUKU6YK2jTDYRqA4WtDBCbU9cexLXHtQuBiXDVyZWs3/yqnaSQ2
 mktYs6WQrHf85FDaKqVg996VQF1HqfBeoPNtq+0=
X-Google-Smtp-Source: AK7set9rxs/5ZpTNOECH4vONmlxmnqBGjqNrEScaagfpTZSjMUyF3DvkFNaQwnXpkNHXdW9ATlAnFA==
X-Received: by 2002:a62:7bce:0:b0:5ce:ef1b:a86 with SMTP id
 w197-20020a627bce000000b005ceef1b0a86mr16749443pfc.2.1677476291613; 
 Sun, 26 Feb 2023 21:38:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 24/31] target/hppa: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:54 -1000
Message-Id: <20230227053701.368744-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:23 -0000

This wasn't actually used at all, just some unused
macro re-definitions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 0102cf451b..cee960949f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,7 +35,6 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_local_new
 #undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
@@ -59,7 +58,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
@@ -155,7 +153,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
-- 
2.34.1


