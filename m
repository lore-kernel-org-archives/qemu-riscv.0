Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F68DC2BA1B
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 19:59:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts5kz-0001uE-Dt; Tue, 11 Mar 2025 15:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5kA-000100-Dc
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts5k7-00007G-Qq
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 15:58:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ff69365e1dso8805854a91.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 12:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741723102; x=1742327902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=DLq9LjIUfvl1UuuHb1ssLHfev3HctsXHAQzKRGfwZgnqgB87YQUjvT9EPbn8eWRu4r
 /2r0R+znQejaeOsiEb0DTIUjv7AS1wYYkBl8Emcr3pznhG00I7/w2qQn7aD5TupJn3Jv
 lz82X+C9rw9ihF/+CpvnudfqzhxnpN5yZxE/S4W0E7Mu4oyQoqNCNxKku6RjYhcz5/JZ
 L3/erjpw9D4EeMzsGpdU5wTHQGEpH0fMdYZaBZ7vIm5e0Oz8HHCQFjjHJl6m5jPmUPj2
 tFRxDsulfK3gkXcfABepEtr2Ebny0cfTSbRKbfsE7SMin5AlrP72PDPA8DnhLK5rMsXG
 DPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741723102; x=1742327902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
 b=DvNS3oazNsr7RmHLAmP7MhxkwftA7XQ3tot46zG5Qrpk+wFVitZlgD68GDMassueFn
 ARVE1ZZjG+3I2E9REmNfZ03ak+R8D+Ip2JRZNyvwmeRIi4gpa8NVyTbxxvdIgNILk/2L
 v5RwuuLB2Tww62NlL3Idl0RyHseWRSrGgkZq4YRuIEQWAlpPJUVDfuE3C6Y/TAiuj5yG
 txS3GXb3RQ1XWOCm7WWl23lkEMUPUYvVnVlUApMkM6pEI/s1YbhjZaExkOroQES1Fo8u
 B0wbido3wpiarL3kKNapj94lzf6IrYnqhMpEf7iBOB/BJf7WHBBhf3bxtqngT/lHZ1uA
 V4Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZE16o3Bu8WGDy0e6N1el7JxNIr+MjK9dGlCXiq1xpNvnvjd3W+PMX2PNBSk7PoGQWmDbCBXnxe/Sc@nongnu.org
X-Gm-Message-State: AOJu0YxEoCJYt9wrOk8s2FzlE8w3IGc3csSoooP1v2ROv5d0UT+FqYJM
 g5KVtOwvHbI+EKtUloYcowOwVWZvQj6ISGGQr+7+/hHP6bxwKPQzrYHODBCzqcU=
X-Gm-Gg: ASbGncsxhJP4gVWi6omb8tiBZPzJgISy0ZFbvXg3XRWqbuLaDwBMtmSex37gW3GV1+P
 DU1RXPg0snAl+9R7KcjUCXxOvOU7oosb+8QV84ANoOhrhYKp5Xgsgi2HFiV7js7zJeRNzHBF5d7
 HstoooUHLbvU2OtS7pckMIibrTu9gByHGW/AGPR0Etv0QfeLpty+bE8WugS7bX/TxjYxzZDZAx5
 VM7Z/8G8ujNQ4M/GP7cQkV3ggVMv5c1O17XJIsxIeTtniaWtYpWxw97dDDMLxtphixSO1gFY/JL
 x4szwEBFSkQ/ZrOx0pUCFHK6GLfHrGwMi4K+MqHLd2De
X-Google-Smtp-Source: AGHT+IFuSUSQsgKDn+cb31pnjdNEblE2NjRflSuEeU68kg8s8JFfsQQJsGkDTEhj0ycbJp3/pjIRHA==
X-Received: by 2002:a05:6a20:6f90:b0:1f3:397d:86f1 with SMTP id
 adf61e73a8af0-1f544afa185mr29488018637.16.1741723102158; 
 Tue, 11 Mar 2025 12:58:22 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:21 -0700 (PDT)
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
Subject: [PATCH v3 10/17] system/kvm: make kvm_flush_coalesced_mmio_buffer()
 accessible for common code
Date: Tue, 11 Mar 2025 12:57:56 -0700
Message-Id: <20250311195803.4115788-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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

This function is used by system/physmem.c will be turn into common code
in next commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index ab17c09a551..21da3b8b052 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -210,11 +210,11 @@ bool kvm_arm_supports_user_irq(void);
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu.h"
-
 void kvm_flush_coalesced_mmio_buffer(void);
 
+#ifdef COMPILING_PER_TARGET
+#include "cpu.h"
+
 /**
  * kvm_update_guest_debug(): ensure KVM debug structures updated
  * @cs: the CPUState for this cpu
-- 
2.39.5


