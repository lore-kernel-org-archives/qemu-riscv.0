Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asn-0002Qa-SO
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ask-0002Mw-17
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:42 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ash-0005Gf-OS
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:41 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 189so7156387pgg.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fTGYiWwtW906qmiAixhXd8EHGk4gyV4PCcYhBx7cnPk=;
 b=ZWbwPuuPFM6Dl/pO4KFj2DbfxkNWV+urjjvejhtcMhPRsS0KBeWjpylCBCGlkcZzV3
 PldDy3IUrwW3NFwJHPfLXk94KrOjBcIpcjqjRB7vXvsRVuSXPG36xGf1nvIYfhwB/9Cm
 Z6oGSltaAJphw5DTgKpz6VcRinbtkltQcycwpi8LXZ76whxjcPmMPEeBjbFaEdqiqZzP
 eRKjlv/+QRTe+E3iuwAUY2G3eYP06ITSU9Zq+ybVBMtEEbxSkY2JdFa0FQbll11eAmfN
 1rGJtAhSKpsmIu8AR8nL8jr1rKdn9h/dEKZsb+60nK3j230ZTMkKzNr42n8clcvaRlgT
 zpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fTGYiWwtW906qmiAixhXd8EHGk4gyV4PCcYhBx7cnPk=;
 b=WcYcLGiyJruaC16hG6wbj066KJKyAOm/acEF456EzaWz5qhQ2wQsF6zuhzP9ZnR6Ag
 zCXKbO9YXBrz6W+h86wD7cFyGjtaMUH/5rppSdsGN7NWYcpxcYRRjhY6DIWbyYqYg1nl
 YODa/GxdGQteWj8Aii9sGKhYxXqfNFzSEqiM433PXGfx4qeBN0zDuQZ/XJoWYTi37E+3
 Vcd4wmsyY+o7ol1DuMDk0X2DyYBejc/PxtqimTDYbL4MTck11J/5/0cQTrFf6oRP88O9
 iw5/aC+Scv4uNk+xQViTpgYmToRJ/nnrgR2e9rw8s53eHugN0ag2LYfoQc3Q0QXpB8ow
 tVSA==
X-Gm-Message-State: AOAM531tZcKJw8Ac6I53aHN8tqADVUZC35d4z64RkaYm/KamhdEFLmXm
 RcJziYIYk1agaZtlFzCvHN8H4w==
X-Google-Smtp-Source: ABdhPJx+rEQSVSpIQZBC5avTjRGh+eBfRUh6pNNoBCzLw3x0KHD/Vr4loeOsfAX5f2tqSUQrnlNs5A==
X-Received: by 2002:aa7:84d4:: with SMTP id x20mr10271436pfn.96.1597654358475; 
 Mon, 17 Aug 2020 01:52:38 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 55/70] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Mon, 17 Aug 2020 16:49:40 +0800
Message-Id: <20200817084955.28793-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 15a646af361..00743cbce34 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4432,14 +4432,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
 
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum_noprop)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum_noprop)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum_noprop)
 
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum_noprop)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum_noprop)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum_noprop)
 
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
-- 
2.17.1


