Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4vx7-0001I7-Rj
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 21:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vx1-0001Er-HG
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 21:22:55 -0500
Received: from [2607:f8b0:4864:20::102a] (port=42989
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vwz-0005XJ-Tq
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 21:22:55 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso4987025pjb.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Jan 2022 18:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQ1pF4pkhR8rxEPKphSN3UAQJlKORYmOv7NGLw06rhc=;
 b=RUChbzeKPTJ0cqfNHwM2/jbiVSYGSRNb9w4XLEden7BQ+GBDWLOoIjGQLgJ+cbVgBr
 ytLxnGcweCHVs3vlK50pBwdqAnr5MzhHodOIDZx1XlvNLJakByP4hYGfSJQsf2T5nL8c
 vM1B4bg8+X8OULmJKSHv6k2huNYDpUXfa1Lib4vLvhHgDBudxJywmBCvYhYQNNQ/dgH/
 5DaxN2U8L/26pDRUvbL9NtOUtS4+MO8KHwjxw4+XOxKw3YOYnTS7iQAgpzbCEU3Rk1d4
 mnOvFdrWft28DkrVEm2ZCpYoYKOweI9nIcJB8KdURFzYM9HP4EHvxZ+uzYo9v3J8daOy
 R1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQ1pF4pkhR8rxEPKphSN3UAQJlKORYmOv7NGLw06rhc=;
 b=YKmZAhFRGbHiujkCyWKToRXvdcGtpxOou1XpI/Dkkku7GrxBqx3Z8BNU04nSoyLspX
 VnCALAw3N9qTH5uxYxkiuLaQO2hOiPLMJNRZcazrQWKs0Xe+o9E14Giwl/+LEfvNC6Ln
 oXqFB4YzsPi2IJLmCtaqRmDqAiUWnI4ObK2tL3YeMQTTSA40ZhrEnyOUYMETEeYPetuQ
 Ktf5OsTxeA1gjpd/t1FVPB1rE4kWu/jzbkKtRHE2+us111YTLZTZOqaO4zMJwYHzRgY/
 nWbQob7sAvqIZamPtpFAsoFlhPFH5C6P8sv1iOQz6N9LIJhUrx+T1CI0bG2E3gorDu04
 p09w==
X-Gm-Message-State: AOAM532cdyz8BvJeMz3bJLZi40WrShcwHimroYyDJnji/qXOPoniTf8m
 A9HGNbXXIoc5rewart6Px5Semw==
X-Google-Smtp-Source: ABdhPJx8EpPMNi37pd6mkSmC+LaMtRKsd02YAgUMAGLNIE8ihhXf4joFQSMKgd8kj0IXRObNz++zgw==
X-Received: by 2002:a17:90a:b30a:: with SMTP id
 d10mr1575127pjr.92.1641349371711; 
 Tue, 04 Jan 2022 18:22:51 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id x19sm193593pgi.19.2022.01.04.18.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 18:22:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 0/3] Fix RVV calling incorrect RFV/RVD check functions bug
Date: Wed,  5 Jan 2022 10:22:43 +0800
Message-Id: <20220105022247.21131-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 02:22:56 -0000

From: Frank Chang <frank.chang@sifive.com>

For vector widening and narrowing floating-point instructions, we should
use require_scale_rvf() instead of require_rvf() to check whether the
correspond RVF/RVD is enabled if either source or destination
floating-point operand is double-width of SEW. Otherwise, illegal
instruction exception should be raised.

e.g. For SEW=16, if the source/destination floating-point operand is
double-width of SEW, RVF needs to be enabled. Otherwise, an illegal
instruction exception will be raised. Similarly, for SEW=32, RVD
needs to be enabled.

Changelog:

v2:
  * Fix patch title typos.
  * Add missing Signed-off-by.

Frank Chang (3):
  target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
    widening fp insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
    widening fp/int type-convert insns
  target/riscv: rvv-1.0: Call the correct RVF/RVD check function for
    narrowing fp/int type-convert insns

 target/riscv/insn_trans/trans_rvv.c.inc | 78 ++++++++++++++++++-------
 1 file changed, 57 insertions(+), 21 deletions(-)

--
2.31.1


