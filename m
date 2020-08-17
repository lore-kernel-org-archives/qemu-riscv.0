Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asv-0002Ug-QS
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7ast-0002TD-9k
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:51 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asn-0005Hn-ES
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:48 -0400
Received: by mail-pf1-x433.google.com with SMTP id u128so7899748pfb.6
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3hvE+RspnEJb9Hzut0m2ZeEVXpPm8G/Iavh7BR1RkbY=;
 b=MzslXUN2FsU4TlpK5wNbdKWKmrt5lwShKcDmIjvpUochIVC/XFgF8gMhBTISLPp4Wn
 zJvT3X8QTQ0cXhLf/4PMRrROxjSH8ZuDr28Hgc2EXklx2hUPcE9hz5/sFrXy8tZZ5/gc
 8DavuJ44Iuu/xcS4f1JeoDFC5YyjinSNngYRjHbxez9FUMl7w4kCvIPVy01aQPwwBSd1
 RjGvlKCuVhRYt8b78Vv+Lcb5+YY8DhejkgmcjlYHvp4lNwLsHpQl3xwd2C2wtncjNgBi
 FmxvZeFo2KMCEcgcMw6784++8ZA0FsDrOhkDOioNZWz7N1tONGDGYUmQtw2tpAbMAOt3
 votA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3hvE+RspnEJb9Hzut0m2ZeEVXpPm8G/Iavh7BR1RkbY=;
 b=mg3bIVYHrfLfFyF3PfpoG/Rqii0WnJ2f9hxzz+vvsF7yXFbYhYRT1WXkL2rKL2nY5d
 zbFUvah8kQIDiv8sdHePudldlRIh42s3iPLTS5WPpIK1D18osY7rkhA2le6j9SshO5P0
 NQSb1j/gBXVSmRZOHMI7ovFpjZAP40lQ9Pu1svkvujg7CGSUvMkTjZ/m3jLrL0wyfOZm
 Fp7X9nGXMCBj72oDPBku06d0x2WnywZ9rHRIX63quEQ5xljipOR5AIqL4mbCIeOMUwXw
 FdiCFN//JMehm76TgUOS2f9PADD8zfn7BsiiloZDseLwip/jNVjQcsEIDbCmoLKP41hK
 ddZw==
X-Gm-Message-State: AOAM5335C0X4CS0vgdTbLbc1LycE3RiHNCRfnIy9qdrB/7He80rNbGHA
 DGY8jEUYwGmmTZYtK7HiLT5SAA==
X-Google-Smtp-Source: ABdhPJwhzCSVp7Kq3p6Lg72zOS81LXU1LPVrz9lUB6tcspI5LQjuwd3VixsMWBKBVjHGmR9YcU0xcA==
X-Received: by 2002:a65:40c1:: with SMTP id u1mr8929748pgp.379.1597654364221; 
 Mon, 17 Aug 2020 01:52:44 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 57/70] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Mon, 17 Aug 2020 16:49:42 +0800
Message-Id: <20200817084955.28793-58-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:51 -0000

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 2ebe2373237..9c92ad62915 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2372,8 +2372,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


