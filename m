Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768F2C28B2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqy5-00063A-U2; Tue, 11 Mar 2025 00:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvc-0003QI-2d
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvW-0006VH-O7
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:15 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so94536995ad.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666149; x=1742270949; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9PU2mUUZXceFgFF8NURkIZqXSTxuLUTW3yG3F37dHQ=;
 b=HplIzsYFheD7G2bIbHaHKjetAU4JyioxlWzenrbz2kE2GUDihxdPnRjFFmAZ4pdZd5
 ziXWXaTPSZKXSCVKU0+yb2YokCyzbQsEnXP14UbroY/hypYSSTjf4GAHmZKyliq/FLZf
 ZCyjyZgI8gjWom/pFle53hrbAWe+WNqXwZQYllToYT29ThYt7BhfKQ0KUz4edxypOdXq
 VmGr++FrgtV7hJsGeuMPmsr5Nzx7v0qxYmwtQEoPKVB3t6zuNFvvd2MLXTSW8eEzwzdE
 5PIUAfGSZPravGwnQnqmD2HgcmKdMMPVGwMHeYg9vAPRePDimGSq+bvwFqD9YWW7QSLk
 LQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666149; x=1742270949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9PU2mUUZXceFgFF8NURkIZqXSTxuLUTW3yG3F37dHQ=;
 b=Q43Keer6JywOOAaJsHzR749bNWJv4gYrTIF3UAiNoHC+tlsdrX99pmmHs2ILlzzNwO
 y5bbA3jn7Jcx727++MsqzMnq2yHZ2Y9NrbG2JxiVihO6f486rPTN9n0bSci/9VA2DAAw
 vkjHD1F720t5oNedDY3kaoptpCzOQPnRs3TLzE8o1PZmR6glhYtuv7rhzq+q0J5kARFq
 vTbmhcm9jQEaZcE0MHX3HAMJgKcRaKnEASsEu+dbej/6SIWs8kGNM/OMyK+bTNLlG2tA
 GrvmiR/nOf38Xm64Q4aZ9t0T9BxMVoeJoIVmHEn+1+QNL6a4axK441REUQD53ZFxET+3
 H85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+IitNTWJHdOFtSYBPar9N2fHU3mYl3CTsuJx5xE7gUEyKu5yS9tHXAwIGEzC2TOIYexGqnHS05dMn@nongnu.org
X-Gm-Message-State: AOJu0YzpmU4FCL+yA4euxXBKxS6XxR1321cGL7btgCHGZDcUkQwDO2e0
 OKV7ffKvNY4hNu5toq8gCqIq/4TQhRMqapTVpgBgp6mYS39fazeJZeNANrAN/d8=
X-Gm-Gg: ASbGncuFNJDnCiDf8+L46mqAiwUXiC/nUZZ9hV8csuHw4aFiMZLclIpYOpP6ztn64zw
 d9SYAJffzkCYDECShcnEZY4/cGzcFLgk/Ug8kAk+vD3hT0PqRQiAyy4Wro0dk8h4E8DMzk6brkq
 /qnr7ZSGhdaQH7Nd8++hSuvhxzuLH0hQ1o8RGU38ittVz5TIdYb7vMq7uvckmFgYV2aSmghk58a
 ybCrcfYLF1XN8YfxgMNn9WHQNiSIwhgjDqMBBK9rkd2I7ou709dQRTp1YfyNCkNMfkLZd5pAkCJ
 e9O/2icNQX4sfoIxMJbmdHi8UTqYc7oSDfmjhKAVOqo8kn38KuvCOzE=
X-Google-Smtp-Source: AGHT+IFhjhUd2vTxqYR3Z5nzc5K52WwhbsgB0wgjWXiu+XeofP+aLrA4dkvuyGbgnmdnOjVQzIEANg==
X-Received: by 2002:a05:6a20:160c:b0:1f5:75a9:5257 with SMTP id
 adf61e73a8af0-1f58cb1ba63mr3462589637.13.1741666149439; 
 Mon, 10 Mar 2025 21:09:09 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:09 -0700 (PDT)
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
Subject: [PATCH v2 11/16] exec/ram_addr: call xen_hvm_modified_memory only if
 xen is enabled
Date: Mon, 10 Mar 2025 21:08:33 -0700
Message-Id: <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 7c011fadd11..098fccb5835 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -342,7 +342,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         }
     }
 
-    xen_hvm_modified_memory(start, length);
+    if (xen_enabled()) {
+        xen_hvm_modified_memory(start, length);
+    }
 }
 
 #if !defined(_WIN32)
@@ -418,7 +420,9 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
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


