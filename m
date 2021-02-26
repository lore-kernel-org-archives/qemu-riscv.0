Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFThp-0000Wv-MZ
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThm-0000Ts-LF
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:16 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThk-0001fe-Bo
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:14 -0500
Received: by mail-pg1-x536.google.com with SMTP id e6so5398036pgk.5
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ooeYII9a9p02Rf950LgKJWyqZVGnNJSme//eJhfqgt0=;
 b=XgjH2u9lP18gtBmBV1mHCi8vvkP121obMj36G8LTMwVQa1CxoyEC40aDkn+DR7Wwte
 2iMLq2ZxjGgoFlqPcJtmyoCvEy7ekI8kDbAytfqx0s5oK2PCwksxb52AB3kW/tmnS97J
 cR0zPU47LqXfVwNMXSvDbsaQoPtQZrQGZ4/9qKzqoT52qzRJXaQg+n6opxbqGRYcuqJT
 g2jkhDWqSDz9lGk7534mNbmnIGadaux85tnJaL9iGRg1wcVufPX2Uv/FeR11EgZCyEU1
 qRMPa9ZXBkTzd6k4bZHhRi7IexTzTW7wxbRFdFbCsnjyM9vz2e7ylPfgcN0O3eTf7CUj
 rqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ooeYII9a9p02Rf950LgKJWyqZVGnNJSme//eJhfqgt0=;
 b=mjhe8VkXNePMdIe3Wapo+JyRO6mFfaup98OYmEA8/RzigzOYtbhbnE46vruxbTBbGt
 Tp8PNH4ZepYFcub9n0sGGUo6akK8JqzUu4mshNGi4cUcFbMzEwPESOeGZ7nYROlcW7ca
 WZrw+hwLDXZ9CBBD4O6PxSf2ez7d9LhoaUlByvL83pd4yyll+8wNaahw/YNZUwWaypkB
 /2KuD392jKSNadG+dPAVohQzXfDPz+LQNEPsETJK9SYkMwtqd2/oRy0cDXpgobIudhSr
 uGgYH29nZWVGZEHKbQMnSKRtuwBQXRojiycXPo35wxKsQMkBMsWB5vM6tdJluhZIM4io
 /I/g==
X-Gm-Message-State: AOAM533OHyrjbDQQiAsgT4GvJ0R8cARqSkp0dOCncU3HvnLlWWPBXhvx
 PxCSiPTF90JbYk8XeS+pgLb90g==
X-Google-Smtp-Source: ABdhPJw6JWNK5dCU1O4e/l7drroUepbfHUQntkpBj98O8PKYflbnOYwFI8jxH35V8s3IhH4I9x1YEQ==
X-Received: by 2002:a63:f808:: with SMTP id n8mr1007140pgh.115.1614309729446; 
 Thu, 25 Feb 2021 19:22:09 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 31/75] target/riscv: rvv-1.0: iota instruction
Date: Fri, 26 Feb 2021 11:18:15 +0800
Message-Id: <20210226031902.23656-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:22:16 -0000

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


