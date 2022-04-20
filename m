Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh5Ol-0001tz-Jm
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 04:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Oj-0001rg-Vw
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Oi-0001Kg-Cb
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 04:09:13 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bg24so1243045pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=OGz734JfLRBJyg73PF0Cs61co4UhumCC0eqYB+o9jA6DOvQN5r/LcMdXVS79l4nqNo
 voHxyXFPvctKPm5iLrjx/n6g2GMJWQ+qbvwMq5P9OBiY/5dAmjgb46K2iGcmHkhNQDqv
 lxr30iC92L3nbksYsm1L4PFqLnHm8n0w8zeITGFctuBhsA/ywyoWpgyHwZgoGO+LrO6A
 ElynctgE/oRxD8n82lCfbt5l7/uMC6Dw6w+/xJe8jqCyXw+Ii0t2imOGYCxF3X+1yKwZ
 rp0LY6bjdd4rzk5jG1ib89RSra/QlBLJzS5h8gCjFlRIqR8lG49Ks/mm5eEgtsXw78LI
 4JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=TS85ZuN6dkCP1w4UrTmwHYzJemb3Dn96Q3/E01pSTtmIebnDEltLJt3UC4u5uSsgev
 D86dr2uqRzD7NfyBBWnLeRNLBHueSNfgn33tdK3Drkg23MckQupyBBdTzhbaPXoZD9ik
 l/CeXexeH0RiEhnFToqSWR6qiLoGMZpoCrkvCkQxe34iuaYrdOUvyuxe5vwtJkDlx4ar
 NVQJW2uErnaaNGSW3DNqym+8/pdr7G/mvoiV38Fof08qT4MQtDBPs5ZOBG0MSa/g2w+v
 7t1n7PU79BKhGuLFsaVJyKBleb5D+JC5K5jtlBKqwddIemNY6nKs/B45Txuixz8sSpI5
 XO8A==
X-Gm-Message-State: AOAM530uJ+2ULjW34SMBSMPxqSIMaNzfPFbYJoEIM9eS/vZhkVbPoKju
 rmMzdozO3s1P0v+xmsRvYWAecQ==
X-Google-Smtp-Source: ABdhPJxuWBD+EgjLXomTuoB0YUwMYajcg5zpVl/EXzE4Rs9ow2K+tZzTwqhHdueD8UEubX0sJhkgHw==
X-Received: by 2002:a17:90b:4d88:b0:1d2:a753:479d with SMTP id
 oj8-20020a17090b4d8800b001d2a753479dmr3097722pjb.12.1650442150980; 
 Wed, 20 Apr 2022 01:09:10 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 1/4] hw/intc: Add .impl.[min|max]_access_size declaration
 in RISC-V ACLINT
Date: Wed, 20 Apr 2022 16:08:57 +0800
Message-Id: <20220420080901.14655-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420080901.14655-1-frank.chang@sifive.com>
References: <20220420080901.14655-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 08:09:14 -0000

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


