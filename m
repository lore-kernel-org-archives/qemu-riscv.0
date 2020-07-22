Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvJ-0002tA-Ow
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvI-0002qG-8B
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:24 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvG-0005mB-CA
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:23 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gc9so867999pjb.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IWrCcJNFCIXNETTyltO0w8hd+iSggOqWcQXMvciqGQ4=;
 b=A6776ZCMWlg94EKNM/QTZrh43UcJTXyrRRa+Rooot6v5+tX4G1cePHr97hgQeignOd
 1IlnqaSAdliLoMqDiuTDhjunOpsD2FlakJ+3qvEczST42FVuPelHj8d+WA9o/BfwPVnq
 lxxts7ezrQ8dkMlHylsgeGjs/0ttPj5PdG7xqowvZanP6M36dY4+gRZR6EcBb4BvBaXQ
 Cl9tix7FN77GrgQCC4JGtFvAQvKTBKNHBn9ENDKDotl/z9TJyq1VGwE7fFzEXzW77Bz9
 X9D3ydpuRXAnJS5MnUJ4M2Wi2cDRfMoeNfx7EcI/6yRwrLMgaAgbZfTsjrmRVXFqc44c
 rzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IWrCcJNFCIXNETTyltO0w8hd+iSggOqWcQXMvciqGQ4=;
 b=anhtGAl6GaeYj+/OQp9Sm69t7hkUOhNI8WQNwFTpRk/9PgZUy29f/LUUnUc+DXzFqm
 sQvXd3IexWD7oEfkiqf4Om+xgUEiUK2mG36/rhXUzHLORUQwjNyMxcqe30E3GzsbiB3B
 cJMFuMFpwtWSJaQyenbzwBvkfFdC6Jpl7uTxE+XuArTGYAfpi+5Yfc+EbBsr2ZQpMoP8
 CRQi+pEwUGW9h3aj0yjvEev2Z/Gc10Lmy7PscfXI2NYkbQKjHjGwLj6t+QFfp0fwQYGH
 j7NRvWDZhgioej3yTVHObuzm9JDXFG9FmpIUUnzLsTgOYxKbA2Dr6rrxXw/n5p6KImEs
 tQOQ==
X-Gm-Message-State: AOAM532/S4IIajY94qrbv57+aDfP2nMfgRYHO3Lht0OI0IZ0GaJ4kcyx
 2I0nIBUg2UGeF+6DYaNtVGN56Q==
X-Google-Smtp-Source: ABdhPJwP7sySkmckyVKU5n1H+RqNNRpsnr4Q44eiPfTrC2PTV/ej6SCkZwAlvIHtfrVHYOnYd912Mw==
X-Received: by 2002:a17:902:9683:: with SMTP id
 n3mr25264460plp.65.1595409621093; 
 Wed, 22 Jul 2020 02:20:21 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 38/76] target/riscv: rvv-0.9: register gather instructions
Date: Wed, 22 Jul 2020 17:16:01 +0800
Message-Id: <20200722091641.8834-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:24 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 6b4b7f6574..af19561e7d 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3384,11 +3384,11 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        int vlmax = s->vlen;
+        int vlmax = s->vlen * s->flmul / (1 << (s->sew + 3));
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
@@ -3415,7 +3415,8 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        if (a->rs1 >= s->vlen) {
+        int vlmax = s->vlen * s->flmul / (1 << (s->sew + 3));
+        if (a->rs1 >= vlmax) {
             tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
         } else {
-- 
2.17.1


