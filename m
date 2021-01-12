Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGBa-000458-5D
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBX-0003wc-54
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:55 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBV-0007fF-Il
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:41:54 -0500
Received: by mail-pj1-x1029.google.com with SMTP id j13so1308301pjz.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YBwtcYDn0OZ4VpML5GbVnXvhvm7p0Lm6u4cPISfe0yE=;
 b=VlxJaELIK4Ebmq4KYF7XF+J6rZEeYW1+2gIj8T45d8/UXjA8PNSJmhU4xC+dvFI22y
 xNgsLOE78W9nHbGVHFk2cv0/1WNxfbEIR7yY+YwkEfjqhMEPO0uF4gW+hPejkXHUoDNP
 QP6ypwHPh1sE1pyYV4beGjmZqM5tJNKaMIFVzDOLkiPydqFk+cRdK+ibC6k9WcOG0OLe
 2HwcSlHXU0xpTMOJR2BOWUtPkyeA95FmgQDytT1Z1hK7t/FD7Z/taD2vayKyNejqbVKs
 i/vGu+E2vuU4PNdr4dAJhHHdCk7MoJgg8EqWsYqiEN2VPPrg+bEIHP8JrzVukx1xi25r
 Sf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YBwtcYDn0OZ4VpML5GbVnXvhvm7p0Lm6u4cPISfe0yE=;
 b=sB84EhmLe2V6urHHMG0+bG9YNOb4BDZYep9oyo224J05CxPV9lvcj+ZWQsjTDU37Z8
 OVvfB1Y9+yTsUQnHmXtcW97iouAgh4xKZqOinnczpX2tX/pf96QeQZE6HEGE25g9np/6
 O9YRO0O0tnwPCOj8k5dbAXUmu0H48/dj45/KLkz1GKfci+Y1OUVBTPONBDoquXqUzeoi
 xlwguY1xw+IGXFGI3NMWp5cVQXnbkXMK35BFVUmwT3FhTODodn42fgKRNWOtU1XwUHE5
 Glr7Ds2pIqPJ+XdypRmnLJGevsSmEW2Bg0fmpLvG7Szz2I3MKhgSW1+K7kRFdgJBtWCL
 v1cg==
X-Gm-Message-State: AOAM533FQ8SdkdJc7nOW87oWEFEsFk3Q7WHtH+94IC9jMg+g9xzhC3B8
 +IH8IkPzfUon3ya0oLQMBDJSdQ==
X-Google-Smtp-Source: ABdhPJxxW7tZ8mjT5f7scZBwxa0r8R2Ut2RfxQlzKu239z57T69D5oOW8U3CQ2vnmsP2H+hiGie7qA==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr3619104pjb.148.1610444512298; 
 Tue, 12 Jan 2021 01:41:52 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 27/72] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Tue, 12 Jan 2021 17:39:01 +0800
Message-Id: <20210112093950.17530-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
index c0053cfb828..a0a47dbceb3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -561,7 +561,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.17.1


