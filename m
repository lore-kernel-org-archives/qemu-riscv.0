Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25EAC47258
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 16:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rSJSt-0003W1-RF; Tue, 23 Jan 2024 11:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rSJSn-0003Ta-SK
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 11:17:27 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rSJSm-0007Sz-28
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 11:17:25 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so3960862a12.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706026642; x=1706631442; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o+uMzKgEdWxAfaTKc31QCrp/gGCfKuJesU8lsEew9OQ=;
 b=gplP29iVSScKTk34+wZ8YaVmjICPbnpENSyV7qfE9dBhm2L2dy1ADtJh8DyBrSpCbl
 q8HtzfWfsm2y8WOBhz7dKR/9LjqA04i4vtegq3ZtUGjp/OAZxHTCXv7CbaKpGSTkRNFE
 1LxoPNQo4p9PehvMU4xjHY2aaNVUNabdHQcHLHD0vAMchg/xXN8qIBbjOPmUX/av593W
 I+IwtVLmSqmMsGzOfHm22J+j3RmUUZr3m2YhSoPvhIYmlVdIph+kcn3NEK8gG2XCU8ZN
 uiU/oIl5Sk4gYEdW74r5V0ghpmtSFXfarFSpXlqd00Uox/CxdcY0BvyD4BWgbxdweQK4
 F0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706026642; x=1706631442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+uMzKgEdWxAfaTKc31QCrp/gGCfKuJesU8lsEew9OQ=;
 b=AG4gK20CtE8MEGqrFrh32/LYEu5zfy0vvRxajOLqqxaWMt1r7zDxZE/tk/vP+ZSKXW
 Q+lvZcLcJYTWkO9HMWkhkPNsrT4vXGSb4VJlwUtw8jIabowjq+3NbZBATwE4zbyGD6FV
 TjLQ0x7+uDlSbg62FWn9BF3dkF61zavNmo6SxXsy33mtPNxKYzR9yJ3z+oCXhxYVgmC4
 +CKqBW6pLegF6MUYtZPgyw2+WTDNG0zMzQ3OlWafKBkb14l9UaY4bXrgGNTbqfeQhXtf
 IA8LijOghTnrDNbLa6cV4hygKYQ67du10WEtUgS/5mpA43p4S2EbIdewC7UoLRcVZlV0
 021g==
X-Gm-Message-State: AOJu0YyfnDpu0RTu4WuUIxX4pCdtKPDkctj52iEZWf5X5gs74pj5z7TK
 0BC737LoHTlN35wMKNf0BpbPeqJD7G0WaxMzDfPfEUZfLpssT1N6FQXj4zYDGwM=
X-Google-Smtp-Source: AGHT+IHLlmK+3asEIWRwGkfIALuLSuka+7+zFVfUpIxr6eMhMnjtuu0bBVX3V8wotnnveIrNnetOzA==
X-Received: by 2002:a17:90b:3cf:b0:28e:3b7f:a2af with SMTP id
 go15-20020a17090b03cf00b0028e3b7fa2afmr7414350pjb.47.1706026641730; 
 Tue, 23 Jan 2024 08:17:21 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 u14-20020a17090ac88e00b0028bcc2a47e9sm11755686pjt.38.2024.01.23.08.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:17:21 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/3] target/riscv/kvm: support 'vlenb' and vregs[]
Date: Tue, 23 Jan 2024 13:17:11 -0300
Message-ID: <20240123161714.160149-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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

Hi,

This short series implements both 'vlenb' and 'vregs[]' in the KVM
driver.

The patches were done a couple of months ago but we were missing some
changes in Linux (support to 'vlenb' in KVM) that got upstreamed
recently with Linux 6.8.

Patches based on top of Alistair's riscv-to-apply.next that already has
the 'remove vlen, add vlenb' changes.

Daniel Henrique Barboza (3):
  target/riscv/kvm: change kvm_reg_id to uint64_t
  target/riscv/kvm: initialize 'vlenb' via get-reg-list
  target/riscv/kvm: get/set vector vregs[]

 target/riscv/kvm/kvm-cpu.c | 144 +++++++++++++++++++++++++++++++++++--
 1 file changed, 138 insertions(+), 6 deletions(-)

-- 
2.43.0


