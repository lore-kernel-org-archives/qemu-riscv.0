Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHy4-0001Wp-W0
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHy4-0001Tj-14
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:28 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHy1-00045L-F5
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id 187so7672109pfc.10
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6PkezBH+FEV3jHu5Pb1F3JamGgVSlOWl1a/EDuX+xo=;
 b=iRCsgvq6+4cwJOcnmXKp/06mnCIrX98rv7A1Zf6Cs0YBXUgscKW7Azhn3rPaPWmo1Y
 p/kADKTAvae2fcNIT+H9oXCK7YUgevR9fbkAtWqGe90rQfzFqnKXV+n7SYoVvO+SziQB
 dBf/N/ebUSHPOz470WosrsqwGU4QDosmNM9NXUDTZ2ibeNkfG2dzGKLbEgNRq6IDwpR5
 1DhvYEvt2VpXuaXu0MldpHHnFwuY3cpVhGfGDmnU5nOBw70i8y2X72tE8SP/26aE2VCM
 HoQBnm3cX/MqgANaSHWkHDndqJ9pThsDeHkOboKHWy1UyfugywSWo1hj7H+o42ZXl3sR
 UX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6PkezBH+FEV3jHu5Pb1F3JamGgVSlOWl1a/EDuX+xo=;
 b=wroQa+lQUoCeqHN2q4XBANXQHoNCgmu2rR6t642HjImhdYgOOP4eGfuZrfeaGU61hm
 N9FHxknHV65N9dfoR9Iu/DXWbtPNWpSADfmN4e7gFCZbHOVE6iMgA9NjTEUAn+jDsUaE
 s0oNIXrTqQOfzcMV9ndbTGaIXBPb7nmQ7Y3JOwJQU2i2ZhWNuBOOVv1EZWfvqvbiPcF0
 +sRgYemUS+JAyveySondhfl9Jr4O8g/6azPsMFLbYqCxc8aga9AJDJLcvcem2zpQ53Jb
 nfVrdndjzD0k1jEqxXazeFqaqBbfr7YHp2kvPuA1cFXqGkY8xXkqqYfRWZBEq1iGYqdV
 PmMg==
X-Gm-Message-State: AOAM533FB7wCT+SwFEi9q/MHmX0Z1fe4nCD4SP31GFq5yq2jnwgLZogQ
 btPv9IvNE/Frqp7eBJlFyR0C/g==
X-Google-Smtp-Source: ABdhPJxvAvWksJWDPn1S9e2LIbBnVdaguS9CE9iCnQWWE8bgDlohhYJpRnky8uwT21SLyx3A1zeeIA==
X-Received: by 2002:a05:6a00:1a46:b0:44d:7a3f:2043 with SMTP id
 h6-20020a056a001a4600b0044d7a3f2043mr8334083pfv.56.1634284164295; 
 Fri, 15 Oct 2021 00:49:24 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 42/78] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 15 Oct 2021 15:45:50 +0800
Message-Id: <20211015074627.3957162-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0fc19b19c69..1fcde9f4df4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
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
2.25.1


