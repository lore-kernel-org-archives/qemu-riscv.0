Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaNHQ-0001hI-6K
	for mharc-qemu-riscv@gnu.org; Fri, 21 Dec 2018 11:04:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHN-0001eJ-To
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gaNHM-0004Df-Sr
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:01 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:44409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gaNHM-0004CL-K5
	for qemu-riscv@nongnu.org; Fri, 21 Dec 2018 11:04:00 -0500
Received: by mail-qt1-x832.google.com with SMTP id n32so6162317qte.11
	for <qemu-riscv@nongnu.org>; Fri, 21 Dec 2018 08:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=LrEYanjBIeOlcUCN87Q23zBaAMNYjJEywyn80S4jR80=;
	b=WjG0bPHTKhRCNrDROUsqGZdntexNJNYTJMpY4BP8cca9Ll+BS74ogiPBQlCibb2VY2
	08qLoozc8LiDSz91olERxEY7IpqU9DR4ae58QT63uqicFfbMGWdkfLCmXaJBLeOJMK6v
	SoHlDKVxbpfnjPgc1NxmlFNkUXTOOJs+fE6FhJzn73PGm7GXUlKQfRmkeRZlDFsLnUmi
	DNH9UMh7PeLoMP+hiNRWZcXzHCaT/ZuyXvuJFw8VnNfN64exx+bcR/l0VQcsNcqP3Y3t
	GScuRNFQBcV7+PyqEbP7aR/QbEDIMolwNub6rbmcpya9bWOdbfjr39Z90sZPHuwLY01U
	+vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=LrEYanjBIeOlcUCN87Q23zBaAMNYjJEywyn80S4jR80=;
	b=GQ0Bjxd5+VS0xCjtXQp4j6uKwmpcoypHWq2S6WwKUPSkYt/PuFbEfSoRAiLZbUIMGw
	qZNGdzQJOquO4XPHKO67Nh/SX5icywJVTnaKoDa9eCxUhuIQzroH+gj5fMAzS3ohHLSB
	JIFHPxcoL1Mda/SPv6VgiK2XbLbtIG3yfonrPfG9tzpeNzcr7CBxiNIHMXhXKx1UszzJ
	6tBdA8YHiFhiCo9kqgHzY/OECVKEbSBAO0LKa2qEXsMly0lb+hr1D4rV3j1yqJhhjYWc
	WLCXiX67enSdeMfyD5HfVHrCW+yFOmZzHG3VuHas44RVN8eqUeQkeShIwe20e8YHateA
	Yevg==
X-Gm-Message-State: AJcUukeLRX3Dbr64Rbqx0+/4Ie/NJSXTkd/2NdEIekMaEKFQsQPkxOn/
	YxIFrvpBmYGf15D8vR6xtOvd2g==
X-Google-Smtp-Source: AFSGD/W8aFzAGMDEYFv1CegU9t87WR8X0GrYV/Ke+Slj8NOEIDcbAi49hV7MT9XC8KLq+Il9syxvKQ==
X-Received: by 2002:ac8:33fc:: with SMTP id d57mr2863434qtb.82.1545408238342; 
	Fri, 21 Dec 2018 08:03:58 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
	by smtp.gmail.com with ESMTPSA id
	n72sm7170084qki.26.2018.12.21.08.03.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 08:03:57 -0800 (PST)
Date: Fri, 21 Dec 2018 08:03:07 -0800
Message-Id: <20181221160307.14819-15-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181221160307.14819-1-palmer@sifive.com>
References: <20181221160307.14819-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::832
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
X-List-Received-Date: Fri, 21 Dec 2018 16:04:03 -0000

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


