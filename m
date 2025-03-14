Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A5FC282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:35:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8tf-0005sA-Bo; Fri, 14 Mar 2025 13:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8t6-0005ad-3W
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8t0-0008F1-NJ
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:31:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22423adf751so38666105ad.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973513; x=1742578313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
 b=H9duQxFvfjDJ/5RWK7zM0lYMQNiNW83G69CdomQndShsG0t/7YILuSCNLqX2ihNS/D
 i+B6XoQzVfYWuwsauMEUySfWjVi1N4w+JhsXwe/vPgkkjVOGKkk3bHnYW9NbwQzDd/WL
 BSGO47p2tQV2Zi9v0WOTK+B3XwknoHEsl2G1BKwEymS5tGs/2zHGaFGBzJAA4YPamiyV
 P5J14SyIpc3YZ2UKY2Lu86TH9yVmHCwzgBPWMsTdp8qu847nuevOTU98prGZ+SO5EgNC
 /4Fa49yUr2Xc/68pP6D/Q2tXMT80Pfzs8TI8hDv+nd1O47rMk3JrgtD9kfsTqICx8tyL
 FUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973513; x=1742578313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
 b=faNnCONDbLdYb4o0MJA3hZWs5S2MRc0LbS6JWuKj9ac6jGukd/xLXSfBwP5LoScg2+
 b+LsgUzhzle/6stF0VhXsMYUehDtT3ZBhPNLYlYAausBiHgFXZ384R6FTCbZbHjFthV2
 NfEPYm3mCKRR4KkDsqtd6ziM+Ey4k6nID14HI4WdRgVYgqlnG4p7woQwxVU9eurrPIga
 pYtIT9CLE7Iykf3/Rtai1KAAQvs0p3bqjRoZUBFXyWSAysDAQkbxgenbAQG+uckF+AhO
 rZx4h7KVgaCeWn2XlJ6Uf/8Y310E2npHl7GizvrPNUU1Vc6qxtiy7pp4x9eFcDfiNHei
 DXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX98Gx8IqRzJvqdug51Mf7gf/0baAcYtBqkPC4KH7HU4hhnj+0ZneXQAgbqt/SyYLpVR5n11W4jjB6l@nongnu.org
X-Gm-Message-State: AOJu0YxLmM39fAUJmoN/Sqaj39uNiiLUXjrWUzfKrRaPjd+uJfuBaqLa
 as2fCSdLTDwWsR55uQ9NykE/cswyq+22d3xR86DFJ04tAIrvMKP2ptVp8BXmIjw=
X-Gm-Gg: ASbGncu/O5Pz5IjnGt4sHHzMX2r1KKJ3WB4Xfs+YgiqiqjYEncHEr+r4deVRfoQvvc0
 0zGWIMUTTwo3uZp9VF9db7nvau0m45pazOQelqnOSeh0Qv9B8lp3uUAGNlAxKH27InrAzmZyT1U
 BWtXIXgdBBdGmAUzd11twLSP0m+rCUNyzDBxgvGA+A47h4Y5SVbqnR2mww8niexTxHvgPMuBJFi
 hx5sp+keJtGw4TWKRMyKjBg/6J9ynXtWvoS38v93J4tY0XHZkwWlxajOzAAu6+5I9Ha0Euhe1N3
 o3pIuPbMGjGGvojO9YPun6VcLGLDUafAWrxr9a8qtGyP
X-Google-Smtp-Source: AGHT+IHKJWanCd9a3ngVFjdniRCV0nA3qgwDHy2sNxgD5gHXjvzGRnW7PF30BgY1b31dJB7uC0Yy3g==
X-Received: by 2002:a05:6a21:7308:b0:1f5:64fd:68eb with SMTP id
 adf61e73a8af0-1f5c1137439mr5964561637.7.1741973513079; 
 Fri, 14 Mar 2025 10:31:53 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 07/17] exec/exec-all: remove dependency on cpu.h
Date: Fri, 14 Mar 2025 10:31:29 -0700
Message-Id: <20250314173139.2122904-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x633.google.com
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

Previous commit changed files relying transitively on it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


