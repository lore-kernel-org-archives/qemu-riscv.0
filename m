Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2CAC47DD9
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:13:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRwtq-0006aI-GG; Mon, 22 Jan 2024 11:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwtp-0006a4-Lj
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:49 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRwto-0005MP-6a
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 11:11:49 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5ce9555d42eso2824395a12.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 08:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705939907; x=1706544707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcOoJBxtOmItyxwzRVxYTpNYgBui/7NGS4TVsI5tRuk=;
 b=j1P6HW0XAxPRrGGsAMHsRdbYrzzPg0CMZBtdpM4cwielvn8qCY8RhnvKBP/sTl80jb
 X0A4LPYXPKGvX27rsns7myN7cCXdwDYQRvJr2WfO6i2a+gSzh141UCnYlPSmZ6I7kj3D
 uXJK2LuuM432CWbbQixruNz9vn84LVfpJXqR4wXA5xixue0E2ejulrjE0xAY9+3g3oPD
 r0uavvgKvJtD/gD1SxWRTqJDVdiEOx3A68BtPL1HO0cyohVxwKBDQ9BXDmK8HtjOU07g
 npiIivMuJ9SWvnJBIYhVASREEQUw8IlbIvw3zAOAFUWaEAQaZtRmDhCfC4QtSNgn1eNE
 UH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705939907; x=1706544707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KcOoJBxtOmItyxwzRVxYTpNYgBui/7NGS4TVsI5tRuk=;
 b=YA++Atl/4O5YFHzePl4nD0M9x4YSYS1pA+m+ElEodRYWkzCsiB+n2Cn//JANAj+Cv9
 mqXgJY6CkJ8RXiGMj9ToWmR/GMk+jULWlQmolsmJEX5UHitCBEU76LpN+djXHkeDBMA/
 01u/f2r7KLFkKy10H7/02UjwmEkY3i9VPPISxdoer5O664bFsRBWxyll/PUm5IKaFqBf
 8Jc10zKhG2nrDqbY5MgbG4jnhpoRwHPX/Oqm01nee5hub2kRWUbVwlmKhlRplx6RAYpc
 NJ8AkP6tecWINox2yLdzdLaviqdXH7LcLOgdXQ9zsvwxT6ByP6baBaOPZFHbCLquWkyF
 TmgQ==
X-Gm-Message-State: AOJu0YzLeI24xPsKliuPL4VzBTqat1+brrBRuw8uojLWrRHYoflFiU7f
 KlgXAAMOaDS8WuSiyHHvq0mrFnLjASsZFhkzw3TYMQ8pw2GIfcdap02O3xERMlq71JQ/cW3PlnP
 c
X-Google-Smtp-Source: AGHT+IGOXZAifSExYp6cN2TXawYHcelH2S/9zYo2uKShw0Ee3l1+cHC5ZE8e1PRiM/JVtwL/Ad+GDQ==
X-Received: by 2002:a17:90a:af92:b0:290:ab28:8079 with SMTP id
 w18-20020a17090aaf9200b00290ab288079mr936507pjq.86.1705939906926; 
 Mon, 22 Jan 2024 08:11:46 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 db3-20020a17090ad64300b0028e245501e7sm9866446pjb.4.2024.01.22.08.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:11:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/13] target/riscv/cpu.h: use 'vlenb' in vext_get_vlmax()
Date: Mon, 22 Jan 2024 13:11:04 -0300
Message-ID: <20240122161107.26737-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Rename the existing 'sew' variable to 'vsew' for extra clarity.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 05e83c4ac9..71696762e3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -692,9 +692,16 @@ static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
  */
 static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
-    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
+    uint8_t vsew = FIELD_EX64(vtype, VTYPE, VSEW);
     int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
-    return cpu->cfg.vlen >> (sew + 3 - lmul);
+    uint32_t vlen = cpu->cfg.vlenb << 3;
+
+    /*
+     * We need to use 'vlen' instead of 'vlenb' to
+     * preserve the '+ 3' in the formula. Otherwise
+     * we risk a negative shift if vsew < lmul.
+     */
+    return vlen >> (vsew + 3 - lmul);
 }
 
 void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
-- 
2.43.0


