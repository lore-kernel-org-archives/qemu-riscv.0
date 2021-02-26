Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFThK-00007k-T5
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThJ-0008Vh-1E
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:21:45 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThF-0001TA-U1
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:21:44 -0500
Received: by mail-pg1-x529.google.com with SMTP id h4so5368123pgf.13
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4vgcvDi0Pb1vCv3IrRgtKYdcW6367/KB72hY1q4QLsQ=;
 b=ZXyk28aFKBzbPYdyV6Bjz6Baky75AtVvutkeQzoVzoGhlbSOISEykX0WbvQWK3pl3Q
 +sh2ED6LVH0k0Y+7BBlf8SWtBxWUdfVlHat3LKJxPUSGrPx5L/GBAlGJTyMX6rA03OC3
 oyU4DN/tLxT7CHg11kFGfvX6zP+2MytKwGTiOK+8cC0GsG4Yf5ncRkSd6LkJV81nnMee
 X9/zNfYZdrduA28y8IGjiyl388nUrA1KWPeMbWsEP7gY0lofgCORy9iO7/6bwKRB4XjS
 nIjGGxkm/mWw8bRuoWjCBO8n/3A6h5ddryIFBkSvVfkOy0KyL5ycXBoh0FtPUGb0lQ7P
 w3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4vgcvDi0Pb1vCv3IrRgtKYdcW6367/KB72hY1q4QLsQ=;
 b=h9rFByn49VTWd2ERq3WBR8IMq4AG8uSi0/cPe8PSoSgZMBPuoQ+xHUPGsl971U90TN
 9pP0AI3DDflcpwc7kr6gS1EDdIjDHKbsGyM+jOZ6B4ycTYaTTOpuNy6RLb+mapc8Eaeb
 o27EYuM7/QaJPRfQZ6rnqf7V+DYfN9mu2OeRuMlfLAf+MUXUISMsAXsvBK5UXoUvu405
 mioJMLGRrb02rgXEseHS+cV4xrw+bh1kijX4tSWa4SaJ+BdxqcKkPATjieUACU+yHhKe
 APmeGpnxnaaAbdq24Aifvc16zPsPFZ13tHf4DlLFrdC7q/7E/4mN5n6ex273ShoKsTwY
 iGKw==
X-Gm-Message-State: AOAM5311SVx/iFeJJjVcFpk2Xwo+xo7gTsEuG82es418ze4brrVZZ+uT
 mN51F0mGi6o23ZalcAmLCl1tTg==
X-Google-Smtp-Source: ABdhPJzRu194LMHdZdUfW7iqyjY1krgl/AyeYpf3RmZyUojf9YxsalqPC/9GaYIvvDWt1Kk205lpJQ==
X-Received: by 2002:a05:6a00:1393:b029:1b4:7938:ff1d with SMTP id
 t19-20020a056a001393b02901b47938ff1dmr968903pfg.31.1614309700808; 
 Thu, 25 Feb 2021 19:21:40 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:21:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 26/75] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 26 Feb 2021 11:18:10 +0800
Message-Id: <20210226031902.23656-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:21:45 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e11666f16df..c0053cfb828 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -538,7 +538,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.17.1


