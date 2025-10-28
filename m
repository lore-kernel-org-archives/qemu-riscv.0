Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBD7CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:24:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoN6-0008HS-Ne; Tue, 28 Oct 2025 14:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoN3-0008D0-0N
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:24:37 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoN0-0002zX-1B
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:24:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso79787895e9.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675870; x=1762280670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bb8ct1msdop66cfNc5jZbjnVVPLBi3asYT3AOca3j1U=;
 b=nFVDC9ORWdMuMwYyt+KPwMjVwQ6c46l6pCu+M7fUW0/dkIuwxKhwa16anwWBBbVAHK
 zf9SN/k/Tw/ZOLwtUPOlmjK8kkwBBE7kZ1m0DnjQXEjjAud8CwNyhGoGSFYiWxd3Eh4a
 Gc1eDdXSAb66vvT6xd/FzZN5FVijLinkgg7b1fZ6n+3OUNgFUjWs5sZGiBBkr0hXt3o5
 t3229y8OKIFbPNFYtu0Hbt7gjZmVLbkBBBiqiRca8N5hJO/17rK1wwKDZk1Dx4dJ38AY
 9/mgVMnmxrwUn2S/AP624bMi8PfOwnaX4BDXXVVg1zVyITJsXA0TL3qjLmcscWoqJtyJ
 rDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675870; x=1762280670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bb8ct1msdop66cfNc5jZbjnVVPLBi3asYT3AOca3j1U=;
 b=B06zM1horulbaDIXgMSVoZHinLsCPFDL/Ds7mXaCEwTdOj+fIjpvVua4UI2Xg6KTY+
 rqZKMOIVYw+Rw9hXEPTb8mvHnQ+Vnzw5VS5z705HNWRmUKgoWI3AyS1dYsdnF9UibYON
 FWUcYKn0doKJHxMxpmCmMVvOpuEyiwLs09RMJMxpEEC7gKzlLzhtSt8J0LvktfxzTAoD
 KWCv4VseWwRczeOH1Env8RfSBON0gMJcOs2YJFEUdVeO7aVwByAxwqoJDYSp6g5TOy/S
 jGHKM8/sNOtstQWXmScAF89p0D1rqbcEt7AbXbmOReQY0wQ3VI5EI+pAbuSMeooDAgBI
 IzYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8hiAmpasFycONb7vMU5uXoGoXV7vmgoMw5K0vJf8pZPpw3i5fBlWa6jRo199nuYA+aLWMvUrlzUay@nongnu.org
X-Gm-Message-State: AOJu0YwSWXv6xnb/677ChHi4vD5/hSiiSyLAsuCfG81uSmnDGLHbhkSt
 41cohQq2p/R2KqStNOvdXg18efuqaGmy0JF8gjiy8mURRPSmye+BYpYDMRseswR/k24=
X-Gm-Gg: ASbGnct+Rrnc9tadl9HL3xuaEeFc3z76HWVb+veQzSghjF0vO4nX7M+ei1AZIL20FZ/
 du8rIeYx5LVtmOma4xqDEaLffIZk7w7KD7mMLBgAUCVoZBunrhophw5ZzETXxAKHkHwY2cb8pBb
 fI8dvwt2hw+DCqXq/jcTByFnVc2WDnM/HJBx/mUC1u+DPKIsksLmnd6wIIjfMsjz6qrn/BP6hlh
 znw3kz4yOiFQXr8D99m77Lr6wQEIkki4WFQ6pPjzcI/YHZVjIu6fcfOEVwVju/bUPjcfoJDdr4L
 g4WLDU4y9QgIYkoJcYv0seFtRJFI3dlLw9PQWn6TSKKoZ6slK6XkXo+NOBtXGFs9ZRQUltUjwJ/
 gh2mCBQJPZsZDkm73IjWsm2Iug9efSoBua/gkiQRoJKvB6MG3pteurH02LKgHE+fU7acWrOGrqr
 So1GWzn8PirnZ5lQBPmKMG812TfLOmOH4HxcX27DBecLY6DzEjvA==
X-Google-Smtp-Source: AGHT+IHGtrcGFoBqbOWM/Z4ZKtNkpIoAicr60V8rp7HbelNRNEGwujVNu0ILye4Zuu0pu6nn0bXufg==
X-Received: by 2002:a05:6000:2507:b0:3eb:d906:e553 with SMTP id
 ffacd0b85a97d-429aefda844mr13371f8f.55.1761675870517; 
 Tue, 28 Oct 2025 11:24:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da645sm20772209f8f.30.2025.10.28.11.24.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:24:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 11/25] system/memory: Introduce memory_region_get_address()
Date: Tue, 28 Oct 2025 19:12:45 +0100
Message-ID: <20251028181300.41475-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

MemoryRegion::addr is private data of MemoryRegion.
Introduce memory_region_get_address() to get it,
similar to memory_region_set_address() to set it.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h | 7 +++++++
 system/memory.c         | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/system/memory.h b/include/system/memory.h
index 45de6946812..d2a5850a360 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2481,6 +2481,13 @@ void memory_region_set_enabled(MemoryRegion *mr, bool enabled);
  */
 void memory_region_set_address(MemoryRegion *mr, hwaddr addr);
 
+/**
+ * memory_region_get_address: Get the base address of a memory region
+ *
+ * @mr: the region to be queried
+ */
+hwaddr memory_region_get_address(const MemoryRegion *mr);
+
 /*
  * memory_region_set_size: dynamically update the size of a region.
  *
diff --git a/system/memory.c b/system/memory.c
index d1c060b2b50..f48b586122d 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -2777,6 +2777,11 @@ void memory_region_set_address(MemoryRegion *mr, hwaddr addr)
     }
 }
 
+hwaddr memory_region_get_address(const MemoryRegion *mr)
+{
+    return mr->addr;
+}
+
 void memory_region_set_alias_offset(MemoryRegion *mr, hwaddr offset)
 {
     assert(mr->alias);
-- 
2.51.0


