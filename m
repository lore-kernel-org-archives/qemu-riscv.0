Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kMq8d-0003g0-Sf
	for mharc-qemu-riscv@gnu.org; Mon, 28 Sep 2020 06:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kMq8c-0003df-Fy
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2020 06:12:06 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kMq8W-0001RH-FK
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2020 06:12:05 -0400
Received: by mail-pg1-x541.google.com with SMTP id t14so426085pgl.10
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2020 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=x+ZLRjzoNSqzQq7ZokkFdwTlzj8XiUz2U3ivXf3qQG0=;
 b=K4ldXPWzNJ2impBYE6dYVYz349g2Wzmpn/KlaVOibK+yM18IH9auXHIZ9zE29y3COD
 Wl2qq6Dh4SpOqhTTciaY99WH45/b/uab+dX5rSzhXQJuFj/pTIl7plDIaX3m6+SYIvn0
 WDYl5HyRxqac/acezL13pFFSDS6bEMNFMN5VaMs8sU4mTt8S4W5L/2FB4+Ye+eLl9PP1
 fi80LBxsjb6fuzdIY988VXoZSUQ6cXcvy8YOMub9fB9KKw+WjEMngo9KUYvhIQLfEwiz
 OrcotIc41/8vPJwJ50GLxRWnVI+45CfwtlyQ1fuCz8hr94HK2ThwoEg59i01sOe1i//N
 JE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x+ZLRjzoNSqzQq7ZokkFdwTlzj8XiUz2U3ivXf3qQG0=;
 b=tqzITcuVLnataTGjSoq8VbqtaPcOQQES8j+7WMYZl2uB2btkjG/BG/TOJ1b3rMkqaO
 eFDbwdEkOhC5qvfpN7lLBqgrftvG7ij1aHTycsF10OT/0YU7Mtph0gBDiqJNU8FeDHkk
 iO71RpY83sjlM64xJmDzvZF9mkNFsFkyJlWzscZscvwVGkYfiMNCq1L04++U1MZ9TX1u
 ZPePWx2BKbZK0vxU3mOG5AATlcBHRz4WFT0TkMbB89Bu3qjbeUYGm7CGIOpUldvvQwOO
 JTVCl+jSwX+LX2i5X9ZR+RYexERkIoqRn2pAXj0Sh0jhYc1B7NfdYyMN5Lh146u271Lr
 Mi1w==
X-Gm-Message-State: AOAM532hxSeO1N5/W8e92JuvVqoNGYDIoWg2xt5yUFrIN0w5QOGfnWih
 sHd94mqK/RSWMa6pnPP2RFrLbA==
X-Google-Smtp-Source: ABdhPJzsTMWhOxKUHfRdpzXz+3WTIPvekiSei257qxqIuvCnuPngmzR4VOkvigW7Fl1NiS6r8ESiDw==
X-Received: by 2002:a05:6a00:1702:b029:142:2501:34d7 with SMTP id
 h2-20020a056a001702b0290142250134d7mr801865pfc.48.1601287918711; 
 Mon, 28 Sep 2020 03:11:58 -0700 (PDT)
Received: from localhost.localdomain (111-241-115-7.dynamic-ip.hinet.net.
 [111.241.115.7])
 by smtp.gmail.com with ESMTPSA id u2sm814747pji.50.2020.09.28.03.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 03:11:58 -0700 (PDT)
From: Green Wan <green.wan@sifive.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, bmeng.cn@gmail.com,
 alistair23@gmail.com, Green Wan <green.wan@sifive.com>
Subject: [RFC PATCH v6 0/2] Add file-backed and write-once features to OTP
Date: Mon, 28 Sep 2020 18:11:44 +0800
Message-Id: <20200928101146.12786-1-green.wan@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=green.wan@sifive.com; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 28 Sep 2020 10:12:06 -0000

Changelogs:
v5 to v6:
 - Rebase to latest. (sifive_u_otp.* are moved to hw/misc)
 - Put the example command to commit message.
 - Refine errp handle when check backend drive.
 - Remove unnecessary debug message.

v4 to v5:
 - Change the patch order
 - Add write operation to update pdin to fuse[] bit by bit 
 - Fix wrong protection for offset 0x0~0x38
 - Add SIFIVE_U_OTP_PWE_EN definition
 - Refine access macro for fuse[] and fuse_wo[]

Summary of Patches 
 - First patch is to add write opertion to update pdin data to fuse[] bit
   by bit. Add 'write-once' feature to block second write to same bit of
   the OTP memory.

 - Second patch is to add file-backed implementation to allow users to use
   '-drive' to assign an OTP raw image file. OTP image file must be bigger
   than 16K.

       For example, '-drive if=none,format=raw,file=otp.img'

Testing
 - Tested on sifive_u for both qemu and u-boot.

Green Wan (2):
  hw/misc/sifive_u_otp: Add write function and write-once protection
  hw/misc/sifive_u_otp: Add backend drive support

 hw/misc/sifive_u_otp.c         | 81 +++++++++++++++++++++++++++++++++-
 include/hw/misc/sifive_u_otp.h |  5 +++
 2 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.17.1


