Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngjrJ-0004Bp-1x
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 05:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjr5-00048d-E6
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 05:09:06 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjr2-0007rx-OI
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 05:09:03 -0400
Received: by mail-pl1-x633.google.com with SMTP id be5so14921435plb.13
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=T+yhVW/tffltTohALTEbL9yQbTluCCIJTvG8rcXKdt1Tn88BRgCrVV6niKKiNkSQcS
 nzLQwuYNnoYYBlwCsw3e63INxlSM4uXngtELGO5veAedGOARrrQTJPwzqkIJQr/wm+Iu
 UMVWQ6aiOU7ROfpAyQgM6lOKmmadTlS29t9aeXJI5O3otWBmY8R68Qnzg0VyOIsClO75
 UDz7jjWYPKYw7eMVQzFlBEytzOakzEQsEJQ57+qfeGnRM42AckERNyxFe2Usc968Hl0o
 UGewl58xrG3tf2187JsXX103d/06mu4LF7NGcTJ7WGSXmwhTIb+8aHI32Puohd7gMHi8
 5ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=uJ3RnRZklzWzSJyoTreA8HnDBoNJIkxmoKIWFBCYMUxhG6y/oWDSKj6oJ32g8kejT/
 xCIIJDwahm3FHVHbG+rOgZdNg6Z8cSRPXsT56tHZladCui9JfTc9mexEjLpJnPIBvgO+
 aP7l/ekRObe/MpLPouD/Rjjo7eajr0MU4tQsBUwY7ZrjIw0BKCZGbZSttawnRQQ4rBu3
 OfJABAGy1bHIVxJfhzHEaGRTvjR2fGaSECvINEQvXdAINYyEnN9Z+iwSXRGSZl7dUwho
 QHLDerHTUGULzs4gEbJKnhVpecXpLV3YAJu75ChV+PqGUq7oC057MjToq4EQP9qa40Ur
 v1tA==
X-Gm-Message-State: AOAM532NyJGD6TfSAqJOL3bMHTUEcf1T3WLPPeegqgtaZ3EmBpbFr60b
 2zN+8LnQmWBu1mcWKeZ2Mf3oEQ==
X-Google-Smtp-Source: ABdhPJy0vrB4owDZ5D11DFGMrQspVjjV75clJkrf8MSQ6lGgMyTrXAfQibnRP0//9LqIwYl40dct1g==
X-Received: by 2002:a17:90a:aa96:b0:1cb:c57f:9218 with SMTP id
 l22-20020a17090aaa9600b001cbc57f9218mr23102110pjq.227.1650359336990; 
 Tue, 19 Apr 2022 02:08:56 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 fv7-20020a17090b0e8700b001ce18c551dcsm14963381pjb.19.2022.04.19.02.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:08:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 1/4] hw/intc: Add .impl.[min|max]_access_size declaration
 in RISC-V ACLINT
Date: Tue, 19 Apr 2022 17:08:42 +0800
Message-Id: <20220419090848.9018-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419090848.9018-1-frank.chang@sifive.com>
References: <20220419090848.9018-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Apr 2022 09:09:11 -0000

From: Frank Chang <frank.chang@sifive.com>

If device's MemoryRegion doesn't have .impl.[min|max]_access_size
declaration, the default access_size_min would be 1 byte and
access_size_max would be 4 bytes (see: softmmu/memory.c).
This will cause a 64-bit memory access to ACLINT to be splitted into
two 32-bit memory accesses.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aclint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e43b050e92..37e9ace801 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -208,6 +208,10 @@ static const MemoryRegionOps riscv_aclint_mtimer_ops = {
     .valid = {
         .min_access_size = 4,
         .max_access_size = 8
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
     }
 };
 
-- 
2.35.1


