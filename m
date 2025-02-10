Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D093C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:33:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbM2-00049o-4x; Mon, 10 Feb 2025 16:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLz-00044s-MG
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:07 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLy-0002Qe-2l
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:07 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dc6d9b292so1970761f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223004; x=1739827804; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TcZHkuWys2mgVq8GL0a6AId6axol/O+ywSBYt05fm4=;
 b=x3rQpBQ0c+TrEIT7+Hy0zDViNuJ7ynH5fMQEwrLIfl5D1yMS/wtOcifDbxaItyj91b
 GWdvbAe//aV6WJATfyo2O9rBraL9as/S24IaherGCX0Xiw7sXjVcNpsHcISYjlYcBd11
 qYYifXc3lIV9ASC5LO95TmCvRqWp8cAiBqAvzHihEsvEDwOLlf4diizljBLOnAfZwJhp
 VTgCWVI/d2L1+X186O/NkAgYcLABFDo0Pssy41B6tgq+UCEN8vo+HmUY/bwO/UcD0m2o
 7j03OFIWmtg2RblczMAr8bmm3uFNwX9pAOkojEqiYvEbg8Z69znErj94JnY0wsQHvec6
 6rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223004; x=1739827804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TcZHkuWys2mgVq8GL0a6AId6axol/O+ywSBYt05fm4=;
 b=lbHtrh3IngvJKdbf8WkBHsiPL7F1qLBdkbyzynbov4ZZyOYgBRqaVolNhQzKgpp2jo
 D21z3HxKzuUux3thUXXLA8pq6qOHjmSbEsBn+si6F4oeyMDsnUSKpsGjNTme+H7W9Ak9
 G+ZhKOYwEm6ql4bbPj6G1pyK3W4qDG+jC35TTDmR+5k8c4p/sc9JYTQZirIlytsLuhHQ
 Gh5bwjavLQYWtjKMM76Vj3Ta5EJF/+P3w60rUNxur0x8oHAluFW1UauabZEXiFxq+Qpk
 EbroBOCsipGVwi9OLpoXb3+ev3uOurGc9MIhOgrPj1cV/Sp39/NVHDoMEEDCdcOID597
 zlhA==
X-Gm-Message-State: AOJu0YxCKTdRkaxtl47S83MhQXSwBjnX0TuIGWylFybT+yzmMYeJFQLi
 mwg6kLxk0Iwy93PWcqKxBX5kYBPC3TPLNbUqdXQZmBkx24pp0leQN1jLrujcqkM=
X-Gm-Gg: ASbGncu1JetAjdmMQ9YSVbjwiNyF6AHt5l5O1wfx7+0zRbnQIH/LJ2bfSrGegsnltzS
 EUMgUjt5AOzPm5v/P9Vs1igOXAClzdqNT+TeGGCNCeVU8T6LvgmpMcsIHeDt5o5deNWyRPWMPS2
 s/pUnPzRIAci4Wae4plcq2iw9rb3j77ToR3gVw/jUOv8emVJkkJv7kZoaGcTGiNPzsB9QQbpp66
 O4QQqh1tby9zLSYTDzbCiXxasQdGjIlR+g2Vh4Q75sQ0rK3RqGrjw6Tand6McH/tZfsf4CrXE3g
 R+NlemPhpX7A37vk6naUBdaA6qWEkgSrfXMOGcNX2UVrL5H3eFMs8sMyVBkEWgwZug==
X-Google-Smtp-Source: AGHT+IEybuJN0iVC0lvUnYblFezq2sKDkEo6bIIrzo35HIr8jogIOE/wSfSGM77kq46sdHxBW6II2Q==
X-Received: by 2002:a5d:64a9:0:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-38de416d70fmr1012371f8f.1.1739223004112; 
 Mon, 10 Feb 2025 13:30:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcd34a39esm10092759f8f.30.2025.02.10.13.30.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/10] target/ppc: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:26 +0100
Message-ID: <20250210212931.62401-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Have the CPUClass::disas_set_info() callback always set\
the disassemble_info::endian field.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 25e835d65e7..e816d30114b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7398,6 +7398,8 @@ static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
 
     if ((env->hflags >> MSR_LE) & 1) {
         info->endian = BFD_ENDIAN_LITTLE;
+    } else {
+        info->endian = BFD_ENDIAN_BIG;
     }
     info->mach = env->bfd_mach;
     if (!env->bfd_mach) {
-- 
2.47.1


