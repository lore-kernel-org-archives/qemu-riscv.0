Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9wlG-0001b4-9f
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 15:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j9wlE-0001al-CM
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 15:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j9wlD-0000NT-8x
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 15:06:24 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45022)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j9wlD-0000MW-2O
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 15:06:23 -0500
Received: by mail-pl1-x632.google.com with SMTP id d9so3087640plo.11
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 12:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=SjkABZPI4KAtufXS32+txuVZk28FWhEFjtGst2XQOX8=;
 b=dlJ0ZBMj71hUL3RZmZBGGhfTCD29yWLBtEwWfealWIo/ZNef8xh7/K6grBHqa7tUjO
 oqUZdql4eGocSCCaOiOFdxzXUFKLjtCWBbtcQLX5hPe7EncfjVYX6larV/5sqF3WOoGh
 IpShU/q01BL+AXKsdf0g/1ysS1Bt50uLYnv+rt+Bgzg74bNBq1COeNMCzAozhPUX/YAg
 ZWm6oCO8vXfBlOESccVNXByG/jGRDC5SXsKiHCH6mA1jgq8mB3GWEF1LF1TL3MXwwXi0
 T3o5onWJKxThZzrDLJtP5keaICInsfEaLVibMs8EPb/AXSaXHJcV8P9ikCXq9fPjaOz7
 j6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=SjkABZPI4KAtufXS32+txuVZk28FWhEFjtGst2XQOX8=;
 b=ZsJTjq/ivjSWxZvGdZ98Hjk1eIfsQXWd+RK2/BjNM6Tw6yptTjJmAscEHgFiDokSeO
 cOgFDE7ckhnniDdEHvC3spo4oCbVStF9UKfpAsrWS+HavIyv57fiYVukNxmhbxg+TYPf
 q/myboi9/zgXPp3vZ6LO+JYyMVFxPOz3XilvEZfMcTdICzKxlVFHVwhz5/FErOgEgB30
 kLOm/e6Mi5xhlrtuTiWLV0IMwR2JnN4KBipDuKsp34/Vl1U0VTN6M0HJOjnXYjBseQvW
 tYMXT8/kSRR7wqb2c3D0/Jv5Ir39o46hQ6uin0+kC4D6miLZO9xPcdIVkE+9hBYWwBFz
 dXCQ==
X-Gm-Message-State: ANhLgQ0AdVycIc3oFGEDD8RKi+ibaUrATT9scba2rhWiK4SJSnrJXbOH
 6tNrfsB6HrNn5DYr6ee9CJ0QTL0AuBjFQw==
X-Google-Smtp-Source: ADFU+vs8d4D2nzeVxRfc+eqWbYIP3d07ZBQSGzliMCM5Uj1QoMabuCF6S+S2bYWhK3PxwBbcT27jvw==
X-Received: by 2002:a17:90b:1953:: with SMTP id
 nk19mr327254pjb.98.1583438781514; 
 Thu, 05 Mar 2020 12:06:21 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id b2sm6890898pjc.40.2020.03.05.12.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:06:21 -0800 (PST)
Subject: [PULL] A single RISC-V fixup
Date: Thu,  5 Mar 2020 12:05:57 -0800
Message-Id: <20200305200558.71104-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::632
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
X-List-Received-Date: Thu, 05 Mar 2020 20:06:25 -0000

merged tag 'pull-target-arm-20200305'

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200305' into staging (2020-03-05 16:47:37 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf4

for you to fetch changes up to fd990e86a7c99f5c99d430160243a3bcc64b0dea:

  RISC-V: Add a missing "," in riscv_excp_names (2020-03-05 12:01:43 -0800)

----------------------------------------------------------------
A single RISC-V fixup

This is just a single patch, which fixes a bug found by Coverity.

----------------------------------------------------------------
Palmer Dabbelt (1):
      RISC-V: Add a missing "," in riscv_excp_names

 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


