Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B7AC282DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:40:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslb9-0003q7-Hc; Thu, 13 Mar 2025 12:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslam-0003Tj-IH
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:32 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaj-0005ia-8j
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2239aa5da08so24790835ad.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883967; x=1742488767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
 b=oRlwnokKkUS/RnC1aoRrUA+5LFVFYqVMcbbVLireM7la7Ouan2CCM2WiqiGLmYHCNm
 bGUkCV0Bapwy8R1X5LkzYsP349K2iX5ZWY2dbx3L1cZMs/oGI2gwQylYPB2TfQZ+QCsF
 MdenshsuUkXBCXpR6u4FAfY5t6cnfUkeKuPXK1KVL0KZc8vEybyWP9Z7KpQVxaBcfQj7
 HAde/VibFDgS02RvNQ7n36jrEuoXaTWRni05vSH9LzINRl3DOPlUzat+MRMpHR9RhexW
 00We65fwgRZfphabF5crJQhf3zVRWpjORbs1W4DKHcCTLKDfrLjnP5HNJTIf0lzTVBRq
 SBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883967; x=1742488767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0vI16NHb2tKWbIxjnq/SoVUTdY/Lep770BkCc47k0Rc=;
 b=jJ8LjhKSsK/4NsKqD15t/b+rUUK1S3oEVMCYj6XuvbKiXAo2NRcE9miKLnwIdM6VtY
 vGoBCO8fCtLqRmJ5CyIweNMVN1ReaoRQpCb/F6rAnYvuW3thEM8BXLHvmLp8E+Jr7L5v
 XI8Ix1vMJNQGEZc4jfr2zMpU0T3fd3eHrlBRH4RQClpeIsFO9ic3p1+TsGE5/57YXNia
 KM7wsIXUHClPD1NbqDawRutc42oQENMOMWYyMD21I9yXRASJEL4WLVyMQ4uiLI/VyIS5
 m+OdTtozFM65/XA/aaW9JAL2cdm9EH4rF99hiYOF6ocu+r8hBvpJzSLGlEerQSfYzR6C
 1faw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcuoF19RWIo23xseGGEH+o3+SZdnnIyCv1EKiP6RDl0BZVcYsEzJvfV9AGRSsCLNhv1vhQG6Dx5Ja/@nongnu.org
X-Gm-Message-State: AOJu0YzwzkggpgvYM+D2cp/iSCnSL8e/qF4avACEb8QAPl3kzllD19JA
 Ga9MhQPFnyCsgh74KWNmYtGeE7Y1RCTASZ3RTxwwDU5W9sweMoPIXlSNxob3vzg=
X-Gm-Gg: ASbGncvOLjTwRgctxfiD5pGS0KB3wH51IWfwP88KmlRIypF1gRThin2A/wZI/3nS3wD
 H95x+qw/aRs+B12nGK8nhTKuMIwtFqv1KZN7sjHwxUw2fUYL1I1yHvjrhDdAzQoFLcbeo2xJxGN
 BG3s+grhQuoZ+uCHR5rrIkzRPd8MZ0RfzZoTUIRifiNWGN68m7hV1lM4WHtadin/gIq/xuqaMil
 p5dBnLHRZpna/scWEeexEQ/V1uuPDvDWowtLV2yZvH7YPJrh8mhlICNaN6RxP/kR5nVJqNhX6e6
 Psud+KSrUsyeEKHdb/TiBedrLGPs6EI8BNxQSBViQmiSrtIUovESu00=
X-Google-Smtp-Source: AGHT+IFcq5bUjsmA5zzk8huR+izs7UMfjfhsI/1Y2larg5eumFEccAwXse4tJs4zAbzQaGCcQS+wlQ==
X-Received: by 2002:a17:902:cecd:b0:220:e924:99dd with SMTP id
 d9443c01a7336-225dd8b9922mr2731115ad.34.1741883967572; 
 Thu, 13 Mar 2025 09:39:27 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:27 -0700 (PDT)
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
Subject: [PATCH v4 14/17] include/exec/memory: extract devend_big_endian from
 devend_memop
Date: Thu, 13 Mar 2025 09:39:00 -0700
Message-Id: <20250313163903.1738581-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


