Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dS3-000309-60
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dS1-0002wJ-Mm
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRz-0007ty-Rb
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:45 -0400
Received: by mail-pf1-x42c.google.com with SMTP id a79so8952138pfa.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=99inUY6TcXre93Q9sK2twtbOOBRR6deMTZ0PhPm0qww=;
 b=CgHmZ4C7YjHiUolO2acSRX64EUMGTuX33DoYRLIOHpmC9DZxHLRGGFBeNPj6jJwG5+
 BzqPWyTWopsyKFDU4Shocpbx9HUvBO8E4zhpaJoVB5i2w7iTcmtTdF/9QQWWP1G3gwc9
 DquaIoC1NC0PgC+3PHByUlYnz2pqzc4UhDY6hobRu2xpdv0iKJzWgsxBMOQbViM0221b
 n4KzSV257uRhdCPxaIRT15iSXC9tjPWtQjK3Wel8r2IeByTkPeUBWlSBoOQx+pAa/ABO
 fWB5q4SCZTHNHl4bO3Ic7GK7WBXAaJXre+RW2gCATitwvcrwij3drDJsjBU8JAkpLU5N
 vdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=99inUY6TcXre93Q9sK2twtbOOBRR6deMTZ0PhPm0qww=;
 b=TdyiJ5NBg6XxkG6TVTWRm8xdct/IUNJYTvhOroJdiuXeAfuk3FgdzZ0a144sJQ84yL
 DAlReP3/7sZdQ86K/1mP+BunH5Zr7jbYpX0e6JXMd3eLJiXq1fc2BdqEUaUOFBRznJP7
 k6wZUJmeDlcXwdwvqInOHxp2TNAxYI5F5tL6jzdONmfi5P0qbOlNN3HCIqmAg4a8nAvO
 OcjMFoVCaYx/lk+AXaLCCh/eymaTYPM9hteEyN05PFIi/n+n87vz8TVi7qsblUCyRS7f
 +hAt/xHoi7JBSRBxyW9gaaa1jMopTShvdsdrupgR4PURj4smtB+zowW9i6xJNtgtRM9H
 KgCw==
X-Gm-Message-State: AOAM533y2yYqnQrFqRcyMc7s1y6gKi8n2OJcbU54OQgfXp0/2fI/lyQa
 zbofRgcQon/50hiphuHk+nDC3g==
X-Google-Smtp-Source: ABdhPJz+Jjzj93HVfugF2wi5Kxnuk6zCjLnxm00J2LMNF22aJeyTIW6FSLAuC/WWCJUV3W7iLOS9bQ==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr3203100pfb.106.1596710922625; 
 Thu, 06 Aug 2020 03:48:42 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:42 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 33/71] target/riscv: rvv-1.0: iota instruction
Date: Thu,  6 Aug 2020 18:46:30 +0800
Message-Id: <20200806104709.13235-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:46 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0992d6ac86d..7a10fc27c5f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -596,7 +596,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
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


