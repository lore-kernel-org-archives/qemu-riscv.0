Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscg-0006EJ-ME
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdS-0005Mx-1J
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdQ-0006eG-G7
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:05 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ch3so2448591pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mGnKSMkKMtsxEVb7JFS0nY27EekRK3d4wsP51kVAl90=;
 b=Zuf+vGmqjzcAJJn8IEs0hWUiO+M0vI+4INjHzDDG5u69S//0fx/ZqKsTOVsXWd/yPi
 ii+95JFuylF0GzdKwNom5gSf19r9b9sWofO7tZWBuOIWlG1/TEGK3zbIH5SyesySgAaE
 jkWABx3hXsHHSbU+ZozSqoVf2tmReRggfwyVGs5q8bu845I1na4geA0FyQGwNuW1y72w
 Smus/PKprmdsD/01NgfzJo+hgKzgf1GyxWQCiBAkT1EOvdtSYlqxYNSEhYAfR4rLATYJ
 Utt3aEus4oIBAfGK9pZEaVO1rBKfIYBRlfYHRy4KQXL8YBHhIKVs7d2sSSSi2+V6C54X
 C6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mGnKSMkKMtsxEVb7JFS0nY27EekRK3d4wsP51kVAl90=;
 b=tdxI58dEuKoAw9q8RuKW+++UV/1p5SZkGJBimYQl+0SVLqvQ/uaDDUhpbYc3/ggiMT
 lRNVJobjoFB4rnT3FcL2hAvO9if266KOXvZFyJK6hIU2ZhFf3y8IRgUxSlFY6ws3aqnn
 2sTWtxjYymHSOg7Ef9Ih1ygIBB2AtAkgtE+10+hlg5yX2xd2r16kDxRfP7eRgn9vEUz9
 mF1HOfNoAMSLdUB5kMDFnj6bkAupWG/snYlBB0p7MsHUNibswFoSUpsIxO89TTSbmkW6
 2ouqACcuIqGQMWAMccTj0n7MfGxAbMHPJGBUuZYUNCKWI1xoHHbNWv0IrTwBde3JCtQQ
 UUPQ==
X-Gm-Message-State: AOAM532PDQEguuS1rgUHzYmf3ykLwk/C7faSRnEjtivdd+6VNYSLMpuA
 +P4hX1iLQA0DOg3E8/xWdCVlYw==
X-Google-Smtp-Source: ABdhPJyzbPxUZXhnlpeVNHG6c5CN+lyeYYtkgZ2qM4meUS8EtasSa4AvT/hJgq0kVLQW2oSi6p1dtg==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr53877958pln.16.1594378323192; 
 Fri, 10 Jul 2020 03:52:03 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:02 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 22/65] target/riscv: rvv-0.9: floating-point square-root
 instruction
Date: Fri, 10 Jul 2020 18:48:36 +0800
Message-Id: <20200710104920.13550-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:06 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e3f0fba912..1d34fa647b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -509,7 +509,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
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


