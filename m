Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrWzo-0005VS-TP
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzm-0005R1-Js
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:22 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33471
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzk-0000VD-JU
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:06:22 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x5so15358462pfr.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOZkko/CTdaE7DpkXpWYbtzqXWlFEusGG9wsyPj6Eso=;
 b=VnFD/WRG3qHr4TbZFSgi35ILh4J28irJd4rj2lE9ZtsUMpbuw74kRsTwNZvLBMUZXF
 TDPd4faj7W9E3hpyCj07P2m6cO1RFN7PHob3QVpO1bV0HL/VPHJcgCC756WZ2n+NyoxF
 D1Azmj7dxkHAPUOZW/6BjizEPJdgHK+BU+RPUitpFvEpn+pJqEUQfdOVhg2w3OdOz+8y
 dC7A8x7eihVoIaVB3DWNxiiFNTecqCXIjw4yttQo2z+WQNw+SsZLJEBu/yscL5DM6dtM
 KQ3UqqzXVnYb0GO+6dEnhyeXfTOBfZbuT5+AEi7wlwEBwsLTLetk1gk4K4KDAEGCrVc1
 CkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOZkko/CTdaE7DpkXpWYbtzqXWlFEusGG9wsyPj6Eso=;
 b=4Zd8XKmd1zfbx6g945tJc28TjKUSohq7xwQxGkFBOCWXjC/G6oM6TsNTbrjPMa9O+M
 lxk2BkQmAzap24Qe+Iq3EZyYyv5vqFlzNvaSv7V5WDPEEzbft7LuMrKz6zSk3ZtWTyyv
 cVkqWxbTUrEfckQ2kscadlwICCUwp3stSamZ2E4piYb/k828H9OtPMR9qteTE2aa4tAj
 8blnuHQ6ryng4CZjU3NpxODIFLUecW3ROUzrSBr4lAkzOoi0WJHPz+vqLq54nJx6eM8+
 UC+t0h0mpXwltPkFt0QCze10e1pPX+IRrh39ZI4hWEX+CmRkfzzNwmUlpYwsW4HYbs7v
 HlJQ==
X-Gm-Message-State: AOAM532n6x4PraGUDV4SEyJ6X3LwggVjCLCc2wM6MayKMZ9wBxHoiUZl
 6ozMjMEwDenZ+WPrCZBBRln0+w==
X-Google-Smtp-Source: ABdhPJwmV/TaUF35qN6/OltFs7/czaB9jO1t8D7kRs3mixsiybOImgl+s858dv47ks1slFodS6ezmA==
X-Received: by 2002:a63:1b5e:: with SMTP id b30mr32474010pgm.72.1638155179422; 
 Sun, 28 Nov 2021 19:06:19 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:19 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 32/77] target/riscv: rvv-1.0: iota instruction
Date: Mon, 29 Nov 2021 11:02:52 +0800
Message-Id: <20211129030340.429689-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:06:23 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d139c0aade7..3ac5162aeb7 100644
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
index 9206e6f06c8..80cbf0cadb8 100644
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
2.25.1


