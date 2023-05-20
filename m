Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E80C77B7F
	for <qemu-riscv@archiver.kernel.org>; Sat, 20 May 2023 05:46:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q0FPW-0007OY-0J; Sat, 20 May 2023 01:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FPT-0007Nw-JN
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FPR-0007dp-Vf
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f4249b7badso40382965e9.3
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 22:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684561540; x=1687153540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXcukaWbFF62HN09sQV7LoFKa7B0fHLkBZtjDa1RbSE=;
 b=m9jcuZXBdHByEjfauE4oKJQyaTyU49whZMe6zRjeCmP6kYfk25son0cLoeaUkRgAIY
 85BVBBBbzyyXc0iZwJMp3ktSIxr6L7VhnaIUStq+24FOxKR8sq6ncfhXGqV32imvGDAN
 pFSZk0AeoAdepbG9VRNSxlx6S9ai/ELGpe7AvFLXchxpPKWndCnjnNo/5Sb7Pt8h46iI
 pZoU+VRR+0cTC+nyqNUBWUHw5lOZMM5vnuiblhABeQIf7LB+N2Ac1+S6ZGvHhRugS7oK
 aQhFWvDPfLV0IjB6jkRDoQk+5CfttA8uaCFY2enPHARU0t1R/YTDSNIml3IJlCj2LQzs
 jNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684561540; x=1687153540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXcukaWbFF62HN09sQV7LoFKa7B0fHLkBZtjDa1RbSE=;
 b=hhQ7Q/Rff8UgTCsQZ0xO7Qzuf81H5MExbNVWkhG/pCHAqseZaHTJOkrJthzrzjTmIU
 BUh9zVFe8ZJMo9wBudQH4g8yBO0cOWjT9SvK5kYFLL1fYPmfYSiH9BBIhxsJUCOSCFXB
 FlWpKz7P6cOu2oL1DKNWWwmjizpm7bwKIt7Vsl+Pm6J8ZiQpZ9a/YsZDPQmd2rcUC/ms
 n5fShOlgA4dhrME4X/NRL5JyBClyHwn+mbvByDKur7Bbr3T9qOC2kbu16l3Ia911gHRP
 G89NnYiM/F2sm2ERr/YFuYJ/75aIGb+8ZT2ZbIbk84fNu3BHF2zvgyH2VlGoHooILOhb
 jDzw==
X-Gm-Message-State: AC+VfDxv5nlz4d7NH/yPy+8HIdWWZ89tRmS1+KoTPuP3bFXW6ZhfluBc
 rme/+e/Zdpqesml9k2pFeeUOZA==
X-Google-Smtp-Source: ACHHUZ6bgex7spNwvcTdQoTXcKLQYC5SZZosop6yrNb7653pVrNKU1MeyJaENsWTX6+Gj8OSb9ALjw==
X-Received: by 2002:a7b:cc88:0:b0:3f1:8223:6683 with SMTP id
 p8-20020a7bcc88000000b003f182236683mr2396819wma.40.1684561540264; 
 Fri, 19 May 2023 22:45:40 -0700 (PDT)
Received: from localhost.localdomain
 (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a7bc382000000b003f4fbd9cdb3sm1128093wmj.34.2023.05.19.22.45.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 May 2023 22:45:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/riscv/opentitan: Correct OpenTitanState parent
 type/size
Date: Sat, 20 May 2023 07:45:10 +0200
Message-Id: <20230520054510.68822-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230520054510.68822-1-philmd@linaro.org>
References: <20230520054510.68822-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

OpenTitanState is the 'machine' (or 'board') state: it isn't
a SysBus device, but inherits from the MachineState type.
Correct the instance size.
Doing so we  avoid leaking an OpenTitanState pointer in
opentitan_machine_init().

Fixes: fe0fe4735e ("riscv: Initial commit of OpenTitan machine")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/riscv/opentitan.h | 3 ++-
 hw/riscv/opentitan.c         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 806ff73528..609473d07b 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -55,10 +55,11 @@ struct LowRISCIbexSoCState {
 };
 
 #define TYPE_OPENTITAN_MACHINE MACHINE_TYPE_NAME("opentitan")
+OBJECT_DECLARE_SIMPLE_TYPE(OpenTitanState, OPENTITAN_MACHINE)
 
 typedef struct OpenTitanState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     LowRISCIbexSoCState soc;
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 9535308197..6a2fcc4ade 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -78,8 +78,8 @@ static const MemMapEntry ibex_memmap[] = {
 static void opentitan_machine_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    OpenTitanState *s = OPENTITAN_MACHINE(machine);
     const MemMapEntry *memmap = ibex_memmap;
-    OpenTitanState *s = g_new0(OpenTitanState, 1);
     MemoryRegion *sys_mem = get_system_memory();
 
     if (machine->ram_size != mc->default_ram_size) {
@@ -330,6 +330,7 @@ static const TypeInfo open_titan_types[] = {
     }, {
         .name           = TYPE_OPENTITAN_MACHINE,
         .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(OpenTitanState),
         .class_init     = opentitan_machine_class_init,
     }
 };
-- 
2.38.1


