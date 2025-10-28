Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D96BCCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:19:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoHi-0001vu-OE; Tue, 28 Oct 2025 14:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoHD-0001af-Fh
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:18:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoH0-0002Ea-5G
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:18:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso49169285e9.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675494; x=1762280294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01hqDrORZqT6m82C01ACWFcfM3wBkQW5SH2Nidv/XUc=;
 b=RlaLx+tSY+hUqtRkv0QBR+kj18iFR0oQwiDaIcpvqhbALvf1QNldhOUZchhfDJ9fYt
 vaJLMKOXc2HE5nEMIn5s0yUbQlp2h6G77348/3JSSWddUK72pMTU8cRU5AfYpkliAL0u
 /9Xp+MKzGgbEqt147Adgw/AuP4MFbbwS9Ioy+E0SglbSAUhCK2J5ugVBgLhCBRcJMMTH
 PA4NqPmrcu0gbUEWw/z9mM2FoygWvtk1JUwP9CIvDQ3JGGtheNX84ctD3fcw/97XMaLf
 aykIJjCpZF1pg9tEzDbKZRJk31Eahu1AjB8B1wFwdnIwo8cLqahYIUeU4svH4TzxOwvb
 6eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675494; x=1762280294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01hqDrORZqT6m82C01ACWFcfM3wBkQW5SH2Nidv/XUc=;
 b=FWH+hlvqj/MJ6XRELix3B5d1G+YE+k9gGV+kWtDmExvRbej9TPEzrRqYdae/bwDvb9
 HwP1/whIncFML6vvBm/nqEdFDAE/8alMUI7ocPpHaR5x0G2djKeMd70hXdgK3vtxD/2k
 /PWzVmwBr9mQqEp/Uxp0LRqtPC7LQIXYLCwV2SgvRXaYAS9I3f4oT6vstKTGw+agl+nq
 LFE6XCN0e/RTnzYvxn87OgZY4uGUbyiW7OzE6YkrAoXgIGCQ902y/Ept+FU73Fm0Ko6h
 MNG+7+hFyqrFgnT+lc990xpFtCumnRNku6IlkqgL3TKf0LydDeRv7O3gXHC2Nz48b3Zb
 H4sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPTh4StEAgzIVbcFUNz+aNDZ2WSLX3l9viK8kv8uRTCDWIXr0ZcmuTDlohB2P+UfKy7wPbsW+nx1Dh@nongnu.org
X-Gm-Message-State: AOJu0YxPGHpJaNidbSdxFFkJzrXGONXQ9qv1sNx9AuBgiu0RMrgThFRU
 /3h6U33u0F3wrcyBORcEjK8Ioj38Pegsut7e+p7zbUlrOq87iML6AN+Zjm0bnhBWBsM=
X-Gm-Gg: ASbGncvlFMtgY313yvYxKo/XFmkgFDQ4aIxVFaIJXYPep+wTTJztruzs49Q2mdHmrAT
 tHgtQumlfa5tSnkJdTY2Ca03MYOfU48JubPhG46fdt7YSG27D87uXs1Ek6Ke0Cnfcdvi2KFDG6t
 n/k1AM61++EiuiHthB/eTXE75CS/UbtPfDKyaIjmHLpojye8hMrtTR5WwZ9gRzx9fSr4KKz9ELN
 U1/FuuBD/diI0RScLaFlHxtzgZNf5y0wYQFzTtXgs6vn18IgUO4N/TJWEujLYWDe65aaVz8jJtm
 SnsDQwGl1FEZDN0TwDCvqjAyQlGqs92Qv9OmaYFIo47KEwFbneVXIg3+E37cHFJFjVc7bXh7Hbc
 /p97M+InVAbujQIi8kd6ql77BbwE1o5xFvorDmOQ4i1+ZncnVHDYCRjpfASbn7rZPVhAKVIgpX4
 d3p1sVLsTTV7uc+mmTEphYXa3A2POXFJXOHDFQBQjNoE4fDP9J4A==
X-Google-Smtp-Source: AGHT+IGiptqj6/iCv9W/NsMN2YruISusc2YzRGdBP1Bs0Mn8UNzSF4baihJ10riNMKzZLg8Yf/0Y1w==
X-Received: by 2002:a05:600c:6218:b0:475:dd53:6c06 with SMTP id
 5b1f17b1804b1-4771e20a66cmr3592985e9.40.1761675494104; 
 Tue, 28 Oct 2025 11:18:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718fd69fdsm25186225e9.3.2025.10.28.11.18.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:18:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 05/25] hw/ppc/e500: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:39 +0100
Message-ID: <20251028181300.41475-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 8842f7f6b88..fe1aeffe676 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -887,7 +887,7 @@ static DeviceState *ppce500_init_mpic(PPCE500MachineState *pms,
 
     s = SYS_BUS_DEVICE(dev);
     memory_region_add_subregion(ccsr, MPC8544_MPIC_REGS_OFFSET,
-                                s->mmio[0].memory);
+                                sysbus_mmio_get_region(s, 0));
 
     return dev;
 }
-- 
2.51.0


