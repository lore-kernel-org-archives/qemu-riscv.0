Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCT-0005aQ-I5
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCS-0005XW-7x
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:52 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCQ-000802-J7
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:51 -0500
Received: by mail-pg1-x52f.google.com with SMTP id q7so1084115pgm.5
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=cVW9HbTK+vMMRythuyJKBt04W7Am8EAe0EyogrK2JfYqzX1ghNRkqJCyKgj3zjfDGv
 KyrmeE+5VP++8Iwm/PYFvq8hhIn/NqMYA4ASC0OwfGUSRfta7uOhUb8qiKH/VG3B2IDN
 nY1VCH4/IlRu3d7aEWnVgAYANsIRfx0lNkpHad05JLKwIkfxI6mrHREIItzhFmcqYBO0
 NYY7waBh/fO0pb5y4H8yAXJCpjXgor6Gt8Q/ru3LJO5crpFIvuqetWX0vmqyNhCwZogU
 GrItuLC3CtAYTPvYMH53FJLBxJ+h/somn8qLpeH0lwohPClYN5pWq/UvQMZdO724vSED
 sUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=Joj4kHRIUJeJZWthE+wCEH/2FRAue/s2lCc39ARsj2UU5idi5YTEmGbwIuVWg2mBbo
 KWI5+ZneW3N60Eza/w9dgv2J72Z4DJpDJ5HwC7ohJMao/b5CFIGdyzuBhE1Y5Ri4hoKs
 zK+Pia9igme0EBC78DYidiFu8Ab/dGec/57df8PoB75fzbZSlWDBhjpJS3IorrLkD8I3
 urwI45E7uAur1g4N5MoJxol2xJZZWyu+UzOt/jtnljFKSmFd8h6ords51mhLzvCgiGFd
 Fi5cDL0eSPsfzMRNWBO3fm4H/X1NWVYoTqkRdcnhTA29iuWQ4MZjUaTrtFAA1UeuSXRH
 KmAw==
X-Gm-Message-State: AOAM530h7ZYQbC/k3YVbdqfw68hPEahdifOOmsQe+A0tjj1YDDYiHceh
 09prS8SBWv5ZnwHsZ1TlU6aJGw==
X-Google-Smtp-Source: ABdhPJzRRNa9eDKv74VKe2wyjEQl+BYEP7/VAzfWoTJgrPEhfhkwol43CGEH9TgQaWlioLFF3v2QKQ==
X-Received: by 2002:a62:e314:0:b029:19e:4cc:dc6f with SMTP id
 g20-20020a62e3140000b029019e04ccdc6fmr3774684pfh.33.1610444569415; 
 Tue, 12 Jan 2021 01:42:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 41/72] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Tue, 12 Jan 2021 17:39:15 +0800
Message-Id: <20210112093950.17530-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:52 -0000

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 308c9fa44be..91936ec464a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1915,9 +1915,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.17.1


