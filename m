Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxw-000163-2U
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxu-00010r-FU
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:18 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxs-0003wf-M2
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:18 -0400
Received: by mail-pg1-x534.google.com with SMTP id s136so4615663pgs.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vdmvfWbLmcGeWgXDRW0D6ZmMBbItADht7h/8ti6BcSQ=;
 b=JvS2UOaiy4z336s3dkJZlHOWlCMk6DbgSmpv3WzRgYt5HqfIdahT6Io41oNeFpTw1y
 hxoOGshJD8MZFKkUFPZ9C51DUUpqlY7kTWqgssDqs9UU913p++HH2ZaJukHDPX0/JNhX
 rGfBRU6Ke79z0IgJgxj7Ur198MgqRMUBvmcfYnUCBNJjw3Hn31MZNYrX9IB8uFzTFihD
 N18aUKPRtRpLXAY0wk6N7EHvNj2hKMLKQqPqsa9L0h39Xyr/mltxEG+0Mll/IThcLu/X
 ad65cHdMw4rLykHOnhUaT03nKbUKkxOArqYd+XQGFWvd3NIIx2flEh86tIcZTcX+ZE8N
 3EuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdmvfWbLmcGeWgXDRW0D6ZmMBbItADht7h/8ti6BcSQ=;
 b=UcmZPqMbBd9A+20x6QcYAU/496sbI1FhWLZUcY0Pvf6USr4wMwL/l6OZfsyPgIPcNw
 f/ZRGWcJn/mlrdS1OY9//aTuznHihcpWHPCG6W0xEMcQRUvJThqnEK0gVhWatOXXYjTJ
 R20X1n1QUCU17gjQLN5qgl5sS7D+FgOs1sr3bKobjnffTUof1V1oqV/lOrgXoK8TpOp7
 OqD69dvk89ueU72z9tZ+dXiclYPbUMliM2ajxK9oYGXnFg87BQ5mU4mUwxrTa2cuSZqR
 aI79Y0zSqNS7ECR86ZSV0itnXwXUPzvgJGoRH66TPxHnjuCxFdaPSFfDti1CLintHTcP
 DZwg==
X-Gm-Message-State: AOAM533cK6WtbcouilSwauzp7JGLmBxdQ2hkBb3ygn+lZWbdMjSpx3dW
 qL5HKQKEkro034HcaGfpuLJl0g==
X-Google-Smtp-Source: ABdhPJwzaIbMYpf4iuh4ztwR6oL8waDNrW7E4A5ugB2Jky8Mcm0QoOeFEFX/c5+3QN7Ab9AT9PT2jQ==
X-Received: by 2002:a05:6a00:1a4c:b0:44b:1fa6:532c with SMTP id
 h12-20020a056a001a4c00b0044b1fa6532cmr10265917pfv.64.1634284153769; 
 Fri, 15 Oct 2021 00:49:13 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 39/78] target/riscv: rvv-1.0: whole register move
 instructions
Date: Fri, 15 Oct 2021 15:45:47 +0800
Message-Id: <20211015074627.3957162-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:18 -0000

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
index ab5fdbf9be8..06a80763112 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -650,6 +650,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
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
index aec0316fba4..5eaf978fe90 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3258,3 +3258,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 16.6)
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
2.25.1


