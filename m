Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7at0-0002a1-CE
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asx-0002Vb-0n
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:55 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asu-0005Ia-2k
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:54 -0400
Received: by mail-pg1-x533.google.com with SMTP id s15so7792029pgc.8
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/VjgtoZ/Qc8BN8wsuvMLDZei8FtnK1c5d11+rmHqi2E=;
 b=hZVITFCO7ABbzuRMqZG3FDWUc7p9Ku1JYO5MsPP/tcSvGSG9zij7evWlpPZUWSmOfz
 /sNSuoojWIcLCIEM2lPDuFQpR+2thm8WjLke7o255nMQ+4bIamt39k7JC3SqWS0Bzi8a
 +w/1JCr7jgxqGa2zBzhiI06tR6CM/nu/pS2o/8wsFXSSXsnsixwXc8bvEc27po5xbTRz
 w2/A5RHqnv33rvi19UqWF9cGqzheQiMOhmoGOHY1S2/UOYgN0ozr2NFpxaD3ynMM4QPf
 v4ijZmSQkneVG3GwauuCmsVNUdLyAQEP4fs3chuEKrRJ8fC5Vdq0GoKpbDtA4ouSCWpk
 WyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/VjgtoZ/Qc8BN8wsuvMLDZei8FtnK1c5d11+rmHqi2E=;
 b=F6PG+q9tfPSbH8dzMaM51/qIv0HwhP0WInCNhwUck/5sfPyOAv32vlMOaPab9GKFoL
 AKcfZPydwrmEHrqRBOqUVqNNFz7B2FtkAnXoXIiX92LFRO+UgJykrveN+aHMJVdRUxyM
 NzG81cSok9GYFOumBuF88fB9Ymi2pcQuHle9b7OHS7GF53aTCuBJsVlEkmPKybXGURKJ
 rm/ShU0NYbFhmGRV98DRIQ02mqyjXKp1XfLrm5S6w0PsGr285ZXvrxLP/lBaRexUfXDg
 Z+zIDb7i3wsJZoIh1CBq0QBY/0v9qQ4/0u7aPOK8vhnhrcNWwFlZBlo6iPg/uXg0VW5u
 coBw==
X-Gm-Message-State: AOAM531gqXgDROg1Hds4Y6bxv8zJYVU93JjaSU0ZQS2/7K8NJ13H9Y4d
 qU5b/BXhAvAc4yWf/zfmK3y6bA==
X-Google-Smtp-Source: ABdhPJx7TLCm/XlbOtPV5mov01H3aXFbl87ZU5m8qoKZ8IuZ53zESgB1d2RNoRIFYfbMSZvsSRoQkA==
X-Received: by 2002:a62:8105:: with SMTP id t5mr10715260pfd.94.1597654369700; 
 Mon, 17 Aug 2020 01:52:49 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 59/70] target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
Date: Mon, 17 Aug 2020 16:49:44 +0800
Message-Id: <20200817084955.28793-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:55 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  6 ------
 target/riscv/insn32.decode              |  2 --
 target/riscv/insn_trans/trans_rvv.inc.c |  2 --
 target/riscv/vector_helper.c            | 13 -------------
 4 files changed, 23 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ac655b8f274..a9ec14c49ad 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -963,12 +963,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
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
index 99320705cca..994ef3031b5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -553,8 +553,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index d3b1499c64c..a1d6f7a844b 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2765,7 +2765,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2781,7 +2780,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1aeb3b5e4aa..600d2b53353 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3883,19 +3883,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
-static bool float16_unordered_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_unordered;
-}
-
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


