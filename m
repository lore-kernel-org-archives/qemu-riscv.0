Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D43DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM4W-0006Bl-TK; Thu, 06 Jul 2023 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4U-0005yG-4s
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:46 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4S-0007CF-JT
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:45 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b71ee710edso455196a34.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638723; x=1691230723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xHvxLB9xtcGXjVSbRp4EDf5ah7gB89LgOtfMTIsy9Y=;
 b=FLFgWlc0U9GNhYvs8R2b5B1N3bH7qOzuc6aODWtHU02WQCFZaj7oGviRPwpJrvCY2O
 eV5tdqDysTR7N0nszsiqKV9jVBQbAtvaTME4bC/r5YGSzZrIDu90XZChSb7woLC/2zv7
 bjExDFGCWYJvCB8tfi8yG+FjH4hPoLk+VkfCycg4LBhSnOXS2eLjNwEsSHyKUgBiDg1M
 eGFXGqiVG8C5JSAnmsRKYjXpfPM9doq8zWcj/yCO86JOUA1MmuVYSXQuKQBnl0pF3QtV
 e2BsMlab98zm7lmHDlgQOZnTuPdeoQl3XtKhfkfa/Vg4l2QptPU+FB2BaDMxI917El1E
 1n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638723; x=1691230723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xHvxLB9xtcGXjVSbRp4EDf5ah7gB89LgOtfMTIsy9Y=;
 b=COlhxZbg7XWHWmLa5AJ2ZC0t9Ke2EMU3ykgJRNVlsd55WPYrPTetK+7ggJScrWtCRg
 Q08wbRiEys/IozF+AxJF70tp7SgsG1joCaQcUDxft6j6Ip5R9syYcuFZ7deiBdfFJiwi
 SndTWzd6okIfC18SUe6AZa/MggyPnUB5JrTXamGl+62qTV4x8yT0QbfV/1fI4x67XP8F
 +pO1f7oHpepZt8T/YRb2rCYs+LhPedGcrgVPIAnVhL6K7JFcAoIUhPrshBB+ULK/4pCp
 A1AMVhNp+0cgOzHXdPvmnH/N3KBt6hyWG7KAJkAoGh+Dtp2aqHnq0f8IqO2tBf5rHtAS
 UA4w==
X-Gm-Message-State: ABy/qLbi0vf07sPuyeTHczL78DS3Dhsbwse+G8R2Ohzu6D3L0OKSePxm
 NZtL4sGJwSm2Ew5OCSo7uRYVuA==
X-Google-Smtp-Source: APBJJlEEH6XhQIEbpvRdPLojACr1QrDW++kPCjHEnNzD0eesTdnE0FRhZc8vE9bXBnMC6mI+2Lh3Uw==
X-Received: by 2002:a9d:6942:0:b0:6b8:807d:82d1 with SMTP id
 p2-20020a9d6942000000b006b8807d82d1mr1390663oto.35.1688638722998; 
 Thu, 06 Jul 2023 03:18:42 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:42 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 16/20] target/riscv/cpu.c: remove priv_ver check from
 riscv_isa_string_ext()
Date: Thu,  6 Jul 2023 07:17:34 -0300
Message-ID: <20230706101738.460804-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

riscv_isa_string_ext() is being used by riscv_isa_string(), which is
then used by boards to retrieve the 'riscv,isa' string to be written in
the FDT. All this happens after riscv_cpu_realize(), meaning that we're
already past riscv_cpu_validate_set_extensions() and, more important,
riscv_cpu_disable_priv_spec_isa_exts().

This means that all extensions that needed to be disabled due to
priv_spec mismatch are already disabled. Checking this again during
riscv_isa_string_ext() is unneeded. Remove it.

As a bonus, riscv_isa_string_ext() can now be used with the 'host'
KVM-only CPU type since it doesn't have a env->priv_ver assigned and it
would fail this check for no good reason.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index deb3c0f035..2acf77949f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2124,8 +2124,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.41.0


