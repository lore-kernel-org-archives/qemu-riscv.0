Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWE8-0007jJ-Nx
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCz-0003MY-Vw
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCr-0002il-FZ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:37:54 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n6so4166038plf.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKuK62hxv2vXEM1ktPotl0poAfziKcuIlZAl/cEb0MU=;
 b=GSgmioxOe4H+3ZwiZ21dHhz08vWfL/N7uE/pwLRbBTJ6R0g4//GhKzaiHfjrJ+gCWA
 /0L48ew6TLVC7qvFN5m27Hs8xDFqNzUivaCNJQ+Z3E+VrUP8XUsdXKpnAA1BpoEmxrcH
 MezQ5VQu8XY8b0TcLMvjhEUdyB/yDFzp2FEEeY4K5Am5C4rQfnl6ponyS0aSfKKpVHhu
 HfYP8HfMasegJXP9ruLtQu+1QPlV1W0//NFQc30G5bHVHk5S9G6m4y2UVXencHlGx7RW
 LS23sHLy+h10B3nAv29b2Zr7pK1Dw4JgveHkYyPPH3qnHtRjvxraynqPdLu2a/e4a+xk
 9hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKuK62hxv2vXEM1ktPotl0poAfziKcuIlZAl/cEb0MU=;
 b=Gly3pVuBlKJLZjABtN3LfhHa0pKSLtsN1KdIud8ptd1VXVHqdbFfNOC7uWIvBvNkSM
 M1aIvdpjQsIyNqd6gZbRc9nbSyBtVwANMDAZkPsyrP1VNK20dk/nGf7s1PSBnvtc6e2j
 2rWWynJlyzbxIw9R2c3TY4yMKwe5H6BbBSq7P0M+T0UCy91xOLRtx6ogi4ZQWeF6XpK6
 +ObVYZKnDsHc0lo+CZ4kz+0KfrUaYaq8MGwGkwDfS4E4kpeTR0qm1RWswB0web2dZUQt
 WJVLIkepaHc7jTdZa73XLWE2XGRXuQr8wtss2Pf66jR3FDd6AyGmppuKopdfcW1euymt
 Ezkw==
X-Gm-Message-State: AO0yUKVjcBNJlkN8EydTvKKxxRF695w6b92TIEXp8MD2I/pAY5/ZkDCM
 F7hq/A82T9tUvUutq4of04sCBg==
X-Google-Smtp-Source: AK7set/GXlsIavkm/OM22LQUNc5hz38InFswBnd8PXRYXrrh9sAsdJ+ZMAPmeAHnNIBoOde5rLUhMg==
X-Received: by 2002:a05:6a20:9383:b0:cb:e8c6:26a0 with SMTP id
 x3-20020a056a20938300b000cbe8c626a0mr18498050pzh.11.1677476267765; 
 Sun, 26 Feb 2023 21:37:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 15/31] accel/tcg/plugin: Use tcg_temp_ebb_*
Date: Sun, 26 Feb 2023 19:36:45 -1000
Message-Id: <20230227053701.368744-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:11 -0000

All of these uses have quite local scope.
Avoid tcg_const_*, because we haven't added a corresponding
interface for TEMP_EBB.  Use explicit tcg_gen_movi_* instead.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 17a686bd9e..9b793ac62c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -93,11 +93,13 @@ void HELPER(plugin_vcpu_mem_cb)(unsigned int vcpu_index,
 
 static void do_gen_mem_cb(TCGv vaddr, uint32_t info)
 {
-    TCGv_i32 cpu_index = tcg_temp_new_i32();
-    TCGv_i32 meminfo = tcg_const_i32(info);
-    TCGv_i64 vaddr64 = tcg_temp_new_i64();
-    TCGv_ptr udata = tcg_const_ptr(NULL);
+    TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
+    TCGv_i32 meminfo = tcg_temp_ebb_new_i32();
+    TCGv_i64 vaddr64 = tcg_temp_ebb_new_i64();
+    TCGv_ptr udata = tcg_temp_ebb_new_ptr();
 
+    tcg_gen_movi_i32(meminfo, info);
+    tcg_gen_movi_ptr(udata, 0);
     tcg_gen_ld_i32(cpu_index, cpu_env,
                    -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
     tcg_gen_extu_tl_i64(vaddr64, vaddr);
@@ -112,9 +114,10 @@ static void do_gen_mem_cb(TCGv vaddr, uint32_t info)
 
 static void gen_empty_udata_cb(void)
 {
-    TCGv_i32 cpu_index = tcg_temp_new_i32();
-    TCGv_ptr udata = tcg_const_ptr(NULL); /* will be overwritten later */
+    TCGv_i32 cpu_index = tcg_temp_ebb_new_i32();
+    TCGv_ptr udata = tcg_temp_ebb_new_ptr();
 
+    tcg_gen_movi_ptr(udata, 0);
     tcg_gen_ld_i32(cpu_index, cpu_env,
                    -offsetof(ArchCPU, env) + offsetof(CPUState, cpu_index));
     gen_helper_plugin_vcpu_udata_cb(cpu_index, udata);
@@ -129,9 +132,10 @@ static void gen_empty_udata_cb(void)
  */
 static void gen_empty_inline_cb(void)
 {
-    TCGv_i64 val = tcg_temp_new_i64();
-    TCGv_ptr ptr = tcg_const_ptr(NULL); /* overwritten later */
+    TCGv_i64 val = tcg_temp_ebb_new_i64();
+    TCGv_ptr ptr = tcg_temp_ebb_new_ptr();
 
+    tcg_gen_movi_ptr(ptr, 0);
     tcg_gen_ld_i64(val, ptr, 0);
     /* pass an immediate != 0 so that it doesn't get optimized away */
     tcg_gen_addi_i64(val, val, 0xdeadface);
@@ -151,9 +155,9 @@ static void gen_empty_mem_cb(TCGv addr, uint32_t info)
  */
 static void gen_empty_mem_helper(void)
 {
-    TCGv_ptr ptr;
+    TCGv_ptr ptr = tcg_temp_ebb_new_ptr();
 
-    ptr = tcg_const_ptr(NULL);
+    tcg_gen_movi_ptr(ptr, 0);
     tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
                                  offsetof(ArchCPU, env));
     tcg_temp_free_ptr(ptr);
-- 
2.34.1


