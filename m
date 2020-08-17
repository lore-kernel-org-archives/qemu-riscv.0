Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7arX-00005W-Pl
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arV-0008Qq-EW
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:25 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arT-00054P-Im
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:25 -0400
Received: by mail-pg1-x532.google.com with SMTP id p37so7797127pgl.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fGmZi4G6G8HBm6kSF0AhkPZa7UesVkFkZsuvcd4O+2c=;
 b=FmCzG/+Eadyv9+5yAgcB0K4WqYCCJ4IrFZxC7/OUSbB7ZOJTLfx8I6Yaupz66wzHRA
 +Tjy4DP3zk8O1Qi+ES2tv0gaSNLgQaFrXTjEtuvnQEc8YkQMJ1Jf0CzgC5N18Fw3YSrj
 1ry2/jBUss0H4jFXMGdPT1ZJrIEZO6CZizXhLXdV3Yb8nPGmYESXwh6elN5+I/yUSmfE
 gEIYSERm+xPYkHS8ClG/BdrKscIKMyYJFZHXnKABR8Ly7yq9TvNGhIv3dyx7pNHAgVs1
 3ZU4rs/s37ij+0AHn1ZPxkcjqgMsq6hK8qFH5vZwtxsxBuzHOlbm4/PTOmdN77dKqoCc
 oJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fGmZi4G6G8HBm6kSF0AhkPZa7UesVkFkZsuvcd4O+2c=;
 b=ugq564uXJxHlRftuCfV89ZVaIIBYqUwITptu+gnkLUUyfO6d/IM+31thu+OSBBFpsi
 wxfoMYTmFJqqcjF5KwWrjaU3seA7uw+cqgZ8Ue5GRcuSJ/PNNFvHXIMkQzajd5azW4TW
 uv96w9+yR5gDgz55Q0ADUzwe+uwCuDLWOszvquhzGNhMXH92TCCIIdfb4iKGZr5HDSDt
 M1OOs3n3eSsHFwQAlDLTsq4Gk22bf3vy4mQMhoJeS4XLQKhk9UrEqujJdoW+VTEQInBY
 cvU6oEwkFsc2qboNoKBBzSVNs/TEvpdE3pYXwz6VFajPimhurqD26mq7mvaGuTvJBR6Q
 SpAg==
X-Gm-Message-State: AOAM530+6+tUBmJQxUCpwPZMtafRWiU7ZybqXuqJE6S7yFyeJ0ll50vK
 r4aPM4ap0NYjgtH4UGbDRrNyqA==
X-Google-Smtp-Source: ABdhPJxvu9ZRCbRgnrrZD7rRvscWlbjFV0zSmAke3P9DON0GrYpOLI5kWrK6jcC8F0WN0MkO6lz0LA==
X-Received: by 2002:aa7:9e4e:: with SMTP id z14mr10830682pfq.60.1597654282162; 
 Mon, 17 Aug 2020 01:51:22 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 27/70] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Mon, 17 Aug 2020 16:49:12 +0800
Message-Id: <20200817084955.28793-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:51:25 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f142aa5d073..a800c989050 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -550,7 +550,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
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


