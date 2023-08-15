Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2682DC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:38:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0ms-0006UQ-BP; Tue, 15 Aug 2023 16:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mp-0006TD-Ef
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:37:07 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW0mm-000131-Rm
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:37:07 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bd0425ad4fso4867709a34.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692131824; x=1692736624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VCJpeJK//sLuFv0BvYUfNG8DD9g7ICJEAF5RfRSvnA=;
 b=LeKxwDZG7Sj2Le6yVnwh6DQOaugsV2tZXfcckQV6JPM59CpHCyHg6jiil15nIrbhOy
 7Wa+4zSkCsQVh6v5BOLExN+wBBdMu+9m1eFiVtGzAevgsAkYiJhJTXwwvvQ6PwjE4KC+
 +CiQdKSXnulhxeTc4HKVBUFiFKBLeVpk+mq/L2ZOkcdm6vrS8S104zzGuKoVNc4vM4s7
 rL6ppr+4E7aQfDrQ9RCYf2lBPP+v3SGrB+vhIsAXKUohucaeEx+AU6pUl85n0Fcm+ldr
 +w53NTh8iG4kZZeXoER0ZXcwUpxFgmziS0XLLNdiLBbtFUfet+OVGTS0K/7247gXUPYx
 v6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692131824; x=1692736624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VCJpeJK//sLuFv0BvYUfNG8DD9g7ICJEAF5RfRSvnA=;
 b=l0c7bBtsp+Xi8xJHwnoRi43WShGE4LjgiHBG/igsMaur7U7MqHTAGEali3xmBa6TPp
 Yfu8dfBpbd3+NV+lEVcSeof/rxw7nSJQJKcrGlu9DItj5AKrwiRIhEE4rGwV44rRTepk
 0KoXSIxXXq4njq5AxgoBjrnY2aQNMgnk3tJlUfmRcCSKk+9yWggoqq4ZXYsnrDrzLJ0k
 R+GJfQq6133cXLYCukgqaf9nGNcwSgum+MQ94fVERsReq5Fe/AMlm8u/iug78Xa2TT5N
 PHZF0VoX9NOX5UYYiBYQrhEcn5smgI8F57ymnMd+rCshvkULnmkBBKGe+246lkOZueSg
 sUsA==
X-Gm-Message-State: AOJu0Yx1oQ70vznj7kE/4vWGFhKim3Xpnu+ZPRCuQvytZ6ERU3eox75W
 wJBYOglN7tQ+h2bGBQvUkMGkgg==
X-Google-Smtp-Source: AGHT+IGDx/IeMrveNmTV1RV3pBPNwOmNjlluZbd14h/gUfWVPoGboVdsHkAUtNorSD5ENPoioGzMKw==
X-Received: by 2002:a9d:74d3:0:b0:6bc:eb68:ea4 with SMTP id
 a19-20020a9d74d3000000b006bceb680ea4mr13352382otl.21.1692131823924; 
 Tue, 15 Aug 2023 13:37:03 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a0568301bcf00b006b94fb2762asm5526849ota.23.2023.08.15.13.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:37:03 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 8/8] target/riscv/cpu.c: consider user option with RVG
Date: Tue, 15 Aug 2023 17:36:35 -0300
Message-ID: <20230815203635.400179-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815203635.400179-1-dbarboza@ventanamicro.com>
References: <20230815203635.400179-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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

Enabling RVG will enable a set of extensions that we're not checking if
the user was okay enabling or not. And in this case we want to error
out, instead of ignoring, otherwise we will be inconsistent enabling RVG
without all its extensions.

After this patch, disabling ifencei or icsr while enabling RVG will
result in error:

$ ./build/qemu-system-riscv64 -M virt -cpu rv64,g=true,Zifencei=false --nographic
qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d779660739..e87f50daee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1133,8 +1133,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
           riscv_has_ext(env, RVD) &&
           cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
+
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
+            !cpu->cfg.ext_icsr) {
+            error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
+            return;
+        }
+
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
+            !cpu->cfg.ext_ifencei) {
+            error_setg(errp, "RVG requires Zifencei but user set "
+                       "Zifencei to false");
+            return;
+        }
+
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
 
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
         env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
-- 
2.41.0


