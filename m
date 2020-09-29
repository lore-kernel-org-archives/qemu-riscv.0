Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKzT-0007kO-9S
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzR-0007gk-Ey
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKzO-0002T4-Ve
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:08:41 -0400
Received: by mail-pf1-x42d.google.com with SMTP id k8so5551329pfk.2
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LYp7yzSpA6P9AuNWWp5LWQ7vaSkBmM6AQZoYO+4PhEk=;
 b=FqqT9phaOTYSCY8r3sV6NY6V+tBfltmi16nD38P9/RuvRBKbw9tq5madg8ol2nlVi2
 DapcDM1Qup5idwn8l5lqBOveD1fJWQ4F88tZcWppwrhL8XnL7UcHsQonsk1iKGQOHDeS
 CIvhuNZz60LfAgHVi23POVIYg+OGYlIkYyq4QEKGDW9IQkjmZvZxVV0P6AJElKWzyA5j
 cbCb5+p116frkclz9+w2G9ARTjRtcNzsGbdKt+pYpsgjjCwG6kFfz/yodoZ0+3Zv7DNL
 mN2iYezznkjDctmGKZ64Ajn5q4Nbc/5pYN9trEi+GyZzxvLxvCOsi/EArWNOGNvzB7yW
 ai6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LYp7yzSpA6P9AuNWWp5LWQ7vaSkBmM6AQZoYO+4PhEk=;
 b=MKrcY7Cjdx+dXV3dwgTTI7vipjjO0n/l4H4VuQ1xvn0Cp5DxgGz2t5PKr0V16brrNy
 N2e85aQXOt2Sz+AR1Nk9gCt8mcNJOVBFB6/EvpFQjgbtCiR0VMGEYRDUQpdJrhiyDDHH
 tDomEt+oisABvp84aTBwmHoTERkQDopV447y7+SumQXyLYerX4pHb3q4tTW4yvZdVnzy
 rcm28Pvtzho4ZPwqxVRlfsUVgQkqUSEKAeBAjcwgwsCeIh7kFxmVC4a07ISK9iJxiXwc
 51zvPMl0OgwxkRaKq3gST0e1bSsMbvwSIGVVmgME+fu0qnnnk8kJJKCFMEj2XTdxh69M
 7esA==
X-Gm-Message-State: AOAM533cGtAboM2SWHt4pvsih3914fjU7Ubobq4h+7s0GSX+4m2QWC3Y
 3pZlLScan2dMsI6dkcC4SvFc6g==
X-Google-Smtp-Source: ABdhPJw/2oseiG+hKIZ3tJ7V5pWKj9p65BqdVCPBcHsFpCZKFVJYhlpFcTn1645aOvDB86dMDF52PQ==
X-Received: by 2002:a17:902:d210:b029:d2:8084:7e5a with SMTP id
 t16-20020a170902d210b02900d280847e5amr6145497ply.68.1601406517781; 
 Tue, 29 Sep 2020 12:08:37 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:08:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 56/68] target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
Date: Wed, 30 Sep 2020 03:04:31 +0800
Message-Id: <20200929190448.31116-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:08:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 6 ------
 target/riscv/insn32.decode              | 2 --
 target/riscv/insn_trans/trans_rvv.c.inc | 2 --
 target/riscv/vector_helper.c            | 7 -------
 4 files changed, 17 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 24d575162d..cdaf427060 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -952,12 +952,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_d, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_h, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_w, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 
 DEF_HELPER_5(vfclass_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d6468750a1..db84c0d1c9 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -557,8 +557,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 20781ab5d1..9225780145 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2673,7 +2673,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2689,7 +2688,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 549a476490..c5e6572012 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3839,13 +3839,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
-GEN_VEXT_CMP_VV_ENV(vmford_vv_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_d, uint64_t, H8, !float64_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_d, uint64_t, H8, !float64_unordered_quiet)
-
 /* Vector Floating-Point Classify Instruction */
 #define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
 static void do_##NAME(void *vd, void *vs2, int i)      \
-- 
2.17.1


