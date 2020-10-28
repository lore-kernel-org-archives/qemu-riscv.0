Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXqdl-000318-Lo
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 14:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kXqdi-0002v3-Az; Wed, 28 Oct 2020 14:57:42 -0400
Received: from home.keithp.com ([63.227.221.253]:47552 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kXqdg-00053N-9l; Wed, 28 Oct 2020 14:57:41 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 201E43F2DDB2;
 Wed, 28 Oct 2020 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603911456; bh=3Y2VWJRX23/hdfDfe9DUV2SU7XlOH4Dfu/OiL9JBZxM=;
 h=From:To:Cc:Subject:Date:From;
 b=SCAVBsJG8lQV9AQsqErGnJ9Jqry65LpSB/LD5rjVSq3QD+uX/bTG1WVxRaIAsCwRl
 5v3OP8gzpsP99tWnJvXOpNUAbhNw/luj3bR/A4GlfvakzJlr3Bw47KC666QV0nuocI
 mHioRHGTltyybte6hdsWCtUM0AnAmPT0ZSrqlNt18KPRpXtwbDKdyOSbeZVl7vWPWI
 jHp+D51I0MCpprBKAvfFTj39XnbNd97Q41Mo9odMc64zxBFEp9kY+3Z14OMhUdzb4T
 Rxy7m6d7W7oACUOQrCgfzkMAlEGtcoFHoWRYmj/GrTjHD+3tbvxM4QMolgWnlOhNpx
 N5feU1aAO2LMQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 85-Kk52-VwyA; Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 60DCC3F2DDAA;
 Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603911453; bh=3Y2VWJRX23/hdfDfe9DUV2SU7XlOH4Dfu/OiL9JBZxM=;
 h=From:To:Cc:Subject:Date:From;
 b=kMHszQuP5MNEwRRFoZXqAHMZOQsgJcmzx874IFn2FBQk6JfUFBZtdCjqyprAdPDHD
 6CPT72b6neQRq+s2i88PTgo8akIfNv3ChxyhYbpKL+QpTmdFvqelT6tyORJw0aSq+N
 glRrbuwoSY7k+zhPQxoeF3rxO9sTLGgFj1E/u9XHUqJvzLZK7NKbsgat4fcxsL6Jyn
 P+29+GqzaenPjnQN+1c7fsm2yAMaWUS1p1/zUhF3JGi4cYr80DQVMYFt7OVE9UQcQl
 9WlsLYlzRDVAerkTnuFqvIi62O8hpHkYiyw5EUH4XJj77DsFD4pKu/flqUP7VONXje
 RuZlG13NyiAog==
Received: by keithp.com (Postfix, from userid 1000)
 id 2D5421582210; Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
Subject: [PATCH 0/4] Add RISC-V semihosting support
Date: Wed, 28 Oct 2020 11:57:18 -0700
Message-Id: <20201028185722.2783532-1-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 14:57:36
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
X-List-Received-Date: Wed, 28 Oct 2020 18:57:42 -0000

This series adapts the existing ARM semihosting code to be
target-independent, and then uses that to provide semihosting support
for RISC-V targets.



