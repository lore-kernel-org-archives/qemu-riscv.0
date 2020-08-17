Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asH-0001a2-Uj
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asF-0001T1-Nm
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asE-0005CN-5U
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:11 -0400
Received: by mail-pl1-x629.google.com with SMTP id y6so7175604plt.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/QB6MM6my3+zghgo3JxQFAhPc1E5NUjOg7eIVy9GGiM=;
 b=AUasqCyMHH/quxy2GkiAZpoXVLxNbf0Ciw+/mSYgHnuqB9+vzI8vR0c0KEwl0MjKE6
 +6EDc8xhEoACAsKhiZQjnuaDLyaS3fQ/8fdAwt3XkUoPOGvRslkkDj6frjdshBF7NXTJ
 IskfGsVTtM+QFUQHmECrn/YfiDU/NIRhahUz9+BqIACgZb9uGOIBjWx2q6eFU6Pue0/W
 rIQuA1mwaAwkrBLtBHdGUxR1cKtpSfC7J90Z7mgkig6pdIE4DH7Yp1SK8OP02b9NAb+z
 4iaJxwbIga/HRoTP+WD1XMiXVBWwppRISy+V6xGAxpEbqdqhS48cfvUZDSRm9d2TzXuL
 49Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/QB6MM6my3+zghgo3JxQFAhPc1E5NUjOg7eIVy9GGiM=;
 b=ZOJsnAHyl0+egOAFXYGGmrw5x8FV+bq0Pp6shPuO0OHLoCvITJ3QF69Pwq2PwvkUP4
 XTm6SykNZKOoG0Ie4xj3Lj3mfi/kMr0PamZCt71H3YA5zxTbOTvfgaM7a3N6M5xDGmIc
 rAZ8bszcNQESsteB/9tnPInjdeS9oMVIu29UXk4PcPYehpmGMo9ZvjON2ZK41Fk2mCjX
 zvwMxzEArGMd9MCRTSuwfnysjRdTl9Dw+Usf+gUBUh8ofhFffRxyRstOxiTaOn15GXB7
 /La7OofA8xdnul3jrWViM2lPV1yzcgNf2UiDXsFAjUKbAREOzKtfi7flUVv6x9YFpiYF
 2jhg==
X-Gm-Message-State: AOAM532N/iRBhR6d8gQuc66do14Gr+7h6v4adgjH56gQSLfVda1Nl8vC
 utQEsLR3SryuwGDOYyAMJYvseg==
X-Google-Smtp-Source: ABdhPJyl4SSmCNGtZQ14VRWLhDGfJ3EW2FiZTQKQPA9K5cvLhs0oCYth8CjuCtpUQw+MOkDI8b4Y2w==
X-Received: by 2002:a17:902:ac87:: with SMTP id
 h7mr10721972plr.238.1597654328847; 
 Mon, 17 Aug 2020 01:52:08 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 44/70] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Mon, 17 Aug 2020 16:49:29 +0800
Message-Id: <20200817084955.28793-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c4fe9767585..2e305d492d8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -438,9 +438,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
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
2.17.1


