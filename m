Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D976CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DR0-0003sA-Jb; Fri, 10 Oct 2025 09:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DQc-0003Kp-KQ
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:45:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPS-0008HR-J6
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:45:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so1272757f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103824; x=1760708624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4HGgiMv15db038MKi02IiRG5N36n+u7KrBeSKqnYB8=;
 b=Wud4NyLONgRfkVQ11XqFFCRUIi2lgEX73SFrzObShxW2rBbxZoA6O0BUqstKGzBLit
 dwa3aLJHCt4WDNCV36IrZCgWnnsTM6P09EmmAkK1iT9+pxXgE9d871YvZ/LSiMR799ND
 LzLAhGhC1Eiw2ysv1ej52nrty1Bbgr4fKz36vQX0kbny8BDq99mfKhGdvZlJCUjamxfF
 lo3JQXuuRkrpCcPJdVG+CR3XFfx7BPF2OVKtq+Fcz/uGueZ1sJPf2mIsEGSfCJEk3XQ1
 CqWLDpCqLVv2yGVbjmklKZzWdMnELepJnJ2MgPCREk6EFS2XrL3h89AXOELYy5rzhJJb
 XkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103824; x=1760708624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4HGgiMv15db038MKi02IiRG5N36n+u7KrBeSKqnYB8=;
 b=pyRhmyiWOngsajItsZuicBbc4PWAB9/ilrAQeqpKIn6wcbzvsppQUkuIg93fYA0085
 rG/i6oK5GyI7+e35mBcdqcTNWshIHjxegxeyMTWh6n3z7FAy93xl2QhQWNwQPb9ug7Gd
 yxw13BL49nAw6ImX+1WVg8eVl6/udpvhBX/aQRNpoYGG1lybJTUuXXKzOWFm4dExQYjy
 Ve5m96nxCqrPGuzToViFuvP0eUtgtiXrmMlzkxG8Va8GhQt9DnCeEZC2rfRynOK0eQby
 Jexm18UIpX7Pr75/mniuHVdRA7k+bL9EVO2iW8qv0tR4BDl84Ocn0A3AX/5pP9mAmcb7
 YUVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyY1l2/A59IjacFFtwcHFZz8tRzZn5taNnl3ZcEk7oMtKzEO5EQqJMHwYj1ibqDQk/cMVH8lj+Hs1r@nongnu.org
X-Gm-Message-State: AOJu0YzvCo8UgRKbbUWZMLt9tCzQNm/6xE+zx9NF6LDmRzktCo1F/ZkO
 Pa2OpMpXCR+yGkV9aHXeZY/q/dMmgPDIKEwHEOCd7jPmum1XcrknzXryeYNwAR4J7Z8=
X-Gm-Gg: ASbGncub0D+s+PHMAAFD771I9Op3wg7DLOpcaD0ggwxiotj+98PpGR3sh5HHEhlTCUS
 V1iuiR8MWw0w+/huJRbBGI9UlYHgwvwqIBt0gR3Eumb4R8sKGkvuLe3tmzCBBEk1Cr2n6aqScDG
 Q0hii1667HL1mMajBDeqy2F7sv0dkREWqxMRHul9rglAR+DdyO9Tyuq5G/uu2ADNRH4EhmiCq/Q
 tl+uaMyykqknYkqP8Y5fkLPoFbs/UDCVdIKFx82pzK6EY8j9Jcp9XILmkTe+kT3JfsbsxUv68+K
 6JKEa4piYlOEnJ/7m+JYUejvjMe0AUrbs+AKq50wW2tLcJxDaRCTHoGDLTslV/6UBiQMqeosiCr
 mw3XHmqn8mimC21Yf1wHhL2fI7x6buE/uByUwoiMlsZy3Ba1LR4Kfu7u0OOm3+QZGdTcDU9nqfF
 tmjbJe9jzxp5ogv5UqjBM=
X-Google-Smtp-Source: AGHT+IHEvlUtvA1b47Zvxo/zoUXjFDcn/NFvuh+N6pNi1JzgwJ6dpmrR/Ll2gcdeH1ymCCVWKFtYgQ==
X-Received: by 2002:a05:6000:1ac8:b0:3f7:b7ac:f3d4 with SMTP id
 ffacd0b85a97d-42666abbbc1mr9120199f8f.5.1760103824459; 
 Fri, 10 Oct 2025 06:43:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce583424sm4269124f8f.21.2025.10.10.06.43.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 14/16] target/s390x: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:23 +0200
Message-ID: <20251010134226.72221-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/translate.c        | 6 +++---
 target/s390x/tcg/translate_vx.c.inc | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index c7e8574438c..ec9e5a07516 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -258,9 +258,9 @@ static inline int vec_reg_offset(uint8_t reg, uint8_t enr, MemOp es)
      * 16 byte operations to handle it in a special way.
      */
     g_assert(es <= MO_64);
-#if !HOST_BIG_ENDIAN
-    offs ^= (8 - bytes);
-#endif
+    if (!HOST_BIG_ENDIAN) {
+        offs ^= (8 - bytes);
+    }
     return offs + vec_full_reg_offset(reg);
 }
 
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index e073e5ad3aa..f3b4b48ab7b 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -175,9 +175,9 @@ static void get_vec_element_ptr_i64(TCGv_ptr ptr, uint8_t reg, TCGv_i64 enr,
 
     /* convert it to an element offset relative to tcg_env (vec_reg_offset() */
     tcg_gen_shli_i64(tmp, tmp, es);
-#if !HOST_BIG_ENDIAN
-    tcg_gen_xori_i64(tmp, tmp, 8 - NUM_VEC_ELEMENT_BYTES(es));
-#endif
+    if (!HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i64(tmp, tmp, 8 - NUM_VEC_ELEMENT_BYTES(es));
+    }
     tcg_gen_addi_i64(tmp, tmp, vec_full_reg_offset(reg));
 
     /* generate the final ptr by adding tcg_env */
-- 
2.51.0


