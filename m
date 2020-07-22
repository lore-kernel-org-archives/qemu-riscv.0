Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvB-0002hu-TU
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAv9-0002f2-Tt
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAv8-0005go-7K
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id 8so870039pjj.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hnT4LfCpRz4l4mcm1WiBHzRG6KMccLv2xCUhcy2MNm4=;
 b=jl7i98moEc7uKcaQDt8Zv3z+6E6JJ3m6kZ3sEzZY+UIRYC06rpUDz+8AnBUNt8JGPD
 dZLR/t7zeY2x8g2ZQ0gyBbZNtAlPkG68PyUPihTQkOJUKBdiYmlvPhjw41/4Wdp8czbX
 8SzKAuoHXuDTD9wqqeUNHQzynnkQOyhZt51/5kanlYrV63kQ+BXJ0oZhCzj6BSWttvkj
 viMqr9ovm9Jr+tVgg7VDxto5T0aQsLLefo79UGHoecyURDXF5WTqQUBPGDN2ZrcrdaFU
 JFOuC0+98EkXqRhuYGGjJhYwDVKJo9s/AabRTCli7RD3xUJIozWVgL2ZF6AwfwE7BvhS
 mbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hnT4LfCpRz4l4mcm1WiBHzRG6KMccLv2xCUhcy2MNm4=;
 b=sg+56BpdL2xSYi15y5rSOXWRUvE/xCf7K9OsXLzNRn2SB9hi2gOOXB4ugKdOwvD0Wn
 nzYGn8mGMVttOQSd7PVgmXWxNmSH9lOmvehGp438FtC5ijRHjJqD7GZMUu5UOD3bSKjd
 9OuBaykhawNu5WZQpwkKz2UTYiKYSEow3Cw4wv57JQ0K/kAfP0B/pg1lcYU8jOT66Xu6
 TkQzjNSx+r8U4kTIjKNe7VAjSCCDiS/djQtHGFTI3Z6TBQBpEOAY9kAYBWGAXSMAj2ML
 ufYY0ezRbq9lsxl58Cwfp+Dvtr57u/RL7kyilkdr6g9zkvXASG7DW30+5TQBLSu3V1B8
 JXuw==
X-Gm-Message-State: AOAM532QOwzAmDaQf1BKOvlGhbdRiaL+fpqsFyXOOCraL27jIw58mBnd
 BenAyZy+QJuYJxLdczhvR3i8rA==
X-Google-Smtp-Source: ABdhPJypycV7D0mV1C755O1O+znJ0HxE4i6ft8KLTpebJ3tTVGGQhaIPNA6hCiWwcwT7RKBvmbSwZw==
X-Received: by 2002:a17:90a:3769:: with SMTP id
 u96mr9395366pjb.198.1595409612979; 
 Wed, 22 Jul 2020 02:20:12 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:12 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 36/76] target/riscv: rvv-0.9: element index instruction
Date: Wed, 22 Jul 2020 17:15:59 +0800
Message-Id: <20200722091641.8834-37-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4560bc4379..01316c908d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -579,7 +579,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.17.1


