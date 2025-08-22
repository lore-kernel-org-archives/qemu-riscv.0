Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C0CCA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 13:56:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upSDl-0006HV-UZ; Fri, 22 Aug 2025 09:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1s-0005yU-HE
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 05:25:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1m-0007F2-12
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 05:25:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-245f19a324bso17845185ad.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854740; x=1756459540;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXgebig47wIeXfp8dqO8PzqCbna3KM2O0dfho6ysf2U=;
 b=s/Cgb1xvvuIYGLC7pCYhMY1IUYSqPoaLPxBvg4u4rNHfKsRQKbiANocmZSTH9+78Xe
 b6GkLk6qgRgPSRstzJstnsCaniqmPZuu8C7uyh6Cbick9HorvmEu5H0GqvsxWx71BVVf
 R6/Nu94ZLOmcaptn1S3+pRScE+FGCjLiAl638PKqe5KS1ZCkjWSImLNnQeP4luk/hvXb
 ESo0JPJ2HtDkmwBMkjXPCfZ4bVbRKYEzQuNbHsZfbSlnnXBYmKmjmEVCKFuoXOH0E3/+
 n9FdAPAFsqVDJ4/x+LWLfT+ENb0458VJ76PqAwFXa+iO+dvwMDeeYI2cb6jR3CX2fM1O
 /JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854740; x=1756459540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXgebig47wIeXfp8dqO8PzqCbna3KM2O0dfho6ysf2U=;
 b=dzB9sTfmtQ6IejEoPaJEASSqljYOQUU/xj38mjk0TlMnMqfmRlZi51VD+0sm94Zr1N
 MRDKtcGE2PW3eao+Vpv3IyOsTPFoOTpO1nZy8PRyxb5yn71hq1x9K+t5or38qX/dN/Wb
 ub/7ixgyh2pzU3Htas4iE1CaVehQ2nMYK2sSBTMkO5IOnsU/yJwJbaSWFdIE3hkAEjch
 ff3ScYkekdYLJIWz+2i6odar4pmrWV53AZkgjUZqJjvNJTe0CWVyXaFcdhPvhandVzOK
 HDFFqUarbAxO2J+z1LracbvAUfGQax72oO4Bb0FmXXEE44mRUqOTR1a/bgUU+rlR2l71
 fQ4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPwpxo2IgGn2u5B9jWcG0BTO2eMyS5vvuWxpMex47BsbUnOmAz0WDU0rB7STqdEEm/osLHswTRviXW@nongnu.org
X-Gm-Message-State: AOJu0Ywd3WQtJsyOlJN1fxZcDs5Z6h7DC0697X3bexM6xDeqJAGbbqfP
 ZQ5KywNMzpjrOp7aTLT0h0nxr9fNGDZ9WL7JBIf4lHaZHcMK5vI3QW7vHXyDSgh0518=
X-Gm-Gg: ASbGncsnUVMp9NqpjxOqp3vLq8HY/oJLdqGiCYMc0JtOkoIIDJUnZUQPzgjnaSqQXA0
 zrisf7IK546bwquiNPYFHjLYONXf43LI0bWpOynfVEQPLRwxXQDk49QXjBY8DDUwtKdfWhZ7XNE
 z3C24hglZacammo8Anc9z8rgRhd1MB3YfEbUlwLm7QUOPYjgOMdXYd9hmlNWP6VnaHBEtL+bJrl
 wuDB5pfaLTFQF9Bw+341fg+gFUDwX8cqge1GQ2u1E4Cq0OgVuM/+Dh/cjGbG8ePd5SvvfhLNHC3
 jsAq22lOKm0jmTFbkvKMAAxG3E3ETlE2Hy+KFB/FrkwbY/pqxyqVuJlkA5BQfcguVIFuaTgkCzv
 qESYStBU/JhG3c66U3sVB54au1wDrVXgC7kOgm2VIKg==
X-Google-Smtp-Source: AGHT+IH8pYTJbnXf7rKnNIsoHQG2QKG2X9mf+U2mWDZhwdN/zTCzSXTLAS1lHezYzzhePUW/JC2CJA==
X-Received: by 2002:a17:902:f70c:b0:246:1c53:6739 with SMTP id
 d9443c01a7336-2462edfad58mr35900195ad.21.1755854740220; 
 Fri, 22 Aug 2025 02:25:40 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:39 -0700 (PDT)
From: CJ Chen <cjchen@igel.co.jp>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, CJ Chen <cjchen@igel.co.jp>
Subject: [RFC PATCH v2 6/9] hw/usb/hcd-xhci: allow unaligned access to
 Capability Registers
Date: Fri, 22 Aug 2025 18:24:07 +0900
Message-Id: <20250822092410.25833-7-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=cjchen@igel.co.jp; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Aug 2025 09:54:10 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Tomoyuki Hirose <hrstmyk811m@gmail.com>

According to xHCI spec rev 1.2, unaligned access to xHCI Host
Controller Capability Registers is not prohibited. In addition, the
limit of access size is also unspecified. Actually, some real devices
allow unaligned access and 8-byte access to these registers.

This commit makes it possible to unaligned access and 8-byte access to
Host Controller Capability Registers.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/143

Based-on-a-patch-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Tested-by: CJ Chen <cjchen@igel.co.jp>
Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
---
 hw/usb/hcd-xhci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 292c378bfc..81e91e6ffb 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3190,9 +3190,11 @@ static const MemoryRegionOps xhci_cap_ops = {
     .read = xhci_cap_read,
     .write = xhci_cap_write,
     .valid.min_access_size = 1,
-    .valid.max_access_size = 4,
+    .valid.max_access_size = 8,
+    .valid.unaligned = true,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
+    .impl.unaligned = false,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-- 
2.25.1


