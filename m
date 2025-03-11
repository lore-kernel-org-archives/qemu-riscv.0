Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9846C28B2F
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 20:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts5ln-0004X6-O5; Tue, 11 Mar 2025 16:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5kO-00014G-4g
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:41 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5kH-00009m-Cf
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:36 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-224191d92e4so104660315ad.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 12:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741723107; x=1742327907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
 b=Crv3UZaW/GimI91WYuRikjJuiPd3ufM4fJRv3G1tj7YLRkwf5JGMzm4ynzquaLvueN
 MnsFFEVw8oBFKzNi22RuqyLxHcrCPRbkmRBXf2ZWYWeipyt+Wn5oh+xNdp236KTnADxj
 v9s/sDyojhI/ig1P84V3zLCjjWrDwZbeD7g/CiP37KqGTpDPdf2eMbvgXzlQgA9Hknjt
 BJh+HdOjeW9Nbh5Y8JylQvoKhgnXIYap//4rVuXm3fb1QEPo7JuHM8poCA/Rr/3YzctE
 6IqlSl6lLEIHBC3G8NbJnf29F8MdVtGula/zgHmdfYVqEPpDkGv3wcu+f5vEXs8ir9aT
 jsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723107; x=1742327907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
 b=XeYGx+gFTFR9A1jF/uMm8i67dIntjnhScffWAD3tkYqX+gT4VKJMjttnkf6boJ18za
 A8stSmAW2tZKHmIf+zBODYsFbndv2DQ9IRWKWeRoSXGx0EgqxO1JDPMmoGIE1BnLwre4
 /y6HVfzQ4hEyQQZG0s2pItHxEd8UfedFaMUcuV1t/oiQGVPHu0NyeYRktGxZEeStr8OV
 RX2sT96bM0ElNhIq4U7BYTHEuezVhfXP10bg6XO5mI4kpJcqF2vjFuRf+vbWREOydttG
 I3KXyZTd6s8i7m4BVsKbYwsj5L9j9lyVmqXJ5e5jaBjg7zczQM/SNsjgJT3StpOZ+sYd
 FdSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsmNrb1Vye5DU6MtKEqTkd6Y/+LuwWbsKyY+/aXBH/F7ShsP9KfjPCvnL/fkCYhzba0QWgsqust7qv@nongnu.org
X-Gm-Message-State: AOJu0YzEAZ9ZTOlfdtc5/h2akgxOd0uWKgWk4vaz7EEgVYeg5PQWvPB2
 gvdIja7d4q5vFBTakw1v/duuQ1fQxUQqB5fum64c4z8TuECsy56MlrHtzogzWsU=
X-Gm-Gg: ASbGncubHFlX9FKTl5USmthIcV37OUxxpVRf7v1BiNQYx+keYuAPJFvUEBZM2vzpIa1
 RDlarEpKulqpYyq2W+QH+22gx7E7JVHkujieOiuoQqX6knL/oT1U63diwqDt5LmEAH9GVYCSMwH
 7Q1HCsKoP1s/ErPM2hAWdA9l2XlaLzUJp/PzaJo5PxGaci+KLGdsZFbTDbjolajrl5SIyHWzTUE
 /4qZK8n0iD236kaCm6xrqe10IPoJ7f6+3/i14IyoHw4NkvCq9Yhb4y6fkV1oWPlTtZ3TqrbCv4y
 tkZVq1vlUFB76zJfg0zM3xHmQkRvnxhEskTG/zoY4B9u
X-Google-Smtp-Source: AGHT+IH4DZQtwoxJlYICmsHBrM9aJbv4mOOcZipSBsnLFw41tHWuGL9LYWyAZtn5lP/0QysRh7Mo8Q==
X-Received: by 2002:a05:6a00:928b:b0:736:5dc6:a14b with SMTP id
 d2e1a72fcca58-736aaa1ace3mr27769096b3a.13.1741723106807; 
 Tue, 11 Mar 2025 12:58:26 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 manos.pitsidianakis@linaro.org, Peter Xu <peterx@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 14/17] include/exec/memory: extract devend_big_endian from
 devend_memop
Date: Tue, 11 Mar 2025 12:58:00 -0700
Message-Id: <20250311195803.4115788-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

we'll use it in system/memory.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 069021ac3ff..70177304a92 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
 MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
                               uint8_t c, hwaddr len, MemTxAttrs attrs);
 
-/* enum device_endian to MemOp.  */
-static inline MemOp devend_memop(enum device_endian end)
+/* returns true if end is big endian. */
+static inline bool devend_big_endian(enum device_endian end)
 {
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
-                       ? target_words_bigendian()
-                       : end == DEVICE_BIG_ENDIAN);
-    return big_endian ? MO_BE : MO_LE;
+    if (end == DEVICE_NATIVE_ENDIAN) {
+        return target_words_bigendian();
+    }
+    return end == DEVICE_BIG_ENDIAN;
+}
+
+/* enum device_endian to MemOp.  */
+static inline MemOp devend_memop(enum device_endian end)
+{
+    return devend_big_endian(end) ? MO_BE : MO_LE;
 }
 
 /*
-- 
2.39.5


