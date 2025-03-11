Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8F0C28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqxg-0005Q0-Ry; Tue, 11 Mar 2025 00:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvb-0003Ox-HA
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:16 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvW-0006UV-5r
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:15 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22435603572so52633915ad.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666149; x=1742270949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSQnGpOqRDw3w//OvJparnGxlKjvigYzwQgvxmVvIU4=;
 b=wooyaybViqP1byEs+hy1w62H6jLG4fvt8jvtS9DSxYc/ObvZSK3umAEpygexHXlIKV
 gZrp5lhSXBfHfxCW7HOJp9zg9rCdNhDSRFBKAFnePSfsoI92AUf/Vb82OFlupwRqtptG
 rU2U4ogDbMgKByU47wiG9yZMP3pXN2IaZcX33VSzX85d9spQD7IrY0CTYAseRv1zX+WI
 FZqzKQn6Fd83Oxl9mN4rcs7v8Dam+zVMj2K99vjqbTOepujSugVLWl57TgaCmHfQdx0L
 rprQqGm+6JGY78ienR2mwlwEkjK+nwfyn9WSci/SFbLhChq9GuXjXsBnn36Ds411VkPl
 pgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666149; x=1742270949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSQnGpOqRDw3w//OvJparnGxlKjvigYzwQgvxmVvIU4=;
 b=P6vvv3Y/gG4uTCA6cM2JXY8CJyhBx0N5E/T5LaezDdyvXQFsEe0+UfXWIvox+EHRk4
 +R5XcrnDJJrvwkbcpMt/OkRUJpsBx+QVmkDxNZpBL9CJWZXzG5Q0TADpp1l21PnU8syM
 AZmS1tAklfDbvdYuSPo9wEF0NQIrBwXv9F0Sk17niOdSKX7j3/Lv2C8UF7J0+bnzhLkL
 pdFlw36Sur2yDKhQIDYWThm7v9/rdQQlxsvyEEGiXavgs+tOZ4zCoGvNco3Q6ftBxspt
 peet/xJAkwa0LEobTKbt8PSi5ITzuRgmsxoSjLorAJVqwL58i4szRB6vQddLQtW2GlnY
 quOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsVh5IM86PlyF4cKNXHHfaYUrJA1wOAzPGShXunuXDZSe/jTQ2BJ6Bwf3Aq8i72G94VtP0BF+iVfLo@nongnu.org
X-Gm-Message-State: AOJu0YwNq+5G7jdsvxDasfUqVSc1l5lsVOeQ0Brh5rueE6kd7yIPL45t
 AGnnND3Dl52h0HvOmLE+vhM611MNCB0iTowLR17bpY0OEADMXQyqmLTfapcAIOI=
X-Gm-Gg: ASbGnctNRllJGzw6mDVqaHRovj3HWrYELdr9pbcfnjSFjjNE8sEzzBIR30BFHvtfiIt
 BM5hQXgXyTqqSuvQS2cZdxd9uSifqr9/uNbUQxP9n6bvoAO2WtkgmDM8xNV65c/6sjnA/2xX2nF
 tblgagHDFu29ypjHbUWm0T/P2db58VgJ1C/0o7RhuwN/MeOTG3vnWvJFvxiLEbGC6mwGhCtE1XF
 FK90iAlxFv2nO29iW81NrkzCCthJfcVfyqPL7fZkpJ5uVU5Y/MXNTh5V2CcDTDrBjTSyz12Wm0I
 d/lJDLTC3JA9pWpbOfvds/cbe/FUtWusYFBR69ufD3vMSg+mIRhMuno=
X-Google-Smtp-Source: AGHT+IGAtyqJ8JwUWzZUpShXBSvpRNbrwAinE/LFxHiM0RsFVnA1TPY911KWPkY4EkoTDg/0IjRi5A==
X-Received: by 2002:a05:6a00:23cb:b0:736:55ec:ea8b with SMTP id
 d2e1a72fcca58-736e1b3e670mr7549220b3a.24.1741666147270; 
 Mon, 10 Mar 2025 21:09:07 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/16] exec/ram_addr: remove dependency on cpu.h
Date: Mon, 10 Mar 2025 21:08:31 -0700
Message-Id: <20250311040838.3937136-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3d8df4edf15..7c011fadd11 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -20,13 +20,14 @@
 #define RAM_ADDR_H
 
 #ifndef CONFIG_USER_ONLY
-#include "cpu.h"
 #include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "exec/memory.h"
+#include "exec/target_page.h"
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-- 
2.39.5


