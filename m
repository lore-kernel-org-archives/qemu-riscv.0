Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHyE-00021g-K8
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyC-0001wL-Rl
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyB-0004DL-C0
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ls18so6651787pjb.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ua5QPNKI3+mtdWrr6duWB6GbsCIKbt2CcILxnbVK4gk=;
 b=YmuHKm/Uv8P8hWaTDQb2ucc4Eh8OCvlamr1fy0rgkWJiR2JUVkdqA4wbMu+w+clTWK
 b1IraBX+AlbctEPXLqXh3qF/WkmUyQ2TXQq9NKbEhV5yCA58Na5TtxFNtqNjriAmTDqU
 aPrbkbwFXt8aVrxhFyZZA7KN+HF/rzxRVvdCyXkJZL5knDPelaOWCfDPaeASZVTz1VBU
 qWSckEK/kB8LetxAR08dM1pK/GSwbyjezHTIp80pN3v1ESbvX3525Qczdx436xACwpJb
 b/tyXmGi2zEGqGw6cRy+ZS/2AaVqnrDf8+mATaFlW8ZPccJ1yEK3iHIooFTrr0CKFiBI
 YLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ua5QPNKI3+mtdWrr6duWB6GbsCIKbt2CcILxnbVK4gk=;
 b=FpACKHMifUINC5LV9p1ZEfuH1VBWfqJy0UlOQAgtHeBvdodVLu9hZ7UdTmW/yzNn5W
 kmDLJqLq4U/zkfbYn+wMH/cgw9meqAJ/MUu+zfi4Iesp4Iy3/aLKMLqE6sxQgY58bJaQ
 CAyTK1rSt2Dm/8ATb5dLeDv0Nc3ExhMEkKUn4OiqPkmNJ/wyQCa3BDiSTQs22wk8/2vD
 f51NWYtXPuVq0NeznW21QNtniMAsoSCMEmbUpfhj1OyunZ00IBK+Lj3hf2GXB/d0lvMf
 OcPuCxnmytp35wfnsluBja18ev7sE/vPCBGX4uvkwy133Qw+4xaz77bryqkRSYl12QlL
 klgQ==
X-Gm-Message-State: AOAM532ju5hggBVDAJN25eNY52STM1imjB7vI4TggKM3TENBDwuo7qIA
 cohpzG+uYmxZBY4V206eUgN4nw==
X-Google-Smtp-Source: ABdhPJyYDieFzcIgQ2uRxCUVQwPhowc5lEuew/bP2h5KOBa4GaCjxP1Rv/Nf4Jm/jwXuCmaI4RBKzw==
X-Received: by 2002:a17:903:1103:b0:13a:1dd7:485f with SMTP id
 n3-20020a170903110300b0013a1dd7485fmr9876788plh.6.1634284174145; 
 Fri, 15 Oct 2021 00:49:34 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:33 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 45/78] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Fri, 15 Oct 2021 15:45:53 +0800
Message-Id: <20211015074627.3957162-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a3f1101cd63..7548b71efdb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -474,9 +474,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
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
2.25.1


