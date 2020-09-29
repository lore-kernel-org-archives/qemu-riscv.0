Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxj-00052O-0z
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxh-0004xr-7U
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:53 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxe-00028a-Nk
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id w7so5537890pfi.4
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rkiw3APuABfBa23cqFC0hN5yY79R/Z9co/HW0WOplcA=;
 b=eNGb1N34raAWMu2HV/a229Z+JV71Bc/ZSocmQTFiaC1WjeG9yGvuxSjhuGDJTkwdk6
 Ccen7KnSk4He7QwUAJwJ+tV7aZ0adjtm3EOJmwRE6nqJ7fb8Y7EXBDbcbhmZquU6kLV6
 EsII+xQe9UjmO+40usx9ZXIJ563FlJdSoN+Xk/9H+usDGkDxBRngoi701S6Epnwv8h4N
 pMc/qHWvUloCwT/DMf5lDhoGfxqbW9BGrcx59sDMgdWxH9Jfr3j7d8HXVC2cb/hjajgc
 cOYrUSSuuJfHlZWbQijblcaerZ8opto9DmP0ylIWQiVKS7FCsr2xhhQqhZ38fUPO7sCA
 Bshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rkiw3APuABfBa23cqFC0hN5yY79R/Z9co/HW0WOplcA=;
 b=uFOu+K/2Bqrn7glSlx0CpPbouOlTuD3EBtraBuLpI7yiFa5wtlXtxUXtyHzZ6T2LJs
 r/rAuJsghdqsIlgvxRq27Jk625ePv27AuJhzp/6HLEP89guyKYHc0iXu7HZC7J3XP9cu
 r795sUUc9NKOsMue8X9DMJCSm5zHBF3YDcAe5jJkP/6BoXRcaaANMXVTEZgAHSBIT7MJ
 mjwisnPrQ8OXgOvA+s6+elmdBOLCYzs/X0i48UamDu8/wPY4jslwugJXKZEEdwgd/Dfq
 WCpW2EGOwcFL0/uMDpbY0oT+JHGRCLl31sn5H/hD2BdWnUwSIddhBj0gyV5ETn00yaC/
 J92Q==
X-Gm-Message-State: AOAM531GaZFfWxFxZNRuGuyDfAOxnwZe/hCVwMsHqKtMli3zB8XW5kGg
 cMZ8LMBOkT23+Jxv5p6gACtEVg==
X-Google-Smtp-Source: ABdhPJxXXSdEe8OvyccLtqdyQlEKclMepHBMRcuHgLvEevw3I/qc0WHkhg8EDIT8Uw6rCIfvgDb3rw==
X-Received: by 2002:a63:5d09:: with SMTP id r9mr4046641pgb.397.1601406409487; 
 Tue, 29 Sep 2020 12:06:49 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 27/68] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Wed, 30 Sep 2020 03:04:02 +0800
Message-Id: <20200929190448.31116-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Tue, 29 Sep 2020 19:06:53 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6c95a3460a..958914458d 100644
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


