Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mezKP-0001Jj-7N
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKN-0001G8-Vx
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 08:43:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKL-0004iB-6K
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 08:43:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so11461177pjd.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOs2Bq1/GGwM4a/Wa2Jzo0+y+GnD8X3Yq7P4b31d40w=;
 b=IM0+tT/7xYFRiSnrIyJnmiXpF0UU8WsNw7VtuVrJkIiO/sdNuOsEDoSjHlQigP9z6e
 5zZYQGx9Ae8HKzyLYhhNK8H57DSqU8PLFGtYhjF+bNhzbyLOI7a/PSz2VK2d5mTRxizz
 hQGwUep5kZJpytuCPDTMxaL6ArqigAHQYiRvR8U/Fw6x+2I4mjGFZj2fY6OQoyw/nT5J
 ccbg7fNGH2ufXxOC1nGoAfQq47Mb/H1XHYK8QbbFLfVPQC/KsxICdMsqxNvTKFt5pO2b
 eYFArvx1u4YqyLgLpD/R4e0QWxgfLfmgse7crdFsQy6RkTQfRH4UpMUdZe8aytl0GXyf
 v6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOs2Bq1/GGwM4a/Wa2Jzo0+y+GnD8X3Yq7P4b31d40w=;
 b=3CLZB60l26Gz2M8spugtoqZ/zMnWKFL2hokicE0+HXY93fJwq/Y6ZyxnQ54Vix/pkc
 ilZngbH76mBZ7syE+RqZkaLghQBeY082dYQyVV4rS865NZeC/8iCy5vZ4owTs/Khkw6E
 ZRsbh8YP8l/kma26/vHXjXmHn7cemeSr4pTWkco0a06JvUFxzASSvzgYljc7PSgBUj9H
 As+9/QBENfK8szupRd/m+RbvLITpVjudAWOBvzWUOFMBrD4dJ/1HFZ4R5hoNPdhUNx+o
 i2U3/NYBPSt+17t1KMRrFrfdWWqzjcipEaSXm4Ni47j1h88nt8fQv/oZDqIUBDvnLopb
 DkmA==
X-Gm-Message-State: AOAM5301IHD1ixrgNTdajS3xLObF8XcGHJYQk+QHedzk+gZKcpOm6bF6
 9GxEQDDXR8eSPwm2+iEi63Z88VkbA/jA1A==
X-Google-Smtp-Source: ABdhPJz9w/uM74No566XEkad42u+MYyXaqkl6mhcrIq0o42lYm1HvY9X+Y+TMHTMzJl/a97ZveyXdg==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id
 mi15mr6673589pjb.150.1635165822792; 
 Mon, 25 Oct 2021 05:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6817:c049:7263:28b8:7cdf:c7e4])
 by smtp.googlemail.com with ESMTPSA id nn2sm3293461pjb.34.2021.10.25.05.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:43:42 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com,
 Alistair.Francis@wdc.com
Cc: rpathak@ventanamicro.com
Subject: [PATCH v2 0/2] mconfigptr support
Date: Mon, 25 Oct 2021 18:13:17 +0530
Message-Id: <20211025124319.195290-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 12:43:48 -0000

Patches add the mconfigptr csr support. 
mconfigptr is newly incorporated in risc-v privileged architecture
specification 1.12 version. 
priv spec 1.12.0 version check is also added.


qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=v1.12.0

Changelog:

v1->v2
------
1. Added privileged architecture spec version 1.12 ("v1.12.0") check
2. Added predicate function for mconfigptr which verifies
for priv spec version v1.12.0 or higher.

Thanks
Rahul

Rahul Pathak (2):
  target/riscv: Add priv spec 1.12.0 version check
  target/riscv: csr: Implement mconfigptr CSR

 target/riscv/cpu.c      |  4 +++-
 target/riscv/cpu.h      |  1 +
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      | 19 +++++++++++++++----
 4 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.25.1


