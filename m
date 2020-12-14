Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kou7z-00014f-RP
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou7v-00012A-BD; Mon, 14 Dec 2020 15:07:23 -0500
Received: from home.keithp.com ([63.227.221.253]:51712 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou7s-0004Fc-8W; Mon, 14 Dec 2020 15:07:23 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 211EA3F2E393;
 Mon, 14 Dec 2020 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976438; bh=8haCYnZ52jXxxy78j8fypuNz+2Y8rEl1NEqgcLh4ORM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ebrUsY/brx6OjNpoxolM4bbxy/nQy6RGE3hJ8UKBe2lzs/cE6e6oomZSQhnAUWDyg
 vq5y6hVZ73AvYunlHPB9H0S/ndGFFW3D67e1hikTEOyMV6OyrWQ/kVjqi5sG9FqX6j
 pgI8GtxqvupHJjcq0JlSk62ux/2bmyuJoDBuPfIA/lkiaV3DEAE2XH/IEZQNpcUp0x
 Phnzlwkg8Ha+XgeThXzSiBt99BoUmUlB/AwF+Li6t5I3aGLsY9eHX0illij8hR91HC
 gyJEJYGyKLFGnmiryruHRzoMPWtjoyy29gx8RF6pUkDamJtTlRmEp+9ARn4nC1APYz
 ijWiuXaevpRDw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id GHliSzEgtfof; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 7816F3F2D6F1;
 Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976437; bh=8haCYnZ52jXxxy78j8fypuNz+2Y8rEl1NEqgcLh4ORM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wYIoBcYtjBDc05zvyqpV+F6NqqILFE43y12UsOcSxQAvc/11JoR1nVL+42x9cK8NQ
 fMk3fw7KqxP3CLZk4gs/okQ0A/M10En2jtVyI8CTnVT3rc02//AzlZSZw+15PbA4G1
 ZnTKo7rIlRasCy2jUNwjk4cjBvRnKJ5Xq4yKp4CXAhUUzRusw5xiR9WfyD4GaeuEne
 IDuA94WCVntPKXMVt6wGb1O8alUs6MdTY62k8o5mQhDNDpNCYu4bXu7XkOpEmyff8d
 WcoFmNqgk5AoZshTHCmyeTUGocrENJ7zJVk8qKJ8W3KoWmGnlCsh1DerWmkRri+N7e
 iTsqy0+bTvqkw==
Received: by keithp.com (Postfix, from userid 1000)
 id 3015E15820DB; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 0/9] Add RISC-V semihosting 0.2. Finish ARM semihosting 2.0
Date: Mon, 14 Dec 2020 12:07:04 -0800
Message-Id: <20201214200713.3886611-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87wnxktost.fsf@linaro.org>
References: <87wnxktost.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
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
X-List-Received-Date: Mon, 14 Dec 2020 20:07:26 -0000

This series adds support for RISC-V Semihosting, version 0.2 as
specified here:

	https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

This specification references the ARM semihosting release 2.0 as specified here:

	https://static.docs.arm.com/100863/0200/semihosting.pdf

That specification includes several semihosting calls which were not
previously implemented. This series includes implementations for the
remaining calls so that both RISC-V and ARM versions are now complete.

Tests for release 2.0 can be found in picolibc on the semihost-2.0-all
branch:

	https://github.com/picolibc/picolibc/tree/semihost-2.0-all

These tests uncovered a bug in the SYS_HEAPINFO implementation for
ARM, which has been fixed in this series as well.

The series is structured as follows:

 1. Move shared semihosting files
 2. Change public common semihosting APIs
 3. Change internal semihosting interfaces
 4. Fix SYS_HEAPINFO crash on ARM
 5-6. Add RISC-V semihosting implementation
 7-9. Add missing semihosting operations from release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>



