Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvx-0004XB-TN
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvv-0004RO-P1
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvt-0005yx-SS
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:03 -0400
Received: by mail-pj1-x1036.google.com with SMTP id f16so878439pjt.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V77vPoxF5wHJpkr1vzvCn6SW3F0N4bm+U02KvfCaIVI=;
 b=NqUTBCVRXRd+sTcoCU5+MGfTn2sznVrpu6qrvqCL0Oi4fvO20C2HGRCsGGHmElkmw2
 mUI3sNhnRm3xKTWsk2EV/0pMdXRBAMeI23UiXKRagN3yuIsg/sfRaKyEWZHDdxv8P5DX
 EYqLTqGBmNKhXU9P9prwVPkTrztAyvdR0HP619wus4BoVIBSKFDKHN1vq+MVx4VsIQz1
 9uKRtOF76kdJdcES9Xx49F7uc0YzhQRQPR1v1bpJ2UWeEPk2wpnzKNubOmbDNDMbeklI
 ifQErwstsxorFLuNupvMume1YeUrBY8LQ2+DEBWIuuIRaVRhR+cr5woltAOLxM9HTCYR
 nLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V77vPoxF5wHJpkr1vzvCn6SW3F0N4bm+U02KvfCaIVI=;
 b=HketJ3Z3l/fuNO8qXV5S84sibjPk0kLFXLw8S4Sz65LiMI+ssJQg8s4EtLy27m+mxY
 XLjg2cfCAKRwm6S5zNxemcYhRxN4cmRbMBFtDTtncKe+IhXraF5CF1Xj/FYwhrb4POPJ
 9Cv5yolzq//BCHhxg2eqNTgxlQclKwpdw0xsGkJGt/lPXcL7GRZGhdQl78WdT675bncT
 wG++GXZDb5YAv40KjoZF5YvqQvaftOYx3SMmIilzm/9C9+OtPT8jJn5IkUY9JqllJszK
 64DZwgUUUtwMvtYgodEI0WeRsI3QFNt9+kEnXkdCvRwi9+3lHeZid9lVF0ZqcTf8nVDS
 MO4g==
X-Gm-Message-State: AOAM531WGTCuDCZZ+fB/eaPc9wBuVmdRyf5LC2sA0hMTJCT9iRQkhFI2
 w4fZUNwZeiiC24ije5PYWxoqDg==
X-Google-Smtp-Source: ABdhPJw/INe8A2OwpA3e0HysV41P0wQ60wemAi5fO7ATOkcyA8U/1hMvj55DIu9GecdiguT5acwSmQ==
X-Received: by 2002:a17:90a:1acc:: with SMTP id
 p70mr9572815pjp.210.1595409660695; 
 Wed, 22 Jul 2020 02:21:00 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 48/76] target/riscv: rvv-0.9: widening integer multiply-add
 instructions
Date: Wed, 22 Jul 2020 17:16:11 +0800
Message-Id: <20200722091641.8834-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:21:04 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index bc6c788edf..c6a7145aa5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -420,9 +420,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
-- 
2.17.1


