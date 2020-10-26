Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXA3T-0006WU-Gm
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 17:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kXA3M-0006PA-Jp; Mon, 26 Oct 2020 17:29:20 -0400
Received: from home.keithp.com ([63.227.221.253]:57152 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kXA3H-0000Yj-LP; Mon, 26 Oct 2020 17:29:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 13DCE3F2DD63;
 Mon, 26 Oct 2020 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603747751; bh=Rt/tnJ8MibG2sDkJbt0tLtUaw7w6ozqvsygGFzhNqcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C/fbFmHmTdtAZFY+UlOZ/TpxGubJezOaL8zk8upyFkgSPDT7H6NG9jcv/lHqL2qIb
 lXE0pT3NQSBsyod8B50IuTHLwBNQrT6juUEVYYtortuJI1r0yyHAlRaEVUNvgsju6Y
 VVNb7jAkyXm+Ink9ienrybaTBuBJ408hMJRliNr5Oih0b+MUHKUsc6yA8GkmP2zl/V
 9zTGxtNiLXrf3u35Z7J5Fp1V0fV7zRFXDYsYPQHdsE8sMR7S2DdqFbnE9aNfLgrXIU
 9w19J4U50o9/j/9GBAM8GJLn1fUC0eaAduU1K0tlRLaGQeCi6VOprl7y6LYwkgkGn4
 SFiYShwDocVrA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id dO-qTp-LHU3x; Mon, 26 Oct 2020 14:29:10 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id B165F3F2DD61;
 Mon, 26 Oct 2020 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603747749; bh=Rt/tnJ8MibG2sDkJbt0tLtUaw7w6ozqvsygGFzhNqcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIsOX0/0iWLDLwz0ECZifYd4M7wrxJSt+Yc/BPr7iG3zTe5mJryQ/VSgKChcJ1UMr
 sd970/gspSAB5FYlu7WIlxk732v6UBYJFEG9gYA//HAqG3pY4yFPFtHDKVL6lm6UNc
 YfuiO1XTNzcz5gYKASqqsJZt18BYxOuq1slVndf5O7qw/LrrOWZafeB8CWMMywGt/p
 iDIWUWKBeJ4Vg7sWa2Dmkj8JIf0kTFCdQwZHymLOCfwsiWcVu2IM2Vg8+h81XYUvkP
 8Kv+H5Zp9heC06Hic17v1VcHEKsK5IbtjUDz3BbHfAGfFlhXtg580rNha9R8Rtbkoh
 JP7IjPR/TwzKQ==
Received: by keithp.com (Postfix, from userid 1000)
 id 953481582211; Mon, 26 Oct 2020 14:29:09 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
Date: Mon, 26 Oct 2020 14:28:50 -0700
Message-Id: <20201026212853.92880-2-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026212853.92880-1-keithp@keithp.com>
References: <20201026212853.92880-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 17:06:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 26 Oct 2020 21:29:23 -0000

This commit renames two files which provide ARM semihosting support so
that they can be shared by other architectures:

 1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
 2. linux-user/arm/semihost.c -> linux-user/semihost.c

The build system was modified to reflect this change, but the contents
of the two files are unchanged.

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
 hw/semihosting/meson.build                            | 2 ++
 linux-user/arm/meson.build                            | 3 ---
 linux-user/meson.build                                | 2 ++
 linux-user/{arm => }/semihost.c                       | 0
 target/arm/meson.build                                | 2 --
 6 files changed, 4 insertions(+), 5 deletions(-)
 rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
 rename linux-user/{arm => }/semihost.c (100%)

diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
similarity index 100%
rename from target/arm/arm-semi.c
rename to hw/semihosting/common-semi.c
diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
index f40ac574c4..fbd2841e59 100644
--- a/hw/semihosting/meson.build
+++ b/hw/semihosting/meson.build
@@ -2,3 +2,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'config.c',
   'console.c',
 ))
+
+specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
diff --git a/linux-user/arm/meson.build b/linux-user/arm/meson.build
index 432984b58e..5a93c925cf 100644
--- a/linux-user/arm/meson.build
+++ b/linux-user/arm/meson.build
@@ -1,6 +1,3 @@
-linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
-linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
-
 subdir('nwfpe')
 
 syscall_nr_generators += {
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 2b94e4ba24..2fdd12cee5 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -17,6 +17,8 @@ linux_user_ss.add(rt)
 linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
 linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
 
+linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
+linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
 
 syscall_nr_generators = {}
 
diff --git a/linux-user/arm/semihost.c b/linux-user/semihost.c
similarity index 100%
rename from linux-user/arm/semihost.c
rename to linux-user/semihost.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index f5de2a77b8..15b936c101 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -32,8 +32,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
-
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-- 
2.28.0


