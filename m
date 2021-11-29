Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX79-0005uA-Bq
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX78-0005oL-4M
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:13:58 -0500
Received: from [2607:f8b0:4864:20::236] (port=45720
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX76-0001X1-8g
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:13:57 -0500
Received: by mail-oi1-x236.google.com with SMTP id 7so31871838oip.12
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ua5QPNKI3+mtdWrr6duWB6GbsCIKbt2CcILxnbVK4gk=;
 b=HlW/WA3XYokhRjJsyoK1G/zilWhPT/7eEnIvI8FmBhoMr+0DhZIKCmQX+OG4zJDh7E
 WA9Hkn974susPJuF8mpdm2ryKBOQp0baYmA4QvwujSzZxd0JuvsSg9sPYVX4FSQCxbJL
 cU2hOiYgRjDuG/WSFiKIG9Q+trCRb18KIrxk2acC9uYQytS4eJW2fIw3mcr8jh1IT2wz
 VEz/QFKyQ/7C9+3BGk7eznJpYJi+Wv896NprcMAZM4k/SNUdubHfvit5B+qYFObjKlGZ
 sb4K6fTQHJ+BNvTSEBSKIMPX+t5xJosK+BYtvuMf2ESrtnmsDeSYMTLG7J06nS4Jas6g
 UMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ua5QPNKI3+mtdWrr6duWB6GbsCIKbt2CcILxnbVK4gk=;
 b=AtJerwVPW/NVUCtCx4jynNnc059FDtCxLGLT0+vhVBeot+Z53YBMsKgIK3OtzB+zFu
 N+3w9kdIb62s6Vv75QSl3bMO3mT+1ctOC1diLqAN/nG7+SiZWaiJ0eTIpw+S/7o4144F
 roH0SVP+SxZFXpw74r5BGErL/hhZdzopPVZhTDcP5cweOZtfjID067UNNybz7Wm32D3V
 +zAnMw6RMepSHEVD1RpJqub4XzPnYe2jx+tZbAu8pg7HAXG6LGpAAnKejtysh4yiQsN0
 UoP1LBurRzE+kfpw6s91HsLtZ/pXTYsAbq5vwjucedR8V68VvU7yIZFhJNXAVaWX0mDY
 h+og==
X-Gm-Message-State: AOAM532vD15BqP0SbwJNn/dKzDO8ZDNEnfRofVr2mJjz7klII5fu39dM
 kXZzTwhJn2765ykqmj4EVin3s63fe8SHQz65
X-Google-Smtp-Source: ABdhPJwq5VWbOEnTgQWJzS5Kos8qkeIlLRGxbhtDAZlMWj8DmsoLxlGKIs/bPOgy18aveACadcYPpQ==
X-Received: by 2002:a17:90a:8049:: with SMTP id
 e9mr34728111pjw.229.1638155252791; 
 Sun, 28 Nov 2021 19:07:32 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:07:32 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v10 45/77] target/riscv: rvv-1.0: widening integer
 multiply-add instructions
Date: Mon, 29 Nov 2021 11:03:05 +0800
Message-Id: <20211129030340.429689-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:13:58 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a3f1101cd63..7548b71efdb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -474,9 +474,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
-- 
2.25.1


