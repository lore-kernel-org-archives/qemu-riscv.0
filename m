Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA29C0218A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:41:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNRy-0005u8-PQ; Mon, 27 Jan 2025 06:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRv-0005ro-Lc
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:40 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRt-0005Bk-DI
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so30015485e9.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977916; x=1738582716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7f2QljdpVMPmTAUUD5p1a6uYolSKMxu405BuJzc8Pcs=;
 b=oKJs2Y4BRLVBXO7RO9q3kikLt4emzO+aEZbg3kPOrJt4ZzFAOmCfBiq8lnaQH/Sj8l
 GMqbm2uDvra9aYRyzAo+u96orxevYpbvySEI4+4TQCmDBUmyrHWNNT99bN5KUc+5K9L9
 DBf0uodnqfaEKH4u9QaZCCYUHDE8vJC33d44/28ZpcNI04iVDPiVJw9RmLecXSqIlH7W
 Mptx49x9BCZI3Lv7ccF5pO7iKOtz5bWb2O+owSvmbzoU1VygGZ2Qi/vsjD54fmB/l70o
 6WvL/OaPWKXEdtNGr+7AOc+P39XwGoqlT59XPGCjni6cgVuvAZVzGYLEpmi2DXBaGsNe
 sZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977916; x=1738582716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7f2QljdpVMPmTAUUD5p1a6uYolSKMxu405BuJzc8Pcs=;
 b=ese8w/0S0MEjbyhMKL15cA6b2UtOqggKv8kLReTKpGQL9VBCmeSFZ3IIiqr+bqzZvy
 EHQQbmvyhDnrndWJ0o1fWJ38lDzpectLmpaRng7Y2MiMz8iYAcaHzplGEr6Zan7k5NlW
 s4E0gsy7pI4Fm9WZ3dpnFnUwD2x0q9UuKh+K7n3d1j/swdP3h/69EWMyaXFQdCgszTGn
 Ro/BCqfvJSupCSFgZZS4czl7KnkibiMzph4TV0Qnr18XFfzI/yMTe/wPs0IeETHrTN6/
 u8m+ZTB65wDCDdMs/Gu1rNTfJCj+eLUO8+q7OsNTUbhFMWHpJhvqNBVeStcIPuceAt4Y
 fGpQ==
X-Gm-Message-State: AOJu0Ywa40wVukECIc/HP5e6pGupyJwFFJjkzfVhakJCnyaIYJfUjkVQ
 rNfkurXTKItRS4fmSsfoLZ1wqjXISEQ4MDigwMHeL/Zh1YIuGw4Wkif1cnGM4Z0=
X-Gm-Gg: ASbGncvG7AiyNIHnvZaQuMAqO/rck78JoytXlSqNCJtMnMcZ3hOtJawQVWza6y5mV9P
 iOMIFMSXGKbFx70U3gP+OKLByO+MnBpXW4TNaXdyXwU9PFx3PQD6aZH+oWq6aDOkPa+f2W5JNbv
 wxJCXmSuDhQzoi8Ns+bij3xk8J7zC5bZsWZ4Gy9hCbucZf9Yz4Tb+GC9G+rAfCZYDKdhHmhu6ue
 W0oWvOXbXL/0svSsikk7sESwbTYsIh88bQi3s5ECPE6kBSolWZT3FS6REACmOIPvYxqxiQb6L3c
 /kH2qEI9ntK0SZHiMiknZU49Qy9TuD2Ibnpe3L6rNzBXIoc2mwEU1Gw=
X-Google-Smtp-Source: AGHT+IHP/XZhG+paG3G1tUESXqsYgRbwJsBrVWSjZpjPjsQ3s4qI1hHl0UzfsLh5Zw4hOKYDMNjnHw==
X-Received: by 2002:a05:600c:1f86:b0:436:aaf:7eb9 with SMTP id
 5b1f17b1804b1-43891439d5fmr325139905e9.20.1737977915930; 
 Mon, 27 Jan 2025 03:38:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd573245sm129066725e9.33.2025.01.27.03.38.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] hw/loader: Remove unused load_elf_ram()
Date: Mon, 27 Jan 2025 12:38:20 +0100
Message-ID: <20250127113824.50177-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Last use of load_elf_ram() was removed in commit 188e255bf8e
("hw/s390x: Remove the possibility to load the s390-netboot.img
binary"), remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/loader.h | 14 +-------------
 hw/core/loader.c    | 16 +---------------
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 8985046be40..9bb34e6f062 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -155,20 +155,8 @@ ssize_t load_elf_ram_sym(const char *filename,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
 
-/** load_elf_ram:
- * Same as load_elf_ram_sym(), but doesn't allow the caller to specify a
- * symbol callback function
- */
-ssize_t load_elf_ram(const char *filename,
-                     uint64_t (*elf_note_fn)(void *, void *, bool),
-                     uint64_t (*translate_fn)(void *, uint64_t),
-                     void *translate_opaque, uint64_t *pentry,
-                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
-                     int big_endian, int elf_machine, int clear_lsb,
-                     int data_swab, AddressSpace *as, bool load_rom);
-
 /** load_elf_as:
- * Same as load_elf_ram(), but always loads the elf as ROM
+ * Same as load_elf_ram_sym(), but always loads the elf as ROM
  */
 ssize_t load_elf_as(const char *filename,
                     uint64_t (*elf_note_fn)(void *, void *, bool),
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 4dfdb027eee..ead10fb6cb5 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -425,26 +425,12 @@ ssize_t load_elf_as(const char *filename,
                     uint64_t *highaddr, uint32_t *pflags, int big_endian,
                     int elf_machine, int clear_lsb, int data_swab,
                     AddressSpace *as)
-{
-    return load_elf_ram(filename, elf_note_fn, translate_fn, translate_opaque,
-                        pentry, lowaddr, highaddr, pflags, big_endian,
-                        elf_machine, clear_lsb, data_swab, as, true);
-}
-
-/* return < 0 if error, otherwise the number of bytes loaded in memory */
-ssize_t load_elf_ram(const char *filename,
-                     uint64_t (*elf_note_fn)(void *, void *, bool),
-                     uint64_t (*translate_fn)(void *, uint64_t),
-                     void *translate_opaque, uint64_t *pentry,
-                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
-                     int big_endian, int elf_machine, int clear_lsb,
-                     int data_swab, AddressSpace *as, bool load_rom)
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
                             pentry, lowaddr, highaddr, pflags, big_endian,
                             elf_machine, clear_lsb, data_swab, as,
-                            load_rom, NULL);
+                            true, NULL);
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
-- 
2.47.1


