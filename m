Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7as5-0001MS-IL
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7as3-0001Ji-LO
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:59 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arx-00058k-TW
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:59 -0400
Received: by mail-pf1-x443.google.com with SMTP id 74so7878140pfx.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aSuxM7z3Zcd8Qt9fuXNwzVvaRXhXe1Q5X81hD5IACMw=;
 b=WoZasPODCnVrPrvyBi1YVI1DHb6PQZ7w1ZED7/y3Wagd88IAa9QgWrypjy+ar1iCmd
 H8FXY6cigtIXNXQ5HoMKmldtxvVzv8IVjMW2nqxPSI3bjY+SVV/kq7O//3dV44zvyWzg
 Etr6PfRKUaTAi6tII74Fg7wAKAsP6Qjq890/zGiM309pnJ1TWkWshGvaGovo1tgOWmJG
 vcyMHScCrz+dbOeJN8wWefydiMczqFIJT0R+5OwVh+h5m/IuC/dLAIFdmLqZepQ6yxgI
 RxovUAJNOa2b2s73PP8lX63fFIFQ3UXY+MTBGgP/DC+TYtQryczbsFOs96jxZ2DIoLF6
 KvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aSuxM7z3Zcd8Qt9fuXNwzVvaRXhXe1Q5X81hD5IACMw=;
 b=Dh2/OU92jPxMQe9xnQmH2JI7CxbrMok9Bv04F6WiCWXrh8rqA1UKRw5u3yMGzXqUU9
 CthKFqf+jxAQqSpkgWJVrFbXk8GrHSpYDfv0lY0y8vG8OQEYVxdFhuKrktO8pokphdss
 QQloi/Jf2TG+U4+xzGai/VfdzIbn6IDIXShZBVkBLNcQDeEp269hnEm15HLCOgLj6g2F
 dqDexpKXsIp/BfAkuJBBiUXt9XZZuyRd6e+BxAUoBa+QD4Itb6oOtz0ipl015UAkA02y
 b+6cM9rzvMvYlCBdO9MgoKwactAxR44tZyMTDnfBcBI4slCZI7PkieUVjIZef9HhRcUm
 c3DQ==
X-Gm-Message-State: AOAM5326xkhR0/jxvWZTChu5EI92Kx9bYqaC9k7g/erzfMg6hkhU+Lxi
 vnzsBSrv0US2O1gSr6DjmREenA==
X-Google-Smtp-Source: ABdhPJwwx2RZogmwC+ZAfV9vQhVgChGrBOzodhyhkR4+TWRI+MB7Xrjc3jYhIzDYilx2hntvK18R6w==
X-Received: by 2002:a62:7687:: with SMTP id
 r129mr10627548pfc.308.1597654312559; 
 Mon, 17 Aug 2020 01:51:52 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 38/70] target/riscv: rvv-1.0: whole register move instructions
Date: Mon, 17 Aug 2020 16:49:23 +0800
Message-Id: <20200817084955.28793-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x443.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:51:59 -0000

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
index 95fdd972fdf..52f2f4902c0 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3479,3 +3479,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
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


