Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BAED0E6C5
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:56:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqhR-0003k2-DB; Tue, 25 Nov 2025 05:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqh5-0003d6-6q
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:54:48 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqh3-0001PV-9p
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:54:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b38693c4dso2350052f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068083; x=1764672883; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtKth+b9TdPq30wZ/hp2A5R8f47SbZbi440xtKAdXk8=;
 b=gTyY0jpjKH1pAxxN4P4DyTapD2xBf5LYj5ID7AkL/6uTDCsecOjF4tWED2wQfOuSVk
 +tw58Sc4VBeuWg0wN36Txoc7FI5mu22J/M7sddl/Z2vCFTRUDSMXykacw5GAAXsuweNF
 40I7WXVa++U+O1kIXczxlag0kjtiwMBmuSwwEjhf3MzN2jCkcOt1qAOW7Qkyx7llITK2
 qRcSYv7KpUyOC5mgn/79tiAcMNolDzBfeoK/tEMB8FrkbIVwPA1AYw9s13RHkirMWB4N
 KoNiif67O5R1Dup8kEuykjo7hBXMkZgSAKRCF9mRBr8Kxp34CXEL5qYJdzicQC0dKKNS
 ef3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068083; x=1764672883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FtKth+b9TdPq30wZ/hp2A5R8f47SbZbi440xtKAdXk8=;
 b=IoQmaGdiackUXObc+hp9xm+TQeLH6kF33sZea0KiNDq0R92fUGMMEBtHZBeFyM2dNT
 sGTTaJDgf+3v13cFYWXi+XKrxKSaRF9bRrXJ1UQu68+B/DMmHLeYJf/PM6XbRsp8hBH8
 n/yCjIzdk6ktD16ngaXmxDVy5HwsegKMOebC0jzYL6a84Bjb4nEeCsGu8Ka/BoC5tX+d
 +d+o8ruia45Kng35kuMpnMHOH9SRyoHDNJvkX4fXenk3oazkcOboUYEjJ3LTK34USGmW
 XyL1qu3JnxsyxmVeYEqlC+OYXL+TbOa9uRpXteDELnVxQ2bw5qn+1Ji3+MejdbxTfM3Q
 N7pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzvQ3L88l4WwWXnCiYjux4iJ9EAREAj04X0OFcWJPgzY8e83nXzk4h/VtrQnzEjJY1rwIMNngouKWx@nongnu.org
X-Gm-Message-State: AOJu0Yy/ox6Sy3ApKd3ga3xJqRU4R6xMoGn47KJnhC54Qzhl31FwKCXs
 HxqY57Ze3KwTZYL7DR+DfdaqrMR1ErgSSKmS7tpcCOdP8+74aLsiXweWhBIfnVl00BE=
X-Gm-Gg: ASbGncvgzxOGKADj70HCI1xcxB0URqDkyPieSL7qNgOlov+i91jrQYr4ZgYQIxiA9ut
 Y5E+TZ93XAgLy2g3vXvMMecdUZ37QTyJpX7//3MBgrIQmXPJW0RcZcVGuyfu1Z94Ow/U65+g27g
 d9dcO2Vqabomo3HzYhSXKm+0B3xV+SLgrrinjG1RVSQXi0T2nN9aQzGfk2V+OBdiKd1dT4gu3UN
 zahHN3iAmc/+wR9gi9lkkvEuBArJgqCJIGw/R6oIvCldh40OOF3fdnPBWMsOxQxe9Sbx+pQIlUn
 ysOUv2KLmzeYzXIwVp3o4+nwCsRZvZtroJkgwMWAxi544oNO4Jvf82DVpL76B2kWKXJjCwslp5e
 rPpp8+CJG0Un5d3UMNZCQqkobqxLRA0Jbl/Cu8xPRqbBbQQtK97Ixf06yvep13AJT4kjBjcd9AJ
 TfehZ/fvr6d7/YHN/u3a72c1w0yTyRZ1e5JcP4/N8p5s0vSlYOBjxR4IK/H4pY
X-Google-Smtp-Source: AGHT+IFaBvSEQ5Wqbc6MfyEWzq5WR0YZGeylAW80PRB1W31X6BTwbu5A//9Zo6uNtRPEWl1RL3KRcw==
X-Received: by 2002:a05:6000:2004:b0:42b:3b8a:308c with SMTP id
 ffacd0b85a97d-42e0f34fa61mr2380260f8f.42.1764068083482; 
 Tue, 25 Nov 2025 02:54:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb91f4sm34331366f8f.31.2025.11.25.02.54.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Nov 2025 02:54:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH-for-11.0 01/12] target/hexagon: Use little-endian variant of
 cpu_ld/st_data*()
Date: Tue, 25 Nov 2025 11:54:22 +0100
Message-ID: <20251125105434.92355-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125105434.92355-1-philmd@linaro.org>
References: <20251125105434.92355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We only build the Hexagon target using little endianness order,
therefore the cpu_ld/st_data*() definitions expand to the little
endian declarations. Use the explicit little-endian variants.

Mechanical change running:

  $ tgt=hexagon; \
    end=le; \
    for op in data mmuidx_ra; do \
      for ac in uw sw l q; do \
        sed -i -e "s/cpu_ld${ac}_${op}/cpu_ld${ac}_${end}_${op}/" \
                  $(git grep -l cpu_ target/${tgt}/); \
      done;
      for ac in w l q; do \
        sed -i -e "s/cpu_st${ac}_${op}/cpu_st${ac}_${end}_${op}/" \
                  $(git grep -l cpu_ target/${tgt}/); \
      done;
    done

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/macros.h    | 6 +++---
 target/hexagon/op_helper.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 088e5961ab7..6c2862a2320 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -519,9 +519,9 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val, int shift)
 #define fLOAD(NUM, SIZE, SIGN, EA, DST) MEM_LOAD##SIZE##SIGN(DST, EA)
 #else
 #define MEM_LOAD1 cpu_ldub_data_ra
-#define MEM_LOAD2 cpu_lduw_data_ra
-#define MEM_LOAD4 cpu_ldl_data_ra
-#define MEM_LOAD8 cpu_ldq_data_ra
+#define MEM_LOAD2 cpu_lduw_le_data_ra
+#define MEM_LOAD4 cpu_ldl_le_data_ra
+#define MEM_LOAD8 cpu_ldq_le_data_ra
 
 #define fLOAD(NUM, SIZE, SIGN, EA, DST) \
     do { \
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index e2e80ca7efa..08db1e9c56b 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -77,13 +77,13 @@ static void commit_store(CPUHexagonState *env, int slot_num, uintptr_t ra)
         cpu_stb_data_ra(env, va, env->mem_log_stores[slot_num].data32, ra);
         break;
     case 2:
-        cpu_stw_data_ra(env, va, env->mem_log_stores[slot_num].data32, ra);
+        cpu_stw_le_data_ra(env, va, env->mem_log_stores[slot_num].data32, ra);
         break;
     case 4:
-        cpu_stl_data_ra(env, va, env->mem_log_stores[slot_num].data32, ra);
+        cpu_stl_le_data_ra(env, va, env->mem_log_stores[slot_num].data32, ra);
         break;
     case 8:
-        cpu_stq_data_ra(env, va, env->mem_log_stores[slot_num].data64, ra);
+        cpu_stq_le_data_ra(env, va, env->mem_log_stores[slot_num].data64, ra);
         break;
     default:
         g_assert_not_reached();
-- 
2.51.0


