Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8B7C43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:45:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weVx7-0006EP-Tg; Tue, 30 Jun 2026 06:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwf-00065y-Iz
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:02 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1weVwd-0004o0-KE
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 06:44:01 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-37d70036426so1947246a91.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1782816238; x=1783421038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=L8MLCgcIzPLxEk6oIi3sgxaxk/YxPgVclVumvCmWShKNELyV/Pnw84zJgJF/xZbKUR
 tUj75vCBCBsy4fda9+24h9i7vnhl5jdZlmyd3wI7h/GPU5+32z5YNHqXENsHJ7ht1JAY
 ujQL7juD2oDtUcq9yrY/ivBU20wfwIPuSn6LZD0zLjNbPJSqh9fydJ+Vm9e0nTp68DgC
 vn9r68aItP0RpVeLnx6ZpR9urt7irlY059Y6nXFwLB52PKh+E2EI1dX60Z0KDec7i2rC
 qHC4f6bzvb0QKl4DdGjsrXOTwdlQldywayl35yQLekzNwmnqC09ZJpe13/if+9TxWlZK
 casg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782816238; x=1783421038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=oD4hf6ak+dtp0oxYTJeg96NL3YrsMdH8bG9pLa7y6PA1UZKJcK/Osx8BrtI/OuQMGg
 VCcSXKHO9gU69wbaF9/CYIDH271pdzyve8HsPDSOyzVPLK2s5XHOOefBN9YGbw3HTtsu
 D7dxsHSK1TPvwVLFh8J7nZqIqnoE0aj8QYs/Yge4ZMDXhZ1x+rKnR+MFMVwFkgjGyGby
 9XlNfkwJNLk+YzM6a6wUnJTxjjJRCJNh+tq7NIRxi71HdTb2Kd3KsVEij9alPK8dvM29
 lx54nGZUaGblZOJaPnHcjP8DcP+qbWgpbmIS6/rAZ7FXCD99yLDOBAH3yT7Dwf2764PW
 EqYA==
X-Forwarded-Encrypted: i=1;
 AFNElJ++lfZSE3MJC3iFFO5D5YmFFhgXu1n9yZ2LHBEashKY5xGeNwVb3Sgja/VFj0sJwlIe0PQH7QZUNc36@nongnu.org
X-Gm-Message-State: AOJu0YyRyCt8+QB6ickRwO9waK8pWwLJfp5e2GclpSe/OfN1C04P1wn1
 5V7S8/U2HM9cIYK0UvnI7Ki5TqliAxc0mpXwXU5JlkAE3d2Pff3mxx4pOcG7Z36jNoY=
X-Gm-Gg: AfdE7cmhcSB1rIcbm1u+9f82Ta8Lh2uGYrudeiGxK3LmxE5jVUpOTcN3KJILJjPa91b
 0ZCiwrrXWIjlidnI1lwwiDY/F3XvefQkK0dx5O5tTTP/W2W+G6S5pMqZjYdz53JImf2bZGteT6L
 DDhVltPoVoXeAf8BfVGkZDNYeATI1vU8p3Q59QJg3zcoQcXTCnllAlFH4K+xA4g2Q9/pHcpkvtG
 q/5q2E0Q64KBc4q2+1SBQ1HYjR1l/OcLC01KqOcs4sLKcF0fhReScEGeXPkK3/Rwyj0rhTMigtd
 P+BXxPzbBoK7txLeDcoV9uHBrkSJ61mpIXs2NAriJAN9UCOExxdQ3/8NTOnTr7UpOrKBQNDk4bn
 r0shFNLXktZQU3TJBryObjIrBCm4t7xPMdZ9FZk+QYewHuYOn96tWaH+3oMfMfs/OCL+K1fd75u
 TNZ3YG4+eFLWcd4I+eQWpMrmm30FICfDWOCICUxDE=
X-Received: by 2002:a05:6a20:2583:b0:3b5:489c:7bb5 with SMTP id
 adf61e73a8af0-3bfc5271719mr2902273637.28.1782816238281; 
 Tue, 30 Jun 2026 03:43:58 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbf95be56sm1274745a12.16.2026.06.30.03.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 03:43:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 1/5] target/riscv: Add Zicclsm CPU option
Date: Tue, 30 Jun 2026 18:43:46 +0800
Message-ID: <20260630104350.748267-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630104350.748267-1-frank.chang@sifive.com>
References: <20260630104350.748267-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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


