Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBs-0004iI-13
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBo-0004ed-Av
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:12 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBm-0007lL-Cx
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:12 -0500
Received: by mail-pg1-x530.google.com with SMTP id g15so1067478pgu.9
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ooeYII9a9p02Rf950LgKJWyqZVGnNJSme//eJhfqgt0=;
 b=ArXijuxhXQLr2VEWC/4e5vW7JeSK+SWICaZ1prNCgQQXCR2d1gCcHZuDKg4rUUKxYj
 iKkMz8C9SzjAXw10bHgaOx3tjfCvueDriK5HBHqbkPLx+KFhtIQYLnPYMGBD5aBe9xV5
 ohfmmLy5N52sDCx9z+7VNXg/6Qp+jjLRcxHhEtqqhVQdpmY5giUNkk7VNRk+kE1Z10Po
 Xx3Ku+iFOGPTDk2wVbGIFc9JyVHjcRBqJSV2Ii/1eR6HXPluCprCGyrpXlt7ysBlr0DZ
 ov/ozOl9BKd5g+RShcmQfEdlCQQrItIEIg3GjQQqjLnD+FOGAhQ7zTqDS3zP/GYPZkPk
 RkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ooeYII9a9p02Rf950LgKJWyqZVGnNJSme//eJhfqgt0=;
 b=d6gG+KF1E2siMPTV2cCWviHtCmoYbl/iwLlcQR2rqPo5dupLYiSmkKmrwL5CipaMX3
 pZHc5QOrXfDVPIL34x0LoD/YzvSyJ+UvGBhQjV2CGb3X5pE9Ez+GwPN/jqzik50ICRd0
 o7SD5dAPI0CCj4nvHmhWVGCq+AXo5rsQ7urgeZZlRqHrWUfJuAbpmg4WR1gQOah/GfMH
 +Ly5ZNp3WHWDm+xl/FY0fZrJiFj36LKOqof9kpYHmrauyKoF4PakjnnMgWDxB+4L5vsq
 MIxwWJupz0vOiP7d34FcBEwgJem0gMky7JLtM1ys7jNmftXaBFg7vyD9sDUtqVz2MXD5
 thgg==
X-Gm-Message-State: AOAM533wLkV7g653VaTFM4DQRftXr8HECPyK1vEik6Sw7B9cRtWGAvQX
 G7b34jzF+1fQo0y9jcVqjKBzvqx42RNtYAS8
X-Google-Smtp-Source: ABdhPJxFe9+0BhPXMXq86tAfXsyEEVFkeMVSJau5TZqSvRFiIwUz3bgFMLfqSQSmE2TtoCtywT627g==
X-Received: by 2002:a62:dd94:0:b029:19e:92ec:722a with SMTP id
 w142-20020a62dd940000b029019e92ec722amr4124825pff.50.1610444528979; 
 Tue, 12 Jan 2021 01:42:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 31/72] target/riscv: rvv-1.0: iota instruction
Date: Tue, 12 Jan 2021 17:39:05 +0800
Message-Id: <20210112093950.17530-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6b3caef1721..fae5ea3fa63 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -607,7 +607,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5b229d55307..6e45186b9b4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2989,12 +2989,18 @@ GEN_M_TRANS(vmsbf_m)
 GEN_M_TRANS(vmsif_m)
 GEN_M_TRANS(vmsof_m)
 
-/* Vector Iota Instruction */
+/*
+ * Vector Iota Instruction
+ *
+ * 1. The destination register cannot overlap the source register.
+ * 2. If masked, cannot overlap the mask register ('v0').
+ * 3. An illegal instruction exception is raised if vstart is non-zero.
+ */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul)) {
         uint32_t data = 0;
-- 
2.17.1


