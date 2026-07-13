Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136D1C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 03:53:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wj7hu-0006os-0N; Sun, 12 Jul 2026 23:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7hr-0006oX-8g
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:51:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wj7hp-0001Lh-Om
 for qemu-riscv@nongnu.org; Sun, 12 Jul 2026 23:51:47 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c9d1fc053e0so2334594a12.1
 for <qemu-riscv@nongnu.org>; Sun, 12 Jul 2026 20:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783914704; x=1784519504; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=dtXnu2uJ3EWAo3qWFHkH0X13wvmHYPZObnv40/mF4ffqvvOFVvl6g7/rR+XkAEy2A0
 ecODn3kYuNoYEgUxlxZ5h6cUuDdIlP7u3j/PVt7oggxjf2winxVssQ96nuE1RMOLoKOC
 kKjiL6g+51ONqdrBd3eMJsjfN4UqTRULBcysRooFmVKPQnrNP633kqxML0gCPZ2LV2aw
 wCAOm2ICMUN3BZva3ZZmdY23wM69PjGh6Xfe/tShM47byFqp2fOqHpqi9ReGgf14FHPO
 d9ZHNdoUnKi/2P2STOuM6OVdVmE+4Z1flBgG03q0xO98OXgvY0RXtAbxKruqTFmOB4TV
 NZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783914704; x=1784519504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=X/zellh3rXaFjQSDodEkIjjiihoAUBLOB3JgUVhu/Jn4XAUPDEnGojz62PS0AIldoD
 ADFcMneCg6r6BD8rXSuF2KXF/5NJx0nfJZhGTBoDmo3KZAJnQHQheUoO35RSp79i3RIf
 ILqO1ZOZSdzGyMyVktp3Z5tkaXdKfVDaQITAqNeBUhfqYMhoV21ZGsFYF7EF+B/a8kAu
 n4sYWAc5hLO5/mFG98HcKJJpGW8wKiJtb0P7t0Hk0kxxaL4cnmrlR6gGWN41mqYVdwbb
 boADtnT7FBDv/7+l8lLqGzMy7FWjisYA5z1c0O4Mia6nI+NJyN/qNmLXhse0hfxdHG5T
 melw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrHqiA9hZQ4bQzZvuIul3+kYUddeDRkVX0/7x7a4L+5cvrb1NG/odfsLnPAcwyl7DwpmfCgBX1bIUul@nongnu.org
X-Gm-Message-State: AOJu0YxyOPrGdFtBFKqoR7hf/Fn0QzR9nTBuJDqIhwD83DwuUUnkVBCB
 U8lYppgvNuK/+VypmAlD7jL/Q+Soq3sdX810Y6y2kOY7u7X/LHObpabnQAtKPPvBTbE=
X-Gm-Gg: AfdE7cmLBwkWVqYJHGoJ1MK3R6sf8BRf/dwOVaFD+kQNfwRHK9DG+sUvKR1W2tI8HwW
 l2RGQMs52lmFJEeQK571nXU/gWsJBO5UWtR2u9DdGxo9FRDaNa0myYTUomzpM/B85SkOASIOAqt
 Hn8Sgee20WKn/W2eyHWu2DpIYqc2roDVoQPqJsEwHqAkQghtMzUJif1Y8Vp4XMzT3GlvUrS+LUK
 JRSKLynSwINSVgxGVdVF6W1urOgBxGo+6zOHL0+KqR5yPtRyC2RAxvUckhfWBecG5jmWsvJdSuD
 W6lRmzK9uvMVx6qPgJTJkAEqFW97r76q2KuwtQfAOQinnca5Bit8PluNbgx6PnDnXabd0/7uvwi
 k4gp32hq2u9M5F4wkJf9hA5jx2yHX6/em7gQcSuhF+hiJrhyeNoheimURHRjcK5hSsDLcEabWRA
 T8cS558YHBCAGX6zwosLWFq4BWHGYrVhtil904kA8=
X-Received: by 2002:a05:6a21:50b:b0:3c0:9c1b:d0b7 with SMTP id
 adf61e73a8af0-3c110a1213fmr8503751637.66.1783914704480; 
 Sun, 12 Jul 2026 20:51:44 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3162d3csm7739884a12.18.2026.07.12.20.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 20:51:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 1/6] target/riscv: Add Zicclsm CPU option
Date: Mon, 13 Jul 2026 11:51:30 +0800
Message-ID: <20260713035135.3996990-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713035135.3996990-1-frank.chang@sifive.com>
References: <20260713035135.3996990-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Add Zicclsm CPU option so that user can turn on/off misaligned loads
and stores support.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_cfg_fields.h.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 9eb47af0a76..f8c27a574f8 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -139,6 +139,8 @@ BOOL_FIELD(has_priv_1_11)
 /* Always enabled for TCG if has_priv_1_11 */
 BOOL_FIELD(ext_ziccrse)
 
+BOOL_FIELD(ext_zicclsm)
+
 /* Vendor-specific custom extensions */
 BOOL_FIELD(ext_xtheadba)
 BOOL_FIELD(ext_xtheadbb)
-- 
2.43.0


