Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoX-0006UM-NN
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvao1-0006DP-6j
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:02 -0500
Received: from [2607:f8b0:4864:20::434] (port=43780
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanz-0006uE-2V
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:00 -0500
Received: by mail-pf1-x434.google.com with SMTP id k26so7740671pfp.10
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RqB0+hsmREKJeAX+2oNDCkYIZsY0MzyqxWMwIQVHOVg=;
 b=RIHLK30efJXn6724TT/yd/7QGbMGaKpT7nJMaUUaQ1a2W/E80g+dGCWPqAvHgfY/SP
 4Y/ZWpYfJ3wJi70NPwHj7C9NkRsNKwU2p2D/Ibb+qUEdM9sv2/al4muOLKvrf/HY+HSj
 0uxt+z8Cl3O6el8JaHF+w2uusFbC0cAEfH05x2GMNHLorNYMlFAGW/1rGgXR+VdBsKYV
 +aF1qOT1E5O5DqNUbVSfINNM7Hbvh/gWX+bMyW9Qq1zQU4R5hV0og/KCf/SkGpN6tgFG
 T6oHte1D/O5uValo/3RBbazD+ZUnct/XiZG/RJU9ONteGJxyV/aSRrmGsR0LApaAJTnx
 tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RqB0+hsmREKJeAX+2oNDCkYIZsY0MzyqxWMwIQVHOVg=;
 b=32foCjTI/0fEF7FpQS+QGJlmNG+HiBjgK9sjIZdDSG0uZntwnI+e+ACq6RRRKkuvuV
 U/+UpiJzvnl+qLQFJBxz89UNN11LSIOyxEvcwmDxwqR8dSgB8Eyaw0iD2IhPDbVXQ5HS
 DCEJwVFUeVo7Xq9sq5OljMGvlSVur5KUTJ7cBWllxDjPLxkyrDJ6hAU/9xUgD7NGtgMm
 OEpZr+Qf90EBvRwQwMv4bucXwMQRCpxgDRFbbEuZRnX15YLtcfUjz/giWUfyH1yZjsfr
 ssaOVNnLJiKoHEDxW7IpROCiN1POt1EqpW88iC0wCiBTu1bFD+mzWi6sLwwDTbIdB75X
 x6bw==
X-Gm-Message-State: AOAM533Ws00k9TpWrimEmFoFHUP47tq902JOnld65392s8tSM9T1Gabg
 /3Z3R6iVt4xO/99lxPxQq5B/rQ==
X-Google-Smtp-Source: ABdhPJzixmPGgZ7Apg+HxOCjTEQEiWKzu6ZecPvB5ZosumXq++QB/mVqsRRbz+oJFVkwQJ80sMAVuw==
X-Received: by 2002:a63:1413:: with SMTP id u19mr38383513pgl.109.1639123135432; 
 Thu, 09 Dec 2021 23:58:55 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 32/77] target/riscv: rvv-1.0: iota instruction
Date: Fri, 10 Dec 2021 15:56:18 +0800
Message-Id: <20211210075704.23951-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Dec 2021 07:59:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d139c0aade..3ac5162aeb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9206e6f06c..80cbf0cadb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2757,12 +2757,18 @@ GEN_M_TRANS(vmsbf_m)
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
2.31.1


