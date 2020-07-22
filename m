Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAv7-0002cf-Ut
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAv6-0002ZM-48
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:12 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAv4-0005fI-Dt
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:11 -0400
Received: by mail-pl1-x631.google.com with SMTP id b9so652330plx.6
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8wfCLaacJLGQ4JsbotMOzZuv/OFkbZxRksmqcJIZmw4=;
 b=AI680HGJOj6z31w0yZEFHunmEgcm8ub6PAL9CyBGUlWmPhdbEdNjhcd6L1oB4WhbUv
 /+TwNcSfTjWqr2w+EZPBBwBznhhSYQZ0VrM0IKS0atZFKSM9rhTSqB3E2MBabRT16Xb/
 vDOpuavbri1IUUaCdvyntI6ZgUTLoPhR0uZPQPBjB3xegB4NR2ZbdvagniMJkSLd5sem
 HzV1jn7xKeOQaNo6uKE8hTmkdNkiBIdxdZVwhOw0UDocVOKMS/M1ha1F1jEjJSrs3uXK
 QHD3QyvHv2ExDPDmrrDOLYtixApW3wiFN+aGU0r1ZEmWf1nvHRCW0jWtVF8wXFXwOusm
 u2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8wfCLaacJLGQ4JsbotMOzZuv/OFkbZxRksmqcJIZmw4=;
 b=pJ9E657+DLO4Drdkb1B6QZ8qXeKOcXXqA/Dd5u9Xrq+l4x2MhMfykeWgwPhdh5ABGs
 uCtyL+/STSfjA+l/V7Ge0D5P2h2eoNoh+yV49YQpK21PEew30am3ux/xdbVUPkBHSiNw
 pxclujs+mfEprEOb1P3FTCLa7vz4pIDyqxUinAYIocUf3/EotMc9rznr++2jlPzO2DoE
 gh97wfyVKX0ujOr0fjJmorvKhUei53TP8u5L0wmmroQ32hJlk1H6L9xJHgMTKEg/zPFV
 6zmd3qKyTaQKy/CrXjkh48c9zAMRihOa+YYCCTD+yPsXjEEjV+SMAOMYLs70f3gxmBKa
 JBow==
X-Gm-Message-State: AOAM530AYbdLG9i7xFlolNiyxFA7TC69xw1iWaml4fR5yQC707rvqRLe
 4H4P+6moZvzHDehB8iXZp7ftVA==
X-Google-Smtp-Source: ABdhPJyj190soGg4BEefZ+R3j6eY2+yzLctvvbXOY+zsuw3MPxEpTuiCxbhrK1RBeyLJtrQ3RppfRA==
X-Received: by 2002:a17:90a:ce96:: with SMTP id
 g22mr9112663pju.9.1595409609172; 
 Wed, 22 Jul 2020 02:20:09 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 35/76] target/riscv: rvv-0.9: iota instruction
Date: Wed, 22 Jul 2020 17:15:58 +0800
Message-Id: <20200722091641.8834-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode   | 2 +-
 target/riscv/vector_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 37b2582981..4560bc4379 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -578,7 +578,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index aeaf3d1cfa..c1ed0ff6ad 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4774,7 +4774,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
     CLEAR_FN(vd, vta, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));     \
 }
 
-GEN_VEXT_VIOTA_M(viota_m_b, uint8_t, H1, clearb)
+GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1, clearb)
 GEN_VEXT_VIOTA_M(viota_m_h, uint16_t, H2, clearh)
 GEN_VEXT_VIOTA_M(viota_m_w, uint32_t, H4, clearl)
 GEN_VEXT_VIOTA_M(viota_m_d, uint64_t, H8, clearq)
-- 
2.17.1


