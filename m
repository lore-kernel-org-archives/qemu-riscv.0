Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKy3-0005fa-Bq
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKy0-0005dy-V8
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:12 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxz-0002Br-B1
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:07:12 -0400
Received: by mail-pg1-x534.google.com with SMTP id 197so4628310pge.8
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SIH69F4lD/ulL3L/bQ9It0P1aDp77VjtDK919f4m0g4=;
 b=bUqxKjWmFdCuQz7jucNb/Nz75eWWOvNdQOImAYMe82vYdHhV6/fdzX4IZOEompWVbt
 IdFJou1XesM7sOy8t5kl+J1SjkCbtceRcLOAbGRSuO3MiuV/p91NXWRtfv4+M2TGJxYy
 sJ66f8WjenrkykZppx9BA3TgviE51ge5+35+hbUiZBZiwO07++lpMIHtG8E0akMPY+VM
 SMdMGkNTxWD8sFE1oHh0JSxLqYrSwopsRzU0MEZ66tYlPjYFFXX4cvpXN2CEkdONBk9X
 f2fhVhceYmbTsBoW0TbjsDwsCDP9L0NOzRZlOjgn9g1D56a1D6Qy8lzMd6/5luk5Lud2
 XDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SIH69F4lD/ulL3L/bQ9It0P1aDp77VjtDK919f4m0g4=;
 b=M2svCrX76WXulSOJjixXNDWoht6vzKFoSRpAMIqaO0KvNfKtJ565m9KlzfJSSwd5x9
 2RtGE9558+Dz1iZcz1jBHZ5QjZXqJmrcd/9W1sAovuVnZbMhDVoE77g4L+M1jNRw4H9i
 +BzTeUX/1niwr4lU9GkaxriW9Haz2keeyUmAXuP9a/okdAGjkvOwp+r74Gtpfas9oqqA
 1SYMreXTK/JV/3/h3oImTP8QdavUF5ROPmQEz7UC7OFuCuvpBgOYfYHDJlXLFuDLD7ML
 f2M0VccF+hx4s+79GNpRNLOzM+xwxDXEedeyQF47Gx3Xcew1bMjFzSerzpkTx1ALcKR1
 Xdyg==
X-Gm-Message-State: AOAM532zcJiwQw0AIKW70EtoPakbqigQEfWuYTDg6IrGVL7KGabiQNea
 5sP0I+EnRoCQHi+XGptz8tSrqQ==
X-Google-Smtp-Source: ABdhPJxBqvZE6d00xfsqdZfR2HmanS+ILB0dl/2V+5zGHBUSaClsrytrED+pJhELolYkEzPmkaKz6A==
X-Received: by 2002:a05:6a00:844:b029:13f:dd99:d1a4 with SMTP id
 q4-20020a056a000844b029013fdd99d1a4mr5606810pfk.31.1601406430081; 
 Tue, 29 Sep 2020 12:07:10 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:07:09 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 32/68] target/riscv: rvv-1.0: element index instruction
Date: Wed, 30 Sep 2020 03:04:07 +0800
Message-Id: <20200929190448.31116-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:07:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 33b4612a69..c3b42b051c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -608,7 +608,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
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


