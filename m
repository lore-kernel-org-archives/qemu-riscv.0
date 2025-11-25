Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025C0D0E6C3
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:57:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqiI-0004r2-Pj; Tue, 25 Nov 2025 05:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqi8-0004XH-6I
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:55:55 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqi4-0001nH-1l
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:55:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42bb288c219so4588023f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068143; x=1764672943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/moKxyhhhNUAAssiCB4z5/4yHLvVf9L6ospDexZsZ8=;
 b=yOlt9LaYNYjuk6yA/JJ6P4+iYfNT+9NlDEBRdTs2kQAKSia4j+rM7kLZG3CJm2nvGS
 w4key30D/JlP/+8ojziaLxU0oxRTMSffekjlxZKMBTp4r0jfHnf+ZIy79ZOwabm7YdXp
 ijnGtGijz4jL9sXCS4exwsNZsjrfshh/aBzj2HFQbCSv/FEnE+tvs4wFh5L6hAcAsO8/
 N8dLhKIEt9WkpNnq3IekpsNBXLHo8aUSuLf9Ww7jrG40sO1O7dV3bEOkwICTdD7ERbFq
 2iP9rFbvprUTXPl8f1nbCvpzdf4HI5s5k3obyXYnW+yOVb7A6SU2ZvpxRw9p/I9g+b7c
 5L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068143; x=1764672943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1/moKxyhhhNUAAssiCB4z5/4yHLvVf9L6ospDexZsZ8=;
 b=VxkUaiN7bOuwsLzIbl4T8K6jbC4qDGQ0WC18GIscWnMvV1Y7TSbCcw51WmiTs6gqdq
 ffhstvFlq0C0XQJGog34cTus3sSx6bOr/HP8JF5bVQemflKXDXjL4/b1bIlSLjtc3Xpo
 Df9ujsQTpnFBJMY2Z1su4hG+IjtqbecPpnMk4kKnPo8/HHxjp2J8JO2NI4hfi2ISKjYr
 vrXGvsDkIEfvj1uEYq2javIKJ4Vl5IHtJZQG+HUeJkTqIVjeiZYFqVYmUuADLaZuBeF8
 h6KN4E+vwvPNT5lexMkd1MUetDRRTtJmfl7+qxsaSzdqKR0zskNxPim+rmTHX4ggc6Tx
 gmLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVJ86xib6QjgJK9ojRJgDfqmHh184OoM8vkEp1BTd/SXMbmkJ60gJcItGiv0tu+F62ABL9lVb4B9Es@nongnu.org
X-Gm-Message-State: AOJu0YxQ1cTCiwPDruDa08Xv4dwu7vDA6x7+mdhw6mrCPvNKcRW8GA3w
 XFNd4whZWGLgUeZLlz4yHDb0W4iVRHvThlJgPkVuuXz++kzWpPx2RBW0ZPE3z5/pTVQ=
X-Gm-Gg: ASbGncs0BE3klq1hV+eKIdFmZEuahZv0+N6gveJs9LO1OMZeZRp2tmQgk5b7AUFGnJW
 vAqNRsll5tkcphfC0jdcJRYnOVHlTjlyhHg1HIpR5Fqv1KN/AoqkKSV/TEhYRpAwXrvcey8pPCY
 U8463L91K7sPfqWls3KUDnWNCjFysylFa/11MdZQxFQCqM4J+0cNb7pO0cP7rp3+vHHkMT8cAxZ
 Ecwp46SZSW94WoQr81PV40LpgoZh9fs0cecmzK4qP5x97Sp83Bo29bTgSaE91LQTswl3zJMmqLd
 Ex9Aa85Ae+zBJN0hREA5KFipKqB6aOyb8iSYVfnx956/Qd0Tc8WuYnOjjNWVFIUR7aB/Vop5rtv
 Xreym34Or2b0fHbsHhkbhRHUy5stSAXzeqBmMu1QIKLBe3vlKo37IoT6vGCDXTBIltvQ71kTVHZ
 qBGfzN8JeJ+oLwX23+ZLbQZQr3vVt4C2ds9nVg1SMxWg4He2gRAlscI1yTqn2o
X-Google-Smtp-Source: AGHT+IHyvsxgcQUNPg/NfqXzo+L4q8Axosz32sAX+4NDQUAgn/EY3SkUaSnhck7OcRoCLKievYQ1+w==
X-Received: by 2002:a05:6000:4022:b0:42b:3746:3b85 with SMTP id
 ffacd0b85a97d-42cc1d198c0mr15200852f8f.45.1764068143512; 
 Tue, 25 Nov 2025 02:55:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cc231dc6esm24754351f8f.7.2025.11.25.02.55.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Nov 2025 02:55:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH-for-11.0 09/12] target/riscv: Use little-endian variant of
 cpu_ld/st_data*() for vector
Date: Tue, 25 Nov 2025 11:54:30 +0100
Message-ID: <20251125105434.92355-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125105434.92355-1-philmd@linaro.org>
References: <20251125105434.92355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

RISC-V vector "elements are simply packed in order from
the least-signicant to most-signicant bits of the vector
register" [*] which is little endianness, therefore the
cpu_ld/st_data*() definitions expand to the little endian
declarations. Use the explicit little-endian variants.

[*] RISC-V "V" Vector Extension v1.0

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/vector_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2de3358ee86..caa8dd9c125 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -193,9 +193,9 @@ void NAME##_host(void *vd, uint32_t idx, void *host)        \
 }
 
 GEN_VEXT_LD_ELEM(lde_b, uint8_t,  H1, ldub)
-GEN_VEXT_LD_ELEM(lde_h, uint16_t, H2, lduw)
-GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl)
-GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq)
+GEN_VEXT_LD_ELEM(lde_h, uint16_t, H2, lduw_le)
+GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl_le)
+GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq_le)
 
 #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)             \
 static inline QEMU_ALWAYS_INLINE                            \
@@ -214,9 +214,9 @@ void NAME##_host(void *vd, uint32_t idx, void *host)        \
 }
 
 GEN_VEXT_ST_ELEM(ste_b, uint8_t,  H1, stb)
-GEN_VEXT_ST_ELEM(ste_h, uint16_t, H2, stw)
-GEN_VEXT_ST_ELEM(ste_w, uint32_t, H4, stl)
-GEN_VEXT_ST_ELEM(ste_d, uint64_t, H8, stq)
+GEN_VEXT_ST_ELEM(ste_h, uint16_t, H2, stw_le)
+GEN_VEXT_ST_ELEM(ste_w, uint32_t, H4, stl_le)
+GEN_VEXT_ST_ELEM(ste_d, uint64_t, H8, stq_le)
 
 static inline QEMU_ALWAYS_INLINE void
 vext_continuous_ldst_tlb(CPURISCVState *env, vext_ldst_elem_fn_tlb *ldst_tlb,
-- 
2.51.0


