Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E40D5E145
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 08:51:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t9Kh7-0004dh-B4; Fri, 08 Nov 2024 03:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1t9Kh4-0004bT-Rs
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 03:50:14 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1t9Kh3-0000wW-2M
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 03:50:14 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2e2bd347124so1478136a91.1
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2024 00:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731055811; x=1731660611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=40bvvcKOltQHXpA3nRcAP1ayEBgymgbTXX5iRDTQQM0=;
 b=EmZ2rjzh//7C0DzrDpl0a7X+uaSZPrxic1ab6sKCp5nqf3pV4fUan9yfoZbpWFEfzG
 ZJOQQ26+r66LTi1lOUpvrjZBMjUAloO4ePLoxonnF6xJdJutRjXitYimf+uW34T8OLpe
 bgftnP06Jdb7wawWzWRjn7QEDbV2QDk7emlT0QlANd2IJzJ8yDMCayCgb7j5h6z2CAv6
 f0Tm2f82ocSsT2mHaFSs5mcydImReBJCL/shSLWeAy3c/0jqRc/t76jBi1zT79qNGPqG
 YRMKsGQv7w16qpF6tvQWsa02uzkCAAGxqIUb45nyFZfkAl8pJAbFaWCz3M/+I4oiHgbP
 pZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731055811; x=1731660611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40bvvcKOltQHXpA3nRcAP1ayEBgymgbTXX5iRDTQQM0=;
 b=Jcp7KPYO9dQACbYv5B4ebQfEhOCLPsVL8PAq4YH1wwVAwTFuhrScHaf7KyptMVlsNG
 YlSMKMhHiysXiXFbawltwnzCgcZGsDH10UoDCo1NI9o2kxxnjttkKhOWCp50M8fCL8KW
 B5XdVppfCXMllC8jEXyW1RPYhLVTtukjPfGSE4OMjoC+EHn3/YHarXrdg/OEswn3IbrS
 2leQIV96iJX6F1u4QHT+n/g3p952ABCaGjcbSpy5HQaQN0X/Zr/szmvCD/WVjvwSfPts
 S6oW0F6ofEaBAhnOmk9gT1Lr/8Vpjtyk25F2zvO9AOs3uJ5ae+q8mavwgQ+UMVvahVv4
 SEtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3WhlM3/Ikof2s0769HYFMBE6QuGXXzBs9pLyXBfkjCxdBvY/9aewtlVSqXwuFccZVNCepnzTP9BsH@nongnu.org
X-Gm-Message-State: AOJu0YwtbxjJQbEW5WhzmcEe8zAL0JzQuEqOrETJEb1bS03SwlcqNEil
 OAkcwDB+99uTEmOhC7ul/mlJs9eiQ7jefSnNZV/yb147P8HdtkHwZO2YDw83IVc=
X-Google-Smtp-Source: AGHT+IGqRbQFFLTkxljwJ/ns9tZybsbm+verNlltpFg/ImoorWUQHMidDh/ZZdt0r/1BbwK36CM1xA==
X-Received: by 2002:a17:90b:4acb:b0:2e2:d5fc:2847 with SMTP id
 98e67ed59e1d1-2e9b177fe40mr2896451a91.30.1731055810653; 
 Fri, 08 Nov 2024 00:50:10 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e99a541da0sm5540135a91.13.2024.11.08.00.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:50:09 -0800 (PST)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH v2 0/5] Introduce svukte ISA extension
Date: Fri,  8 Nov 2024 16:52:34 +0800
Message-Id: <20241108085239.2927152-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=fea.wang@sifive.com; helo=mail-pj1-x102b.google.com
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

The Svukte ISA extension has been approved for fast-track development.
https://lf-riscv.atlassian.net/browse/RVS-2977 
And there are Linux patches for the Svukte that are under review.
https://lore.kernel.org/kvm/20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com/T/#mf70fcb22cd2987ad268c0efee9b8583197d3cb4f

Svukte provides a means to make user-mode accesses to supervisor memory
raise page faults in constant time, mitigating attacks that attempt to
discover the supervisor software's address-space layout.

Refer to the draft of svukte extension from:
https://github.com/riscv/riscv-isa-manual/pull/1564

* Refactor the code

base-commit: 27652f9ca9d831c67dd447346c6ee953669255f0

[v1]
* Add svukte extension

Fea.Wang (5):
  target/riscv: Add svukte extension capability variable
  target/riscv: Support senvcfg[UKTE] bit when svukte extension is
    enabled
  target/riscv: Support hstatus[HUKTE] bit when svukte extension is
    enabled
  target/riscv: Check memory access to meet svuket rule
  target/riscv: Expose svukte ISA extension

 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu_bits.h   |  2 ++
 target/riscv/cpu_cfg.h    |  1 +
 target/riscv/cpu_helper.c | 57 +++++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c        |  7 +++++
 5 files changed, 69 insertions(+)

-- 
2.34.1


