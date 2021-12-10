Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaow-0007Vo-Vn
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaov-0007Se-9l
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:57 -0500
Received: from [2607:f8b0:4864:20::535] (port=42738
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaot-00074P-EK
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:56 -0500
Received: by mail-pg1-x535.google.com with SMTP id l18so2694467pgj.9
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CnAtznQmlgjT4+gZBNcoweme+F2gZDNVtpkqNmRLoPU=;
 b=EtL2cmY8Gj44580fkvC4FCcZ8bUxlWXty4te8TXOcx9iTSME3PiOwFDexbmgIVM4pC
 HQPn/5fvM0CuQeOI9Gyerpur/Ku+fN+D0cOUrIMSEuSTjjbwSEJcXKslgkFIAziHDVP7
 mHdBwi1XhQCjldukNkeEk0rpp5MpNNRdpur78AdtViRkX9svJ6eXpWP8ZLj7t3/VCgzu
 3Nzyov34KD+Uvb7oH34qdqbn/6EFV+459VVMXsYq2MEqOe4RerITtV+YhgyNibYpsfbu
 Af/1M377NSBqeiXrTatYr2greCYYVn2HdTH2yr8dStszfH9rVe3Sw00hVTGhgIpXVnPf
 DJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnAtznQmlgjT4+gZBNcoweme+F2gZDNVtpkqNmRLoPU=;
 b=D2jjrBgXplPhQMIWZYdCHIjii845TQ2YG4gRAWBfyrSGxyzDCSaqdW1tFmcgXJHuPb
 YOl9cYLZL3qxk5ZsE6XCywA0/EgTJgJkwlg+ItCuBY9iVuxXNN0VOEqUdGdbDfPMaafr
 24y8+PS9AXdbyuhm9s42MTLXzctXZdnAAkbgrzO7sn49cHGqfgYLKvTRf8Um5itId/5n
 vcuduo0FKTz0ki3oPk4dcTxujYIGLBz8j5ubbHseKi29vOnkxt6pAMO2IPXzX3MGue9W
 41osfptdA71NIfQOT5Ec3AkkRhqQBEK+R5Yb5h7AAPvBMKdnKNO040FBGf47V4piygN6
 0FPA==
X-Gm-Message-State: AOAM530iYHE+Mm67+H56z3V4U46U9WnrSgZCFYP9obRW50gSpr9u52oA
 lDwdsd2ZK6sokJjxMjU+ePhAlg==
X-Google-Smtp-Source: ABdhPJym5a+ivErqg2+MyzHwjRpkKt4s6SfRS5/fW4B7yIJ79lQBvMeFX49O+xM2Cdef7DxtrzylfA==
X-Received: by 2002:a05:6a00:124a:b0:4a4:cfd2:b40f with SMTP id
 u10-20020a056a00124a00b004a4cfd2b40fmr16678208pfi.57.1639123194240; 
 Thu, 09 Dec 2021 23:59:54 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 54/77] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Fri, 10 Dec 2021 15:56:40 +0800
Message-Id: <20211210075704.23951-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:59:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 998247d71d..b43234ed3f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2648,7 +2648,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.31.1


