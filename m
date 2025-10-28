Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68511CCF9EB
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoXg-0000ZU-LO; Tue, 28 Oct 2025 14:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoXV-0000Pj-DT
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:35:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoXO-0004at-Qk
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:35:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4285169c005so3006496f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761676510; x=1762281310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbV20QgyIxlspSHe3slsxqgoOZCxZe5hmrWfCx1z6jY=;
 b=ht6gfUrVraJDYYa0CBatWamXOspZgpNax59eNF+2RDl1ryGeVu5+1fxwbJitjTO8oH
 nvlqmWC4cTjwkl+iJ0+L0VrutYFHeEcnmd+Nog2c2JdTzscJlKUyMvR8pkuLjlLXkPUk
 kw9O1aug88IGRZ7wEqlVpIFPzkLNSxw6AFSeyIdIaymdsfKB9VyaV/K8G4aVht3TaGz/
 xRe75ZrKr/T+rqTI8jJgdkOXDlvnPoRjB11YdSDnLYwQ2bXd4mprMIALTqxrs78htQTP
 nCzw/haCNywpdTQS+/o+nWgX5YAQqjSqvYvST7G1CaeJiEvdLBhKQfFATDPsSdHFGSgf
 fiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761676510; x=1762281310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbV20QgyIxlspSHe3slsxqgoOZCxZe5hmrWfCx1z6jY=;
 b=h895hMeZjU+XF/cLt3eqPljDAIkfjwsomwNmcsWrRsSpKJxt98Ca6nW2kxfwy9+GWR
 6Cfoza47EbAkrlB7wvZIkYPz6hJ5ORN9klcGSrumZHgwXLgaprLlyk1G9/0xHweu5WAf
 +B0wGsNUsRsdZI2nS6QyHPFBFG70mhT8mY5uUBBCbfvIOc/wperBmbN3cE9YS+bT0SGM
 LlGV1hCmxlt+A33y+y2jyhkRXl6sS2PxiXkv/+IzcC8Z75jk9c4sbsnL/SBHjkxHGvPu
 RTYCpRtbKDp6Er8rsL7QpIY27T9qHiD3XYA0D/mWCwstMGC5I0QYQcv0/oR6HKtAfxsF
 92aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXipEl+VIqowgdRDWLADjtH8x+sfsWEevW7XWgHfhig1IwYuqVWMgZ4MukjcQdyqJXqC9HGn1hsAOo1@nongnu.org
X-Gm-Message-State: AOJu0YyB2uCX0p3RF81m+hHN27X+ppay9K/sOjjnmDFSZwdoE9GctV2m
 4iA3/dMMTd9pLLVjwbM/1DridDmMqqOXD/CgZ1eJyAIGED1ICWCLF5cfXq+8faEFGTw=
X-Gm-Gg: ASbGncvWDALKgVejq3fCmWv3N3FUjPANnvkvwaoDtNBTCXWv9DJTFmmlH2OqYsHS38l
 Hvq2R0ZfSRoiva4GM9Ran4QDTnCCr1jDfuOYdbwVqgPCz4IwumUZTervrXRaldmqvHgb2QxvNsr
 SFCMgR08aDiBOGT0sxe3v0IivrFBaXyZiqRPf8//7Wa7/dLrtDkOr2pdlt8g+S61Tt5QHKV5n3Q
 Y6l2VMZcH//GxFUpWf+Mpe7HAg1qwBXTcSdmQpr9g6oQWFV56jsA8CS51GEE3r0rIqFWJI8hfqD
 Ddgb3aZSdqRFYtZ3ivEShkXSl7quA472QS4cjxzLVX0keH5qAA3HyOhuL7dbCj+8urD6EYu+I6c
 GcLwoz9ivQaTBBaYGYV6iXj2ub0U8MdSuM5MmtX3bVuOuPd89cQjpRe6F2UKjCzMENEOBMtGdER
 srWCvrsQvuoiwAXLb5YOK81+cUzln4JRAfBeYc6MXrtrX6UoMA+Q==
X-Google-Smtp-Source: AGHT+IFZvJ9NpojrZnUC56Rkdt1ACx7aQJVJlyE1/s6DyXLlTiXnLMfxQJUA3nNkIlmy15bezLbfdw==
X-Received: by 2002:a05:6000:2082:b0:3e0:c28a:abbb with SMTP id
 ffacd0b85a97d-429aef77d9bmr77676f8f.13.1761676510363; 
 Tue, 28 Oct 2025 11:35:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9d1sm21375687f8f.35.2025.10.28.11.35.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:35:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 19/25] hw/pci-bridge: Use memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:53 +0100
Message-ID: <20251028181300.41475-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

MemoryRegion::addr is private data of MemoryRegion, use
memory_region_get_address() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aa55749954a..0cb94fca9c0 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -161,7 +161,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
         MemoryRegion *mr = sysbus_mmio_get_region(main_host_sbd, 0);
 
         return g_strdup_printf(HWADDR_FMT_plx ",%x",
-                               mr->addr, position + 1);
+                               memory_region_get_address(mr), position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
         return g_strdup_printf("i%04x,%x",
-- 
2.51.0


