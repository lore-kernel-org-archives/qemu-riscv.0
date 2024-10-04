Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAC8CF884D
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:32:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlD8-0004AK-Rz; Fri, 04 Oct 2024 12:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlCy-00046g-3w
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:31:12 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlCw-0005Xs-Kg
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:31:11 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5398e4ae9efso2738632e87.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059469; x=1728664269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIUgZUCWAt295BVKONLExnXwYaPBthL2sBqrxui45VA=;
 b=qq1/z5OtvKGnEznaw0x37LTPR2GJqXXhuk3wPvRo1alVfjT89UjcYNvSLYX1IBHoRn
 GPYjH+2d4LDwE63m+ZQfsfF+ZYOaDufXfzZa8UjcdHq9VnQYS6LFRlmhrOnEfDhmd117
 eZKxl4ZzEUc1O3pvycSzhFKlXrPOW7hmjgIvgsavCzMYbBtpO9bOgjzmAJuyZe8gb9tV
 MUhBu6rn1XdkzGlN9fclu3mR8SlbBGgUPq/fPbrVk6dvWYfKJzKeo+TskIvML2WKBgOL
 YoCai0yJVz3KELofV7ENyRNg78JncpVb3g4EL5M7rY0mtXkp4bu3C9Q86YFJjqOaVf9X
 yq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059469; x=1728664269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIUgZUCWAt295BVKONLExnXwYaPBthL2sBqrxui45VA=;
 b=aWxr+BI7u8F/vFRh2EKgAqg5ttBb6cwADMLpS7vIJcS6fiCJXLNWTmz18DTwaWoe7I
 6LsxSbwXOFhEqZ4dl0qXEU3QC9OsOY9sDxahE2dR8Ru+/4ZP0ZCnLOYaHsWl4Gl9w62E
 g64qWDyntxaDRlojnHtCtVGHwcUbRafr4vjyfPRe0ZZvniPJY5EsUaaG+PLDfIPaykWX
 1IOoeqqLQgH0nqXHy/gS89WbtB5PPyuMtTF5U69h0rTVFWslKmCk/QxTXl1zVYPRAdzI
 UUBBmfciXj0dM5SkBJwAQPTAPDZhXrp+qswa7Zi5Sxzx9OYP6Z033EJQFobNcpa8eFkA
 fpgQ==
X-Gm-Message-State: AOJu0YwfNf7vTz1wnQDVYJSyipNYtQUZ4ooYa1FQc5xj8yaqUM4JG+J0
 fqR+JybQXOKfrYbWZ7gx8/cCJ+cQzzKw/BBfJGtMYawWf2FGpZ0QX1IyOpTepr4=
X-Google-Smtp-Source: AGHT+IHVePiDEX8UnpOrUuEZ9GJ13IQk2Xe4mR+Lk3YxFiVzpQJTTfuBXn9bGIxHhBNDIOK1z92raQ==
X-Received: by 2002:a05:6512:31cc:b0:539:a3cd:97cb with SMTP id
 2adb3069b0e04-539ab9de441mr2264190e87.43.1728059468759; 
 Fri, 04 Oct 2024 09:31:08 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec1157sm1716e87.3.2024.10.04.09.31.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:31:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/25] gdbstub/helpers: Have ldtul_p() definition use
 ldn_p()
Date: Fri,  4 Oct 2024 13:30:17 -0300
Message-ID: <20241004163042.85922-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004163042.85922-1-philmd@linaro.org>
References: <20241004163042.85922-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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

Use ldn_p(TARGET_LONG_SIZE) instead of ldl_p() / ldq_p().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/gdbstub/helpers.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 26140ef1ac0..fd83e366a51 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -94,10 +94,10 @@ static inline uint8_t *gdb_get_reg_ptr(GByteArray *buf, int len)
 
 #if TARGET_LONG_BITS == 64
 #define gdb_get_regl(buf, val) gdb_get_reg64(buf, val)
-#define ldtul_p(addr) ldq_p(addr)
 #else
 #define gdb_get_regl(buf, val) gdb_get_reg32(buf, val)
-#define ldtul_p(addr) ldl_p(addr)
 #endif
 
+#define ldtul_p(addr) ldn_p(addr, TARGET_LONG_SIZE)
+
 #endif /* _GDBSTUB_HELPERS_H_ */
-- 
2.45.2


