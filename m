Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNm7-0006ax-QL
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNls-0006Fw-53
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlq-00067C-Aq
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:55 -0400
Received: by mail-pl1-x630.google.com with SMTP id t21so6401151plr.6
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1milFWRlxmjHs2wPWKUhveKm7jJqNElG1gH3QnTU80=;
 b=VJz+zVmxxtCeZ8hfJlhiGkWmgT4lpXFoErIGpr90d3YpV+0VcjlzpwOi5fMBSCqs7s
 5XxempI0IaOdP7TGKpqZz7qPiBWkGxR8ay+8JkRsqGHMifvo++l3dA3OZrh6QcUFiJcG
 vyeey8TJMcsTiDyzlOPpeQl1SaB17UckItaGjtouUnFbimCNcfUzaMRivtQBme1F13+M
 r1O2hQOnpSjP2l4SQM38pv2vr6SDxSp2mYBf7f1/bIpzlVGKhPxmZDxUVuukIEpSdvAd
 aKujD0zEiV92e3GBDNOjP3ZjJQCkAn4hxCqwnorXDR877sSw4fUVY71ZAW16S08ZZH6j
 1O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1milFWRlxmjHs2wPWKUhveKm7jJqNElG1gH3QnTU80=;
 b=wclKtwxRsVVtZZM4Ejlk3bUDoTSj0cr5agBz9CNkxsKPzZc8MsJ3UKvsbCB4E+WlE8
 kRrQaXvetfkiu6lZ65jMJbQBhMPV/RaW86OEy+LhHMmunSZRSCMZIdiH36dvoSyvjkdb
 6aevi0HHINXU3w86hrd/tOBkWZzQS93XoHrXf81OaRe+iu53pDG6umc9KXFS7yQiwNqK
 LdRS71vuCxs/CbDaJYI+X7vzMzr/eThmSUxgEeYHjQml/xpFj93Gad55GsiYVF/4Vgky
 SXjiziZOk+kwLSXaiKNsVDQqsb+I0OvI20YuxjGc7uDg/fkJkH0u2kNSO4cSZTBQIxTu
 JB/Q==
X-Gm-Message-State: AOAM531+yH/10sOgnjtDoi+HQAZ1LF91rwR9u6L4thVce5JkLFpoP6mH
 6qBOreHFBWPOX8beagHBNmn4cg==
X-Google-Smtp-Source: ABdhPJzrwiKfO7CgKq/Vi4Tcxl+cvJivycKZVMzX2m/iK7B9e6OzWTn/5FrSFEE8t8OAQ2HfcxnDJg==
X-Received: by 2002:a17:90b:1c09:: with SMTP id
 oc9mr18257736pjb.33.1635498113161; 
 Fri, 29 Oct 2021 02:01:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 37/76] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Fri, 29 Oct 2021 16:58:42 +0800
Message-Id: <20211029085922.255197-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:58 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c250943dde8..2c8002af543 100644
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
2.25.1


