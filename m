Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F27DD0E6C4
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:57:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqiI-0004pP-8w; Tue, 25 Nov 2025 05:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqhw-0004S7-Uf
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:55:44 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqhu-0001l0-0A
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:55:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso40265035e9.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068136; x=1764672936; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idPfVbwdmuwP3E4rOS4isKmneb6eqTi31QSmeF+nOd0=;
 b=liIaP2nQtgUVbfTvfqHMDQMA3Y7/Ck5aNulP3dWUmoFYY7SmDVkqc2Oi7xbb3g7TQo
 Pr1GTllfp8Me60rJpsT6VNk0XY+bmzRVKinJEUH5tTH1NuS9tRwIKlfIE9XRt10P5t2Y
 G/GMTvOujwOhTxaBvK1cfH2ao2Jxsz+PM9rU/66AA+WKY6wnkoDEjMFQgY7CwwOSER1G
 YyhajHCUm8ekKJlQRPIBdPCUy4ZFbrfnszdGoVui1H4jsztT1Z380nNm95vPjzPgUruv
 1tP4hWDsLtzlTEkJIwaAcdTuO+zQkgbr9ZRozHY3hjEIALX3QnGWZsP3uq5RPbo0AMnG
 6pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068136; x=1764672936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=idPfVbwdmuwP3E4rOS4isKmneb6eqTi31QSmeF+nOd0=;
 b=lKW7GMHqooL2hZIBY3vgsvt8nJAMX2LJ2F84hymug9F+x0v932eqfsLBevcZYPQi4D
 SiJicARlHM8NHjasJC90kamOYYqiK4k7LBB3fZ3QzaXA7w3GUvmEhFlyFHHZQY0zQdpk
 zaaNAXAEcIUTcZA3veP1+hqIxC0XYRjlgJu66mo42bcpMqknhJ11Ly+Wo2lr1b7QFObT
 nEQiR3beucftEE+qdTzKUTN10/snRIyFFkLbdjaYF5pPEevaCYMAln6TWn4Bdy9phUp4
 p3O7HAAxKNj6kQsnDYkEscEm8fo9uST7ciKUe3xsvo1H3A2D+VLhvMVokKLsMISScxof
 IXiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYQ5tHaz8pR5n5VRBtQT6Of8IliHm2s/7iLviML6dawsbjVPq3vMG0iBKR5yWZ3gF1Hy4XH4pDzIhK@nongnu.org
X-Gm-Message-State: AOJu0YzyYbcpTz5P9Pl6/QDfq290euOaa1qn1fPrVkyQeFTi7zat4Y5j
 FRm0v1/gdavcXW1jRt81JiTUKUxVWG75N8lKegUuuDv9XVwQTACvn5kx8WeMyiV0Qr4=
X-Gm-Gg: ASbGncspJk1mvE6QOrKSepbAhbQEgN0BIZ2mP6NfdIbIxy29Q5K6CwJYQeetQ7m2THi
 CvzF6qaOZ7qdazKPqh427jh58xc6X4zfmaBc0o64Zo0J+t+H21vLZGnoToyx/6nS2Ad1uDsHrAm
 XUp3BuyxNbITGfVCf951Cl4/fFWDSEZ57HcKG4UBgYksOAxdr2C7DX/j0RTIX9nTI5IBUP2CFXI
 lQ/0ZeZoFshu5t/G7nPgDV5jJkVeqSrJFMQfmC0+mg58BXpIq7lLUpcrKNbDLl9fOdGiyIy1zHy
 s237W2HlzrqboiNUp0X9HzyFTiOZKrXER92LFMFX0hYmVsa5yJaUZq/T788yWhDIXcKCs7kx/ES
 GF1sm7IDHRb+5Xvna2i7V3Dn2dFFVczqRvopWAMVJITtI5l3h8IDB+a7Z0YJdgo+fsUk+QGOa54
 43x+KrfNnonTgD6exVD6pbVx1v6EfvSccbdnL2s9ua6mYWJI8cX3q4atc8GA4z
X-Google-Smtp-Source: AGHT+IHqFvVaV1NpPrrFgJAwG9qoxoIIsgYpq5DCkzwkvMmtxEBHOyDGzJI1lnHrjyrkPXEiPeQ7FA==
X-Received: by 2002:a05:600c:4685:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-477c052f04bmr158778295e9.13.1764068136086; 
 Tue, 25 Nov 2025 02:55:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e5b6sm33267759f8f.1.2025.11.25.02.55.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Nov 2025 02:55:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH-for-11.0 08/12] target/hppa: Use little-endian variant of
 cpu_ld/st_data*()
Date: Tue, 25 Nov 2025 11:54:29 +0100
Message-ID: <20251125105434.92355-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125105434.92355-1-philmd@linaro.org>
References: <20251125105434.92355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

We only build the HPPA target using little endianness order,
therefore the cpu_ld/st_data*() definitions expand to the little
endian declarations. Use the explicit little-endian variants.

Mechanical change running:

  $ tgt=hppa; \
    end=be; \
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
---
 target/hppa/op_helper.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 0458378abb2..65faf03cd0a 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -107,7 +107,7 @@ static void do_stby_b(CPUHPPAState *env, target_ulong addr, target_ulong val,
         cpu_stb_data_ra(env, addr, val, ra);
         break;
     case 2:
-        cpu_stw_data_ra(env, addr, val, ra);
+        cpu_stw_be_data_ra(env, addr, val, ra);
         break;
     case 1:
         /* The 3 byte store must appear atomic.  */
@@ -115,11 +115,11 @@ static void do_stby_b(CPUHPPAState *env, target_ulong addr, target_ulong val,
             atomic_store_mask32(env, addr, val, 0x00ffffffu, ra);
         } else {
             cpu_stb_data_ra(env, addr, val >> 16, ra);
-            cpu_stw_data_ra(env, addr + 1, val, ra);
+            cpu_stw_be_data_ra(env, addr + 1, val, ra);
         }
         break;
     default:
-        cpu_stl_data_ra(env, addr, val, ra);
+        cpu_stl_be_data_ra(env, addr, val, ra);
         break;
     }
 }
@@ -132,7 +132,7 @@ static void do_stdby_b(CPUHPPAState *env, target_ulong addr, uint64_t val,
         cpu_stb_data_ra(env, addr, val, ra);
         break;
     case 6:
-        cpu_stw_data_ra(env, addr, val, ra);
+        cpu_stw_be_data_ra(env, addr, val, ra);
         break;
     case 5:
         /* The 3 byte store must appear atomic.  */
@@ -140,11 +140,11 @@ static void do_stdby_b(CPUHPPAState *env, target_ulong addr, uint64_t val,
             atomic_store_mask32(env, addr, val, 0x00ffffffu, ra);
         } else {
             cpu_stb_data_ra(env, addr, val >> 16, ra);
-            cpu_stw_data_ra(env, addr + 1, val, ra);
+            cpu_stw_be_data_ra(env, addr + 1, val, ra);
         }
         break;
     case 4:
-        cpu_stl_data_ra(env, addr, val, ra);
+        cpu_stl_be_data_ra(env, addr, val, ra);
         break;
     case 3:
         /* The 5 byte store must appear atomic.  */
@@ -152,7 +152,7 @@ static void do_stdby_b(CPUHPPAState *env, target_ulong addr, uint64_t val,
             atomic_store_mask64(env, addr, val, 0x000000ffffffffffull, 5, ra);
         } else {
             cpu_stb_data_ra(env, addr, val >> 32, ra);
-            cpu_stl_data_ra(env, addr + 1, val, ra);
+            cpu_stl_be_data_ra(env, addr + 1, val, ra);
         }
         break;
     case 2:
@@ -160,8 +160,8 @@ static void do_stdby_b(CPUHPPAState *env, target_ulong addr, uint64_t val,
         if (parallel) {
             atomic_store_mask64(env, addr, val, 0x0000ffffffffffffull, 6, ra);
         } else {
-            cpu_stw_data_ra(env, addr, val >> 32, ra);
-            cpu_stl_data_ra(env, addr + 2, val, ra);
+            cpu_stw_be_data_ra(env, addr, val >> 32, ra);
+            cpu_stl_be_data_ra(env, addr + 2, val, ra);
         }
         break;
     case 1:
@@ -170,12 +170,12 @@ static void do_stdby_b(CPUHPPAState *env, target_ulong addr, uint64_t val,
             atomic_store_mask64(env, addr, val, 0x00ffffffffffffffull, 7, ra);
         } else {
             cpu_stb_data_ra(env, addr, val >> 48, ra);
-            cpu_stw_data_ra(env, addr + 1, val >> 32, ra);
-            cpu_stl_data_ra(env, addr + 3, val, ra);
+            cpu_stw_be_data_ra(env, addr + 1, val >> 32, ra);
+            cpu_stl_be_data_ra(env, addr + 3, val, ra);
         }
         break;
     default:
-        cpu_stq_data_ra(env, addr, val, ra);
+        cpu_stq_be_data_ra(env, addr, val, ra);
         break;
     }
 }
@@ -211,12 +211,12 @@ static void do_stby_e(CPUHPPAState *env, target_ulong addr, target_ulong val,
         if (parallel) {
             atomic_store_mask32(env, addr - 3, val, 0xffffff00u, ra);
         } else {
-            cpu_stw_data_ra(env, addr - 3, val >> 16, ra);
+            cpu_stw_be_data_ra(env, addr - 3, val >> 16, ra);
             cpu_stb_data_ra(env, addr - 1, val >> 8, ra);
         }
         break;
     case 2:
-        cpu_stw_data_ra(env, addr - 2, val >> 16, ra);
+        cpu_stw_be_data_ra(env, addr - 2, val >> 16, ra);
         break;
     case 1:
         cpu_stb_data_ra(env, addr - 1, val >> 24, ra);
@@ -239,8 +239,8 @@ static void do_stdby_e(CPUHPPAState *env, target_ulong addr, uint64_t val,
             atomic_store_mask64(env, addr - 7, val,
                                 0xffffffffffffff00ull, 7, ra);
         } else {
-            cpu_stl_data_ra(env, addr - 7, val >> 32, ra);
-            cpu_stw_data_ra(env, addr - 3, val >> 16, ra);
+            cpu_stl_be_data_ra(env, addr - 7, val >> 32, ra);
+            cpu_stw_be_data_ra(env, addr - 3, val >> 16, ra);
             cpu_stb_data_ra(env, addr - 1, val >> 8, ra);
         }
         break;
@@ -250,8 +250,8 @@ static void do_stdby_e(CPUHPPAState *env, target_ulong addr, uint64_t val,
             atomic_store_mask64(env, addr - 6, val,
                                 0xffffffffffff0000ull, 6, ra);
         } else {
-            cpu_stl_data_ra(env, addr - 6, val >> 32, ra);
-            cpu_stw_data_ra(env, addr - 2, val >> 16, ra);
+            cpu_stl_be_data_ra(env, addr - 6, val >> 32, ra);
+            cpu_stw_be_data_ra(env, addr - 2, val >> 16, ra);
         }
         break;
     case 5:
@@ -260,24 +260,24 @@ static void do_stdby_e(CPUHPPAState *env, target_ulong addr, uint64_t val,
             atomic_store_mask64(env, addr - 5, val,
                                 0xffffffffff000000ull, 5, ra);
         } else {
-            cpu_stl_data_ra(env, addr - 5, val >> 32, ra);
+            cpu_stl_be_data_ra(env, addr - 5, val >> 32, ra);
             cpu_stb_data_ra(env, addr - 1, val >> 24, ra);
         }
         break;
     case 4:
-        cpu_stl_data_ra(env, addr - 4, val >> 32, ra);
+        cpu_stl_be_data_ra(env, addr - 4, val >> 32, ra);
         break;
     case 3:
         /* The 3 byte store must appear atomic.  */
         if (parallel) {
             atomic_store_mask32(env, addr - 3, val >> 32, 0xffffff00u, ra);
         } else {
-            cpu_stw_data_ra(env, addr - 3, val >> 48, ra);
+            cpu_stw_be_data_ra(env, addr - 3, val >> 48, ra);
             cpu_stb_data_ra(env, addr - 1, val >> 40, ra);
         }
         break;
     case 2:
-        cpu_stw_data_ra(env, addr - 2, val >> 48, ra);
+        cpu_stw_be_data_ra(env, addr - 2, val >> 48, ra);
         break;
     case 1:
         cpu_stb_data_ra(env, addr - 1, val >> 56, ra);
-- 
2.51.0


