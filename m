Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1loWHR-0000Xj-Rj
	for mharc-qemu-riscv@gnu.org; Wed, 02 Jun 2021 15:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1loWHQ-0000U2-6V; Wed, 02 Jun 2021 15:11:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1loWHO-0001qF-5l; Wed, 02 Jun 2021 15:11:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4417794wmh.4; 
 Wed, 02 Jun 2021 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgH9k2F3cSshfOu3hyyfavKK1zDqFyZbj3vWJ7RA2xQ=;
 b=eGZrxEOtR7pcKd9ZDQX6Jap8yYfYjA2qJYlFRMo4ueGIvRwuTanRwflrrAZrFFz9RE
 Gfe0WY+T6XuhI6zBPHFEsKU67ZY67tRormHQGBRJtV6NEv0VViKuscZ2lgmiI/4D4Tjh
 gcwsItWWLK7wwh+JJPedjLIn23dpN9t6x03UTAHrWQw+zAAKklTSsKalLUI//22Sj6p2
 eiwbiH70Pn7Wzn0RW5hyJR78B7sOP5mIwp9BZ17P5YGb6Sihqau67uyxSK0kXo1pi855
 jVVObMiqxpYdz6/li7ieHbu3BPR6VMQI7PIFJWlPdErkLGkrTAlNKXe06JPw9XCuRSeS
 mQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgH9k2F3cSshfOu3hyyfavKK1zDqFyZbj3vWJ7RA2xQ=;
 b=ifHeaMC0vrVJAeWMzLrpfQcSLvSD82Molgc9qrE/xZvWED37r+EDt+GyVM/SiYteJ4
 sqht75IkmFu5/QwbYVr6n2zICNUU4T8HFykbMOVe0TwW3nLwcrfZZku+um8Fng1O1w7M
 FEUIiMvgVe4qbmAUyvjB3a3hbf/P5OCTZhm2v1yddyLTbh8PJ324u7srIz7zwrypnUZ4
 VUfgJ38h3orDKVTOLpeNQHz5CN28VYmJRh1SXbu8rtdtTWrIFFiAHAihh6t2mOqmnMEG
 RqEZI/cPh8u9L/EGn/gNNl8x5SA8qVxJFQ7Gckdq+rwfSf1NOGCmZCP1nD5aN5OYSM8A
 x4Tg==
X-Gm-Message-State: AOAM532IXSxkHVMl/5mp1j3XezM6xsoBp39s2phN3noGYiykxq4QYAlr
 R+lg1dSjeuhjzFmwHm7bbMgs73iN8vrBEB5B
X-Google-Smtp-Source: ABdhPJz0Nr5q46gqG/CCjbSTaD7jQ+dqNJfv4Gh4JCYCCNwPaBsZHuQpX+XeXbObql1FyxkbpD11xg==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr6566810wmq.143.1622661107443; 
 Wed, 02 Jun 2021 12:11:47 -0700 (PDT)
Received: from asus.. ([83.144.170.28])
 by smtp.gmail.com with ESMTPSA id n2sm635304wmb.32.2021.06.02.12.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:11:46 -0700 (PDT)
From: Jose Martins <josemartins90@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jose Martins <josemartins90@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 0/2] target/riscv: fix hypervisor exceptions
Date: Wed,  2 Jun 2021 20:11:23 +0100
Message-Id: <20210602191125.525742-1-josemartins90@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=josemartins90@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jun 2021 19:11:52 -0000

This patch series fixes the forwarding of VS-level execptions to HS-mode and
removes unecessary code previously used for the routing of exceptions to    
HS-mode.

Jose Martins (2):
  target/riscv: fix VS interrupts forwarding to HS
  target/riscv: remove force HS exception

 target/riscv/cpu.h        |  2 --
 target/riscv/cpu_bits.h   |  6 -----
 target/riscv/cpu_helper.c | 54 +++++++--------------------------------
 3 files changed, 9 insertions(+), 53 deletions(-)

-- 
2.30.2


