Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2On7-0003GQ-Im
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On6-0003B0-Ei
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:12 -0500
Received: from [2607:f8b0:4864:20::102a] (port=55962
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On4-0004bu-No
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:12 -0500
Received: by mail-pj1-x102a.google.com with SMTP id iy13so17325689pjb.5
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsCcWlWnK/y8bx98uJLBXekQNGdwFDxga/0IN3bxlvI=;
 b=OJUf/QRwdYLVTuUFPPN1OxWtjelrrZhgetMyqHcoFjXUcHwfbbrDBv0JYcq/6JrC2e
 Ihxv1T8oFR1t4Vra8KTuOKb/fW2oDNsy4mHeW69TpWo/YI4XTUrd8aqwPzbP5evoP5W9
 7BU1g1eZu5AiEz+qFCtkHDvnQeV65kGF+dggLbc/nP55AV6FUl8heUdSSiv9S439f1fb
 U3O5vLV9IzrhHZQ/JSawKsGVMNGNGD1VpUvdA1/r6SIyC0EeUM0flMVkS8JAa4BQcUsl
 bZQ5ykRQqPS0/PGY0rjOVXZoo3d82H4N3wFGpr5Vwc0NAERnE1yfrXWAmnIAdhPmQks6
 LWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsCcWlWnK/y8bx98uJLBXekQNGdwFDxga/0IN3bxlvI=;
 b=K6iI39P8jcwAzh4nV9W0JHrusIVYFwwJNZ5DbeUtfIwmKNIXEHYBxtf6n4SZwRHDRe
 5G01ydgneaOf0WMYRYXDvP+6VXb7IeNtppD1efb9A2XL49vyAneRx00kACuuCb90JyzX
 hd6o0flXr497VJIa1MrHgIorwupa9An/KrTrpc0EkAR7k71Ys/aP8OE+dDdirObETBF+
 ReJCvzV3ViI4AtirQJKe1i8x3vL2C5wxaT/fLqsN/OIx/zdGcADBWdx3SnEIImRk+x1V
 1jXg3rCxJyurZdL87Djuu8hKMd37qqnCKTZcS7ysnGOZUdJu/7142lcVwHQwcMGnqGip
 B05A==
X-Gm-Message-State: AOAM531Cb4onnl0mVIA1MJFMJaOS/ixuljhyUV+Ln1t5UJzR5taF9I3W
 hFUT6TqgquDSG71zEWFoA/z1QQ==
X-Google-Smtp-Source: ABdhPJwqhsZsLbaICCFKRZCWbUW6msj4VNPzggoqfsekmdAidpDjd7XWTlM3WUf9bI+yzV4RNdPptw==
X-Received: by 2002:a17:90b:20b:: with SMTP id
 fy11mr29909676pjb.238.1640745249595; 
 Tue, 28 Dec 2021 18:34:09 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:09 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 05/17] target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv
 and vsmul.vx insns
Date: Wed, 29 Dec 2021 10:33:32 +0800
Message-Id: <20211229023348.12606-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:12 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector fixed-point arithmetic
instructions, except that vsmul.vv and vsmul.vx are not supported
for EEW=64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 658cfbe10e..a1e403fe86 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2121,8 +2121,31 @@ GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
 GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
 
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
-GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
-GEN_OPIVX_TRANS(vsmul_vx,  opivx_check)
+
+static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector fixed-point arithmetic
+     * instructions, except that vsmul.vv and vsmul.vx are not supported
+     * for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector fixed-point arithmetic
+     * instructions, except that vsmul.vv and vsmul.vx are not supported
+     * for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
+GEN_OPIVX_TRANS(vsmul_vx,  vsmul_vx_check)
 
 /* Vector Single-Width Scaling Shift Instructions */
 GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
-- 
2.31.1


