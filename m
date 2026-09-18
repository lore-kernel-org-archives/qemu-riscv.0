Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88C7C982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:08:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7M8O-0006gy-PV; Thu, 17 Sep 2026 20:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8G-0006g6-W2
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:07:13 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7M8F-0004tt-Ej
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:07:12 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-398cb5615deso211748a91.3
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789690030; x=1790294830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FFu1GWUOTl4gGw9oxLcpuVAdjKyzH7fM1wcdIhlx/50=;
 b=CbirgYWo/IaNM6BqSpiIi2al91SlJlRMMol9gJsHm7A96+QmMsQVD6V/LI537MY31G
 BEZf3juv52688sY+tkUlc/quCJKuPZpeLTJW0k656iP9mUqq/kEfh51/34okcQjsvJmq
 gMUreU3TQSLofCADezP8o5FHgxS1co1n+H9kTROHk0aqxIqr5gLlRqaqaNr6zqN/DJPY
 mGy8UTGf8/dLJK7Nt/WCCw38q7+MoCCnv9qjIkAv1Xd8J3Hqmmp6240X9ckIAS8IaAj9
 B+OCJUTVoGkbUpX6cjkIZ4XyCbbtBd6z5PH6sJykmZKsfxl0rqC818l2yOYdWm9J4jhf
 qrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789690030; x=1790294830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FFu1GWUOTl4gGw9oxLcpuVAdjKyzH7fM1wcdIhlx/50=;
 b=XYb5AOc0LGwvvY27lfkXXKTSzs2+rfTVmOJuuVHmFtDW0QU5V9PJSdyR+itVaj+1Qh
 fnvxLrKBCq1couOnXeO/wzSjjATtUxw/VCZHrb7+ZCCFrQzUllKG8cL0V87TA2uhAoI1
 pXoVGRH6MKdA1eO4DSzcBZHkNvibV/oEZAiXppjVbBbxRb5XTwju/SbPw1rAOnmRiWLM
 s9+M13yLsTuO9/MGkcgtUE+YyhuSS26iYc0rAf2p9azgkSw86rTRxQUWMY9FJf0gnBOA
 FjralV6FQYdbO/+wYRpU0Mqpa/OpdjaGsixN3Uwwf00kg8HTsq+IOnArFWY9IpPVMB6m
 3/sA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxA+ANUe3HQX8xp2nGWgi6EeOV1NH6sGbyQ9mT2KblFMmDqxH2YNWRnj45Do/shsPDLSQ3pdkFWaoAy@nongnu.org
X-Gm-Message-State: AFuF++lkMRxIgI67/DT18ZQkzwLWwe6MUw4YCyaFCO+Mk6AFkKfpJUv/
 DJ6qC+tBHWaL9UH+LkkHIZIEg6lwAOsJTnZY4vi4V0T7Qs8B8+GZ1agl
X-Gm-Gg: AYBFou2Ym0cIXmEMIQQR3DRAP9mhvhboBklcFUXyFXW5RkMf9xhAprLwcemXsAwv7m+
 wmleXXu1MSLNRO5TSnrIdFNWRr8VCafrFIVUFIZ8sv+IBf+UkCv4q939Zewkf2Nc4uoOoqlggOk
 fyCbehMCTHn5Nz+tIcD7Elwws3qYmEOVchHNtSNBc5YBeTe05iiIwr3zrbzNYOudsNhsxy8dnTZ
 CiwS9WPe1zNltQjzCzJyq6Mmd/3JaI71+P+K5MFhH/JAWPPmRZPezSJ7Rj4aOr8rGlzBZVMmvT6
 E92qItofEYqCPKNRYCx8HRchjnB5i9uQkw5h0AhegdmVSvx3tYcYOFDtGQE+sFLBB0qUEq8j1IY
 suYMbX67auYXP2iduT7Y11YhdNv88oD8aVPutunVHtgd9yttx0eVFDxCFTFb+YooaEJG8j1FqRW
 gR45TlSeDI+1N4QmArPzvuYRpoWg0XBtki39113V/YmailtT3naR0bTwBT2aVbp6GLlSf6MNTcQ
 GxkZJYUhKDTIQNeokP+boNeHfZeqspMe2tXfbvm72s=
X-Received: by 2002:a17:90b:224a:b0:39e:4c81:6c99 with SMTP id
 98e67ed59e1d1-39e54fa5deamr1509803a91.31.1789690030121; 
 Thu, 17 Sep 2026 17:07:10 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33bf5b1d335sm20328212eec.28.2026.09.17.17.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:07:09 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <17746591750@163.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 4/8] hw/or1k/virt: use unique QOM name
Date: Fri, 18 Sep 2026 08:06:35 +0800
Message-ID: <20260918000640.1001-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918000640.1001-1-luoyonggang@gmail.com>
References: <20260918000640.1001-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("or1k-virt") so OpenRISC
virt no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/or1k/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index 2ff5c084a2b..35884252379 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -34,7 +34,7 @@
 #define VIRT_CPUS_MAX 4
 #define VIRT_CLK_MHZ 20000000
 
-#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("or1k-virt")
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(OR1KVirtState, (obj), TYPE_VIRT_MACHINE)
 
@@ -548,6 +548,7 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "or1k virtual machine";
+    machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->is_default = false;
-- 
2.52.0.windows.1


