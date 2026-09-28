Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F54CA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 12:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBACN-0002hk-AB; Mon, 28 Sep 2026 08:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan260699@gmail.com>)
 id 1xB4W7-0005Lb-8L
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 02:07:12 -0400
Received: from mail-wm2-f12.google.com ([74.125.225.140])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefan260699@gmail.com>)
 id 1xB4W4-0004P5-6V
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 02:07:10 -0400
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a003bd18e5so2616345e9.0
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 23:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790575626; x=1791180426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1cN92NBzyWhwDbelW40CbB85aRaw+XYk0wpK77nA6R8=;
 b=FHNKMosPVOxirxz6sMZJRjItbfWVAn5OYjwqnbLMV2gFcroz/RrOqLeBoVn7JSgxeF
 iARBhSSdd84O30i4EkEna+S3yk6yjUhl85Km85Y7S929UwoK/4bhrSRv5Axr6iu0hlnO
 /EFs3hkAg5TsnE9xhi2bNosUi74dz2jEfNLumRTAWh+Z+m6pb2SFC5/3rL5+XjgAzsAS
 X115+z1xaAGeQ4RBQaGgI+DHsESn/zaX/ZspJNOSfPy8s8Z36h/e3KJPZUgRZX+G5JNw
 QEYcrQcfcnpn3wPjwP9zIrNXtOWYyGqJDtnl0hJBZi4Z8xUtHU62Kxunt8EGGjSv6spi
 szdQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBys5xq6qWB+o4MAqB1xvHzzhfj1ZKHTg3rOBbm04e/B3K+fJEqFBnM6zzw+rA5nZ0FlWqADfSuyig7s@nongnu.org
X-Gm-Message-State: AFuF++ljdcFPWfJECWbjkkyNxTqzWz/hh6yqCjckotpdhN9/RqdyV+of
 tt8Wr+L+xvMNUQbRwhf1l2gCBP15Yczc3+F4Gxnw7gSVXEvE8+46bnX1
X-Gm-Gg: AYBFou107CKpNEYWb/ob5HKZa0NmBlpECkmbI2D+R5oxBB1nIgZKOpj9aD+GPqmKlMs
 UnIw9HkIhPeWG1vxZrLdodQSCa+lMjaanwH/Zm9dM+xGXXFllWa5VCoXzus855rs+vqKH5WGaxT
 uUfsquuzflhInFE8CmaxOw5ygFia16PJNfOf9DsweFX0xm8VXn1VdSvTrFGn/YDE37qYfW6mLu4
 EC7uBSHNocRfCqrsULu5LhAaTi+T0mtAEh/eDxxZu9fwuTowVuIhbJRfHmWoAwKSauQadIFyI14
 dvc2q7Q+Io/mhhat7xrSMwrNBXX3BQjcXhb6xvByjmokPDB39cOajl0H9QRNgwDd+acRVZsH4P4
 UvhXjmo/eF/LTAWVUm6Xve5ylBwzj+fACubwQ+iQl4CrZg0A+bSKLHFaC5btZANI5Ci/OJ2n+xd
 GlGbpOP8ubrFt2J7GU0UEi8IoEABEiwAJNsqJj05DFGbtM0X4zxJwNOzSe8sg29ve6WJEypPvpn
 L9C+Hjc8B4YEND22E8=
X-Received: by 2002:a05:600c:1d1c:b0:49f:bc43:9e96 with SMTP id
 5b1f17b1804b1-49ff06bcd5fmr146886865e9.8.1790575626180; 
 Sun, 27 Sep 2026 23:07:06 -0700 (PDT)
Received: from mac.fritz.box ([2a05:fa40:300:1a00:d105:6a41:99ee:cbff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a008f7f1c2sm1325775e9.1.2026.09.27.23.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 23:07:05 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:06:37 +0200
Subject: [PATCH 2/4] hw/riscv/virt: Move platform bus interrupts below 64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-spacemit-k3-v1-2-8c57d0596b87@butz.st>
References: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
In-Reply-To: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
To: qemu-devel@nongnu.org
Cc: Sunil V L <sunilvl@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Stefan Butz <mail@butz.st>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1790575623; l=906;
 i=mail@butz.st; h=from:subject:message-id;
 bh=4KB5OWyGlPcNia4s0cXBrLw+sOdQNBsSG3nSdF7wGYI=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBAOJW8yHG2FdKcC8jiWoQyd2Z6
 SNHh+aJB0RLkH7BFF7Yy7MymfE5UJE2mmoucIa3HiNQdlVZjgqLY7wph/VSM4kniDO57IG9Q9jN
 x96oOAzzWWJEVrh8vlxRGXatNy8ywcO9WExvzLop5s2ddP08f0Wrzn/55mpqoLJyoKaIbk10kxz
 JW1GONHT8nsNvBpVB2lnzA2jhv7DC79UlHzA98+sp8eX6kmUips+9LpTJLDeVna8f/vwkU708PI
 Qxt/5nhmFXKj/su/CMFivCLHckdmMOem/4UNoTyRcAbcoFQ9WWyYHvAD/bRuYZVEA2hfoBEQVu2
 FGHdG/OimvbT/GseVmWjiw7WV9HUOJJawVmfoTEJynX9BbV+VNMKZVpW5YaAaps6/KOC7V2bM7P
 hvORUmj3b8eUr418GYC3M4rLJtrj6Vu2cUyTV9Q5dvq9Lg2TIj/jpbEWpOqn2FSGkQcLvcDksNk
 jOSGmdG4h+OJ3vbGrva5UCJF/KIyuV4ozlSU7awAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgD4I3U6FeGLd3zHLOViNMCZuafigSUHhQuQWUYU6BqaMqHEHx
 ufgHVFzJaOx0okxAqRMifQaRXpzGq2I690EL/XcZPl/mM7RwcBb57Z4GQ7cZB/anlDOgptKHFCp
 x8gUjJWdFEz30S3cFGBja53FRy0XbLLEX4CZ9H1Fp4nhfPtbHdSGqZlaoUy5MhJtg8tany0BWjh
 GcxNdc1p8YfumyVJwbl1qYgu9V3KTTFc65+tfJK+zy6mM1TFQ2VquETqC22wf5U4eARBJoEPKAC
 5Xudb/aNSBcVosvYh+jQAS4Pi8OEeTPcJKOyQQa134t7xfS9JBzSWrv8ht75wulSoT5JMZpSX6D
 81/r+i5ChPaT3ZUnJoNx84JDqsZsJ/255KpqCFt+5oKjLtPknlociE2E3HFXj9XT8lVskCK5LI+
 uzSmBH5vInW+23QLiH0VpL0Bdgz0ZZmt8to+defMg5IvgnOTnZiGa/laV+IQnw8OW++GDpWOW3F
 5uGMRM+LO25JudQ==
X-Developer-Key: i=mail@butz.st; a=openssh;
 fpr=SHA256:jcZFBs39daoQJIontO/rJaVachWp/oqTbhNpQk8+REQ
Received-SPF: pass client-ip=74.125.225.140;
 envelope-from=stefan260699@gmail.com; helo=mail-wm2-f12.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Sep 2026 08:11:08 -0400
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
Reply-to:  Stefan Butz <mail@butz.st>
From:  Stefan Butz via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Current available rva23 compliant risc-v hw (spacemit k3,
tt atlantis) support only 63 guest interrupt identities.
Reduce and move platform bus interrupt range to fit within
those limits.

Signed-off-by: Stefan Butz <mail@butz.st>
---
 include/hw/riscv/virt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 98e48ac894..52cf7c5290 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -102,10 +102,10 @@ enum {
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
     IOMMU_SYS_IRQ = 0x24, /* 36-39 */
-    VIRT_PLATFORM_BUS_IRQ = 64, /* 64 to 95 */
+    VIRT_PLATFORM_BUS_IRQ = 0x2E, /* 46 to 61 */
 };
 
-#define VIRT_PLATFORM_BUS_NUM_IRQS 32
+#define VIRT_PLATFORM_BUS_NUM_IRQS 16
 
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES 96

-- 
Git-157)


