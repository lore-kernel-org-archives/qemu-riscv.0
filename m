Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKyc-0006I3-Pu
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyZ-0006DV-3P
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:48 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyX-0002JI-Av
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:46 -0400
Received: by mail-pf1-x443.google.com with SMTP id w7so5540435pfi.4
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4LjkfSy5vUY+saBETuGzU8Wtir4rrwiBPx84nJJQaXw=;
 b=RXFRDDAmLIBOa2Mehhypvg7Ktvw9uqr3mHDYZy4xbfYGz+KTKA3SGezRmB1Wx0UpWB
 mWTEWdGeMnMfVmj6HeLlSnfaC0n8rXTWyi7ctODOZA5VwejLO0dR6ovitmrZPjYRENNT
 AtJ0cOSgkshotdTl7sYcbGoROLRBle8DeH+XuTAuSyzqxaGRQVHMvcVEZ0tHlsZl2UaY
 8cIlay6aMQqy2/GDW3MXYACAlcWbx5CiEGZV/HKtQ0czjOkZ6XCFeuzoSBy6U1xPsCNL
 7oh3iPikmJws6ikCi9A+XoaFGY92zl7YwohJlKW/SngUFFMp2YWT/3ppyurg+joidS5M
 Fu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4LjkfSy5vUY+saBETuGzU8Wtir4rrwiBPx84nJJQaXw=;
 b=q5V3+GQe3saUf/0uBZUGlY+pvU7PBQI2WX0QYwvv5F8kTHROuJLXO4Mu3lo/WMHUxt
 0KqY3mXt/FOXqYKS0sNIKWpwPZKj5H2yvm0nIR1tVzGnX19Q8K8+ryOPq7hsu+DEKf4K
 pxWxUThJW4U9Gd6FFzGs+/IARdrWTQOPJAO43FAimr5+YsOky0x4WTPt5OqljGC5zxrE
 bDhrglwzJ2UGBk0/BI7/sh72NlRFHT4QErYfuwKqRljFTVF6Yhu0zaBOEpXKJ3JGqllu
 lYqdXHzkvjJDcVD3c9EUOfIsy3N19bRucgmOOFh3dOYzdu0cw3z+c5GFdn+NLkhbeK0b
 IWlw==
X-Gm-Message-State: AOAM533ybBCCqscIfaRLfG6nNXhWsvC7CwBJoxJOI/8vWO+GdaeNA0QQ
 0//kk9+Qk9j2N2ZYeR+1cgKXHA==
X-Google-Smtp-Source: ABdhPJxABaapATbD5BelF8yF2NOc47UFxlwEilH6ShOupI+Dlb1dpgvMupsaje81xN5iDKimprKAcA==
X-Received: by 2002:a05:6a00:1b:b029:13e:d13d:a101 with SMTP id
 h27-20020a056a00001bb029013ed13da101mr5288081pfk.29.1601406464109; 
 Tue, 29 Sep 2020 12:07:44 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 41/68] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Wed, 30 Sep 2020 03:04:16 +0800
Message-Id: <20200929190448.31116-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index cce1712af0..20b104527c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1932,9 +1932,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
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


