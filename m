Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2On4-00032s-Cm
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On3-0002yx-BJ
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:09 -0500
Received: from [2607:f8b0:4864:20::62b] (port=39548
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2On1-0004bA-GE
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:09 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h6so10988332plf.6
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5BjYN/Qmz8BZog3r8YldBNpOG88WmJHhnqNdxU3htQ0=;
 b=BDP7yl4xphrcJGao37+LWZsGa1Z/zq+du+snSK61nLcUid5UGOuXDRSk+HRLJuCyow
 qnaCXlAfHa6VvOHu9EfCeoIp0OLO3PLona6Tw1nvYX3UC60FMKGnINTBTz6LR6Qv9IHm
 FNCgI+oFv0DFXIbG8acIhxPrRzFVZzu3jShHPivN5IpBw2jitTNrtszXxJuuqejHg8TI
 BE+qM8Nrv4sttOi6Y7aazM94cI9HJjKa3z9kHYHtpe9MLt93t1KUwJy5F+bbulHrOJKf
 cRaJ8oJPKBQ5xtIzDU9i2i8zg1wNcjs+njBRC+HBxFnBLeDHtgR9P4DpLumNC/zBYtnb
 Ic4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5BjYN/Qmz8BZog3r8YldBNpOG88WmJHhnqNdxU3htQ0=;
 b=JD6GtqH+QDnJXYa7xhO20l0ZXejbySQXGtPl3R675GYnPtEBqH1BfOfPjAmhiyUBWq
 h9wmYX7cZlVQD8k2Hd6dZtnQ+mLS0DC4unWM2lDzZhEKiHgZjIzLa5zr0bfLax7q1Jf9
 HXi3J5zWLN8iKf2Ol2OSO/z+3DqlIXqk91N+YEhw+s6Dt2Ubcdlj7oGSL7EQ51WER6Ao
 myy5nn2K6KMCTzk28e7MNC+ddzxkoOKn0MDt5vGkB8u6RGE3VV4bEA/dMkMEqEjZUqQC
 dlr7nVZDs6yCABKYiUoi7SCXkWuANUMM8a5T995YUvrU9YPBUQ7dUJ3z87XRRK39CGj7
 tfbg==
X-Gm-Message-State: AOAM532T06Ysz9CN/82hMnwgVmsyTARFdhahplZYFebyPBmYQJ6YTGqn
 1OzOvv25ptsFBZZVCZcVzfSyBQ==
X-Google-Smtp-Source: ABdhPJywqCFp0hqFW16bCXf51g/LVJgveRAcNZ0DkzIW9gzaNPgGQuiwdi+qQGq+xpAN1mWHCB5rdg==
X-Received: by 2002:a17:90a:207:: with SMTP id
 c7mr30077491pjc.58.1640745246345; 
 Tue, 28 Dec 2021 18:34:06 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 04/17] target/riscv: rvv-1.0: Add Zve64f support for vmulh
 variant insns
Date: Wed, 29 Dec 2021 10:33:31 +0800
Message-Id: <20211229023348.12606-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:09 -0000

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector integer instructions,
except that the vmulh integer multiply variants that return the
high word of the product (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx,
vmulhsu.vv, vmulhsu.vx) are not included for EEW=64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 820a3387db..658cfbe10e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1906,14 +1906,41 @@ GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
 
 /* Vector Single-Width Integer Multiply Instructions */
+
+static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
+     * are not included for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
+static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
+     * are not included for EEW=64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+}
+
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
-GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
+GEN_OPIVV_TRANS(vmulh_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhu_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhsu_vv, vmulh_vv_check)
 GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
-GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmulh_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhu_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhsu_vx, vmulh_vx_check)
 
 /* Vector Integer Divide Instructions */
 GEN_OPIVV_TRANS(vdivu_vv, opivv_check)
-- 
2.31.1


