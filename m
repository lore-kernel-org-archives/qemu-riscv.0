Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D933BC43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 09:11:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wh1pR-0003Wv-Ex; Tue, 07 Jul 2026 05:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pP-0003Wi-Vl
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:10:55 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wh1pO-0002Fw-Kx
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 05:10:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so36595845e9.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783415453; x=1784020253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=cxatRAXzoUzygniV8/H1CytEEsCrbTRphgAHumnujwwHCtgM31o/N7nCPkaMlOudQf
 ZcQpnTIWVNcILRDW3+Y7lMM7vE3iAksGwZtuwkwFO2/3d1nhRyzfH5Lf9c/xdtT2mU+8
 0q8hIvgO9NVmtjUssb/ZdqQfkHHfOXGpV93PqIaQ7fqXclGOpwX6dJtKolxVBrgod9fL
 LxXTbUdc+auSkeAHIV0gEVXEJyZp6CfsW8zgHRqJMGMjm6Wc+SmsJzYjtUxx03di3Pj7
 2p8ikand+WU1jdhZ9EunPG9q3avZ3UAmaNufKZfNnHKlX3ku6DeTISuHmmLYjnHHjLJB
 HcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415453; x=1784020253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Gykh+5P8EC5j4uZxNdjyOMe+zEXw26y8NMVO5QDhqI=;
 b=jUWOaygmf/mk+7g6U5dJUDnFeK687OVNqakOf1vaHXG9RjQFtOm/reWM+GWsOoSIk2
 mX7X6HiD1uYhxziG/GTvXJvjrJ4nwYE/cbLKDstmWyxlpT/+8fgH6UKuOsHbP7rMf00l
 aROqpGZT7t6Xi+QXzbeC0P77/GlcPaJMQGAsH2cqwA/AKDlb4tV+89p+Wf07TLHrO71D
 HTmm5cOkkirzhDKWpYgk3ZqRpHBkkrZQ9mxvC09RDYhLEfPK97SXRSzyE9BjTXS4zWNO
 W2jxsLt81me80ne5kfhTPH6KRoGMpx0QDBtfUx+flkP0i1j1WSTNACzVRNNKx1NyZuIq
 MMww==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGNNlnQIZpEnztjQCH42k72jHi5JVv+v1ZZ8/8Xue7Qto+95smAsdf0zzmaMMTqcjLXCQPRN1mzFnt@nongnu.org
X-Gm-Message-State: AOJu0Ywg2ds6VWYxQw9vCnieUo32EI2GpofUT+c60ikqiy/AjDxSiTTB
 7QM5ZFEZxw8Foi9e6n6D1xCjlt6o5ULY7qU+xA4metFajzckidhoF+KNYkmv4J/c2sM=
X-Gm-Gg: AfdE7cl3nMq658lqciNdEwIUDLt+3RshB2dYKhKNi9+Ac+CihVU+55AkY0AjC4eNz4K
 /YyIST5ghDRORpkVFpUTghqOMsyuW76WN5OeQrdBHNYapnRrKQyC2lZcNMzsNQRj2LkADul2gfO
 sZCUD2JHZFkz+0RmUTUMdG4NJbN93ZD6bG2fsng+nZWoXv/QlMupV8Xd2v4JbFFsUaL+EQ07wHK
 W5FKK5En6hCCTlCdrvuhnTvpoD0Nn8ZxQAeUCgl4EJ6ZhWk7xcukxlnp9+R46q+o57Fw52p3zB1
 G8iHABaUigUfL+Xm9qN+V9a+oF58qmytpKkiL4Oh5A94MjyaE41CBXi/+gvWPPrkYB0mvGfysae
 qMYDWt5qV6RxzysFRd2V9F76UwqCOabgJdZzgAU3ZPBv5XdGXOFGJ01i2+eLFOT9SuK/nBOKWMF
 X5lbF1Er+I3b+cNZevvLE2N5bVU1GvfE6eH+fOy44=
X-Received: by 2002:a05:600c:350a:b0:492:e5a5:5a46 with SMTP id
 5b1f17b1804b1-493df080753mr43212645e9.35.1783415452609; 
 Tue, 07 Jul 2026 02:10:52 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f32660sm41004665e9.2.2026.07.07.02.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:10:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 1/6] target/riscv: Add Zicclsm CPU option
Date: Tue,  7 Jul 2026 17:10:34 +0800
Message-ID: <20260707091039.2574638-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707091039.2574638-1-frank.chang@sifive.com>
References: <20260707091039.2574638-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=frank.chang@sifive.com; helo=mail-wm1-x32b.google.com
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


