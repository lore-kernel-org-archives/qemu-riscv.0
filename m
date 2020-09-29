Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKy0-0005dk-JJ
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxx-0005aS-IS
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxv-0002BQ-V8
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id q4so3177369pjh.5
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Aif9d1F/IPk9jawUAnM+54T7hc3c2YfAvxLfCtf8uE=;
 b=P1cgQDzkiXS1T1wWm/A9CUU9/KdyGPNPd81pJZJMNAZp2jLEwz/na+ItqYXOv6e9wQ
 qCk6Ipwno4A7B7cu9CqhvDCGOQnwznhiD/SqEe9NNkkcttmIeTHpR0hMlYaCcO19LzbU
 QlXn6JXdn4NmC3XR2NoWzTPmayfxq+rxYeykQoS0RuVEgM6aVKD0nJQhsj2Y9I/TtK5G
 X29VE6mLXVH45xUgx0+P9/NO6LWzf2eo6hIthjUm00CmE0Kt+/o6v82Vj7Vk0U/H7GX4
 KtrL60tVKRPjwvy4hp2nkt/umRPBZN5FvxOVLV7O0irzIVanBerD6x7jgz+eXsTWMn/o
 2iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Aif9d1F/IPk9jawUAnM+54T7hc3c2YfAvxLfCtf8uE=;
 b=MSNRIm6zJzbJ5T4sVOXfFYoStSA01IPHXPmdgnENMAiZEMlsiQ9Ozy8doBV5dlpBCO
 UBga4BSqJNRyfLwnyvALtdZZZjYWCA0z+3rOtkC4nXXo0dPpU4YJg33MhvkYb41a7VjA
 UBYykm6uUlz1Lv63u3lhEx9SFoErXSJeYRu4nCa62hwKYlwaOCYQI7L7vXCJjADNvKDa
 vYlpHmpBkOIlOZ3DraEsUs4Edwcyl+lh+5ABF9dXAGFJGUoV3Dqd0tqabRZb7J+FU8tY
 CUnq6dpwGdzovAKf/gArum3whwSO06pAULcgefGeDxfDpO5lEup9yRjjt0QvjfN77uOI
 8awA==
X-Gm-Message-State: AOAM533UeF+VBGdiu4WExuytph+dCeY7HRjnXDJWumd+5VvBB7HTBsOE
 HuE/g19DpJMoyiY3RL/5xgICOQ==
X-Google-Smtp-Source: ABdhPJyNcXObmrOnRkAZcqA/5yj0TYV0++U2aqGAVS1pcnaVPUQWW2HZIHzH7Q2Z1n4cAf9YwAhXrQ==
X-Received: by 2002:a17:90a:1690:: with SMTP id
 o16mr5170879pja.148.1601406426712; 
 Tue, 29 Sep 2020 12:07:06 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 31/68] target/riscv: rvv-1.0: iota instruction
Date: Wed, 30 Sep 2020 03:04:06 +0800
Message-Id: <20200929190448.31116-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0fed7c9e56..33b4612a69 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -607,7 +607,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
-- 
2.17.1


