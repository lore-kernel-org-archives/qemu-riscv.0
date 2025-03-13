Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF11C35FF3
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 19:32:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tsoGf-00025n-IX; Thu, 13 Mar 2025 15:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsoGA-0001qf-Ug
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 15:30:30 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tsoG0-0001ew-Un
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 15:30:25 -0400
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so1201233f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 12:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741894213; x=1742499013;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OqqMqeTRo1EajqnduezxEFLA+bccYny5XY5wtE1tPV8=;
 b=OAkzl7ul/O8vCJ3nv6Ya+GLhvriGh8AES9KKUZyNICF1VO7kpgor195xpd/nOk/+IH
 OT182dZjiEuyeMwQKa9B1hHeOiy8ryWwVKtLZ0JiKCCVVCcx8RleoQZGK7wAOg86bQMj
 /frFCB/SkgYH6rIfscQMlokXxq45QZXgjz9CyxmveAb2tKiz5vfo8X5iUD0hVhls9CHc
 X3/rmJ4oQ/QtmQAmHGzYlVepqlhfIEI126uom0kmCiuh6QmJBsKp376XyEXsBkRMCGUy
 4456N0b3AZjzYpCpxJLLasZWtqq7Daw1nzxKdVto/ycFTUNWBCEjtMOaco4VJjq8de9W
 uteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741894213; x=1742499013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OqqMqeTRo1EajqnduezxEFLA+bccYny5XY5wtE1tPV8=;
 b=kpNvOlkVYtpTUg3Ams1Bb6Jugxl5j3xlzjcAMSgq9WiNVdbKu2rcWEdASY6d5wb4qo
 OZVc6IPTmpB7WvrFwG+0ijTF98bMtgiwP78kAS9Hh5AcLFBLquZmcBHMYWfOWUCaTvRe
 lU/wQREytuTNrnxDJgipkE5v9f/IhW3N2BixH+X1Z+Uo3DUSxq+oskVuXW81PJRZ5xrl
 c6F/8xD/f7ItkvqRqcYg/+GqUxIFvZp476RwzQCqMjlO0c3mihjIF8lr3slKS9cqvbdX
 EYvVUm6wY2WzGhWy+HDEKBgEII5eDeF+BYEjgrDKMU3q6btYmmg4R/1NMH4Ks6bCLnOr
 0YkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuWruRwTund48g5Vab9/qjA5kr9tTrYBxRQDLhmmSCf9FS3ivhSQnKAdDLZgUfu4PNXUK3glwA3pXw@nongnu.org
X-Gm-Message-State: AOJu0Yze0FV4IWwfjAsetoxw6YXKIxs4foROZLAGgpX0VNzA7DPoBppG
 cV4k/0Hzi1+pFFDUjVI6OnsXSwcCtLnVMrxztZPpDephPkDVb+jLRpEcIH/W2Nw=
X-Gm-Gg: ASbGnctk0qFgBlnUR5qnDrmq3WUMJpUxk8/bpD5ywf/E9dykdFe4+O1r2xFbx4bLs05
 AOGy93Z1zI8qmha5dKbIM07DbWwYFKG9XoneaQu5AE7DOd9yF4BD+c4ubwVNhR56E1DPXBwsvi6
 xSi7KlJDrKkt2UdTE6AOnf1zZu9bD7sAiJf//8EXpSYtR5hT1WBvMrGriS1jg4JijxnrVabdGNZ
 MFA+HFNmvdb/z0sdTSweRNDW0fdbOHTih5IlLmJdvq+2yqFkZtA4OPG7k+T+7pWDDFgWfA4eXr3
 SfLgW0cApaLl2Ak38hC4Ql71XQ3/+zyM0Wbmpqhfklkn73WbVrX4hdqauzqudhFLzBrSV8kjjYz
 9JnWyF0w2X30mG6xaDI4=
X-Google-Smtp-Source: AGHT+IE8H9qSECvH7gw/V0GaNTDa7Otz5TSiqVmJ+ZNLVTQVKKPC88KZWs3EecJAmNJe9jmUPhdJHA==
X-Received: by 2002:adf:a2d4:0:b0:390:f552:d291 with SMTP id
 ffacd0b85a97d-396c1c26592mr648128f8f.22.1741894212827; 
 Thu, 13 Mar 2025 12:30:12 -0700 (PDT)
Received: from llx1.ba.rivosinc.com (lfbn-mar-1-50-94.w86-229.abo.wanadoo.fr.
 [86.229.28.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888152dsm3016421f8f.48.2025.03.13.12.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 12:30:12 -0700 (PDT)
From: =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
Subject: [PATCH v2 0/5] target/riscv: Smepmp fixes to match specification
Date: Thu, 13 Mar 2025 20:30:06 +0100
Message-ID: <20250313193011.720075-1-loic@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=loic@rivosinc.com; helo=mail-wr1-x442.google.com
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

These patches fix Smepmp implementation to make it compliant with the spec.

First patch limits RLB to CSR changes since RLB should not affect privilege
evaluation. Patch 2 extracts some common code into a function (to be used in
patch 3). Patch 3 fixes validation of pmpcfg CSR writes in order to match Smepmp
specification. Patch 4 is a small optimization and last patch is just removing
redundant code.

---
Changes in v2:
- rebased to latest riscv-to-apply.next
- addressed Daniel comments on patch 1

Link to v1:
https://lore.kernel.org/qemu-riscv/20250225160052.39564-1-loic@rivosinc.com/

Loïc Lefort (5):
  target/riscv: pmp: don't allow RLB to bypass rule privileges
  target/riscv: pmp: move Smepmp operation conversion into a function
  target/riscv: pmp: fix checks on writes to pmpcfg in Smepmp MML mode
  target/riscv: pmp: exit csr writes early if value was not changed
  target/riscv: pmp: remove redundant check in pmp_is_locked

 target/riscv/pmp.c | 151 +++++++++++++++++++++++++--------------------
 1 file changed, 83 insertions(+), 68 deletions(-)

-- 
2.47.2


