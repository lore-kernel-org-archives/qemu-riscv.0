Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78D7C46CD2
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGND6-0002UK-1F; Thu, 21 Dec 2023 12:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGND5-0002U1-1p
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:51:51 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGND2-0007vl-6l
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:51:50 -0500
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35f519f3ea9so4952935ab.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181107; x=1703785907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNKontpfLUZyadIzXzNBnB69eWAYBQx8Z06ZfrYR8/0=;
 b=IeCcfGki/r1XMetuUJQ1OKkUFjMttf2qNURwlEFN1a4F1Frxsrxa/0GO9q5kWyHzPf
 ynhlP3wXksfod9bs1FCJSATY/jbaB+F3JILGhtME8D2A7SaHPNbcqGRmfYZn96eh7H7d
 bSDg3rYQVOwg0nQGDdQkd/vpLvjARUuS3cyxRU4GWXmnXiH2ts5Uq8tOKHMIg2zhN5X8
 bsSkZ5RLGXI8MjStRnZzPBe+ePZwNnnYDSdL+yExErbBhueJhQ7i1BcVTWQf/Hn9nI83
 5z94b990SUEqYGdzBvlEFIjKszWDts+G7ISh+8hTVHKDpMmEM6j61FlkEEBsbijGefAx
 LcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181107; x=1703785907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNKontpfLUZyadIzXzNBnB69eWAYBQx8Z06ZfrYR8/0=;
 b=KEY2b0eBPDPVhZVAaD7zvVCeZ5bCnRCp2Nmfjmz9NQRoRbJ4d7oVPIBRBQrSaBF1o9
 55Q1wthArlBUUzinL7xhDML+P/v8/00KTRZw3IscN/r4jZ7dJ44zik6oeN/dMqmTivp9
 BwTYTopEXz3ht0V26+kwnDeTN7pWvl3ERIPo+HoglXGkONc2CD4MpbVPWpfQBzZa5xLe
 EreH7YuqPhjHncL6bLVFnIaj21/OvAKoOjBwJFA3ySaq9AVWgFVpZ03RByxUrXvFGsi8
 WBx8Uxmr66GhL2z4fQEjsAcj/Yk8dHlEj+OAcL5db7aVAqSHVzRx+UDa59Hr2AnGW9C1
 rx1A==
X-Gm-Message-State: AOJu0Yye+9EjLapCQpN0ljNERMEj9asiJRhxE+yg6fl2u/7hYf+QXBNh
 +oAv5G9ZTBpavCa8lz+ojCf/Ow==
X-Google-Smtp-Source: AGHT+IH4el+xtvfYc8eu3QrCedv9jj6VkMTVMjHqfjl8O9qOL+5GVbTntzuCPo3HwUYRjnMNJRzgUA==
X-Received: by 2002:a05:6e02:1b8f:b0:35f:b126:374e with SMTP id
 h15-20020a056e021b8f00b0035fb126374emr8256453ili.107.1703181107083; 
 Thu, 21 Dec 2023 09:51:47 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:51:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 01/16] target/riscv/cpu_cfg.h: remove user_spec and bext_spec
Date: Thu, 21 Dec 2023 14:51:22 -0300
Message-ID: <20231221175137.497379-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x12c.google.com
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

They aren't being used.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_cfg.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index f4605fb190..c67a8731d3 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -136,8 +136,6 @@ struct RISCVCPUConfig {
 
     uint32_t pmu_mask;
     char *priv_spec;
-    char *user_spec;
-    char *bext_spec;
     char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
-- 
2.43.0


