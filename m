Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ADBC282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:02:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVER-000313-CN; Mon, 10 Mar 2025 00:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEJ-0002pf-Bn
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:08 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEH-0008Fl-LE
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2241053582dso53536415ad.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582744; x=1742187544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+faf/Iypy1sVhFNFInOCPAbXVKj8STEbMMwCdFMyRw=;
 b=ovCKNP9v024+gM0P/HHOGPI0VD1930U7Ycfp0GAZWknfo+rPit2pJhoyCBq3BP74DN
 S71l4d0kMgOO1uMJDfrsAg4F26bhaFnFiYrbfiiSex895/4i7iBBAkUySPYL2pDgJwxL
 B2o+QLclM2OS9yGYqUpBStG0uYc53z+O674YxKd23O21mk7m/kVDhCn7zO3d7nomE36y
 Z34Sc2K3JkWggtk6JKeYhsdftpMUVHk2ogHdsUNdQ16JTApkeFsqgAQWQPsKIhKm9M0b
 DQhXIPjeuox7xXH2idOYtoOlalRPiswJyVJPBnTYOk6+2refzcLj2NVRIu7inkkmcfEj
 C53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582744; x=1742187544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+faf/Iypy1sVhFNFInOCPAbXVKj8STEbMMwCdFMyRw=;
 b=SQRtzV4Mx5FZQAvlN445ninNLnmNvo165azQBEA0OmRlpdmxS+WdsxQdyYlMuoJVi1
 2XZH3Sxlr5AOcyJ3aEuptdp6cRDjVp9pWtVIJ3Q+n78+/uxUzuJQ4eBWIypeJkwLIiHN
 4nfOJhLEc9ypLXHzJnf05hyO5XzH/FGnFsMuP3mX52soOykG5jTpmClU0fx868geLYjN
 BWdyzDV73NMx+4ju2KOx0Xy98ooV4E4zMEV9GYLn8/VpgH60TwzMIVdv33TfGDuk4g4n
 ixM7kYEimz7JIV4dMluz8/ZsW3JZ5FASiy0U2a1VR18VVbjVxt9xReYlfsRlEhDRRIgi
 gTnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsdCZTFqy0gQa4OWoCe2z1yLPdJSfUzNo0SOqv+9SsXDJOGi0kfiyUvcJ5uxyWRwqHAMPWACGfUlIN@nongnu.org
X-Gm-Message-State: AOJu0YxSjXwi6XgyjrEcBeTnqYH7GeZJDXWreO4rYGlLyaEghJFLax3C
 NschWqJ6gU87lMkTrmU97u+PvvpIYlz6B8rPpZ1eZTdWV1W3SPX46YiygUE6QvA=
X-Gm-Gg: ASbGnctRrYOjFK5Si+BkNYCmDDpqGuVyGd9fMKzlqaLuvfdB4ZLAAE+CNE0KnOPDtc+
 mBrS7Ze1WzXUkx3Qm0jvk+7iCHfSI9iYAziBBYd/NVzbl16TuY0ia08z/yj0XdY3/SExQLbbIsG
 1+Ricw1+mD4eB7Nz6aC7MLAQ5p83a/+tXWBhZNhz012QRYD7FQaMBSixIHV0HqBvViG2r21IaxQ
 M8Tzbq5PreJetyTJLpAp25bnNPXwnGHyCUiAg1q6TPXE1TpKZMR79huufbDCNfXpSds01W2NQod
 R+59gywBsPCyar0WAysZdKzgPFXuYQR3V+ITBRAdIZ9Tiv4fuXWxTEo=
X-Google-Smtp-Source: AGHT+IHvC7npbpjr3DTdxoZwzYb1dM7G7lfM3pxuLeNMzVZpdYuqkJ12UM6z/Bptz/oCAInuSIhPSQ==
X-Received: by 2002:a05:6a20:a11f:b0:1f3:2d62:3151 with SMTP id
 adf61e73a8af0-1f544acc6camr22843444637.7.1741582744338; 
 Sun, 09 Mar 2025 21:59:04 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 12/16] exec/ram_addr: call xen_hvm_modified_memory only if xen
 is enabled
Date: Sun,  9 Mar 2025 21:58:38 -0700
Message-Id: <20250310045842.2650784-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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


