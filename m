Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKyY-0006DO-L1
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyR-0006Bj-Li
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:41 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKyL-0002IF-Vr
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:38 -0400
Received: by mail-pf1-x443.google.com with SMTP id k13so5552945pfg.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QjeNqivyDQYGdBGUS9rzIEh+c/L6ydzuKMswZA5RVck=;
 b=ALlbZhaE6Un4OWI+Q7/PKp/vMVJ8JR1dd1prqFgJ3W4CMCNvCPYtc6ZeEFq1nH7PRv
 YkZXacvZSU3brsRwbwvCX1+FvBI1AUhr4+/N2jtoZoPseNz8FcWjh0PSpJvWQmy3Kd+M
 WRKlcQ+L/Uue0ONUTTozaHwtuys0lbWYxvw+3iaXgc+hMk4aJrZXm89bNCRopIciv+je
 UYFeSF+g+sMMtyCPOQSOOkREOKXWvSGmEnSCpqx37Lgi5eE4IxyihPoeziuJuvxpLJi2
 q75KMhNSi91OVujKxpmtUVYjTSOy9GGAf3Pi98KpESnkP7v+zath3WBhRqnO8rxCV7tC
 hh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QjeNqivyDQYGdBGUS9rzIEh+c/L6ydzuKMswZA5RVck=;
 b=mH/DSza8KkA1oswPOF297ggPIgOxPqyy3skN+e1XrXJRUa8kr5SD/SyBmQ1MJ3veNT
 utb08FKjqAcfDBG2+XGRft0DSh3QuKTgJ/rew+3kUlxWzmMLVFykpWQ84v9c3GoUopE+
 Qbh5N9khLkXRevNeVEW4GE8GZLrflCZjtpIdWkWbjhuA92KbZEz17lF7urDqUSIhZ747
 8As5aeChR2tTx+9SkVOeGgXS1OF0HqchwDFJ5KrIiheeAqMmBfE7yiJ9aSLKS0/Qqnzh
 TcU2UqybcOxxuMtgT9w9Ac7LtmGEdPHMof5c/4VJqD63dnALgKvlG/RLhlTGvNXhqtsC
 +g+Q==
X-Gm-Message-State: AOAM531HgOc/AqFLrZZTcu+vKNem22zkEyXIDRc3/cFrQ3T+8UPr9YES
 WVCmCVxovW8dKOcMzaTINDKuSw==
X-Google-Smtp-Source: ABdhPJzpjAWjqkebvSVMpvv4xe5b8hAa9SrOZ3hWhMJNj8KHhFoj70m2wWz2S/wV5GJQay4K87mr1A==
X-Received: by 2002:aa7:9182:0:b029:142:2501:3977 with SMTP id
 x2-20020aa791820000b029014225013977mr5452038pfa.60.1601406452605; 
 Tue, 29 Sep 2020 12:07:32 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 38/68] target/riscv: rvv-1.0: whole register move instructions
Date: Wed, 30 Sep 2020 03:04:13 +0800
Message-Id: <20200929190448.31116-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2a1fc1dd96..2280627553 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -625,6 +625,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
+vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
+vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
+vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index dc2d82bc96..dec3940663 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3497,3 +3497,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 17.6)
+ */
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
+{                                                               \
+    if (require_rvv(s) &&                                       \
+        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
+        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
+        /* EEW = 8 */                                           \
+        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
+                         vreg_ofs(s, a->rs2),                   \
+                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
+        mark_vs_dirty(s);                                       \
+        return true;                                            \
+    }                                                           \
+    return false;                                               \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
-- 
2.17.1


