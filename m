Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWCO-0001sQ-VV
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCM-0001hB-Kx
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:18 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCJ-0002Sw-SW
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:18 -0500
Received: by mail-pg1-x52d.google.com with SMTP id p6so2877481pga.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
 b=fDTS2qEINKy3aUYhbGyyb3cTTRA+LaP8OUjR077xcgm70NnBJE0ZlG2JFoFOJqSfAA
 YyzCCpbE3OqEZRYaRY+PR1OoT154nRv6eCQRHszDgt3Bmi/9IeLNduJu9GHmQshoqKmx
 4UyiH/cE6bBgKvBJnmEzLJI//On2QxWK33UmzXj6Z4fh4gE2gdri2i0pz9y6iGjC4l7U
 F6Ri+c3qNFTro83TaxjwL7eoANxFdbYeXnNyBWVqSUt0IXEau63rYI/dEDafSOCDS6wR
 N0tq9zJbGQmPMlyasqtgXCzP5NrsPqohRxZhpS1jkKg18CSoLUK7wNR7hqg+mgbtT3ue
 FNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/lxx08bzggLpozZyWgUkQK1Gl9+CtNC5ZWpyB9XF2A=;
 b=tvhwVc2BQm+uMqvAp494O434QdUWzEafjREwMRfoRySdCm/1CEwpk7apdUXzuTiUG0
 J6SQz91PlxLHfG9kNgnZ5+m3iEUtvbexvpJ64PeOBqQDKO7aaNEwuo/vuitM0KzZOR3o
 Xa0DWDdFoKhctrW47VeajuXSK2S0bGreZ0wI46IEjEdFrChfBMwm76HNA0zpm8iW6S40
 lKUGsAdzMS6Fd9++Abr/BbF6wpVPSXqVe8u5cnlokR/5PvbAC9L7OueyNXoEThUtqU5p
 TDM1sgESCjxwcxcjfa7Q26c3CAi5F8kyJx53DaPq0cIrxKvtWtMzO6gdFVrbeAWVyIGd
 Yy6g==
X-Gm-Message-State: AO0yUKW5FsuQioOhZNs9sgVhgXZ8Dn88lW9kYpl9jAF0ErOANZrpMVSK
 VQv8wMQuwvBhhXLPf5Q5yJ/aJg==
X-Google-Smtp-Source: AK7set897NRT/ggZaYPUWz2zorRJaS96l6SLv3OTJNeMT9kzTyutccj7UkPd/z1PD5OihrWAw8r72A==
X-Received: by 2002:a62:62c6:0:b0:5a8:47e5:bbb2 with SMTP id
 w189-20020a6262c6000000b005a847e5bbb2mr20581675pfb.0.1677476234281; 
 Sun, 26 Feb 2023 21:37:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 03/31] accel/tcg: Use more accurate max_insns for
 tb_overflow
Date: Sun, 26 Feb 2023 19:36:33 -1000
Message-Id: <20230227053701.368744-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:37:19 -0000

Write back the number of insns that we attempt to translate,
so that if we longjmp out we have a more accurate limit for
the next attempt.  This results in fewer restarts when some
limit is consumed by few instructions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fac1e8c465..62e8f28025 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -78,7 +78,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
-        db->num_insns++;
+        *max_insns = ++db->num_insns;
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-- 
2.34.1


