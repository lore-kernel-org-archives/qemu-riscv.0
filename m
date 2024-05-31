Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2F1C27C50
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 May 2024 17:47:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sD6Ju-0001s8-JP; Fri, 31 May 2024 13:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sD6Jr-0001qx-5p
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 13:45:35 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sD6Jp-0007bu-83
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 13:45:34 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f6342c5faaso9415855ad.2
 for <qemu-riscv@nongnu.org>; Fri, 31 May 2024 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717177532; x=1717782332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VglV/qt6rHvbvSgSjaTMT0boXZYOnbayc2OjwjqMVsk=;
 b=Rvi7d5AWZrvm3VJKexTywZB/I2w6wKfkF5sgJ+mTSvjqE32Fc6N5gC6bX64cEYJqGC
 qZN6hott+L2dy2Zz3ykM+RybSMszuzrRU/dBFCsh67AYYltLHCIevLQkbNb/rG5NRxXt
 Na9R8xBlESB06aS4+rhghZns4o/AFbUIhQDk2QsrwNjbMj5qFjorDgO//XDIpZRExJAn
 L4GcvvXJcvwIazXJsE2jzDB2yaKdLdgENh774ZiH3EpQ6FfpTVDE9+KisWTdvEZis++L
 MmpAmaMcndkkAE8GPEX/NkkOkCwzHKHM89fxeNchlZv6suu3LnMb/MdGEO0dmUu5aQMQ
 Fmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717177532; x=1717782332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VglV/qt6rHvbvSgSjaTMT0boXZYOnbayc2OjwjqMVsk=;
 b=Y2i6ZJpVDcx5umXwAJ9V1tan3uIQM6eYPvhw08BH80Nxtyhmxq6qSwuBqfP57dzPYx
 DK3xnBTgT0PeocvgchPniypm6hBCaUFTr3bOymgZolub7sQ9j7B8yBbjBQSOatQrsDuE
 Nc00fCR4JQapjqZQq9FEEmjY0CHGJ/Pe1gkzlOZGX4Fhbl5zEuhwdjkAMJ2kRn5R+31u
 l6f7oRF9ctiQzqax0AduYh8KrWHjsIEuH71+IIK6zJclNDO2m9QkvdEYHk/JflcppmTT
 X8wnhm3gKhPdoOhrZA9ktbsm6Yg734nbsAVoLNEgzxnRS/9guot1pxk7gh/zj25Eh4P/
 +rEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/cuj0IHR8NmfaGpflr8DJTlQ4+hoNDm6lP3XuWub6D7taEGt5j2fG3wWtRst9u2ESA/5uiJ49oZ0TBcNvgndk4ssaoOQ=
X-Gm-Message-State: AOJu0Yxm3R3itVbVl9tMfWGyqTX7h+0VrYfOYCIuZ1ZMAOdwnwfrtfKr
 yoDULk7cvIJdcpC4rfry6CdYRf+Z9qdjpX2ea5bN5aUaoFKuNWB8WAnALgZnOQs=
X-Google-Smtp-Source: AGHT+IGrW1WvAV7CGEKP3jIuTMxCbXh4eSRvs9djyfvLCiCC4NI739KLdE7MiF4C/Z4Da1o5Am7XiQ==
X-Received: by 2002:a17:903:22cb:b0:1f4:8372:db24 with SMTP id
 d9443c01a7336-1f63704b335mr33008705ad.38.1717177531741; 
 Fri, 31 May 2024 10:45:31 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63236ce6dsm19389875ad.95.2024.05.31.10.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 10:45:31 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH v2 4/6] target/riscv: Add check_probe_[read|write] helper
 functions
Date: Sat,  1 Jun 2024 01:44:51 +0800
Message-Id: <20240531174504.281461-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531174504.281461-1-max.chou@sifive.com>
References: <20240531174504.281461-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The helper_check_probe_[read|write] functions wrap the probe_pages
function to perform virtual address resolution for continuous vector
load/store instructions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/helper.h        |  4 ++++
 target/riscv/vector_helper.c | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index aaf68eadfb7..f4bc907e85f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1,6 +1,10 @@
 /* Exceptions */
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
+/* Probe page */
+DEF_HELPER_FLAGS_3(check_probe_read, TCG_CALL_NO_WG, void, env, tl, tl)
+DEF_HELPER_FLAGS_3(check_probe_write, TCG_CALL_NO_WG, void, env, tl, tl)
+
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cb7267c3217..9263ab26b19 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -136,6 +136,18 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
     }
 }
 
+void HELPER(check_probe_read)(CPURISCVState *env, target_ulong addr,
+                              target_ulong len)
+{
+    probe_pages(env, addr, len, GETPC(), MMU_DATA_LOAD);
+}
+
+void HELPER(check_probe_write)(CPURISCVState *env, target_ulong addr,
+                               target_ulong len)
+{
+    probe_pages(env, addr, len, GETPC(), MMU_DATA_STORE);
+}
+
 static inline void vext_set_elem_mask(void *v0, int index,
                                       uint8_t value)
 {
-- 
2.34.1


