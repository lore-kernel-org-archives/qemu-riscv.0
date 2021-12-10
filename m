Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaom-0006yZ-It
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoP-0006Pi-0A
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:26 -0500
Received: from [2607:f8b0:4864:20::42a] (port=47042
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoJ-0006we-T9
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:23 -0500
Received: by mail-pf1-x42a.google.com with SMTP id o4so7725846pfp.13
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1PDrJurekp2wH3fJ/RTfcDQtMF0yVqNfYlitdBh62M=;
 b=hvManDjf7xomierP51vkytvL3gEoyQSyCHJpxv0KHdZc1zy9shL2PiE3bPSKu8Sak2
 XJESm95enY18qied4U5mpVagrbmScqREjIL98OCSIUPsoMltbClvg9TlODLxhYhwB+YO
 5tDpstocaaaC1+Ov0spUIdTUI/ooEN3UgR2SRzxW1+QQ4HAVTNtHevIOJ9qhg5rizHON
 ZOQN5PfxnP1MhOxhtVv7y5nRs4SDiQKfzVOtU/gZ3LrfJE237VrRhhRseOzzT19BmvRo
 wBOLraMj0fL71GG2855T2bb69HXFUXaaEqA6fcBiBmSERwxwDFHBLWyjCOtIBs87539u
 RO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1PDrJurekp2wH3fJ/RTfcDQtMF0yVqNfYlitdBh62M=;
 b=nyg/o28MVbQOQB5+0iOqnlNOKUJyOLq0+xcX6PSkoKcbg29MOyWKvwUPTVQhk8goNJ
 xtHn9FGGoHE7T1p/s+RAsNobtwWGSy96y327ksgsirvH9aEQYPtZbNNzARrgxLr9KgeV
 it8S1IVIGGKNbeQIroWG/P0lsL/qUb3k+LMhfnz8uG/432Tf/tEDo730tGBKB8dp8IXB
 rIRPtUrzhGmv7M/JrCZjZkdDGWg2IGMFD4dbHW+4Cfn2LQt4CqAJq5nNXh51yzMmweN9
 5Qx7+drEvIUDnt2U/0+JOK6FuqNC7Z2aIdxO8feUGXb7O8kppzXkZyHItXtgAnNVyGd8
 y3Ig==
X-Gm-Message-State: AOAM533CgCnJMfNzXQSJ5chgoX6zE7RU33B8mN0o1XMTm6mtaoaDqx8T
 x7hvAykWQO7mISGZHl1mSuJApg==
X-Google-Smtp-Source: ABdhPJw3S7AoDdSflienkRVlBDQ5uR1qF5aVzjKIMjJHuDDED8LzEAoinTGm6XWFsZ69s3x9qUZVSg==
X-Received: by 2002:a05:6a00:248a:b0:4b0:b882:dfc4 with SMTP id
 c10-20020a056a00248a00b004b0b882dfc4mr6247197pfv.37.1639123153762; 
 Thu, 09 Dec 2021 23:59:13 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 39/77] target/riscv: rvv-1.0: whole register move
 instructions
Date: Fri, 10 Dec 2021 15:56:25 +0800
Message-Id: <20211210075704.23951-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:31 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ab5fdbf9be..06a8076311 100644
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
index 89f88a0ea7..91e7c14ec4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3259,3 +3259,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
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
2.31.1


