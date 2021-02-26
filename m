Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTil-0001Ju-Oc
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTif-0001Hv-AJ
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:23:09 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTid-00023T-8b
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:23:09 -0500
Received: by mail-pf1-x436.google.com with SMTP id q204so4269146pfq.10
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=YzD4GWE7McJdMyvQd2WiHcEXlnvpaperfKiAw/tXaHxQQ62Uh5+fR3ucaqArwLiFsr
 CWFYuJV1Edn0x10XcnaCdyNDlQ2narUZw3OG3o8suPsgXPY/aeZwK+Jk9Bepk8ebiOuF
 EBAYPnWbrDhic6ZccvOewQxmLGOk4Oer77YLMxira2/rw70MqsIo3W5qnova8rA/81gS
 LsN+YzoHFx0JUo2rVgw2DSKUDG2hHuLeTIx0be4YGYFw07kV2J1NSiCrJ/Cr12cntcyV
 Cv6wknzeeQ+N1tXvDAQDl9Ow86XMs9jIWhj9KIy1bKajZamPTpWQhiFD6nT8+R4vrgfM
 CCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=FogTzYKDg/C4PlXaA5vWlQllK6Qmhgb8tp9Hh5P2+OXiRdtOvUx7U6D8ar9KYaetE0
 jyoCHV3rxIx7zLJc2+dQcuL75M+aAbWhqGya0e/lP7HLIDVLjj9D2IsAHc4VReFXlTaU
 GA1IG6PgKeiiYrtmz2dANlNozEjC+SEJabtJvwUOWZSKC8LrqSrHQPpHRZ1TN51j3/xP
 xABF16/u75wvcdq819hDe+cy87qBwCqSftYhp17aTtx/jM/j2sLK8zv7VTBrjtWk/kIO
 tbgkHE1Pgq1KKZ59luhqdTXIoJQ9Wkc4piOIUBFhyeTcJZxnd1l+29GadzxfGFfyHaKN
 1U/w==
X-Gm-Message-State: AOAM533e14VaOyTLC+vy7CGAR0fKaQMvfb7UuIJvGyVqBcp55PS9seVU
 SpSUCOODfGM6Ql3Q7EOmDSRRaw==
X-Google-Smtp-Source: ABdhPJxr0+erg+vluTqkUVkl7wm4SIH/+kgVEHmkzmRrTaDfnhu4deMbBrjgDC/Q4/vj1yN+zB5CUQ==
X-Received: by 2002:a63:d144:: with SMTP id c4mr1013836pgj.196.1614309785033; 
 Thu, 25 Feb 2021 19:23:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 41/75] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 26 Feb 2021 11:18:25 +0800
Message-Id: <20210226031902.23656-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:23:09 -0000

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


