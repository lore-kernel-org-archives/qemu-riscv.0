Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTjw-0002J7-5I
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjo-0002Fu-On
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:21 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjm-0002Wm-Pk
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:20 -0500
Received: by mail-pj1-x1032.google.com with SMTP id c19so5184366pjq.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fY+GcOrASDOiYUT5LG3k1EJZKOqbSJ8XapXzLlPlL3Y=;
 b=HrKLnqnT0Xi+G/obAmI4W3naZkASB6QZQLSrpxgrfgRSfYVfT1WbqOrBWd9fudbnkl
 Rl5I7RoAHNyns/DW+nrIwHQTuJw8AbR0T4KfXIL73+7KO4eQJkyIu3frVw6pcLlqtOC+
 UjDe3/UjlQS90S7uREBw0FkITSUh4qH4oNPkl3bn9JwT96lnR0LmVsLVMnOShg4642cE
 o47oZTou38/Qjs8e4aXgnree/cpe27rKPvMj8hmVNitjmBINnrwFBsiNwiU1Fuy+NXxQ
 MuTg8DddzdsdW5OQ6ZVDc4WiiOnfUXTjlxAEfJRXigLH+i7Kdt6Pts3GKsdDFScs9tzE
 MAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fY+GcOrASDOiYUT5LG3k1EJZKOqbSJ8XapXzLlPlL3Y=;
 b=EXvPzgrEuC/5YH4sqPG0eUVW/283BnznfqEm/LJbhhrxLic7FqGrSSplyHAYNrOjyG
 a/ywwcuWSN05zTQxBbDRV/iY50MZMm0slPVg76D9nRNWkIuRUaeXwIipTlbtrJMsgyuF
 l1jWPhelnO+pIMFzB/hkgbWXNwEOaTb6QKxarHoTm67f4r9BVx/FAEwbhxDsC8MvqdnE
 LpaBXrAF00sasdD0sKbC2Hkwyebqilxe6jTaYnpd9rVD97LGpNbuQeLpnCQgQTgaSeDg
 QLtkBGyrGER0do2GWSABgYBC/qvqfTZ40mAonSgNlakvnGP+2IcOhUI83LPyuou1GkYI
 lrGQ==
X-Gm-Message-State: AOAM532swGoP/KIIFKFWvEV2t4ZTjrjq8Vx6zpjY6fLoJfWslnM+zb34
 jgJnh3XKd1NynJrxIkKyd2fMtg==
X-Google-Smtp-Source: ABdhPJz7RW960QlG+l6QOMBkQnrNclk0878yPciq20hUiTgijWEZZ1kr1OKBE2mlOFt3IWNFnjTPXA==
X-Received: by 2002:a17:902:8f82:b029:e3:5900:e695 with SMTP id
 z2-20020a1709028f82b02900e35900e695mr976137plo.47.1614309857592; 
 Thu, 25 Feb 2021 19:24:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 53/75] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Fri, 26 Feb 2021 11:18:37 +0800
Message-Id: <20210226031902.23656-54-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:24:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c4ccccb0370..49889a7706b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2877,7 +2877,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.17.1


