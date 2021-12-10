Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaol-0006t5-62
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoP-0006Pk-0Q
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:26 -0500
Received: from [2607:f8b0:4864:20::52e] (port=38707
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoN-0006xn-FX
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:24 -0500
Received: by mail-pg1-x52e.google.com with SMTP id s137so7372822pgs.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8W/YJuhSDwrsD4NJSt8qyd2a4JKkszrSU/dKj2pXE8=;
 b=QzhGGKOtUs+B63cC8G+sfmo3j1OCLzPs3s2Iyv8vY10J8AYMJC6qGTgU2e43+eJ3oY
 mqEf1zIfInG98ieJLytx+JD/QDVsuNEr1NgUlisVy+VSJju6tcH+PFQxr2UoW373lQmr
 TxHjAoxCS3jUH2nW3sSImeiVfPqPZEo2svVz/GhfRCAPc9C7HYSczO5DmaLBoaTtfljf
 OavY2vhnU9eB2qXia/f4QhxD0SP00hkfYg37cgRw+4crR7CrM1RsmffR84XpO13zpE3D
 glcsdC+UEKH+c8p0ZTWVS2rZEH7GN2U0si7JpyhK6yqDayXzS5mhuTWDbZabwZmoeGZP
 K62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8W/YJuhSDwrsD4NJSt8qyd2a4JKkszrSU/dKj2pXE8=;
 b=RiDomfN8S9dZZbjChaRp7r1pUWgwy6P3ojPCBTWtgMiOzW4U7TyftUPyP1EKtd2rcw
 6kaxrrCxu3r0TOM5WqIx1m3r2e9LZM5735KbIZEZPxR7bYaSekx2ph4JM2J7Fr4PcmSd
 Fy2RjJcc+8u84R+ki+4JJT41Dl+CKuFgsTI+reNyZwEC9sRpGjvjh7S3UiRatob4qlxC
 eNQEamdv3KYyOWci8BGXFxc/dalLE/9UXs4HegemZjYyRjNseUe6IfSq0ySkT8C7riYj
 0uxNXbwJh10Ede+IOFNVAvKZVD0jzhkpP1mP0TI89Y+mvyuBMHYLVa/kwImfm2GvZIOt
 jU1w==
X-Gm-Message-State: AOAM533YAo+3UQOk193VsfDC/XmnPvqwRbv3yENOguNYt7YU1QHoZsAC
 LOFBJUWqQF7Xi4KXyWXPGYL2vg==
X-Google-Smtp-Source: ABdhPJwlJBQjF83nQx0T55Hubr5Q0HMlNN2wDNQF9gaLt34e4fQQzOf7fkfraOpEnxT/+KIsDGogow==
X-Received: by 2002:a05:6a00:1343:b0:4ad:99ae:d4b3 with SMTP id
 k3-20020a056a00134300b004ad99aed4b3mr16584750pfu.64.1639123161918; 
 Thu, 09 Dec 2021 23:59:21 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:21 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 42/77] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 10 Dec 2021 15:56:28 +0800
Message-Id: <20211210075704.23951-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52e.google.com
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

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0076ce5a0a..4894212913 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.31.1


