Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6bG-0001np-6N
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ab-0007WG-5u
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a5-0005kx-8z
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so29592545e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097636; x=1685689636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBYlnrp5r0dnt/Qn2+Cyqv4p//zkrum+IysmcShvf5s=;
 b=fq/Q/Fim4Jowm2cI85zyikEMpFfBtR77DowUda/NBWVIKllP5uPYynmWMACj/xapBK
 HkORVmtzIauZfQZKyXLER4o3RKAN4JxudX8TsmCDFL2rS3yQ21r0vOpx7ZSJXvw2YYgc
 55zfYEudQgCg9K/p6KTj3Y+TP2ZwnUyg8IZQdsfq1abFo7Fw2BYJDFwaMscp4sB3nB4i
 p9jF2DvfwegHbBOnp2y13Y/Whh/46kBJSVThCByTUMofc9RR6tQUt+BLKO2M/r2zPJwq
 gUlvFe5ijZ09VWbSz6S86yCKKjnxaSqmepNrUXhfwhfbQSC4MiWfEez4yKu/vy1npTOV
 oMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097636; x=1685689636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBYlnrp5r0dnt/Qn2+Cyqv4p//zkrum+IysmcShvf5s=;
 b=VQTT5sQXPpW5S/Arc4KMZH7yMUmZL5XDOZ+gSYyxtTahar+Uht2zN8ELhRzZu330Q+
 YSG5PJ0HVjacXUwidis+yjHeo7xTTSAe46ZT2B/tr/kFTUO6dz75SWWyHJCVS69yVAsS
 eDelKCWTCGgFOh/VvOb3Nj/Ke23lKAz7uUKFZpxPMDdu6MiS27PdlSToaWjJtOZQxfQL
 DZxrdy/pxiOSext9z/AvBgrPRiD5eRtuq6fBK6flOS1mL/kah2gcV0dPbKOxhaiEyOK2
 f33Ubtj3cSi5hxAYKV2NkaOPSjPYOvXCctud5qgXKfMojteqvQvKp5i5YsRYO9YntH8D
 nulA==
X-Gm-Message-State: AC+VfDw6NzoZZwnc8Nu7JBmc7NPGanuMaHX9Q6Cb4/tFy16cZGhv8keO
 VHDYJkgZBn0j8hOzLJD0NLJ2vQ==
X-Google-Smtp-Source: ACHHUZ7NfLUQqbQNba0cyh6AcA8PDoE2u264u5lzDLPVlMbdm2Nt1BygFq05MIa9HmwUKMed2CqY6A==
X-Received: by 2002:a05:600c:b54:b0:3f0:a785:f0e0 with SMTP id
 k20-20020a05600c0b5400b003f0a785f0e0mr13230204wmr.40.1683097635906; 
 Wed, 03 May 2023 00:07:15 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 24/57] tcg/loongarch64: Use full load/store helpers in
 user-only mode
Date: Wed,  3 May 2023 08:06:23 +0100
Message-Id: <20230503070656.1746170-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:07:49 -0000

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d1bc29826f..e651ec5c71 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -783,7 +783,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  * Load/store helpers for SoftMMU, and qemu_ld/st implementations
  */
 
-#if defined(CONFIG_SOFTMMU)
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
@@ -822,35 +821,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-#endif /* CONFIG_SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


