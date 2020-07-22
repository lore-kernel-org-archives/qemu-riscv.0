Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAup-0001zZ-2K
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAum-0001wg-N3
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:52 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAuk-0005ct-6w
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:19:52 -0400
Received: by mail-pg1-x533.google.com with SMTP id t6so884643pgq.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mGnKSMkKMtsxEVb7JFS0nY27EekRK3d4wsP51kVAl90=;
 b=G2rnH8m0AcSmUyCzxoci1Tb8SPSeg7DaQt1+GjXsxVSWHC6VQpliA7g9BUJx/G4DAF
 Zuu0RHRHJSjwaaLIrZMePpb+Xm7eacRRkmSgBTGOAW9mliw+JGs7GfyUdw5JDWy0BIXz
 1W1qzDYJYrKpxgLpIvNPTz/sCxzOn0R0hYU/EkMlOkdDGhLeC0Qc7a3NWyXLvkMVpY4z
 WhxRcc3XKmjaC4ddFm6Mbqg1RTym8n5nuSjRvTriT8pfQO4olCmQgYkEuh9XImx5yjbG
 TkR+czYEMVWc3MFwbrz9bv26tWnAPRzNuN7nerDdvbsiNVrWR5kHCurNl6YRSWweHl2n
 hCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mGnKSMkKMtsxEVb7JFS0nY27EekRK3d4wsP51kVAl90=;
 b=X7UM4myrTMqfxZqBmvOnZn0jnDkg3UPJCDjbfEr9LUshlJKzpjufQqXHULqdEz8jfj
 lY6Q1fplChbDAz8JSGcgE/c5VNlJPM+SInGPSU7Jsnm6Dru8rSAFjlY6Ng4PFktOAoh6
 8yHWZZglk17vv7kq+z8bND6boZ1MiKQrCCXiiaoduiN62nBfOKo5aZFXgGX0RL1YSfwB
 rWMuQ/e7p/fCo2cf9wkvetmVP7fBhaQcH/99fJZWzPGXLSRwQu+Jhloi8Rlbjs2RYtGz
 1BOliNNkMcoypirLjpPoh1fbmggZg+27CnVTLDDYY+iSy98jeBlA9aYJ7Dzmotn4EIEv
 a3kQ==
X-Gm-Message-State: AOAM532Loff34h1zRfT5r1w2YqhBTs3wmsqW/H+q0U3sXBR4R7+fqHH7
 na4Kv8z2VMko0FuhwH+WWdM8xA==
X-Google-Smtp-Source: ABdhPJwz2PRLy0ePfNpOkFksGcSj8T/7V+MLLru1WyUGDnZI77BQz4NmqlTPe/V6jJdT7dyWfHvPhg==
X-Received: by 2002:a62:fc53:: with SMTP id e80mr26746292pfh.129.1595409589088; 
 Wed, 22 Jul 2020 02:19:49 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:19:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 30/76] target/riscv: rvv-0.9: floating-point square-root
 instruction
Date: Wed, 22 Jul 2020 17:15:53 +0800
Message-Id: <20200722091641.8834-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:19:53 -0000

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


