Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcCrg-0004ix-JC
	for mharc-qemu-riscv@gnu.org; Wed, 26 Dec 2018 12:21:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrb-0004bW-LY
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gcCrZ-00080m-Dg
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:59 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gcCrX-0007s0-Em
	for qemu-riscv@nongnu.org; Wed, 26 Dec 2018 12:20:55 -0500
Received: by mail-qt1-x82d.google.com with SMTP id l11so17885616qtp.0
	for <qemu-riscv@nongnu.org>; Wed, 26 Dec 2018 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=LrEYanjBIeOlcUCN87Q23zBaAMNYjJEywyn80S4jR80=;
	b=YS6ug9YLPbwpwCKVDcjcczkJcvR4Itpg3Uv0Uo1PPeeoR9EGJ9WdpzV/oH1EPKlUaH
	Jqy6K9bcP5l/X8St7f4OkUl54HVPWnabL4Kc6U4T62JmBZnEA30H8CTzvGTmKuAWrmpl
	6LrZlghXzCAT8GKvMGjVZ/JeVzsQIqEBK6Hr+3wk5ShWlFrGZ5WssJtVXjwJyuMOF5oQ
	Wf2H6oFxkqp6qIhdYwZhVCCi2pYFNLo0vDo4cdfqUMGPsVuyRH6tDexhn6UURkXXSEDT
	EZIlQVAhN4fJB8Tgk2M4i+B9auXdIF8SoW4WeiLt+MsYENq3S5oFA0QDCGQcxziZAva+
	6DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=LrEYanjBIeOlcUCN87Q23zBaAMNYjJEywyn80S4jR80=;
	b=FFowpHNMCNU7Ff0zBUR2RTbj8wrxjoo4zpBspTTwrQH2HiUn1w2PimcBu1by+cVjFw
	KcRAOWrEmrdp9kt40u12LqmfSJ702WgbJsOJw6Hy6TfTaht03cdVRqvlOzKj3KvT1R7p
	oXbwQOwTPAILHou9M0JzEXbw2Jfe/Uj7ZqIGl/wP2MwzuIMU7RajQRGOVuJMZxIibtmv
	qLJpPRe9G8Qe9fNEQGrQAxRUmo0zNuXZhB/m4w518A6x9l1Y9fE9+JhlUMNiV9Km0NzD
	+6Opgv5Zx9hL033+78LDToGy9i1dRR1RLLG15N+SsamrMyCIEPWhUhdoJDu0D9VFawyQ
	rAVw==
X-Gm-Message-State: AJcUukfi9A/Jjt5TpPtIhc7aG9IrlSxmM8ElejjUZyPAzrGvozdkhrff
	YOm4WuJAK7KAjiH89BUn0/Fey0n/cDM=
X-Google-Smtp-Source: ALg8bN7IiiOpTuQj1Il0j1x3h/qSDVAKx5V5+JdagOhn48idCH2KtjFLwkVU7CWQUdjiSxEmSxs8Pg==
X-Received: by 2002:a0c:9e65:: with SMTP id z37mr19778632qve.188.1545844839221;
	Wed, 26 Dec 2018 09:20:39 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	b17sm12615235qkj.69.2018.12.26.09.20.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 09:20:38 -0800 (PST)
Date: Wed, 26 Dec 2018 09:20:05 -0800
Message-Id: <20181226172005.26990-15-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181226172005.26990-1-palmer@sifive.com>
References: <20181226172005.26990-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82d
Subject: [Qemu-riscv] [PULL 14/14] MAINTAINERS: Mark RISC-V as Supported
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Dec 2018 17:21:00 -0000

There's at least two of us that are paid to work on this.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d676c73f8840..317eff6cec4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,7 +262,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
 M: Sagar Karandikar <sagark@eecs.berkeley.edu>
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
 L: qemu-riscv@nongnu.org
-S: Maintained
+S: Supported
 F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
-- 
2.18.1


