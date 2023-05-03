Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6SF-0000hy-7T
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rk-00009u-HN
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R1-0001tE-GF
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso49003695e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097074; x=1685689074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBlLTyWKOiEkOq0J5b/GXBVDB4TkoIkhZS8BOvAsaM4=;
 b=u2Bhi55bZqbHB7M8XahsTwDZtqSe+2e545vT014aCxXrFNtxCZorQzpqli+YAPHzLe
 j2v2pamGEb2enRmIUfNxJj57jdM4f7wA05G/lOlarrZ9FcyXQMboyifPxgdvXiSSCavi
 DeXra2RTSykspfa2SKKz2Ihfqu3/QADuS+OT5/oHdfsXfVKm2iKvUKwuYr86DgA423gp
 EsuuH6Q5xU5ILLI4itktkNigco2HIYx7Kas+f4odPsWsDdIn2W0p9IDPAMfJxO2Dp3FR
 BqYv8wC7afgW8Gt5gNQO/3ZKLNdh/Qk87Al8rCkbUZmvxGkYT7JXMVxWHDmTocpiYEy1
 o6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097074; x=1685689074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JBlLTyWKOiEkOq0J5b/GXBVDB4TkoIkhZS8BOvAsaM4=;
 b=lJUuoHT1Vpv0r7W9hZoSv1sMrRTVNTGKQf5cqcn3NA3R78Ld6ilcQhknlSZa5E7Kk6
 Q/TzSOS8UapP88+Xs5/94JX4NnOoDwNHDsFDnqoZ6YKJYaxEPL48ZSu1uH3u7MOUlLwz
 Meo+fg5D7rdQEAUgbdLYv/e2k6Kv1anWdQI9BSyB64vkm2kytKxcxw2nGdMblO1ep087
 raVlBQYAPSmdW8/5yQzK/sPrL0CKgxBrLlUHBHYrAqxrD6a5NfO0tqN1mYUdQV09BaPZ
 W35DNFcfk44pvG5nK26GcGbsMr/nAroDIALhjvQFIvFn/HSugqKrWQkhsVWOUrIRz2vC
 1tWw==
X-Gm-Message-State: AC+VfDylhMEbIMBUjvBHhMCKST+GVc9tdaaiH6bVyhxejC0UMZ3sF4fd
 zopMQOvPe1+WzlVgGQGmWzhkvA==
X-Google-Smtp-Source: ACHHUZ6QNKqQgivBxU65wEVf+uSLd9M0u/Vn8to3ivwGk8L04o9anXrfsM54ri3qS0DECnF41hySzA==
X-Received: by 2002:a05:600c:378e:b0:3f0:3c2:3fa4 with SMTP id
 o14-20020a05600c378e00b003f003c23fa4mr13824040wmr.12.1683097073885; 
 Tue, 02 May 2023 23:57:53 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 30/54] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Wed,  3 May 2023 07:57:05 +0100
Message-Id: <20230503065729.1745843-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 06:58:53 -0000

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..6f5daaee5f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1


