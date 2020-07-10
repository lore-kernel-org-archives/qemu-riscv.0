Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsco-0006cG-SC
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqd4-0005DA-Lw
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:42 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqd3-0006bI-2i
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:51:42 -0400
Received: by mail-pf1-x431.google.com with SMTP id i14so2369512pfu.13
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2eepYDRNDWrdw3gKaNt6ZPFFqa2QCWqaNWVSQxHa3vo=;
 b=i+IpiXveesHNLFgGx4yjIsYRegm5CfgCS8Vv5v1vLdMSD69ulwreh2HW7fAVQFJ0rB
 Bb8qJxSesl1h3l/L2Tmshry0RF6xRE7CKzQV1nQzc15+OXMFMfJACDlDMRP3Vtw8y9Z4
 3+evjoC3DzRB0RAg2sdE0w1T+3WqBqjwaktPFrKd2V30xlfYNaXiUxW9C2hvSgYgZa21
 KluXUsIiXBHmLWhnG/H4WcZukqUFTDb4fZ0QsCalTP3BPf+1WDWJV+8pOMkAfO8NkzbA
 eqYRPTrs4cbJRdyv0y6roU1+fm1u918FacJZeQ/0v64BLmoHJ4QHOz9/zgscJYDEc46q
 op3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2eepYDRNDWrdw3gKaNt6ZPFFqa2QCWqaNWVSQxHa3vo=;
 b=ufF8tEi7L8q4VQjBUG5JLUQ3f83wDelynvnkdFx4AnNFfq7KfI7Umx5rXOyd3GQFbd
 vmpzIcVmwFTutGOn6saLtMmbcg9CYe9HPN+vUs8R9rnQf+IqJyCWQFovTBRXIfRcRMFX
 JjcnfQwJaRqVLEdFovaZ/U5KtwSBvZT2DOAhNF/FgwP1Yicxy9Kh/nzQFK1PeLcRj6ix
 1mpxHJa5y9QHG+Fr/JZZuMjWU6tRIO7nG4XipFo/Km2RY9/z2IK40mrh/l99I8/Ro8Kt
 it+50OakFWZWmZrsSZrSVGk1Wy7HdeNYbUZRH2wjHDpGXn8bzmNCcWGuSgMIj+dfFaic
 eA6w==
X-Gm-Message-State: AOAM530u7n49EuZrDTgXvxbzQxSVZPUuBi34zEBza4DqKPcmxVh5FUp3
 hcfeBo8YFeVU3ugWAlIU/wJ8GLIF1FnG9A==
X-Google-Smtp-Source: ABdhPJy+AOxwaWG68THtDwJChz9szmwm1j8HtIhRor7P7c1MKOdG5Btu8q9Qb+cMOslJ513mB0iFMw==
X-Received: by 2002:aa7:9685:: with SMTP id f5mr10652142pfk.223.1594378299917; 
 Fri, 10 Jul 2020 03:51:39 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:51:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 16/65] target/riscv: rvv-0.9: fix address index overflow bug of
 indexed load/store insns
Date: Fri, 10 Jul 2020 18:48:30 +0800
Message-Id: <20200710104920.13550-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:58 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:51:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a2926427ce..3ec56bb6fc 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -456,10 +456,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.17.1


