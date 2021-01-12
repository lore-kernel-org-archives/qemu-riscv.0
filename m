Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBZ-00044L-TA
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBW-0003vK-KO
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:54 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBS-0007dn-MK
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:54 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b8so1129189plx.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QFsPDGGstlpNC8yZd2jptms+E2w3nJ4A2M/mfdcapkM=;
 b=noZzlKCDtd7vJh/yiae0g3W58mpdFUDHZyexmMoGVoXZ/DPaWw91fjLq7+Qe0Z02MT
 N3RW1wLrQ/bQxQAtEXBTlLHkSheyCzvNXqpoOIqkEc6YchxPWir2gmaHGqYKiubVbd0Z
 nqismDFU/Cq8TzilsVvj3eKCSVs/2E7as8Hu6HDe46AKO3r09AVcuYxA1kkAnx562HI+
 gfXqfJBomzemyHg3d2A1OgYlFU1ddP+iLrNc6ESrs5U5lVNqBvKlmqkZNCJyosBy81qw
 v7Twd/hpDWmU5VXbKsdWINhQw5mVFaaJj00SF2H+FmtKuq/DxJWXPRWQOADm/Ps5B+WL
 qQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QFsPDGGstlpNC8yZd2jptms+E2w3nJ4A2M/mfdcapkM=;
 b=eFTiIg5KwNBypgAlP9Q4dAqGvL8oAeRm/adVJ8Q8kP7I/DZLD0MwVONgTHLkWXXc1T
 DHIZjPsA87GhujR/ngNSvV9jeK3J7ZxmsMlv4yH9WCT5P5Kw1OGAwIxPoWVIr/EcPR5x
 QQqHdeecuxCqobYpk1mBLLqMtxw9de1/xJ7x0ISmaP8jvWY5JE78R813BvCy5G35e+41
 9aff/cHTGkeixtPxony7FxFrxNhE0mcUF7dt0G1MHscpu9S5ts+2+JDRxB5LHRqk6wDu
 rD63HauU7TH5v7CnKXdSBaGdQV8FxnX5omqxNM4CtB6eIE9KIGcOOePUnbRn8m25vtoE
 TP+g==
X-Gm-Message-State: AOAM532DgoO2QyowTDgnJM5J5sci+dptjL3Ibu6bp0IXaBrkAy4ZqN8H
 x7AQfX6DwYZ41u0nMPWIi8KPPw==
X-Google-Smtp-Source: ABdhPJwMgnd2bdrXYrux+WewZgtZXxUhoMNyaOGuj9AZRrGD3FcM46lVjUm9h8s66Ae2O/7lH2MLGA==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id
 l8-20020a170902f688b02900daa8171753mr3886490plg.76.1610444508404; 
 Tue, 12 Jan 2021 01:41:48 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 26/72] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Tue, 12 Jan 2021 17:39:00 +0800
Message-Id: <20210112093950.17530-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Jan 2021 09:41:55 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e11666f16df..c0053cfb828 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -538,7 +538,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.17.1


