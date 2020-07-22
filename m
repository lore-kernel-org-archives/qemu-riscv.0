Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvS-0003DV-FS
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvP-00037U-TS
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:31 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvN-0005oI-VZ
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:31 -0400
Received: by mail-pj1-x1044.google.com with SMTP id md7so873270pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RsjYqEd04rZOwTgEVDJRj2EjmbnjKZAUxlfDmSey2n4=;
 b=QMqHoraymo6ZHu3en9HR9qnl7q2fRz62DP7dLa+JFXPOwP/34xN9hdEVaEJ+XQPKH3
 iiUAnMaZLam1BhEYlWRC88C2ouxKbhW36tC1DmLyjU18agmLuF2Szyole/yvK+eykDCe
 nR7TBcatauOBPCOMmSIh08gNkXg6EJEi+YeJOSzOHsVrZAnc5oagnlZmuo9DiaTGpQBW
 +h3tXd8LF4XozNQur8grG9iYEeccQS8DvE2k9utbMWWCYJyhHTMgqoMipLwS47sJaBES
 +9amxzx9GhoqE7OU2UeYBDisS879BCMXina7IqV2je/2brCvcOkcDa05HUO6JuSMl585
 TpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RsjYqEd04rZOwTgEVDJRj2EjmbnjKZAUxlfDmSey2n4=;
 b=aj2bh8nIbhpc6GCDOQuPtWUgmK0/b2cyh6ahiBvofm100cj6MrgHY9PExnhher4+NV
 29NsJyv6/nNtahUKj6RMIioTnbfZR+pjblvpxjNo/CEUPwUNuhroITwh7gPUE965mLHn
 L6CtyK650gNkuFG8HWyZUSuTKPWuCv/Evd13yp/FGv02+hgDoXSxlrmxHZFHJQXnGcs5
 e3wZcg+yoHrZlNd6WMXWmIc4d/hxFC4TklzYXuHHY2v0P/J1gIXps5QBsgYTeLhAYZrc
 MZK1R+dnimVWlZezIAHQWaMu/cc4AgJohPhCR8nhITlzHq6MGB2+/waH7c8Dsjqo+BF+
 JvoA==
X-Gm-Message-State: AOAM530ifrNl6W4wtfYX/7dxHAXJ6o9RrKYoEfX0vc9u+gM/7GwniAjq
 DTvEbX/rHTChY4zcTOM45kXDIg==
X-Google-Smtp-Source: ABdhPJywhaIt7+yrWBwlfZyqEcv6IC9+qMUk6Jj/gZi5Uasgn7SIfSpzT03acDxT8QRD8vom7lQFww==
X-Received: by 2002:a17:902:b205:: with SMTP id
 t5mr26305231plr.7.1595409628847; 
 Wed, 22 Jul 2020 02:20:28 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 40/76] target/riscv: rvv-0.9: floating-point move instruction
Date: Wed, 22 Jul 2020 17:16:03 +0800
Message-Id: <20200722091641.8834-41-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1044.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:32 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 0.9's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 780f8660bf..54c08ea1f8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2722,6 +2722,7 @@ GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
 static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 {
     if (require_rvv(s) &&
+        has_ext(s, RVF) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->flmul) &&
         (s->sew != 0)) {
@@ -2744,7 +2745,20 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             dest = tcg_temp_new_ptr();
             desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            if ((s->sew < MO_64 && has_ext(s, RVD)) ||
+                (s->sew < MO_32)) {
+                /* SEW < FLEN */
+                TCGv_i64 t1 = tcg_temp_new_i64();
+                TCGv_i32 sew = tcg_const_i32(1 << (s->sew + 3));
+                gen_helper_narrower_nanbox_fpr(t1, cpu_fpr[a->rs1],
+                                               sew, cpu_env);
+                fns[s->sew - 1](dest, t1, cpu_env, desc);
+                tcg_temp_free_i64(t1);
+                tcg_temp_free_i32(sew);
+            } else {
+                fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+            }
 
             tcg_temp_free_ptr(dest);
             tcg_temp_free_i32(desc);
-- 
2.17.1


