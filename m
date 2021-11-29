Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX18-0000bG-Eo
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX17-0000WY-CZ
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:45 -0500
Received: from [2607:f8b0:4864:20::102a] (port=50952
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX15-0000gd-Pw
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:07:45 -0500
Received: by mail-pj1-x102a.google.com with SMTP id x7so11548945pjn.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrM11z8306OeDA9HI3AbfeDu222nNxWn77R0ZaUGsgE=;
 b=MHnYAcdpr6w+ObAJeE3ZzGls6HwnyFtZkvmgW3IvAw1xgUYiZs3l6y6wD0E7XCGO6S
 4GR9DPPVrD5DcGyaKqgCfyQB6LOl51WKHAPS94DzFRHa+XmQMtO9aeUhm6vbbrae22Ti
 gbFxVfOrp4FFXMRAAvYkOG2FUpgIQEcyh4l3yvfycpR/nmBvemrAbuGmmrdgkGU4bNUt
 N/+lNnp6l3p8m5HiiyhSBzpRaxRWfcJFr4KiART9q/geTbHG6GbVV8XhXECGSBAZZksE
 R4RA/KHERZVYk5vV8murjAuB2c7zU1DlPoUDCuF0KHba0dd0Pz4SZJaNpBfeMczNwl12
 5zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrM11z8306OeDA9HI3AbfeDu222nNxWn77R0ZaUGsgE=;
 b=ky8fVWz9ltbFJZfSCFHXXNlPT2y26oOgMRCMqu0W5Lb2ALZKxi5g+R+0U42ZiODRXD
 dOmNSyI8TPlScrHNg1UV4wQylDosh5Ek5ZddPVGagYmmPO7kUZRi8oQYF1yD8vuXUrLy
 XQdmEz0zbtHswOYAw2GAqZ7gP9Lk5uzH7JJwOxifkGRlUrVOjV+ainbQ6YnGBFFD0vFJ
 56Wy4s4Fiowlcl+d9lXf9V3yJI/e2DAorBpF4Qat+D2DMt8bEEhmcCQDSM+7YI+6Nlj/
 b/0mYgrs0Xe/xyKAi1W5OL6q0gN10baJ91AaiS6ZQiBCb0FeWwJqwVhywi+Nfz48xYy3
 jnMg==
X-Gm-Message-State: AOAM531sexR7mnK49yg6OV08eGtEzcztWr6ovE09JG1Bz6lKy5TInUXj
 uPVjcsreYuKB7zUWk/VbhZNkwQ==
X-Google-Smtp-Source: ABdhPJz3GwUYa3YKsCixWYT8TNSb1cba2fqVLmKThfZARz41dDPOYk6Px9H1CKNLupeFZBIYNO5Dag==
X-Received: by 2002:a17:90a:6bc2:: with SMTP id
 w60mr35234072pjj.88.1638155262725; 
 Sun, 28 Nov 2021 19:07:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 47/77] target/riscv: rvv-1.0: integer comparison
 instructions
Date: Mon, 29 Nov 2021 11:03:07 +0800
Message-Id: <20211129030340.429689-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Mon, 29 Nov 2021 03:07:45 -0000

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 9 ---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ed4554b6a1d..804f423d5bb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1809,9 +1809,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
 GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_SX, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_SX, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
 
 /* Vector Integer Min/Max Instructions */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e885d4d3539..277a5e4120a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1190,8 +1190,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1202,9 +1200,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1243,7 +1238,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1254,9 +1248,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
-- 
2.25.1


