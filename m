Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D4FC02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:32:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFBZ-0001cp-W8; Tue, 21 Jan 2025 09:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBX-0001PF-0G
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:55 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBU-0003Es-7D
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4368a293339so65582005e9.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469491; x=1738074291; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lI4er/UZjcPYTUPzfGtiHhd0qjCJFKtyBNhq4e87GY=;
 b=esQgRAPD/FZMex6GAPmJvaypxjfKid92ezVM97BbSqipCH5GSoODeKHEZfrg76EH7c
 AAkRDUzb4ZC1T9TFyLkVu47S+3h/5szEU5IseAkE1e5xqnrYZQ2QRPZXv4ClI9BnUx12
 RZ01iURINdwZdpuBgU8aq1O9LZGPMV8We7C8wMEI3tx2abXTDsQ1K8uiBJzCb0dZo42w
 FNa6Rayf8cgi8zskhSbxjaM/ILsPF+h9WqKAKJhdAka+OVsnoX7GK7E5+eQrkSXTOVhK
 4XASeYMgKEZZgRwaDjm09ujeSC7+Xz4xXYZy8DqSbJTTytcackWMI3N7G/Z4uSdLTs5C
 YP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469491; x=1738074291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lI4er/UZjcPYTUPzfGtiHhd0qjCJFKtyBNhq4e87GY=;
 b=TKlDaEl/X6SnbueLLALvkQ8/qWD3vzoJnQT2IQsyjrwlg35LN3C5fSdNbcyrTCam0A
 bdc1bmWcz9s6RpUV/BdnYHftaKRQ54+VdaubLILbon+tbxYapCqTEHUS50hAvSH4eieu
 8E4oPpc95A3bjdgJNi7AXHymHVjXcPIM+f6cubdfE0BJd5RY4wPzFxS3WseVcwbjIveD
 upcjD8U4W3XkGgA5SqKLRfwxln+NlUH1xHDr07/QK2fkZmT8mrX+4IZ9f0cV3gT+pZX5
 NSy0ck2UfVaJ8azY6qiiS0xfonExmmHcVP6ie5sk96oow4Ceik8iC66jru3mQafct8cP
 BflA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXng7GTCHmISl+FrAye9I697Palda8u/qZB2/a4Eob4jVW/NtiULwFTJZKUJ88ChQ0alX124m06XDg5@nongnu.org
X-Gm-Message-State: AOJu0YwniGbQ7J9ZEoPZhvnvLJeYA8s5XzaYFz8phA9J4izdv98R445o
 hgAnuhV3YRG1A1ssXnt583esF0N/6+BlIVrn+0atvXiquG4FbU+JDRlNUGgQg5M=
X-Gm-Gg: ASbGncsEeuj1lDSkY/U4+i3193cqUpwCAGmOzPERKABDV+QxdCDt3lGjBztv9wdwer9
 4k060PqltIAnE+dbLrx+87RHBIeZhk3cIY6BmYVrkU+uClRSJKljBFkpYbOeJBnAf7MyJLao9c7
 +dM/gyJZJQOmKUUwu3PbY+2Y/BdHOLaVlTSl/tn+aPf+f+i03dV+wrIpsgWOEa/+q1MWZBr36Y2
 PB0nJHGB3FqYhiXPMQs94KmTx5+qeHvZvcbmmr2ZZVSKUoIWfhr+Mt3Fx5WaC+W4uT9EcWzAcOq
 e7pf/+xFFOOyThrnBDXqnv8BTb9tE5QSHpY4VfCYbyyY
X-Google-Smtp-Source: AGHT+IH2AmG1H5wmqFP1XWCb9LXlLG+q0ojNMzegSUW2QTBvIadZuNV+Dfb/zpIvofwccr5fOG1SQw==
X-Received: by 2002:a05:6000:1849:b0:38a:8888:c0b6 with SMTP id
 ffacd0b85a97d-38bf57bfcf5mr18396110f8f.51.1737469490716; 
 Tue, 21 Jan 2025 06:24:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275501sm13812644f8f.65.2025.01.21.06.24.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/28] target/loongarch: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:27 +0100
Message-ID: <20250121142341.17001-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d611a604704..20aba0e1fff 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -349,11 +349,9 @@ static void loongarch_restore_state_to_opc(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 static bool loongarch_cpu_has_work(CPUState *cs)
 {
-#ifdef CONFIG_USER_ONLY
-    return true;
-#else
     bool has_work = false;
 
     if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
@@ -362,8 +360,8 @@ static bool loongarch_cpu_has_work(CPUState *cs)
     }
 
     return has_work;
-#endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int loongarch_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -835,6 +833,7 @@ static const TCGCPUOps loongarch_tcg_ops = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps loongarch_sysemu_ops = {
+    .has_work = loongarch_cpu_has_work,
     .write_elf64_note = loongarch_cpu_write_elf64_note,
     .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
 };
@@ -860,7 +859,6 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
                                        &lacc->parent_phases);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
-    cc->has_work = loongarch_cpu_has_work;
     cc->mmu_index = loongarch_cpu_mmu_index;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
-- 
2.47.1


