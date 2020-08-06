Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dST-0003RX-DU
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSN-0003Hu-R4
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:09 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dSI-0007wd-2t
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:07 -0400
Received: by mail-pj1-x1043.google.com with SMTP id d4so6278646pjx.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Avnu70PdDYkSdW1ScaLQpwE2+GGkyRo7iSkv1USbDyg=;
 b=lBCm8GXD7Sw5LX0fF7w2YUT2MbEHxlK2FVzGGuOQ+C+cPHN9i4I0HRXj9d/8o5s9z3
 BB/XpHaJ4J7Z+g/vq/DajMQUcBeOcTh8Im8vlu36l7qvEKIX0a6/aH9Y/KoP1Ya9LSr8
 laia0Np/ZgupkJwlJbgff1e9c89qY3jYJfd9GkmpUhyoUSwmSv/nMdUrSFftHGDji0Lv
 jlTH8I+fuIXJq3YHF8Kv3Gu4lTAe2rwiZbPalDy7O0YamMwLFy0jWpJSyB1H4WgYKrd0
 7kpcfMOiw70MCTnyzHLChuFnedm6SZvC42r4wlbLf3plKsTjJeq2Eyp2C+P9F9Zjv67a
 s8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Avnu70PdDYkSdW1ScaLQpwE2+GGkyRo7iSkv1USbDyg=;
 b=uJpyXQV9KS9UsxgaZ5EUl4AptbNkMw8/oapoKNh4mcMZcs7+9LmeHOEz9O0Apnwh5J
 q/5OQouqmBuovjIjAKX4lhJ/sowv/R/AMzeMffVwhf/8+LHqsRMmdzavVacz7/R0BA9M
 jii48jsgwnJrmXjDwQ649hHlQw2QnLl3YMwz0S2gvMkOh0wYFu2xj861IR0grLmn4YV2
 IEhiMwJ2POqRxl0IeHN6V9nBT3wBPrNpMHESZU55dcKgC2LfieclckSSxrAT25bRu/YA
 6uwEj/SgCRop7IvelZOv3IzETuPqqi3amFdJFlAmVy9DNXtAdztVqhw76mDXVTgg8Ep9
 GEdQ==
X-Gm-Message-State: AOAM532XXSPoxwSCmvi1HxN0e0MjHocybAayMUc44Kl4kkHifuEYqK4C
 HtgUbuwcUsgvqW81TzL9OXW6/Q==
X-Google-Smtp-Source: ABdhPJwQ8gTCYNz+1fpDY958t5Yc/yAemBC/CKw5cGoMdpxOluiIWYIPZHYlDRMBmd0BYJNVMlyf0g==
X-Received: by 2002:a17:90a:4701:: with SMTP id
 h1mr7645844pjg.93.1596710940219; 
 Thu, 06 Aug 2020 03:49:00 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 40/71] target/riscv: rvv-1.0: whole register move instructions
Date: Thu,  6 Aug 2020 18:46:37 +0800
Message-Id: <20200806104709.13235-41-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1043.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.inc.c | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 97fce34fcd8..65ff1688c25 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -614,6 +614,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
+vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
+vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
+vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index f5d72d68a79..c3fe5d0eee7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3466,3 +3466,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
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


