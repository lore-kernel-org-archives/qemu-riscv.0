Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaol-0006vH-Oc
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoP-0006Pl-1I
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:26 -0500
Received: from [2607:f8b0:4864:20::434] (port=38653
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoJ-0006vu-VH
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:24 -0500
Received: by mail-pf1-x434.google.com with SMTP id g18so7764108pfk.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+No8Hh3sFX3VAKdhZkr4N+fI/QEs3skLRPgC7AhekM=;
 b=FwApuEMIF3V74363L83qaWiA5TOlKlz2FpF81U5jD6zbRPQLOSvRcZOrVWKsDZHiSm
 p14XFGeCIw6/JRB15aTN4/ce/E704f/AkySmUtvbFHRh0nWqEW6ANFC1sIfQ8lixbpNz
 fuAr4v6Rj5x5Skx/yKGHal/vDJ+swqowrV/VHq9WJxL42T9qES6mDCDfHVtWDUjRLCH3
 gkdRdcwjvoUCClNdI+baunw2QokNXzxxPHrPZBMyOSlcimQ1zHdsnBP+4FUS0E2VdpqE
 2PNkTCRLTtpLPSo/V9w1dvPiDle0CAC4R+fgQLeQLC7PAwViN2V+lDkzogKa/dVJ3aYO
 GeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+No8Hh3sFX3VAKdhZkr4N+fI/QEs3skLRPgC7AhekM=;
 b=pDRbcdsowH3+F3Z87XSUJJaPgaKsQ49cR5Ukobu8hjJG3bvpPesCwi7zPJuETZqinQ
 HrV9W3amm7eSrKOy9MllEi/WyTX2OfKypnfmM4RxdaPF5uKBDZDD6p5vkoyim4BOBPzX
 EfS2KyIST/8m4vX0da/d0SwjBVARQxYtiX9vHbrnXcS8ZBFf3GWrp/eOycXeWmhDppop
 hT8VwlyNfyyUferXVpDh/Fz4YUb2XKHCMcJsV/aoKA61NwZffcOmvUaqnPllFy4Y4+jv
 gkURv7rzyvDq13bRoiOYcbo4emhByaNhNh9e1ycNBfLxZ5fNql9RvGrM+i6dqiNKxd/L
 VIXw==
X-Gm-Message-State: AOAM531tCofplLuNsVOnQvB3SvY8o0f4bJceeSSJt2GB5Pk8vxJ89RiH
 4BZGxL6TdX7EPMrnDsOzD8+1aA==
X-Google-Smtp-Source: ABdhPJyntpLSG3+QgG2G+Vv+2v4+tbyu5nRXIx9NNKA4jK5kioefAf1jVZh5MjZ7ykqZemCmGDMJUQ==
X-Received: by 2002:a62:380f:0:b0:4b0:da80:2dac with SMTP id
 f15-20020a62380f000000b004b0da802dacmr5381717pfa.66.1639123148384; 
 Thu, 09 Dec 2021 23:59:08 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 37/77] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Fri, 10 Dec 2021 15:56:23 +0800
Message-Id: <20211210075704.23951-38-frank.chang@sifive.com>
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:31 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c250943dde..2c8002af54 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2461,9 +2461,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        TCGv_i64 t1;
+
         if (s->vl_eq_vlmax) {
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2477,15 +2483,21 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest = tcg_temp_new_ptr();
             desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.31.1


