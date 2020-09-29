Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzZ-0007ya-KZ
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzX-0007t4-Fp
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:47 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzV-0002Tm-Lp
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:47 -0400
Received: by mail-pg1-x533.google.com with SMTP id 7so4622857pgm.11
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XSHmcYE4DoJ3Lm1TbPZa8VYwNTTvgzD0S4kKTvPjE1k=;
 b=UV3HF2OOCftlcKwy5e6XnyUdNQrpp2eMfq8RICsdYdy+Aljkn49675rXgjUY8aNdXd
 /lsx9yxx7yApWOTW++0C9kbJmqblttBkvfgdODQY455y55C1lhV5A0eZ+27xXbJIqIwY
 4rHQgp4rBcvBjtc0t2/NNqXhxDhZcEL510BfGtbEp3vg8kniG57eYAmtJaL+1yPdA/06
 HY8AQBU/yKpzAAW5B0S/d98O2R9m3idYSzSkYB6QKGAi980iMtu208AngKUBAYzBHEXP
 pfu1S7pIYEM6EM+Y81M5pUqDNKMhmJNnP8OoWXPOfBKDU9Blbtc3gbTpMdgYNNVR1EvV
 BR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XSHmcYE4DoJ3Lm1TbPZa8VYwNTTvgzD0S4kKTvPjE1k=;
 b=n5lHGuBM/JFqor4wFXJAw6c/XmYDxon3HyZToStgCDcZuTrpvIgSLMLWcO8pqnfJ33
 qvsMq5OCYgbXx/R1zrtwO+koSZ10qg06EnsPFE+IddjC2jAvJhq8U9DwAWyZNFhoBZL3
 hSWYOQ/7Tv0oQ8EKrHHFOySfuFzJd0x8W1zVbtmLXsANYDHNgmdIU79Zk8H7rjPiEq9q
 +fYNIFbyBIlcJSb9poGF+terIDLns0m4usq+4sV/xxbK2xBuGvBtbNvb5fOh7AEASg7u
 FT/z0vmEqPBbeullBeXnnZQgEHPDerx0rl6AsnX+s0PEnNDpTC0NIJV4YMDKPzWE6it4
 jdbg==
X-Gm-Message-State: AOAM530bjZJTWvhg7VmE08a3+aZpPQP0jQ/ZlmBOoWs4BWN1okPh7Krx
 SzkmbdMb8n4juspMxeuZW5rjPw==
X-Google-Smtp-Source: ABdhPJwDecjTn8z05yZLRKwauqt/BMuDJuUpF2AWH1cKX2siSmc9Hfs9GUb/QXw1WnXGmULzkXrxzw==
X-Received: by 2002:a63:703:: with SMTP id 3mr4361104pgh.159.1601406524446;
 Tue, 29 Sep 2020 12:08:44 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 58/68] target/riscv: rvv-1.0: floating-point min/max
 instructions
Date: Wed, 30 Sep 2020 03:04:33 +0800
Message-Id: <20200929190448.31116-59-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c5e6572012..e3056a06fe 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3596,28 +3596,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum_noprop)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum_noprop)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum_noprop)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum_noprop)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8)
-- 
2.17.1


