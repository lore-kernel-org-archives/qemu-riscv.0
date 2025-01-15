Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD00FC02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 14:18:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY4DN-0003wo-Od; Wed, 15 Jan 2025 09:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tY4DK-0003vo-WE
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 09:17:47 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tY4DJ-00043r-8l
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 09:17:46 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ef89dbd8eeso8569299a91.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1736950662; x=1737555462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hGKhrWasU+AV7YHxN8tVRXvw4hZD+9qEd3l1jgWJACs=;
 b=dr3FH3QCEF46KwuktXsu/wn+gl4sNRYhZPXuNFKiAoieRe/tu3FpsBTYXaQfVf3IpH
 3VkeTtqTP5qKuuvY3fEfT/fNy/NcLa1P/rxNfy+bW/IJONYp+kEi3cffkLVZRr2nYdcv
 +bz/8KzvUPqRPp2Jese3wJ5XAJJBTbmtj69EvHqmuUnjBc8T9Ki40XlYZUdjh37PurHt
 JnkA1U85zXPiakqQ8eNDsvnKB5tAphxiA59WnkWIo0NO+V9kL3or04gl1YN1+bkKAFyR
 TG0Zp5BISMVzvy3PFDG361yH8qveeaULR3zGko5Rva7dFML1pkMWOaLf+y0l+dNsbILA
 PenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736950662; x=1737555462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGKhrWasU+AV7YHxN8tVRXvw4hZD+9qEd3l1jgWJACs=;
 b=Cy1r9P7DSOpHEVDPpav41mgLAnrOIwqb5TVyyOeB9l2WXOCKU9bD1ktrOXT/cJCdQD
 1yhY0UpRvuQlEFmESs0zTN/nRVo/+8wINygk4ovkcHcV1M2bixHlKKr0aP6yoVZVjiau
 8Xpcdm+bZ+tONu6HL/61FTfioCdZzZ7W4uKg7oVd6bfbE33IIZTti+xhUQMd6ldabNLZ
 7ieuH98j4lUo28y5/1wNH9IsaDvxJhXMP2cUb/iGEUx9S8cCsAM9oAzqzVC7MM6FzB3c
 BlpZ0PlIornfXPYPtkGBwekXYWy3hn9U8+QkbY+CyS0hY4vi7NjFykCj3uipomKe5+ZP
 /07Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZG7Ww8p2hbxWhzvdgDUkwYZuCExvmKqtg3XFXN8y4VRaQ8mKx4NbS87caEP7A/ox7isml4r0pKCbO@nongnu.org
X-Gm-Message-State: AOJu0YysGwlX8fo3SlbjxqTkLfBafBhSy8CTyaOLkTM5mScoC05r5R+V
 5kYiTVT6QICaOblPr2V17kHHvwVg2QXc3RnflKwX6oorrhCZkh5euLTOzxBjtio=
X-Gm-Gg: ASbGnctBJ9M3QBy7Z5HRJKgPAIs4Q57aFHHxiwtIlvJdljwucjh3SMrdWQiMfPPWngd
 eYrH3iLKjUjIH5G0Z0KNBg8Ya6/cKMJBin9MqOIferhFGQSgFRk7WWnU6U+3NlTj5Am5wWXlBOP
 GvYvyl/EZRfwdptkpxvbhvuLSj8QGWgeVl0k7Ql4MSIQb3iqvS6CGlaA/5ArpHQsKR9vgP7PieI
 gLJ4fS3zoHVGgjh7gHAEnwY9n+lQ3WNzw1IE3i2bLKwA3Hh4TIr4A/iuNmdAA2EczUwnt6bqEhz
 8XhyqW49
X-Google-Smtp-Source: AGHT+IHC0TaKPKwHRkMVLPM8XqOe4416utXrCwUeh0aZ+sdMHuRGT11QxGOIiQHFF5f9w3gx8ksK0w==
X-Received: by 2002:a17:90b:2b8b:b0:2ee:d824:b594 with SMTP id
 98e67ed59e1d1-2f548f761d7mr37381677a91.31.1736950662494; 
 Wed, 15 Jan 2025 06:17:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c1cba9csm1432858a91.24.2025.01.15.06.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 06:17:41 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 1/2] hw/riscv/riscv-iommu: Remove redundant struct members
Date: Wed, 15 Jan 2025 22:17:29 +0800
Message-ID: <20250115141730.30858-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x1033.google.com
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

Initially, the IOMMU would create a thread, but this thread was removed in
the merged version. The struct members for thread control should have been
removed as well, but they were not removed in commit 0c54acb8243
("hw/riscv: add RISC-V IOMMU base emulation").

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/riscv-iommu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
index 9424989df4..fa8a50fa24 100644
--- a/hw/riscv/riscv-iommu.h
+++ b/hw/riscv/riscv-iommu.h
@@ -58,11 +58,6 @@ struct RISCVIOMMUState {
     /* interrupt notifier */
     void (*notify)(RISCVIOMMUState *iommu, unsigned vector);
 
-    /* IOMMU State Machine */
-    QemuThread core_proc; /* Background processing thread */
-    QemuCond core_cond;   /* Background processing wake up signal */
-    unsigned core_exec;   /* Processing thread execution actions */
-
     /* IOMMU target address space */
     AddressSpace *target_as;
     MemoryRegion *target_mr;
-- 
2.43.2


