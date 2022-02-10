Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nI2mA-0003cj-53
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 01:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m5-0003ZB-Sp
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 01:17:49 -0500
Received: from [2607:f8b0:4864:20::634] (port=35621
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m2-0001Pm-G8
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 01:17:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id y7so985025plp.2
 for <qemu-riscv@nongnu.org>; Wed, 09 Feb 2022 22:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGEC+Z5dXcbUYNLFj1FrAnBB1EbnT1YJPc/8W3V+BeU=;
 b=EtOkE188PbIwQIcWR7U7i5PiDjhHFFVdHTRlPENuY6RGuCCPr1EqEfBwQ2Wjy6Ae7s
 mOspRoOOImx5V1SmFZqGu+GHKkatDkEeoU5UWPgEHG2Acd13gw9ElPYtyvzeREyx+hf6
 mw2gZNc1mmDBbL8e1VsM40KXM/fVE/AVBxL3xmyhsOKkaiombbs2AwFvEYpZdV6AqeJi
 gmTUwHDkjHfEQTmT4kJ9nN5TdHdsr14Ua3Fwzw0GdiARu+vFwGfeKipdsEnVe6ZxhCFL
 av9Pxo7ZQ6Bf2BJ/IDEpkdVE2jATDDrQEu5nVUZNRTbo15ReOFCju+fcri+syjmfnVVH
 g2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGEC+Z5dXcbUYNLFj1FrAnBB1EbnT1YJPc/8W3V+BeU=;
 b=MQsdHJq/j+3YNRFKLw939aejfwwk3X93PfAOVizJPQl6E9+AezT8UK3/3mtCkVdawq
 xGEajOVm2pNkM1/7tL59XsI8lhggbglccSVNhFOow0Ba1V8OOgMZGtsZhv245efSDKpL
 HOkW+eQPnyXDmmi8NNzVwrN7UgiN+Tm5Hno+ddpd+dkMt+L7jyljwHcNfCXSAhC9tfWs
 A2jKvP04Gs8f8MBxAp25bkahjYDFI4/EtqCnJ+w78wuUM2gFNxYD59o2mriI6L0qQWVj
 zoTxYxkLIqNkHk79u4y4RA+MB2hln6B6ZdG1difzcx2kthh36pAmL3u/qQa5ANGqNbHy
 bLRQ==
X-Gm-Message-State: AOAM532veSNviEx2/E6FsYA229tMMUX8X379r8nEs5CGhMwd6JikCt4H
 jpLTumxCoJlNAwqWT1MyxUlJ8A==
X-Google-Smtp-Source: ABdhPJz+QviRuD0sOPd57tBjjLdagB52DRNIjqb1vMWA8yxJDGuEytCob8/hXV+qja+xB8zXNNNNTg==
X-Received: by 2002:a17:902:e883:: with SMTP id
 w3mr5933304plg.33.1644473865272; 
 Wed, 09 Feb 2022 22:17:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id q2sm23110266pfj.94.2022.02.09.22.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:17:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, David Hoppenbrouwers <david@salt-inc.org>
Subject: [RFC PATCH v2 1/3] hw/intc: Add .impl.[min|max]_access_size
 declaration in RISC-V ACLINT
Date: Thu, 10 Feb 2022 14:17:33 +0800
Message-Id: <20220210061737.1171-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210061737.1171-1-frank.chang@sifive.com>
References: <20220210061737.1171-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 10 Feb 2022 06:17:50 -0000

From: Frank Chang <frank.chang@sifive.com>

If device's MemoryRegion doesn't have .impl.[min|max]_access_size
declaration, the default access_size_min would be 1 byte and
access_size_max would be 4 bytes (see: softmmu/memory.c).
This will cause a 64-bit memory access to ACLINT to be splitted into
two 32-bit memory accesses.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/riscv_aclint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index f1a5d3d284..3b598d8a7e 100644
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
2.31.1


