Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jylZP-0000Ab-K9
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 20:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZO-00008t-HW
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jylZL-0008E9-HV
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2020 20:28:14 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 72so3499838ple.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2020 17:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cm9Q77zIpSR4g6kAlyZmv1zEyb9gfHMJv/3peZTbcgI=;
 b=fs3UQjerbWhKggKxkwh0PG47Q+Fo+tJzra9jkdtabTg2OFPBpGrQADt7fA46nhoSqx
 aV/n0YS3OuqUHcMZm+D1JkdiyHjEgdKdgrd9QCz2itbRNgw3/z2CmTIh3vLdDWi9aYVv
 ligjwtDHNj4WKVUZVYukzbzf2BSMCWHXMWaC8eqzY2wjAIe/dQGt0KaAFaL9aM0G8gAp
 4L//N3e+VIP7IobRBAlo5Oski1PZH5gwUQlPopvNUoopjUujs2fILFoaxlGqbXw9AFTv
 9wwlTzhHy3MDtu0WDZcMOLOD/9WvgafDgZ9NEK4aFfoYaqHtVCOF0iV8Qs8fYsLLz7QS
 01mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cm9Q77zIpSR4g6kAlyZmv1zEyb9gfHMJv/3peZTbcgI=;
 b=Os2/iuRxVYxEqFWt4CRoejti4Qqe5s88Q+PdphID1E5o0mDDh9wetOIpIU/qxRFfO3
 ASFibRrR6kE9NHx7FO++lN87qBdRma1njCVu9zz/bSFdWotFN0OtjeqPWbUlHSRgVl55
 X1JU7GMNhpg1aiJ1RdnxIeBzskQJhGaHuc4Px4Nco5gVQxZ/3AeL54JEdn4fuNxsLEhK
 2yVXQlGA6BEXLaaTMeeU4uYSiJQeUqChV1b82Gh1O+MApUVMws8vU82rTaPpMnRul/+G
 hMHG0sU97kTRUnPuWDLJrCgwTUuciB0Cg29zD1IG1cS1FyFxCZZoQ+XVOn8+Y3XVPfMe
 BhKQ==
X-Gm-Message-State: AOAM531G+pfIK5J/eoufYSYzOHj0rH1iUDvGJ6C1QS49YbX94fgMVq//
 Xh1DfdVkOVQbRymP7DBsITuUpg==
X-Google-Smtp-Source: ABdhPJw5dsGnvos3leEixg7g7AOPycuPE+YE5Y5HBQvO0EIMSsOtQB6T/LcPr6z/i9uppPKhzpqecQ==
X-Received: by 2002:a17:90a:c592:: with SMTP id
 l18mr2900897pjt.119.1595550489012; 
 Thu, 23 Jul 2020 17:28:09 -0700 (PDT)
Received: from localhost.localdomain (216-160-65-90.tukw.qwest.net.
 [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id q20sm4224635pfn.111.2020.07.23.17.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 17:28:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 zhiwei_liu@c-sky.com
Subject: [PATCH v2 0/7] target/riscv: NaN-boxing for multiple precison
Date: Thu, 23 Jul 2020 17:28:00 -0700
Message-Id: <20200724002807.441147-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jul 2020 00:28:14 -0000

This is my take on Liu Zhiwei's patch set:
https://patchew.org/QEMU/20200626205917.4545-1-zhiwei_liu@c-sky.com

This differs from Zhiwei's v1 in:

 * If a helper is involved, the helper does the boxing and unboxing.

 * Which leaves only LDW and FSGN*.S as the only instructions that
   are expanded inline which need to handle nanboxing.

 * All mention of RVD is dropped vs boxing.  This means that an
   RVF-only cpu will still generate and check nanboxes into the
   64-bit cpu_fpu slots.  There should be no way an RVF-only cpu
   can generate an unboxed cpu_fpu value.

   This choice is made to speed up the common case: RVF+RVD, so
   that we do not have to check whether RVD is enabled.

 * The translate.c primitives take TCGv values rather than fpu
   regno, which will make it possible to use them with RVV,
   since v0.9 does proper nanboxing.

 * I have adjusted the current naming to be float32 specific ("*_s"),
   to avoid confusion with the float16 data type supported by RVV.


r~


LIU Zhiwei (2):
  target/riscv: Clean up fmv.w.x
  target/riscv: check before allocating TCG temps

Richard Henderson (5):
  target/riscv: Generate nanboxed results from fp helpers
  target/riscv: Generalize gen_nanbox_fpr to gen_nanbox_s
  target/riscv: Generate nanboxed results from trans_rvf.inc.c
  target/riscv: Check nanboxed inputs to fp helpers
  target/riscv: Check nanboxed inputs in trans_rvf.inc.c

 target/riscv/internals.h                |  16 ++++
 target/riscv/fpu_helper.c               | 102 ++++++++++++++++--------
 target/riscv/insn_trans/trans_rvd.inc.c |   8 +-
 target/riscv/insn_trans/trans_rvf.inc.c |  99 ++++++++++++++---------
 target/riscv/translate.c                |  29 +++++++
 5 files changed, 178 insertions(+), 76 deletions(-)

-- 
2.25.1


