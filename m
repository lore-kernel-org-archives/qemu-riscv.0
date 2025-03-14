Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F284C35FF1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 17:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt8ty-00069T-Li; Fri, 14 Mar 2025 13:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tF-0005fA-AO
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tt8tA-0008Gw-9D
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 13:32:07 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2232aead377so53469865ad.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 10:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741973518; x=1742578318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
 b=RigcekInGiGOc5YBWHVAb7RUpSErD0BgiyvMOpduGne9YVutA9AXx6IkvO4qmIb1+z
 R8ScThTT+KIO7cJrAeEhpojkUWNTA5ezfgWvBgU1WUspo8kjXKWcO/OhPMaUTub3GTA1
 2aw9jSYKWpp/kSjHfEKwrsouLQoLoHLycqTiYdjbkPG951OBpBXGCdNuQtQduIQuOjxA
 pZ0aL7clQO8h2W1CTPv4UZm6tFeOcwvquV9kd0gVXtCuaGSX9e1E+iIGXHmICHphEza7
 sCTiVPs5R6G5YK8ozHNw1WcRXAUDE2UrbGpRgJKt++vTqHWiStwuTmnS5JuQ+8N3WQSk
 sRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741973518; x=1742578318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
 b=GFPiPThlfi9yajDYrej3gluOP9rXZqzfpZSqXM3DmTLNBgOrUOogwt+TDORKeqUXId
 vpjUvErllHzz8pba/+2FSC6fUFqtruex6ESMZUh8qICoubYo5gzh8QR1P0T+phsjRZNE
 3P3YXB0UNngYCQ9P6D1vG0hX5VcbWcPKJq6UOhj5fGATOlCS6QNsJofi1v+hGG5aQWWx
 4kX09UFKGENTqQJUf41UUJSUfU83v52iMZYz2gHs9My9wR6aQfM+I5tC/f1SIOJdll8+
 dJuxvyG47YqY+kNHpziv8oOx7jlg+4ekAkqZ0skzEAAGq4oK6DTpyRpPAZnWlzq4baNq
 tcYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw/fUUU6R5JtnLiTx0HW+9wtPMlqAPuMDtFu/E/LjPAkPYy8mZ5Yl4VVWHPqeEExXdpW9e/7ertzr4@nongnu.org
X-Gm-Message-State: AOJu0Yw7vMACZVkKCK0qntnFMfMtDUp1MC1wGskL6MP2/xHQ2J5vuDbz
 Xm2ZCYaXp5RtiwWKw2axSNcH7jzNwqVN9FxbazIx49oWvMn3KXTc3JGmM5pUYo0=
X-Gm-Gg: ASbGnct3qxJ3SWne3Bcl2vQ2I/neMybpJdfEdOG1L6L8fFJOwtWP9G1SNKAMWYQtTPh
 YYILxYx4s+rBG0TFz0+2utpMmVzDhzaQZRqZS7GBaJM3gSuPMNCSefSeYwjpQTdI0h0U/HLEijp
 yaXnW4ixH5Hkefijs398Wk65OVreUaHXl6M2ZYOE37JkTDzWrPqwRmewR+LqmeCcJiEasxEDFvJ
 8vjhcWeTuhr6ibKqrCTvHoac5zYrHsDq0TS5r7qsaRwvExBJVzhlpleBtBLUHA4k3LyQjKBdKZb
 oejza6n4NuwhwH8Ks9VREjAfMRjOR5chFv5vhHI3vTSH
X-Google-Smtp-Source: AGHT+IGnTvSqXO1fzlE+2xVmojsF7Bo5wJQ+q4TppfmkSKTjR2FsyvyfU5Ot+87AVkRJkvXuDcvBmA==
X-Received: by 2002:a05:6a00:228e:b0:736:562b:9a9c with SMTP id
 d2e1a72fcca58-7372242d387mr4348766b3a.18.1741973517785; 
 Fri, 14 Mar 2025 10:31:57 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:57 -0700 (PDT)
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
Subject: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only if
 xen is enabled
Date: Fri, 14 Mar 2025 10:31:33 -0700
Message-Id: <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f5d574261a3..92e8708af76 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -339,7 +339,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -415,7 +417,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
             }
         }
 
-        xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        if (xen_enabled()) {
+            xen_hvm_modified_memory(start, pages << TARGET_PAGE_BITS);
+        }
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-- 
2.39.5


