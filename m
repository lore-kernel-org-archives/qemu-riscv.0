Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BA5CA0EED
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 13:57:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1upSDd-00068Z-P0; Fri, 22 Aug 2025 09:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1H-0005Y0-WE
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 05:25:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1F-00077R-Iv
 for qemu-riscv@nongnu.org; Fri, 22 Aug 2025 05:25:11 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b471737b347so1224460a12.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Aug 2025 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854707; x=1756459507;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCby+eLrg4GAHoTlGaZ+HvxqNUEpTOhGwkTAgVF2XVQ=;
 b=smxz4qOjekaPlYatmjCZX2+1yw+qAm94ZfmUiUPcX/WHVhSgyqKf+by/sMgJkBSeCv
 U+qp4xqfXgCTmXQix+L592Zlb2LwcJDwiUOEdJQ3gcT8FG/sO2ha/7wWxrzEkrQr5f23
 UP+riUrwkxrJLTE1ubbrHwhEZX2LssEd22KLjP24bJmpVjmYvFm1lLCuvKbJamoOirF/
 xLoAbWg4HTQJ8fIShFRkQ7tZhn7OCQeeJPc5LofnQFD9g+uEejzPZaW/kk30zO5E504/
 5dWyQ8RXMo0wVN7IJ0sNrddkST75BpW529zgk41lAfBths9vOMPpWQZbyRmIe3BpKrUE
 7fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854707; x=1756459507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCby+eLrg4GAHoTlGaZ+HvxqNUEpTOhGwkTAgVF2XVQ=;
 b=P11i9h+iqJ3Yl+QpunPFK97AWS9hPhn+jI6ibfrVTv82tjlAdnEH9BR0AlFtvR9dFx
 TEAsrn6mArLKTelAnPg9Hd8o7duZnPmc5Zdprr/giGCiPE2VMcRamg7CbVdHqSlKp3aX
 dsvSN3974GDJ8RpPDs1uosrzk2HVYgk+NiAMBVG8YGHxJmzwhw5DdiNSDq3Di6BF2ioo
 ReRHyH1/pk0jI8Nh4qO03crlFyUxsU6ciQc0pQWaDx0mW6Y/ks2b7huFQda9fJ0TIYg1
 n6gRTkT2KMG2xHGy5InMI45kADEV7J2XX4boQdwiAcEgRtlrNLMPrszxFy1UqGT5RC5P
 cXFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOq7em2iLYrvhAKEOQJG1O2RAt7mIcgroX7XRhcrg4J+9OTI5sI1tRJcOIdZQN1gIVzzeRgqaI5rK5@nongnu.org
X-Gm-Message-State: AOJu0YyU00AV9uWFt2nHn4mI5XTHfc/2CifjqNPlHtqFAZc2vbbzH5k4
 KwjHTu2w0xshOmoIEZvCOXqxVibb4XzmqRBWVZOE8cWJEr/iwq7u8gRgfBjnAiQwTAQ=
X-Gm-Gg: ASbGncuKtDLiTz7v+gZdg2JT3XyCuVLMF6w3+3rUfLaqH5oYiAm5tTvDjIk/bjDSaKj
 lFrY/nrBal1mNAPXgnfVgDZX2FRZfc5yocDT/BZS9pR1RN+QQYByhZ10DjpaoQbYdJpGu4Hfy1N
 kZ75cmT0278uVAUkvgVQkKHq8TFEXynTydZKfWisvRtn3q0kb/q26pmjYX0bWPuH5Auo6b/3r0W
 b4EHoZiXvVcDWULvrl1W7fjxemTFvN1B1pcvB5DApk5jEvQEgLkxU40VXAZMSnXIKJr6e7KUr7Q
 8WXomCjjsZgnBNe2RBUIKf3TM+5iIlS2EHRYvnXM2NK6ZA8JXDQ5c25QVks1xzP3j96VTlU+0g7
 L1jJNpNVNzQ6++958xbmHBP9MHRsrb2tpHHkEMaXOwQ==
X-Google-Smtp-Source: AGHT+IF0Xwuu5LZYmRduWk25dRQ4N23vj9IjGYBGoJ9IRke8ciqE9vsRzsdrjU7wgvFYWKAZPSqDoA==
X-Received: by 2002:a17:903:1ac4:b0:240:66ff:b253 with SMTP id
 d9443c01a7336-2462ef93318mr30091655ad.46.1755854707455; 
 Fri, 22 Aug 2025 02:25:07 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:07 -0700 (PDT)
From: CJ Chen <cjchen@igel.co.jp>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, CJ Chen <cjchen@igel.co.jp>
Subject: [RFC PATCH v2 1/9] doc/devel/memory.rst: additional explanation for
 unaligned access
Date: Fri, 22 Aug 2025 18:24:02 +0900
Message-Id: <20250822092410.25833-2-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=cjchen@igel.co.jp; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Aug 2025 09:54:09 -0400
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

Add documentation to clarify that if `.valid.unaligned = true` but
`.impl.unaligned = false`, QEMU’s memory core will automatically split
unaligned guest accesses into multiple aligned accesses. This helps
devices avoid implementing their own unaligned logic, but can be
problematic for devices with side-effect-heavy registers. Also note
that setting `.valid.unaligned = false` together with
`.impl.unaligned = true` is invalid, as it contradicts itself and
will trigger an assertion.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/memory.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 57fb2aec76..71d7de7ae5 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -365,6 +365,24 @@ callbacks are called:
 - .impl.unaligned specifies that the *implementation* supports unaligned
   accesses; if false, unaligned accesses will be emulated by two aligned
   accesses.
+- Additionally, if .valid.unaligned = true but .impl.unaligned = false, the
+  memory core will emulate each unaligned guest access by splitting it into
+  multiple aligned sub-accesses. This ensures that devices which only handle
+  aligned requests do not need to implement unaligned logic themselves. For
+  example, see xhci_cap_ops in hw/usb/hcd-xhci.c: it sets  .valid.unaligned
+  = true so guests can do unaligned reads on the xHCI Capability Registers,
+  while keeping .impl.unaligned = false to rely on the core splitting logic.
+  However, if a device’s registers have side effects on read or write, this
+  extra splitting can introduce undesired behavior. Specifically, for devices
+  whose registers trigger state changes on each read/write, splitting an access
+  can lead to reading or writing bytes beyond the originally requested subrange
+  thereby triggering repeated or otherwise unintended register side effects.
+  In such cases, one should set .valid.unaligned = false to reject unaligned
+  accesses entirely.
+- Conversely, if .valid.unaligned = false but .impl.unaligned = true,
+  that setting is considered invalid; it claims unaligned access is allowed
+  by the implementation yet disallowed for the device. QEMU enforces this with
+  an assertion to prevent contradictory usage.
 
 API Reference
 -------------
-- 
2.25.1


