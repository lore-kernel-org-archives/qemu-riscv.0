Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E50C28B28
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 18:38:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuFJj-0005G1-DU; Mon, 17 Mar 2025 14:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFJE-0004me-QR
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tuFIX-0006Cu-7v
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 14:35:32 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22401f4d35aso89737665ad.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742236481; x=1742841281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
 b=H9vB6z5EbsXQH5NQ61mhUXNOByRlDmN05TQo/y7BSE+wBbHTp1WFXWVNzY0U3LlYwA
 7miH5FCWuM+9uehGpbIhAtp0GOqA3859ZDVJtDLEbRfZTtxmBY40xe1TlqMvK6YHir5+
 FfiYM2rraan8swxOJ4XzqkTfQud/FQlrJ3ICbVKZ8d/9Nr9hVyjyc3f/s3Ub9cehAU8F
 IdtsrMid5K4l3ZV+oTrr0XtrdUHI8A2CtUb/Sl1p5mZ/3zSwv9FWqft35x6ivwHdaPjg
 bAjuqjmE9iLLF27037fuqDcr1y0LfPImR70ec6/FzNM3Stj4yXXyi0In0HLmwdk5+ZHX
 1ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742236481; x=1742841281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
 b=LBwPdZLNixBi8zQAHwuw3O20XsKvFVSoxYGbJmZR5zrFe+gsDiNHTjMnWPf62BESqt
 /gLY+FUWGVfioR2Aao6RhwRFZyuabkD7qVPtq21L85xth15uq3PaXsemW+bFLRHGDfdL
 DLNP48Rkhq7pABAiQC1E8EGz8/O8YOnHzp2NYf/DVA0vwVa5ZTgwc9mgkGWqFGnUHWiK
 pWo5kKBAMMY8KReKLmv7ulBz7Dy/+nLVvza8t9ZskPc9RIDW+cAJGCq+Ty9EkpR6TRBc
 hMfaCdwlMw8EBWNy+enCDne+99b3ah/GMGCSJiidSHBcgTSVHoxZjbNQPig++MlUZyLk
 7FcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmUf+zQeeuKGixS+9SEfBpPYqJpHz1qmkE1Eao1+E9FV1+AjGjK0Fw5boSO+tzOG3tXM+Ih5Qqx7et@nongnu.org
X-Gm-Message-State: AOJu0Yyx1WGofTsz+5qsxZgCk8REaQcp93Cb0GYGU0tBgYUZmur3nWwq
 Xv/Scrw8Q+49l6RLb0yNYibjeYlhxd8DsiIxR5JRmLMRa6FXJuLTxjOzg/09GRk=
X-Gm-Gg: ASbGncuSht1CeqLcoalx+AXlQMLny/qU4vtI1C29CPo512VxelpVs7kGLu2Fusx4Ada
 9OXTAEUYjl6RTgLZ6lWAXUn1HSfLe9XQZyqP5WSfdHqu/tq/ULDFWNwOUKPtHIHvzjwNFUlJZ7r
 ThKbuqmvFiAyUGn7Ozy2RJ7DuoWjVCV4rPkle1LP9BFEFC+cGZibrFMu3ZLoSn36rn7jBsq6zZO
 gU/M4l5SK6x/a9ngGRMALsivA3+cqjC62ubqVGjPZy+D6efgHzR2xG5rqN/HcNlD0egho5aoLC4
 ypwPviZEXSEqGQk2NK/02lE2KdC1PDFmIb8pSfEekam2RHepYvNdHf4=
X-Google-Smtp-Source: AGHT+IHJvFyPD498ouch6ktpEIoYmR6xx3vtpzwDFb0ar1DtZX7lkpskC+JCwilCa8dJd3A5JvQbZw==
X-Received: by 2002:a05:6a21:7895:b0:1f5:9961:c40 with SMTP id
 adf61e73a8af0-1fa43acdf8emr1048891637.8.1742236480716; 
 Mon, 17 Mar 2025 11:34:40 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 14/18] system/physmem: compilation unit is now common to
 all targets
Date: Mon, 17 Mar 2025 11:34:13 -0700
Message-Id: <20250317183417.285700-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index eec07a94513..bd82ef132e7 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'ioport.c',
   'globals-target.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -16,6 +15,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


