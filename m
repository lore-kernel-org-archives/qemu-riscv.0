Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDF8C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:30:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9N02-0004CX-7T; Wed, 23 Sep 2026 09:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvR-0003va-HH
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:20 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvQ-0007i0-0I
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:17 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dce6e235so677796c88.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169735; x=1790774535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dE9e1D/hNDaJ+34nzjVxm6PaKrug7kV63zAG9/GlOBQ=;
 b=K+LXO+JIoiaZcXyQz3o/WBNXBHUlS6YLdUsc+N2fRX3BL3mC33gQuX6kJx/psDM72M
 efKK6O3hOTWf6XPl5uYyN/VERYdj4LXfjBm5xnldxHG6NxBDYcrtsQlwpfKaRiUIYKxP
 qY/JBKEFhT3h1gspUZUyCy8RNeNl3I/I4duoI+UR3JJ7Odsi1PN1oEuyST5QWi4uxmRp
 3Yeo/lIW/STNPPXYdnB3JE61zkg7xkRfPXfCHE5/pl26PSjNQ2j+MD6k6/6gf20fIU0B
 wQz4R8pntGMJgCIglLou/IZlfjhU/LBev7S0jc9CqR8F6Hpj8OGb3sdDvQtavs+7UI/S
 IoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169735; x=1790774535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dE9e1D/hNDaJ+34nzjVxm6PaKrug7kV63zAG9/GlOBQ=;
 b=eJkUpZLGZKbvVR1ZCk2pAiz8hsbJBpCIih+B88k3SsU5jB1tx8Zx+L0rqFnnQt2he8
 FcE+YpD5E2bHdj4eLWCKXBPv2uf+uvoqPfH9FmgokjdvMBdnkWyJKFsbC+nM74AA6byU
 58tF552n5Y7QUuuMHajvC2peICwfM/XDV5VXLT/1mW9zk0B5gpVFi6NWD4vRD3X4H62v
 TkRuXanWeNR7nR1K1PNzkoMQOHc4SxFRsypLY+MOu+IFN1y6Bd4xpGnglv+8h3RY1n3S
 kKC6aIsxsNbMUeuRwWWoUkTG1+/8fe7EXGmmD3s/Cd8lp3PADhC+nF6nr9TL5lrSZEbX
 ikLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNs9eCkujDX5sqhBHEi7cEuiaCH3MATdyO6z/6hsDYnfkFDNjw2VCgjGcyJh7Ndf3QGIzao/3FAX8q@nongnu.org
X-Gm-Message-State: AFuF++mie2WjuA/jA9vrboss06ttRHRXGkcBWoYczcmstqMXLB28lpAd
 xhu0r3+qf7LijgA3o6sl+298AlGAgwa9uRIotQXHgFq1tZ7OM+eodWsd
X-Gm-Gg: AYBFou3l4n/GkK5gE430TSs6cI6lqzae6Y/XmbtOXxe3U46dXo2OIAR954Twnf2egtS
 3/EPLCRae0jreRFxnv5be7pxCg+7KSKxdRm8T/gvn5XS8SOfdT2kMMoY20DTnZ0OJjPGQPkwIyG
 uUl3sr5iWFiowWL4b31umWggqeb3Xm5lHlW5M+EFAiuVKAixo8w69bNXGhe+754klZgZ/rVuBW2
 EoO2Tm1OCYiX12xtXRzAMojwe8ipnOfBAdhZQ5Xwpw2Ip2tE4frp8xfpKEmRknecf3BlPLbI+23
 olN1bO9PVCR6p2OZXsWndINlEBbDY6RY5EbDFNJcvtBr8KueeIIejwBdwsFiraVL0Ju0nZC/WBl
 ElzSHwn0xd3LBz92ExDxmnP3hVgq8XV4OHFMsDvtx9DnjHk8U5NArExv24dglTD6sF+DuZP6vK6
 wXrtWR2+8MiT+1C/AQ2FjzqjyASqhq/0R4Swvc+3vJVGISNb7fjl48LPTYDaqF9AsHio8n8PKbB
 C77fCGFNBMSz9S927VlDVhjjX+YT9U=
X-Received: by 2002:a05:7022:6b87:b0:143:57c1:6242 with SMTP id
 a92af1059eb24-144f917e7a9mr3802797c88.26.1790169734421; 
 Wed, 23 Sep 2026 06:22:14 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:13 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 032/114] gdbstub: drop per-target cpu-param.h from helpers.h
Date: Wed, 23 Sep 2026 21:15:06 +0800
Message-ID: <20260923131635.1894-33-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
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

- Stop including cpu-param.h from gdbstub/helpers.h so once-compiled
  gdbstub can use the helpers without TARGET_* macros.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/gdbstub/helpers.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index b2f41d6d280..7250e457c2c 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -15,9 +15,6 @@
 #include "qemu/bswap.h"
 #include "qemu/target-info.h"
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu-param.h"
-#endif
 
 /*
  * The GDB remote protocol transfers values in target byte order. As
-- 
2.52.0.windows.1


