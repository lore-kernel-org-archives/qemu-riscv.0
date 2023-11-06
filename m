Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F16C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:17:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxSK-0004XW-Ir; Mon, 06 Nov 2023 06:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSI-0004Sn-TI
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:42 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSG-0004lv-VV
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:07:42 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-408002b5b9fso32375705e9.3
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268858; x=1699873658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8FQLEYTqFB9Ro3y1RtUGoGmFmjKyGG2i99735loRZ8=;
 b=WF6E+sNXVZX/Z+5pGUBibdCMZcz4zUcXLMjWEZE8U35cfkkuvb1O99TDaEPBQh8Rm8
 zYfiXeRlni+swHKXl2RYdTVAJShEUu5Ssm+p1LnmAGRywT9b5hP4oi8moHQ0A6lBOCFb
 VHpypHN/gZbNOUGMxcm7sfQa2GmmGR1SaPBY5wMpGpKSJ+OSmZGh+RFT/HGCEHivRmBX
 GqXPvktynv1dKAt5Xs4kXbXq8DoT/v1VkuodmY7RE/NWmBg8pHRNKdbeziQ+8ZoFn/FF
 xqsDgUzojnCJIHirq23Nc55SA9QwqCc8/ClXOvUQNyKT0w7lXtBnnL5ZdC8hm7CfBS1l
 NXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268858; x=1699873658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8FQLEYTqFB9Ro3y1RtUGoGmFmjKyGG2i99735loRZ8=;
 b=VjgOY4PkDBh73jNGtnNLyHHTpYyXufK9BTstWmcMek6g74N8uggalVJ6+NtYzUDYjE
 WrKBYTyJZYhy37vI0J+5ASN096T8b6obyrPHfvCLdhHu/p4fJKTbLoCt9SsJYZDedJxr
 7OcLi04GD5flHoiU1PuIrGNNdqtSgvjUiN3Ho7ZUUTeJmpLytZwKrO9zBM/9CFjCyLeD
 +HMBZZflpHLQk72sRQpLYECY+DO7ETqGFdxxTbI7hfqLKzbKGn539vhLLgY1or4EjbwW
 BG7t7jxRghtAH2PYDrvRWWPC/46Mo1/fU59o124gUOmYPUzO9XZzFs9kvywsgNWCRS6h
 AGGA==
X-Gm-Message-State: AOJu0YzpzfsuPi8QGSDBXeGl8o0VJ3wUAsUkmQ5W9axU4JJhokPXGgKD
 B1laozLS4ncmxsWny8SzG6t6tw==
X-Google-Smtp-Source: AGHT+IGSllHpaGQMqKbvX8OyPw5FMMgGznDw9vfBmKkgEXMDizlL7BCd/fkfmOdW9htoRowrrHTYDQ==
X-Received: by 2002:a5d:6dae:0:b0:32f:7c01:5376 with SMTP id
 u14-20020a5d6dae000000b0032f7c015376mr22752718wrs.31.1699268858733; 
 Mon, 06 Nov 2023 03:07:38 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d4d0d000000b0031ad5fb5a0fsm9131295wrt.58.2023.11.06.03.07.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:07:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 35/60] target/ppc: Prohibit target specific KVM prototypes on
 user emulation
Date: Mon,  6 Nov 2023 12:03:07 +0100
Message-ID: <20231106110336.358-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

None of these target-specific prototypes should be used
by user emulation. Remove their declaration there, so we
get a compile failure if ever used (instead of having to
deal with linker and its possible optimizations, such
dead code removal).

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20231003070427.69621-5-philmd@linaro.org>
---
 target/ppc/kvm_ppc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 6a4dd9c560..1975fb5ee6 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -13,6 +13,10 @@
 #include "exec/hwaddr.h"
 #include "cpu.h"
 
+#ifdef CONFIG_USER_ONLY
+#error Cannot include kvm_ppc.h from user emulation
+#endif
+
 #ifdef CONFIG_KVM
 
 uint32_t kvmppc_get_tbfreq(void);
-- 
2.41.0


