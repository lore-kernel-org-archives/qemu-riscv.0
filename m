Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pU3wV-000163-Ia
	for mharc-qemu-riscv@gnu.org; Mon, 20 Feb 2023 06:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU3wR-00014s-0n
 for qemu-riscv@nongnu.org; Mon, 20 Feb 2023 06:02:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU3wP-0004Yy-64
 for qemu-riscv@nongnu.org; Mon, 20 Feb 2023 06:02:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso685941wmq.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Feb 2023 03:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s91YepJIzI4sERJ/1vC1jIWysRJ2VZAsxC7nLTysVXk=;
 b=OvEH3j8m/xpYCbGC+inw8vQRYr6jfq3R2is2/xrPB270iMZNwsVOHqRB7vOsVuAtpw
 WVQ2QtDAZ8RGa4wQEe/tp3WAf+xg6jDFQNxz86brR6qIndh6yVEoHQvdYIfhfQtQ7wBB
 1Wk1g4rnNDZOnEg8gUPRndcfn5T5OSYghV1bLo6lUCavAJlxRjJCm0B0XIGZES4TecrL
 gSrq1yeC9o05GUQ1MRqB0CgY2yx1HUzY9hoBvsRbXW4V2ak6OEJrZlaRrWLmjpNso2SP
 oR1bAMflzclZSbQqJxoYsg8u4qspjJBhva3wHgvDqTeeItkCmvNFFqU+CcLdtqsFYjql
 m4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s91YepJIzI4sERJ/1vC1jIWysRJ2VZAsxC7nLTysVXk=;
 b=vUUUxnlgBEa/7YXUUmgZ0Pi1iKIVdtoTYCOIzuAPgUaIFik75VBXrKc3udVFP1tirk
 Jl2XLY4TJTyq9AZ+aG4QBi0qTCpC1wbqjgflHNKOwNOTWPI+Tqbwjr2Cn5XJv2oLEYWJ
 LBgzZBAuJ4uE8gnkwkpdOW9kwh8Xwtpi1jZZUSt/wNabTTppP27eZh5j1o85NOQwyNp3
 xSakynKsVMqyhMWsxULWQowiNPAutaIkzZrLtXwv6nu4M3bbcUr3g6GvvEy1AcogFsjH
 7OLXFq9RDikGDdhp2KVX3hs78syg1G9lPcN/G0KwbwyjcQ7PJnoIxx4snTg9zyvSNRfg
 EABw==
X-Gm-Message-State: AO0yUKUpO/WeX/DE3DQZlE3gswNSVQUZ6pJg787+sNZm7kexjO0H5IDS
 nwuk3l061vEgzFoPuB9bS96Z2g==
X-Google-Smtp-Source: AK7set+y1YFWMxakZ+/mEQuDf8M4RAEqBlhqSLuJGRDBYDlVvozotFfbpyPl5JX7Z0uAsyoy1EUWjQ==
X-Received: by 2002:a05:600c:1608:b0:3e0:1a9:b1d7 with SMTP id
 m8-20020a05600c160800b003e001a9b1d7mr6158093wmn.19.1676890959119; 
 Mon, 20 Feb 2023 03:02:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003dc3f3d77e3sm801525wmi.7.2023.02.20.03.02.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:02:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Corey Minyard <cminyard@mvista.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] MAINTAINERS: Add section for overall sensors
Date: Mon, 20 Feb 2023 12:02:35 +0100
Message-Id: <20230220110235.24472-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 20 Feb 2023 11:02:43 -0000

Sensor devices depend on some bus, not a particular board.
While merged for a particular board, sensor devices don't
depend on it. They depend on a bus technology, and can be
used by any board exposing such bus.

In order to help merging sensor patches, when they fall out
of a particular board tree, add a section covering overall
sensors, to help out with patch review and merge queue
handling.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Hi, would you like to help co-maintaining?

Cc: Titus Rwantare <titusr@google.com>
Cc: Hao Wu <wuhaotsh@google.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Corey Minyard <cminyard@mvista.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Kevin Townsend <kevin.townsend@linaro.org>
Cc: Klaus Jensen <k.jensen@samsung.com>
Cc: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Cc: Peter Delevoryas <peter@pjd.dev>
Cc: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..657fadbd6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3255,6 +3255,12 @@ M: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
 S: Maintained
 F: contrib/elf2dmp/
 
+Overall sensors
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
+S: Odd Fixes
+F: hw/sensor
+F: include/hw/sensor
+
 I2C and SMBus
 M: Corey Minyard <cminyard@mvista.com>
 S: Maintained
-- 
2.38.1


