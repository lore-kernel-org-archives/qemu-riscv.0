Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67684C636ED
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 17:51:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjMmL-0008DO-9Y; Wed, 28 Aug 2024 13:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjMmE-0007jr-C6
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 13:48:14 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sjMmC-0004Xa-JD
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 13:48:14 -0400
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82a0f237a68so18810139f.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Aug 2024 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724867291; x=1725472091;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2fFk/aYqmhVjT/Hd90cJPr3RLS/W89IWIZ3I+253Z8=;
 b=q7hTgrqy9NF54rpj1cq483vYsC9FX+Z854KaDxdUPHfBU1S5q1OVf8PxpONf/uYuzl
 oHUOe0jiKVm6lJ5+KjyAdBj/fONuXJATsMlmiS6N++sncSFd8WNPSiWgRNfid5o5VkiO
 M1uaNBpE7GJjNuVWGpQBA1ijSzfLc5KYJQg/F3cq6oVNiZAKQs2adnAnuO6U9eJDBjfK
 YLdn40tCOfsGscuoFpBPl2c79/mc/75jiwpJ72hPSeYupF19MqsZ3b6kzyoFzRnBlNrE
 0Ii7QnNtQVrEj3dGFrx9Luh1cz0KMJG7nozO89/KoZtFkZYHfa66Ak2tqOtpSigwGxDf
 Bppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724867291; x=1725472091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2fFk/aYqmhVjT/Hd90cJPr3RLS/W89IWIZ3I+253Z8=;
 b=VH1lQRV1T7/t+aD0RZiteAYAPxJRlzhP9nPcCRwkJDkbQcu2rJWAfQ/ExlQdI/4A2X
 lSn2C2IoMclO0rynapKOWdDsNADMkibd1jJKaXIfkGQGSA1RghQQL1oPX6HVipJbe0oS
 0xSr91WhqKHfdZdSfsN0bGrn4cxYvjeJ04x8ScwEhOC8kLRHQxGiU/mkRxM8SywwbK7u
 Mrfs/lNFICf8khcbiV6hEFf+gqbGnpp6AdHZPb0WIS+DNdjxd7k8I4nS0RWR/949g28T
 LuDcZo/p9Od2zHYpHR4gg4lsQifzuHJEerLgRL5OSSM+Sak3R5g3df0HocHcpja/3VK+
 V/1g==
X-Gm-Message-State: AOJu0YwRLAJenonlVIKVry7OBeTOQNA7BFfv3GxN1J6SGm3hXdki7D1G
 2mQRsDNt1onSkAnV12GiaJi0tt1eVlZniPKYHbqfOO1zW7g2DNwjDwli1XMpihJBEHBRmMyvyM3
 M
X-Google-Smtp-Source: AGHT+IEVrS9mK4B2xIT5n2AvNhtn5N5YyMsyObB+8GIvmy8iCcaebVhnvo25NvvpeqGM6gzfqOgPRQ==
X-Received: by 2002:a92:cda9:0:b0:39a:ea4c:2982 with SMTP id
 e9e14a558f8ab-39f377fdb6fmr7471345ab.10.1724867291225; 
 Wed, 28 Aug 2024 10:48:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acdcf7dsm9778316a12.50.2024.08.28.10.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 10:48:10 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v11 20/20] target/riscv: Expose zicfiss extension as a cpu
 property
Date: Wed, 28 Aug 2024 10:47:38 -0700
Message-ID: <20240828174739.714313-21-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828174739.714313-1-debug@rivosinc.com>
References: <20240828174739.714313-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=debug@rivosinc.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c5ebcefeb5..2592465e24 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1485,6 +1485,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
+    MULTI_EXT_CFG_BOOL("zicfiss", ext_zicfiss, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.44.0


