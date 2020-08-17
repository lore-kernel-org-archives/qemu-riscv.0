Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asV-0001zh-Ko
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asT-0001xq-LL
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asS-0005EV-2w
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:25 -0400
Received: by mail-pl1-x629.google.com with SMTP id t10so7157384plz.10
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hydI740Zf/8EsRb0a02832++22NPxTc0ZDr0nHkfk50=;
 b=chlyxwySJ+/EfDUWqIRKC5BjUX3+hmAvOPFORhOgjzuOpJ/LibCqoYivD19ok0xxVV
 On+wsuSAiyx8VbNjIN7WMPWQI3AWQZbZZpXWW/gdJm4Z9QFwO+uymp9gQmWQSVmINJgO
 LDc54TMzzLmohkBUy8hSSKCx4Kw03UR/ZVJFw30VwmGmLtvSE3wBsUuCO1uRM9y2PRuf
 Z4rstQ8t8xihXSeGp+/9HRk+lYhTqCshXiKB3lKfBLjOcO8bb2gKzhsoHv8Vm5u+O7PI
 5+f5yrRkEyler5O58KqFMkAfTvSO8gGC+RWCbtoU7waqqD+3gKNo0b4fn4RRiL/QKeaE
 yaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hydI740Zf/8EsRb0a02832++22NPxTc0ZDr0nHkfk50=;
 b=SZusZbJ9MdM6TCdSykjX2F+qvhAb6fV7Zp0J/FetiS3nSiwo/sLMN1QIFgttlYhS1s
 sP7z+tds9ORiE4YtsDz4/55UcRKxpy+jox5deuQLCqURlgS9wRk4Yo+R+Wvl1D5ClChU
 Z5TKb/2WuvFaciwcGUo2NmZQvy4oqoFwgJkXy/l0nZeqqx6iIePkhLQ3u1/NoEFRhIUL
 cxGfyg2x6XuZbKSio5nodQeUWqf5pzus8fYLUsHk9XMGrYI4RoF51imzkI/ug35OcfTW
 +3IKot1wLh/FvPHeJVdlltNR9JFMwh2oQLOhubiM90022lDQAQgNqMsk577kXRDqjlRa
 IFfw==
X-Gm-Message-State: AOAM530yc82GahZ9iT8+dbiNp2GBFwLKRA0e5z67ySpXHpG3DmaPOHJa
 wehCIpaTNF+K8D8yGnBRhpYEPBDcY+nqsA==
X-Google-Smtp-Source: ABdhPJzPRMnwLYQkPK2vSnLv/8YjdgagyRbaa5PkUzQfyqto55egMpDpr0XR4MMyr9iSH2AvFcx73Q==
X-Received: by 2002:a17:902:d30b:: with SMTP id
 b11mr10465868plc.107.1597654342246; 
 Mon, 17 Aug 2020 01:52:22 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 49/70] target/riscv: use softfloat lib float16 comparison
 functions
Date: Mon, 17 Aug 2020 16:49:34 +0800
Message-Id: <20200817084955.28793-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:26 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f80c13b0857..e6441f18465 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3980,12 +3980,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     }                                                         \
 }
 
-static bool float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_w, uint32_t, H4, float32_eq_quiet)
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_d, uint64_t, H8, float64_eq_quiet)
@@ -4041,12 +4035,6 @@ GEN_VEXT_CMP_VF(vmfne_vf_h, uint16_t, H2, vmfne16)
 GEN_VEXT_CMP_VF(vmfne_vf_w, uint32_t, H4, vmfne32)
 GEN_VEXT_CMP_VF(vmfne_vf_d, uint64_t, H8, vmfne64)
 
-static bool float16_lt(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VV_ENV(vmflt_vv_d, uint64_t, H8, float64_lt)
@@ -4054,13 +4042,6 @@ GEN_VEXT_CMP_VF(vmflt_vf_h, uint16_t, H2, float16_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_w, uint32_t, H4, float32_lt)
 GEN_VEXT_CMP_VF(vmflt_vf_d, uint64_t, H8, float64_lt)
 
-static bool float16_le(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare(a, b, s);
-    return compare == float_relation_less ||
-           compare == float_relation_equal;
-}
-
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_h, uint16_t, H2, float16_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_w, uint32_t, H4, float32_le)
 GEN_VEXT_CMP_VV_ENV(vmfle_vv_d, uint64_t, H8, float64_le)
-- 
2.17.1


