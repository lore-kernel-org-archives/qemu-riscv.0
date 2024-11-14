Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1EED65C62
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 09:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBVw2-0000QC-7O; Thu, 14 Nov 2024 04:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tBVvI-0008Jw-Qh
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 04:13:57 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tBVvE-0007hN-KV
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 04:13:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so267132f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731575629; x=1732180429;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPcEE6kBtAUoaXinJQfR30MxYrRluNtCFG7wXxXLjDk=;
 b=iumQSKIUlFI7KpghndbmJBvsF96tpNdzqIcMumJqD51j4lLna5+2GGmRJEgCzbDf+3
 txaCJDVzZIhAhGpB01pr0P4YeMAaURT+YwLFDtAIKes1Akvg68SyHOXHef2k0BsLuLqK
 wP0ltV1deJaht0Bg7Vdxa4070nRfTpqmGTworXewauanqHRxdJ4mhgn98e0EdMgB1N0i
 80DNtGhwSLLtGFuRayxj3EOnLGB2OWTyyHWle6H6OGPwoFf4rCVOTlh4o0rCW7rrXLAP
 CGmKS5W+yBmCzExdMu9PQ0rJT6Si01OlYxJ9RNLbgMA2kpJxSZjjh+0vr+B42EZmAXA+
 5K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731575629; x=1732180429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPcEE6kBtAUoaXinJQfR30MxYrRluNtCFG7wXxXLjDk=;
 b=eMla7OVartZJcn+wSdQWMQGuvu6VQ6WR3rocx3cbtwsvRFOZYygil08y8djUgpJkSj
 uInT067evUszCuqiup1OveTMaDGjXw8gAbYoIzUMN8eKxxAePXSZRw+Y80211h/K1RiU
 /noCpQOZUAp+N9ZtOx6b2itHksfhZrantyQ4SMk/tAckttMNaQzsAZllcX/dMD4YWEi2
 VxZVCkhBO7oJvjZW5oLzEkn1lLr43YHdG6f5WiTNvVEt+0ZyNK437nR9m+mmEKiK8gaG
 LEZgE1d6ksmz/2nItwRpAh62xM+xwLVDGVRx8eqzMwTaoSta05S/IhhPoLszU85rj7+H
 9mUA==
X-Gm-Message-State: AOJu0YwcSzfwZmlakM0ga6iy7+u2RwtCjJu3rIAaTFpkAPiGSyBsYvUb
 SIftG/zV3/NlMVWpLjhtITLfI6c+JMhMMNBsLqXLQaugP9ceD1qDHKB61n2AEhDEoBrO3vSCXXr
 1
X-Google-Smtp-Source: AGHT+IHiNA+yclBvxbnb+D0si2ylXsdA8SsvFd/ZyaQm6rcDe0u/O8IeCwLuWhkX/ctTPpJAoUSb0g==
X-Received: by 2002:a5d:6da8:0:b0:37c:d2ac:dd7d with SMTP id
 ffacd0b85a97d-381f1872f17mr18581747f8f.30.1731575629107; 
 Thu, 14 Nov 2024 01:13:49 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae313e3sm899050f8f.94.2024.11.14.01.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 01:13:48 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 5/9] target/riscv: Add Ssdbltrp ISA extension enable switch
Date: Thu, 14 Nov 2024 10:13:26 +0100
Message-ID: <20241114091332.108811-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114091332.108811-1-cleger@rivosinc.com>
References: <20241114091332.108811-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add the switch to enable the Ssdbltrp ISA extension.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5224eb356d..39555364bf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -190,6 +190,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sscounterenw, PRIV_VERSION_1_12_0, has_priv_1_12),
+    ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_13_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
     ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1506,6 +1507,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("smrnmi", ext_smrnmi, false),
     MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
     MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
+    MULTI_EXT_CFG_BOOL("ssdbltrp", ext_ssdbltrp, false),
     MULTI_EXT_CFG_BOOL("svade", ext_svade, false),
     MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
-- 
2.45.2


