Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7ass-0002TB-IC
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asn-0002Pf-Ci
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ask-0005H7-LP
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:44 -0400
Received: by mail-pf1-x436.google.com with SMTP id u20so7906460pfn.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OaP9J0DWVywZWPLwll9kCChmSU8Z+ILd6UJs5gTEiPI=;
 b=iBjL2LcpPiboLjkJm1fF4Aa1/MumVKpEjp+YmcgSgy0XRK63qBOguKf20LG+P/gO/U
 fTZoecfVKunDj0JneuTmfCZGzs6ODvhlY0wlaSb+uXivGncXEDYuAAg1y2pi3o2AyBhf
 Gc2cI9jte7LmmK+Agta/myNoPBaZGgD3ADEpKR6EBB5dASD9yiHEzJK6yIeq7qSXj7f0
 hHVsCf42IWD5uYeeTL6knY8nWrqY39i0H8Z4jW/c1Keg59rZ2md77RVMl8aoDIRcDpa+
 7mFs7OsgTia37DgJjQOSzkpy9m2RV+nhP/OycF8PSZfSeIGJ07OjXqQI4H4OpzGDv6Uq
 O93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OaP9J0DWVywZWPLwll9kCChmSU8Z+ILd6UJs5gTEiPI=;
 b=HFlHkr1Zx06/HKLCjDICcMZsvJsQbSaEUycTza4zF0z40rHVlNtTbvtCT0o2alHdU6
 AaL0u6Ts2q36RkB440IR+7Mf27GnXJeXbvm4Jx9NO1wTskfyV2Cngk/YVYsSP6+JhtVz
 e3zbZCkAj4Y8TQhY4Qalaazv2kqqrAKCXoKmKvvQrI+ByPBVXvgP7vMRcfeAZXfQ5+6T
 OwtLygn+zjjevFY1PM+/vHyYUC/G4zRaQ4rdWZcy/YUDAlKy2yeTmWPDg+4aOUDSbvMJ
 WCCsFlbQMmURnbfeNnVUFLFmjyqCQhpyTGXiRpA4CcM9n8x/qDMHWf/GiC6bDJ2Ysvy5
 oZmg==
X-Gm-Message-State: AOAM530828b6kpzFgg4PqmZTvNoMd/rZ3AOi38lihlrAMaHFzdHZJRnF
 R/LdOWlClykHLaj/Bw0PQpTbDw==
X-Google-Smtp-Source: ABdhPJxXTQZqIpFlD5DJYCQOlo/UQs9rp1MVeS6hlS3S4ov/CJTJvI3mtnuRYNKYi+JKU6LzU/4kug==
X-Received: by 2002:a63:30c6:: with SMTP id w189mr9042929pgw.241.1597654361417; 
 Mon, 17 Aug 2020 01:52:41 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 56/70] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
Date: Mon, 17 Aug 2020 16:49:41 +0800
Message-Id: <20200817084955.28793-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:45 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 41a60cf2fb9..2ebe2373237 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2977,7 +2977,7 @@ GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
 
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_widen_check)
 
 /*
  *** Vector Mask Operations
-- 
2.17.1


