Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BFFCCF9E0
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:18:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNIq-0000Xq-K7; Fri, 24 Oct 2025 15:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNIo-0000Wq-Ew
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:18:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNIl-0007df-Dr
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:18:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475dab5a5acso1840635e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333493; x=1761938293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eonV+WiOoy0c5cnLGQ4V0dLnLYS1ykl3W8IL9D5DMDM=;
 b=Eg9Z6RCR381lYH3RFRzh0nsM4uEFQOHLd7QahSXGrQgtWLNPICygbry9BBjLEVyXrg
 9lXYdLS71xfMIF2FHB8jguu/LXmb+wj6ddebpKMLf/1VQBqY0cn9+IExc0JbIkTu6Ez5
 XrVdBp+XWip0TsjBc8fVS4H50BHDXdmvqlAXgtvvqknlRXNSxl5jb4kF5qd/m6ua0Jck
 orAtIigkC/TKRCtwORJrYlX3SyqWC4q7emofxghFboAI7+TWa8ji/6sRE3Nc6rkKLfm5
 qdmBT+wDYGJ86NM/U/rQD72OlNKOBBuvQfELjhWgtQ3TxZzntuG7sNmFTdDJi+8sEfKE
 RVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333493; x=1761938293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eonV+WiOoy0c5cnLGQ4V0dLnLYS1ykl3W8IL9D5DMDM=;
 b=bx1gPQNSM8fSv4XTMTFV7V8J46GxpoeeN3/JDaiEw2k/RJhZrKGS6gOEvNm8LoLhdk
 9yVkByiN0XTCLts1mIe4/OL86FLNhQfjlofWYt99HPb+69w0cY3QJr5uKV/qxIMHSaf2
 REGRJdIMSHFoRv6ELw+1k29x3CvAwPEF43V7EWGsXCU6Lkg3B+RZTXQKKrNPB3Qmq7ro
 2FIiBeNjlNWubFE7GFL6tJkonh5bJX2/stllhdWfVsLxxlb8rEFZAxZF5GGDBuJEMJGR
 E3hBs7e03jBwj4humVFCPOkcUQG+iOqaZlYkqFOullzaAAal4TqmPOaMQg2cJbZhWGZm
 WSqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+cMMQ8h9Mw+qBwKCW8DABW/3PEeovudJTVP5g6+16F2QIxr6hV/p2EDIpjdo/xP2bPB6uzIFcb3rC@nongnu.org
X-Gm-Message-State: AOJu0YwwEHXWyWWaso4U7GNFm2sw3e/vGIbGRo5J443AMI0CEKykV5zN
 uVNdEGxWnBRhGBxmFHur91MTFIsFkisPloNB2nmZ6MeEvCI/6WUI8ssVpslvMtY98N/N41GjpzU
 4UUWoOZ8=
X-Gm-Gg: ASbGncsV3HTPAFcv1fzCaTpAkvl9D5oGCnx+4p7JB5gJG7NVQRMLnKkyy1YYj4vSJjG
 ysUW+M8fI6vbd6z1YTIhOpgDct/TXq+UEiZZCU2Dr/bdsFaYlZgJospTKm64kAauESgPSEdgqlC
 h1/ojHILqnHLAfrgyYLeaz4kPQLY6KvNi76Z2693jywSik6TkW2Py9kUNBpV0CM1ISSn+3E5qss
 9P5Uq24RvKU0cx5YERUmbjpdKLq98enoioMDqIuJI88d/BUTrEkVT8vPzWqz7E8pMIfXVXqNBgU
 eck+roNJDWXFE4wKOjygs9SMWR/Uobp4uISh2grsWMJLUqC/qQvjSyLmNNyeptzLXkliQJdGwmZ
 fbW3y2Ml+N/Hs3vQlZw3ibzGnwYND9BguEfkHklbEqpIw/faLiLQZlSZek2eXQJT7mJoTIZVI1R
 BZiX3eZccsb0Whetrd4C+l0ATqlxrESo8PIWjQxa1h2xfAXIzv2HGDvE5jnP5B
X-Google-Smtp-Source: AGHT+IEcud/+cjk21SwGuCTletB6kgJFqvWqEu87ta5TJtJi9ymW2LHDBPjBLFEosDp0V0KQ8BtM8A==
X-Received: by 2002:a05:600c:8581:b0:46e:19f8:88d3 with SMTP id
 5b1f17b1804b1-471179123c6mr170701865e9.22.1761333493552; 
 Fri, 24 Oct 2025 12:18:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e763csm10698654f8f.6.2025.10.24.12.18.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:18:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/27] hw/platform-bus: Include missing 'system/memory.h'
 header
Date: Fri, 24 Oct 2025 21:03:56 +0200
Message-ID: <20251024190416.8803-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  In file included from ../../hw/core/platform-bus.c:23:
  include/hw/platform-bus.h:38:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     38 |     MemoryRegion mmio;
        |                  ^
  include/qemu/typedefs.h:68:16: note: forward declaration of 'struct MemoryRegion'
     68 | typedef struct MemoryRegion MemoryRegion;
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/platform-bus.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index 44f30c5353f..8672ccc45ec 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -24,6 +24,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 
 #define TYPE_PLATFORM_BUS_DEVICE "platform-bus-device"
-- 
2.51.0


