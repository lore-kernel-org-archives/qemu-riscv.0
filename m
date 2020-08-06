Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dSQ-0003KM-Gd
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSI-0003H2-N0
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:03 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSC-0007w7-Sz
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:02 -0400
Received: by mail-pj1-x1030.google.com with SMTP id 2so6440400pjx.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PiCEwek3GwYlV43qpUnwxVVCiWPiDa7KHjCJA4ZX0UQ=;
 b=MsB8JrE7I5MFPmHot0vneajUmpA6M7gNqOTOAUpo04jMn1X2BMZrvHj8dCwvglpBp3
 qnxM2oukwU3ASvtzMlPRpgXniMFnkSRTt5AH6D2lFmfp4lmyHK3cQLtzkFtrtXa/tPzQ
 yHIAKx6V/fnCoHEDuUnQx9NTgncHv0NLEb5MhGqM79Om3tqM6BBZvfMsGx5GPMD7Ao0F
 WQEh5OWQqdBg+aajKQjdT4PNebzgrSKEYv7TSUIwxHhFs5p/whMYTK6zFKdlEXX5d0UF
 3RAFGn71QuCsWFfiJMPrSlNQkxHV8pidDnPXYFh18thdc3cSjP9Q1N9LNfHLmSM/OUwf
 huAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PiCEwek3GwYlV43qpUnwxVVCiWPiDa7KHjCJA4ZX0UQ=;
 b=QM4p/bC7SoFwcMUWBDL3D26p34M0DFzav27yxLuLljCIT4SwGV8Zb53tGcQBggIkMy
 UhX3/F/ETB/BKm0KSN+03gabkymbXIDadgPP/OepKbgbffmc2yHmrKwn0Vw2f6sBB/tN
 rIBmTYel43XyDcJcKJbfypabznPzP1etSZTBW+pewqTxgyUiKEp572YZG6GNlWhE10C3
 00Wlm1mO9hyaqM8DXpmY29W0hrfCvZsAMMe05L8F5Yydte/4zDXdlX8ICywJWjr9Jaet
 OQr/M/G/j0Acqt8mTrbYc6T9g4VkwXFc1XncyWB/ZD8kSHFVJcMB3G6apdzIzwKsb1TF
 iAbg==
X-Gm-Message-State: AOAM5311vWFSW+V9WLyZtZ1gisby9dhsxIRqw84Ov4y0ZiRd3jYTEv/F
 ZSDzU2mkpHWI6cdRwmR6OryD2Q==
X-Google-Smtp-Source: ABdhPJz10N+TBes7c7VQd+tZVK5m/60+N6vJWOcd/0LqTnB1MU0e/stF0NLfw9JVjCjX3XvjIzKQLQ==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr7718660pjt.120.1596710935496; 
 Thu, 06 Aug 2020 03:48:55 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:55 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 38/71] target/riscv: rvv-1.0: floating-point move instruction
Date: Thu,  6 Aug 2020 18:46:35 +0800
Message-Id: <20200806104709.13235-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:07 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 61d913fb4d9..60ec83e412e 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2678,12 +2678,17 @@ GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
 static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 {
     if (require_rvv(s) &&
+        has_ext(s, RVF) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->flmul) &&
         (s->sew != 0)) {
+        TCGv_i64 t1 = tcg_temp_local_new_i64();
+        /* NaN-box f[rs1] */
+        do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2700,13 +2705,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             dest = tcg_temp_new_ptr();
             desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             tcg_temp_free_i32(desc);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.17.1


