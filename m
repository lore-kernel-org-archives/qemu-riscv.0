Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2On1-0002sk-6C
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On0-0002pf-3D
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:06 -0500
Received: from [2607:f8b0:4864:20::1030] (port=52043
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omy-0004al-7z
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:05 -0500
Received: by mail-pj1-x1030.google.com with SMTP id v16so17349619pjn.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jEfPTH8U9fZZujs2PcXy4rz3l/B254JUiN9Bojizgh0=;
 b=d1I75DLAHmy3FIOdaOWLACGCvVWGuFL8kBOl5p5RqcA0lpJiRlKAcQprf9RbN/uKBl
 Ew++UHuxpsqwrShSND26+XE+TCJxPvUKnv/M3YHBx81dPe9B1iMoit1QO1XbDqVfGpKt
 kkGQ4kaoC7Ki/qG+2wCerRk38uaNUxCOqN/TmeAqYtP6a9piT/5xnsr3aSV9hcaTCYCl
 K6PC9FmU2wy7m54zXKzeDbt2hnoal4F3VZlPVfUvq7hdR4YuSUy/6FpI2BAOEMpFZRPZ
 U/EQgfj1XB9MUpRYRnaFw590TODd188FI1zl/ZZzlpdH65/jBM729MCct0N5KF05zAS3
 Xedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jEfPTH8U9fZZujs2PcXy4rz3l/B254JUiN9Bojizgh0=;
 b=ZKMFIBajHbAET9ZVE6QIck4vFGxjCBmVNFuD7ZXKKtIGCoIerzi9ORFBSGOm+QmPl4
 6/8llII3bMYyhcg4TCZ+QT68+oTYzJMmdUhOhAziAIRYLC/Dr6rGMI3VysNNb/sx9hqx
 CH3CyQqsBDxfYbV4IieXCVRGY9IJeT4lCYL5ZZMvf0MRpITnNdzt4X0VGXwUp4r+6CJD
 MGSMP/ACp6M2uW2UHFxDJ6C41PuNAB980tTugaIPQOBS4YhH+70nnnW5ry2RwtFxregY
 QF6UphRN5dgjl8oaaKnrfJU32d6IASYpMkAAI+xot9u2CZuQj1jrOohMAWFuF4v+raET
 aI/A==
X-Gm-Message-State: AOAM532+uzgV7GdMQ9NefRXo3jSahTClzSu2EneYw23zomlez9mnKLl9
 Z3Ek/nDG1mJhk6UaQqr6WcwiCw==
X-Google-Smtp-Source: ABdhPJwxk02zcON4caB+HnpOiluOMcPIWdUJj6lZiTylyX2J5/GtjqDRGG4RHUTNnfGrFU1iipZ2lg==
X-Received: by 2002:a17:902:8b89:b0:149:9c7d:2fb6 with SMTP id
 ay9-20020a1709028b8900b001499c7d2fb6mr1381362plb.68.1640745243061; 
 Tue, 28 Dec 2021 18:34:03 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:02 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 03/17] target/riscv: rvv-1.0: Add Zve64f support for load and
 store insns
Date: Wed, 29 Dec 2021 10:33:30 +0800
Message-Id: <20211229023348.12606-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:06 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector load and store instructions,
except Zve64* extensions do not support EEW=64 for index values when
XLEN=32.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5b47729a21..820a3387db 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -263,10 +263,19 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
                                 uint8_t eew)
 {
     int8_t emul = eew - s->sew + s->lmul;
-    return (emul >= -3 && emul <= 3) &&
-            require_align(vs2, emul) &&
-            require_align(vd, s->lmul) &&
-            require_nf(vd, nf, s->lmul);
+    bool ret = (emul >= -3 && emul <= 3) &&
+               require_align(vs2, emul) &&
+               require_align(vd, s->lmul) &&
+               require_nf(vd, nf, s->lmul);
+#ifdef TARGET_RISCV32
+    /*
+     * All Zve* extensions support all vector load and store instructions,
+     * except Zve64* extensions do not support EEW=64 for index values
+     * when XLEN=32. (Section 18.2)
+     */
+    ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
+#endif
+    return ret;
 }
 
 /*
-- 
2.31.1


