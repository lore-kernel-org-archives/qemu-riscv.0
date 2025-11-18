Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83299CED603
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 11:00:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLJR6-00057D-L2; Tue, 18 Nov 2025 05:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vLJR4-00055X-Qz
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 05:59:47 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vLJR2-00009R-NO
 for qemu-riscv@nongnu.org; Tue, 18 Nov 2025 05:59:46 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b996c8db896so5476271a12.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Nov 2025 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763463583; x=1764068383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Is3BbcfmauA71t6fvcSpUGDXXuuhKoITYqwGWhnwxuk=;
 b=gpc3O3NfgoD3Pjqd9DBUw15ul6zjrXY88p6g3EjEkFKnWXfpKAGXW2cW0X/2TCTB+Y
 1ayO76SGGp0S73gXQ41FM1LK28kLrE0YlcSFI6bVspI75kfeGgNJlo1IiF+zAacWoTnF
 27/U3iwYLLKTJWkHKrlaYMq8QrotvSiXZUm7AoXz6MDLR/z21B0aGaB2mKO+EiaWWpKs
 JOjSLvqHuZRVbCJ2Bj0mLMxGdYi5s6zYpjMhphcudKPKP+mB3BjQ4hnHhuNZMOTeLwvU
 iENtTo31yvNwnNlhmiBtRWPdwqU8gkz7yzsFUjPlXdBkzjxhCS7YjuUH8aMIXV1xn2fA
 9xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463583; x=1764068383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Is3BbcfmauA71t6fvcSpUGDXXuuhKoITYqwGWhnwxuk=;
 b=f71Y1jDqbOx8zjibqXJ7frxA1eOjCb/vW6FVqGUrjoNhq0WoALbkMnYWjL7uuUxKDB
 +WyZvzywWCwYtkDoU03AyP46852LMO0dEs8CoBHTOubYZYNtro3+dkZ8+7BnGN0hJpXH
 b1M/I5HvHDTIK07/eoc1LwRje0KTKx0oZ4p2ayJ0jm1nnb0ZRoRt6/0XtM0w7AoQ0635
 G9yvYjAS8UYEH+K6BgL+aXcVUo+qkP11yhjn/rksp2dgsW10J3/PfyMTlIdAl/6ONWxz
 u8hKjlw1PfoH+1+TRUrGoBBEOahsHZdG3AKWQP/9jaFyTBFrQkAjhT6E3DWEcKEBE7kp
 DFxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuvkOSBfhHUqui2jFWNzRqeAyodnXZ7sQz2MQsV8ujaLJv+QeJHaxsHruhXUv0Viflo5MZpl7OrnUT@nongnu.org
X-Gm-Message-State: AOJu0YxAkmT24Hb3zCbnr2l5ZL64lb1/u2b13iIMFp+rog2O6kTMewLm
 E1mX13pY77BNsYcdTKl2+xgicOZ6bMjwkc2xKrFp1bznuFDNq57BvxHTN2jNWHo3u58=
X-Gm-Gg: ASbGncs7VsDn980ss5Vjmq3Kyeb7dToaoRUZjxfuPmlqt/DCpfnWzMsDyYd1/tuWUlV
 iVPIb2fNxgPNljVJEl/Q/nm7DOYjX7jzsT3rcZX1FsrGasJjSmz03T50FP7r5XkrYV+9vYQEzkK
 tGBcKVGqP+OS12YlqRc9/jE5NXQT6zcJY51LRQhw0HQKvPzzZLJ3Z0+HJbLxLfMW4AIPEEUOa9H
 BKqlDPdmGKMfnLWgaRLzzMa6YskVGjuRWdacmfPLB7wroOy1pI0NlHF8bNN7Grsl7nmP/4XXHVI
 DTi1DmTGH2Z9fN9o4WEAKFkVVqoTHuWxrjspwXJHfXL9HqsJOdiJr9WBI1sUMvmTyqdYGI6Zf8r
 62GES1fZb7tINB/NpBnbjaJ7eRL2wGge4jHwKtjmxFtXRrtMuN/ySibZk2HMLRH+lwls6eFIpc2
 frlKruGaXEY4gA9UxdQm/0OL0aOmS2VqvfUEYXkA2srIP8dWC2
X-Google-Smtp-Source: AGHT+IFLea9ZvxKN0VmTFnwklXclNlNZD3sp+zhRfu/ROzmfWHLbucPjb4tPVJrGb9HA+xjW93+dkQ==
X-Received: by 2002:a05:7022:f30e:b0:11b:9386:7ed2 with SMTP id
 a92af1059eb24-11b93868332mr4049518c88.47.1763463582499; 
 Tue, 18 Nov 2025 02:59:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2a49db4a36asm43989903eec.5.2025.11.18.02.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 02:59:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH 0/3] Fix Zjpm implementation
Date: Tue, 18 Nov 2025 18:59:33 +0800
Message-ID: <20251118105936.2839054-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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

From: Frank Chang <frank.chang@sifive.com>

The current Zjpm implementation has two issues:

1. The address is shifted before obtaining the correct PMLEN value.
2. riscv_pm_get_pmm() does not handle VS/VU modes correctly.

This patchset fixes the above issues and also renames
riscv_pm_get_virt_pmm() to riscv_pm_get_vm_ldst_pmm(), as the helper
is only used when checking the PMM configuration for virtual-machine
load/store instructions (HLV.* and HSV.*), rather than for VS/VU modes.

Frank Chang (2):
  target/riscv: Fix pointer masking PMM field selection logic
  target/riscv: Rename riscv_pm_get_virt_pmm() to
    riscv_pm_get_vm_ldst_pmm()

Yong-Xuan Wang (1):
  target/riscv: fix address masking

 target/riscv/cpu.h        |  2 +-
 target/riscv/cpu_helper.c | 24 ++++++++++++++++--------
 target/riscv/internals.h  |  4 ++--
 3 files changed, 19 insertions(+), 11 deletions(-)

--
2.43.0


