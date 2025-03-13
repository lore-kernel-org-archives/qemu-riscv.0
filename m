Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37634C282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslbA-0003rb-15; Thu, 13 Mar 2025 12:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaj-0003R0-IY
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaf-0005gX-ES
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:27 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2f9b9c0088fso2395543a91.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883964; x=1742488764; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
 b=mYyO1/Gls8yHb41wPGQHOQOnIV6qHxdc7eBa+kPErKNia0uM/zvGYWISkf006JCcQB
 YoV9H38a+3rXR2Ib8Eehv23x5+RkZ/l71moIptDbn88UpQuBkGjCEHHEbZHW+PgwQG7s
 LBHux0wV59iXUSfD3XDhgp7niaIE0Cnx+4SKxL8hxM0eC0Bank/97NaN4AvDYV4v4Q/h
 LD1d0r9Tyq22V9pFB2Gt01pyEiDNv8kk3ycrZasmpYnz+FjyZQj56h8d1umCe8AaAoYo
 YPLttiluZ+TI4y7WeRWCsHPqATAENFGtACWG/xMV2g8K9NwSWIbeUZJPhiauUKxw40rn
 uQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883964; x=1742488764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PABH8iZPN9WF+wJr72ZMp6Lm7i1C+9jWBJAvssLik90=;
 b=n8TnInx64B6axfVzqbJMEcDuzXn+GAq7JkBAp8QFOksUemoFMMNdeJexmJ9jqTHM5m
 7n+JCkng7RKv1j37BB6KI2GOHF4XnA3WxgXq8BBq4pJz2iIA21abRstsXc/AORC9m1Dh
 /7E6AAJss250fopd3nsqAKXFin1a3KzdJohNnOX4haPVmv/D42tMMrZFA39uYcnxjQKL
 n9CYT9kmxgQgGQi4jw1S+gPjQ+EPrl5hfzhlxGmfXNWUex6u+n9Uk53joUwTYu1Jv4h1
 f5K9m8DbE1PvSOZsh8mgcUj/MRLtqFojC+pRyJ/+hlFS1zxtpLCNOxoGFOI8FKEuBFcJ
 pQXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6XTNLyA0o1jqiAKGslM0BX0eESEigMMH0JYrkupJjsx4cGOfNVebqUTiK4iZCP0WnwbugEGUkm/Gc@nongnu.org
X-Gm-Message-State: AOJu0Yz4vecqdhi3W2+YhZHH5ud8qxqds/G02l5o+LSrO4Al55m5QhFb
 24ZSLI/ANjNnwuZtImIg0N7svke3NxPcTxQRlYK69J3ghMRAb2No/LtYdNnrRUY=
X-Gm-Gg: ASbGnct4LgA9cGVLalSBWcPn67Lt0r6Rq3EdpQhwkAJFXHpJE9xo7Uoi00/S9+A85CP
 CNGdB4Gg/XU92Xo+d2jhYvgDi+Z0Y3viLWJu9z0o5CLM4us+Dk6l5OOLq+SWEe4xNSfeWEerY5T
 XJ/zM35MjWvezswo6BtPEYufJY9MGqz2mXLh+milHJKsgsDWSZSqefey3jGtMbiuhyatJF46D9r
 jAU2S8JPpuYcB6Y1Etmip2bEVks0s5XgDFFvRyPTCox6iqXjvnFnFI8n8ZiYBouZslZkIlJq0dh
 0LodOQlyY7WZ84yqeH4neVY41W5uJzXTtzt3i0q1RVY7g+KXLUX4cqA=
X-Google-Smtp-Source: AGHT+IFBCzdx2RE2XSuvFzfGvZFs1Ld7NKM4NGPSUQ/nU1Uh9fZ+kP54v1OAyBR0HlgDCGZ75ow8Ew==
X-Received: by 2002:a17:90b:2f0d:b0:2ee:9661:eafb with SMTP id
 98e67ed59e1d1-30135ed493amr4421602a91.12.1741883964075; 
 Thu, 13 Mar 2025 09:39:24 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 11/17] exec/ram_addr: call xen_hvm_modified_memory only if
 xen is enabled
Date: Thu, 13 Mar 2025 09:38:57 -0700
Message-Id: <20250313163903.1738581-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1034.google.com
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


