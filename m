Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F937D132BC
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 12:40:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t7wMp-0005vr-Jo; Mon, 04 Nov 2024 07:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t7wMB-0005ue-3z
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 07:38:57 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t7wM9-0001p6-9t
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 07:38:54 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-720be27db74so2610242b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730723932; x=1731328732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70cONpo0NezeXcq+dlKRTJsBJYOs96bE4Mezx2X1ROw=;
 b=OSXoxVwzVLkIano/iGW9+ZczG/TZupY1bU6WbuQImspfrDaWKoPeDoV3QNT5KV3Ito
 HETLeyWaadUuq0+V9/yb0tBnUAjJlW0pygLPhHDUDNp9cevqZ79LgokCZ4yuZPBK3/8N
 MMWdWmU4R6CKV2FJpOD51GqdMmHEQ0GVzIp6IBDYllTLdaK/pHUtcXhWjKaZCfYxUdQ7
 0NiXdUx5FB6SkSZmAJHu9IcfDkhordopLaxxzwljiUlteIBIamivMdRDLVXU/HoN6n+C
 daly05z956uGVRoTZgAC9Jxb80B8HuY7JSbYFuUT6KX0z/TGRAcWQ2JabjybSKA1wjco
 ReGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730723932; x=1731328732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70cONpo0NezeXcq+dlKRTJsBJYOs96bE4Mezx2X1ROw=;
 b=tLnRN7jNYB1rvyDI9tW4P4XQv0J9Fwd3g+IOyk3lvDRVA/Lq/1mZ/wcTnqVxvlGYqI
 exZ/zEJIHHM4eWIwVK2go5zMxQznm41fCseYgVcnU9BkV+egOasOIj2/9q1FUFC/cV+3
 dogHvC6if8KqRzd217YSGI0fFk9xY+WGI72mYpYynNmQghs7RuMGZyxQd7iP+x6XQzk1
 Zfe7Z0owV9hi22vtI02MS9DPyc58b0Jw2EfolIX56FK8sPFD0Mui48VZSzhi0d8jGQNW
 Vy601F7XAmhcm7daUi5F4FgTo1AH3Kg3lvDtoXBHXXgXwioxElGTyKeKcoLT2ne7bdTn
 U+hQ==
X-Gm-Message-State: AOJu0YyzPVHA048W5DCkvAiLzmiA37aVoRQOMvkDLGSid2YbFOPNSa+Y
 u6dhD/Qsx4QIfihvV+j+tXAZd5PieH9lXcPCQLJeg2KrIx14xEYKegcO7TtxYK4=
X-Google-Smtp-Source: AGHT+IGozwgJnhDKho1YVPQZxf9TGFbk8HtGPwVUSw/K/4/3ViGU/S/oAmWDB9Ue1TR3mzL2mCYy3w==
X-Received: by 2002:a05:6a00:2e0f:b0:71e:6a57:7288 with SMTP id
 d2e1a72fcca58-720bcb1ae5fmr22545739b3a.5.1730723931985; 
 Mon, 04 Nov 2024 04:38:51 -0800 (PST)
Received: from grind.. ([152.234.121.56]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc20e4c2sm7550953b3a.91.2024.11.04.04.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 04:38:51 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 peter.maydell@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/2] hw/riscv/riscv-iommu: fix
 riscv_iommu_validate_process_ctx() check
Date: Mon,  4 Nov 2024 09:38:39 -0300
Message-ID: <20241104123839.533442-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104123839.533442-1-dbarboza@ventanamicro.com>
References: <20241104123839.533442-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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

'mode' will never be RISCV_IOMMU_CAP_SV32. We are erroring out in the
'switch' right before it if 'mode' isn't 0, 8, 9 or 10.

'mode' should be check with RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV32.

Reported by Coverity via a "DEADCODE" ticket.

Resolves: Coverity CID 1564781
Fixes: 0c54acb8243 ("hw/riscv: add RISC-V IOMMU base emulation")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/riscv-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 05341ad20b..dd102b3c70 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -803,7 +803,7 @@ static bool riscv_iommu_validate_process_ctx(RISCVIOMMUState *s,
     }
 
     if (ctx->tc & RISCV_IOMMU_DC_TC_SXL) {
-        if (mode == RISCV_IOMMU_CAP_SV32 &&
+        if (mode == RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV32 &&
             !(s->cap & RISCV_IOMMU_CAP_SV32)) {
                 return false;
         }
-- 
2.45.2


