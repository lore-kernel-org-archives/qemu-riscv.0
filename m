Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvanp-00061L-UK
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvano-0005y4-En
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:48 -0500
Received: from [2607:f8b0:4864:20::432] (port=33484
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanm-0006s0-G3
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:48 -0500
Received: by mail-pf1-x432.google.com with SMTP id x5so7849420pfr.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=psnTdQQJlLhjeyFOG5kFcY75ahQs7c0yD26P9q7b4PA=;
 b=A8rOgIzxGdEzIcWmmDnJKMUzRioYXY8pSsh2gnmvgmynk9opbnfTDykkSbjr2sb+3m
 J/6vWWLs5VENTFeSPLlVJi1jecH1j+m0enUN4JsH2kWMOVi9/dMEI4c5e3VLluPsdRTQ
 ZDp4WmAMT1PR9xqEqK9z1ouvwrjwWTCNvumd2+wpSSZUKoSiuXwoqp4STnDilXMlypaK
 UsTvYRhconn5BGJjN6Cnnv0b55+rVOxD+1Yh5aOgHkfH3him6YvWNH/kC2u1vcGn7IWj
 h/Ffd89km7ZSnRm21U+lWhdy3Ri0LpJzm31V7oHWI+czEjDX2sKmqKe2X/H1p4sLRe3C
 CELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psnTdQQJlLhjeyFOG5kFcY75ahQs7c0yD26P9q7b4PA=;
 b=guCMlahLpz7Ch/ARCpBrNIFv+W937oozAZfWg0/Y1a0EYzAW+k9Dh5RGP767EvU6I+
 mRJF++hE9gKgb1oULuMyoN8LzYI/Y/8rNjR510uIJaZkkpoIM1E7q9969ilpW7sDsdoC
 SUz+EZUfErIiCRKDHOFQ8NQ/UYsrzgKpmeBHc5A3+61pydA4xQ48ledhBl/pgSVSHxEM
 AS68oaMkBMGU3HRSycz66D8jTlF7nal3ydDwAWXQp9/wJMydQ7qNAVcqiuHa/AuJ03lU
 rC17K6Rh0jyAASJ/UkUUmb3MD/Qedm3dW9De+VoUo/4xJgINatuL2mjQL3L1anphNBaY
 0/Ug==
X-Gm-Message-State: AOAM530a7BWYQX9kqRKPdrqCO5U0DcCpCyZUrKupIC7eht4gZ45WxsyH
 jaYAUJ+xPi+ChOm4PmKmVmN+0Q==
X-Google-Smtp-Source: ABdhPJymR2v61FgufdDVLz4SGKI+O5wdCKIpAUogz8LobHJtkSeodNIabPr/URwjFmUl4lcHTH9/AQ==
X-Received: by 2002:aa7:8717:0:b0:4a2:967c:96b with SMTP id
 b23-20020aa78717000000b004a2967c096bmr16721013pfo.14.1639123125129; 
 Thu, 09 Dec 2021 23:58:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 28/77] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Fri, 10 Dec 2021 15:56:14 +0800
Message-Id: <20211210075704.23951-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:48 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51..f61eaf7c6b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.31.1


