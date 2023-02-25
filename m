Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqeX-0005sM-Te
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeV-0005mG-Iu
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:35 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeT-0001bD-G6
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:35 -0500
Received: by mail-pj1-x102c.google.com with SMTP id x34so1473359pjj.0
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=v5g3p7c/rbmxrCzpT+mNS7RbBqum2/sHm+2Uk3YfqSQr53aY5MciGcdJ4R/z5KbrUg
 RLjSW+WUtRXfosIrkZzhryAED9nzreJ1qnWkH5aR4M0uwHWsABWbMSy1zmac5JIntYQ+
 cRsa2vhGdxekfeZ4JosYdWxAyTYHvUcIzHEeq2QWvHyc+zzSAjxWNpBPyNhq03J5bTJZ
 9Mr8Yj24NzDfzvUjBJVmF1xiU7qTuPyA5i6pMlYNhJk3YHqYcUOm372tuNkOj7XW7RG1
 vpg684U29+WwQENJmuaKOkgnWwtGrtyMgnXCbJRZfEPC24lN8nm5SxV9rH5cb2v9eOSr
 mfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xF3Zv42jI/oruaha4e4sWoXABmLVdJQBTLNajb+CF8=;
 b=3gv2aNzUD9Hmz5sJbPeZTmA9HX3KyFbAxERxwelLNnPQe+r14Dnk/fkLp4Qkvyt4kl
 4oqgxGFhRp+NEKnEWEITRoZYbaVigcVI+9FeGOD2iGkO3yxGRlNSudbShA4VJ1dX2lb/
 Bi3xKlZkiyHhFuZxuJR1qW8mIXLcg7B0SSDxbCnF1fMqub827IQ0AJ9nGraIhzNlwkla
 xrUlQ8Yech9dX6E3dGTnvVLETgN6aPk1bHyB9WbDv74FzxEtn0Z3DZn+p8Zswb/tdxmr
 TTYyLNq+/5TnBjdj5KoXK9RyOJ+OKNo96PnWXVb7eDOhAYf5ZrMTIY7UC0kSTArYSHqS
 ct+A==
X-Gm-Message-State: AO0yUKVVtM5lotk8tqtufTdycVckTI6LV8gazJv14CKm0+nllPHrhg0K
 RVGzZ65fVvd0K3WT9oGU0/pV8w==
X-Google-Smtp-Source: AK7set9aGm9qMjkVrDixsFh6rpv4BW2LJebAnAiTwltVFibx4NLsuLDSbeeyTTEFQhxJTw8RfWsSJQ==
X-Received: by 2002:a17:902:ce89:b0:19a:9434:af30 with SMTP id
 f9-20020a170902ce8900b0019a9434af30mr23465319plg.18.1677316532678; 
 Sat, 25 Feb 2023 01:15:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 23/76] target/cris: Drop addr from dec10_ind_move_m_pr
Date: Fri, 24 Feb 2023 23:13:34 -1000
Message-Id: <20230225091427.1817156-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:36 -0000

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


