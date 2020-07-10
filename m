Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsce-00067s-N3
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqe1-0005a2-Bq
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:41 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqdz-0006kT-Nv
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:52:41 -0400
Received: by mail-pf1-x442.google.com with SMTP id u5so2381990pfn.7
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UVHmbybyEpF+C2jSa9zztEcKAVf+X2RtKAWbnScYfAc=;
 b=RBTxFXP32uiwpFitzKh9uK6/Da50jwKRXBz81zUkwDluQNFU4aJw2k8jzovFzl/Czk
 Bygxwu0a8R3gNzD9HUD8RtqWH5c4qAQKKDCKDNBQ/X3BN+V/aaAmtIbjHcgx5rbckdZL
 M6lDs8yhc2ua8umzWnWF0EoEpRSLgMdouhq12KUE4OSI1JovcUL1WyAVkXJy250uz1Gc
 XcxpjGTE2YCd+sOfPEBie6MvNrNuB1QqzVdJozxAlFrdkuj2VIaPC8L3yuCKimnRmUA0
 gPAMTsVd7BHPjgpfJkwpurXLTjlS0dRxc2yaeU269zIEAUE9rJhS3CVV83qLXVkr/3Sh
 NR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UVHmbybyEpF+C2jSa9zztEcKAVf+X2RtKAWbnScYfAc=;
 b=U9SGRAt8tQ2OBG6TSXJwDIHkQsoApR9egFARq+H6gg4FcOV3YvApdqKvMXalmGOgI4
 P/wpuZzXNVhx7STC9cDS7+IYRXKmsffe8Wgx1MFSjYER+q79l8TUtH47lXT7WDeyjNSp
 dq8wg39X2CGHHe5HGr+LKNCpyh1/AFmqDmSg4l2OugDAQdUGrbAcd84y7nwlRdjBzGVy
 KJXCOVGxmPc7LricEgzIgf0TQCT9yhd+vdc6GK6cjLDI8X+POS6AkKsIZFU7Zic2W+9V
 9pg9nL9Pp8FkI1Tb227xF1CyyC8PI2uyuxn5vKaX3lpZQEeDRJ350ZmhTKnbzNi2EoV5
 ppjg==
X-Gm-Message-State: AOAM533o98pitabgx/6vGnlJLqvAQjl2XFwN8mwz7c0ICin+TAKqj3v/
 s1IEPH/2VbSKkqpShm5Txs+LsmaxnZwuJw==
X-Google-Smtp-Source: ABdhPJxJTDXko7VGvwFydiHdtgwU9L+d6TeFjVG7ZZvyo/1V58hcieb7geB5UOr2CioVC5/OIOAH9w==
X-Received: by 2002:a62:8848:: with SMTP id l69mr56796909pfd.314.1594378358527; 
 Fri, 10 Jul 2020 03:52:38 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:52:38 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 31/65] target/riscv: rvv-0.9: whole register move instructions
Date: Fri, 10 Jul 2020 18:48:45 +0800
Message-Id: <20200710104920.13550-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:58:59 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:52:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.inc.c | 26 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4be1b88e2d..0e1d6b3ead 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -595,6 +595,10 @@ vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
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
index fcbcfda050..41777c7f93 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3221,3 +3221,29 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 17.6)
+ */
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                    \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a) \
+{                                                         \
+    REQUIRE_RVV;                                          \
+    require((a->rd & ((LEN) - 1)) == 0);                  \
+    require((a->rs2 & ((LEN) - 1)) == 0);                 \
+                                                          \
+    for (int i = 0; i < LEN; ++i) {                       \
+        /* EEW = 8 */                                     \
+        tcg_gen_gvec_mov(8, vreg_ofs(s, a->rd + i),       \
+                         vreg_ofs(s, a->rs2 + i),         \
+                         s->vlen / 8, s->vlen / 8);       \
+    }                                                     \
+    mark_vs_dirty(s);                                     \
+    return true;                                          \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
-- 
2.17.1


