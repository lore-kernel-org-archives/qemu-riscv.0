Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscf-0006A9-FL
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcD-0004uf-0i
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:49 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqcB-0006Rh-Ed
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:50:48 -0400
Received: by mail-pl1-x643.google.com with SMTP id o1so2108933plk.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4bn+oUGGFPh+TBNTW+1Y2E2/tR5+d9f5YZSgdQZEwD0=;
 b=lrVZGaY+4FcvyQAQ9GygGzkp2ku8QP3JRRKoNwf6xrJtYAVqrMN3BJBRO3stiej/tq
 gu03Ktef4NXjl1N4bD9w523Nd5KfdKJheYAMDppWWzL4ir+nn1g9q+cga2QORXMb7mSH
 4/V1Lzd19y5ufi3ev7WfSANBUmkymLl0HRcIuBU8r4lwyrouN03hDioEzxN2BLq0jc2w
 PNa1cB3LrZLSOCfO7TU5J03tUNqmrskXtQtiucDXNh4N8caZ9Zwf3il+Vt/GovQuu2OH
 W14h3gX7fhjY62uJhBvqSq/a3Y05a1DC2OEtQWiOKnrGf9P1vOoxgI6l+OH6d8TQdIs1
 Ytcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4bn+oUGGFPh+TBNTW+1Y2E2/tR5+d9f5YZSgdQZEwD0=;
 b=Y+bKIhgXHIoaThqY5j+mC0liuzTGh1C+YZCGTzDc4bymeQ+UYQmcTBeMdK6joXn3Os
 nZHUm5s8N3pEjG7/dmqABLJzmYYjLUvU5jBupH9vMOOsHMdAP/RteZJzDiofUsBAtoiL
 VjbyufIKZ3BXlfNKyS+l1b50NRRv+zfCdynebdcMZdZCQzw7aqR47mNr1VbGqrdBt7Ly
 qYEUBpeP2wpjWlKKdbxFYqPma8+B5kHHdVuN+S5me57yli0NYyRyA1rGQzMWaEqfZzTw
 1d0lZVsIyeADjyD5N4B9cpxYn97D3yr+Kq7JQbkodtWDtAwntSUzyuCigXKeH52hBErr
 okEg==
X-Gm-Message-State: AOAM530DuqNPHBXudzaYWtoDFRenWf3HCu/iqAMRgTVgCvahD9/XZe5M
 N42PXsy+X4Qf/HvJf4zZzHEp2Q==
X-Google-Smtp-Source: ABdhPJzw/B6DXZl7APkB8F0jY3xolapGTEsmaH9URq66xwoGzNoxulIszyK+w33pkgC0Ula6P2s2YA==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr4665123pjr.132.1594378246081; 
 Fri, 10 Jul 2020 03:50:46 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:50:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 05/65] target/riscv: remove vsll.vi, vsrl.vi,
 vsra.vi insns from using gvec
Date: Fri, 10 Jul 2020 18:48:19 +0800
Message-Id: <20200710104920.13550-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x643.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:50:49 -0000

From: Frank Chang <frank.chang@sifive.com>

vsll.vi, vsrl.vi, vsra.vi cannot use shli gvec as it requires the
shift immediate value to be within the range: [0.. SEW bits].
Otherwise, it will hit the assertion:
tcg_debug_assert(shift >= 0 && shift < (8 << vece));

However, RVV spec does not have such constraint, therefore we have to
use helper functions instead.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c0b7375927..70d31a5525 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1427,9 +1427,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
+GEN_OPIVI_TRANS(vsll_vi, 1, vsll_vx, opivx_check)
+GEN_OPIVI_TRANS(vsrl_vi, 1, vsrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vsra_vi, 1, vsra_vx, opivx_check)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.17.1


