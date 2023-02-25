Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqeJ-0005Q3-7U
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeH-0005Jn-HT
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:21 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeE-0001hI-Fk
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y2so1414935pjg.3
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=H7Wf4CpTki4dMZf7CWGUMBD9Cu4Pk01In6wHW0aU19eN0lD0Sbv/bSCEfH91+tznDC
 vtm+EPLxIzJuaf9diEwkk6geP/xf+QOFemU+OhUCkGEd6cvdZCXHNHjU0LAzBHu/jGsw
 IncGyWtvfQ7YlH3cbMN9+xEf04Fqb5RVbnlD6oATuZvhxMTKKnxMqkrLkpI+JqGfWRul
 8aETUUv7bIbiIu/Ye1eSPKBbgh6uDmlJu4GizMQ9PdqdKlxsHCWPJePwVMWD3gIzWvJt
 HaZjQsyLLSP/iIDXjSPJ25E4IxIXjT5e2h6gO+jWqVwSpcvD+uhuewBk4qD39y2eWJ9J
 JJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=SuNGcANLD5z4w7Mzgl7ejAVnXZM3RKblnx5xptPhyOZU0N1fvXiNQbzKBy1cBj7pQS
 x38a2bOI62h9Uk7mOYpo4Fwa3eIGfBTVRcXhW0mxVkduL4qiIHrTBrTJWkePX3/aVHac
 4YPChvNlIWlPGYsbCsd2eIS6DgWqKbJt42C/ZSqcTHv9qm9/q2FR4EElDpMgWU3wa+A8
 FKH5mALTTsQ/jwUBlymt8cLpmka3SvfQEKyyDLAfGBfakT0PyEdOg4pHAo7WisfolQ/p
 BJqN9LMxEHUgJIKom7MRHLjQ5neDlz8j731Q+It0C2DRbOlcWvQ8Qd3+YICOfZ+Vvxho
 MxRg==
X-Gm-Message-State: AO0yUKVchWK+Vl/pfsyaH1JGwyTOG5KB7lervhDjo5kEvXOwHpRRPTrB
 CbIkCQ+lLSKNhbTEvNNKr+IPcw==
X-Google-Smtp-Source: AK7set/q2b5ehT2hakpfNtQXYe6q2jwrrTfbeRmdfDXspBO0VyrLvjTvQBIe2+GepAiplifwQsBqBg==
X-Received: by 2002:a17:902:e745:b0:19a:839d:b682 with SMTP id
 p5-20020a170902e74500b0019a839db682mr20758866plf.17.1677316517119; 
 Sat, 25 Feb 2023 01:15:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 17/76] target/arm: Drop tcg_temp_free from translator.h
Date: Fri, 24 Feb 2023 23:13:28 -1000
Message-Id: <20230225091427.1817156-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:21 -0000

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d7fdbc1e3e..3dbff87349 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -331,7 +331,6 @@ static inline void set_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* Clear bits within PSTATE.  */
@@ -344,7 +343,6 @@ static inline void clear_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* If the singlestep state is Active-not-pending, advance to Active-pending. */
-- 
2.34.1


