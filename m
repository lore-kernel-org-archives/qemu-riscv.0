Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667D1CCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:07:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yPf-000104-Fw; Wed, 01 Oct 2025 11:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPK-0000k8-HI
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:06:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yOu-0000dK-0T
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:06:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-41174604d88so3822030f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331142; x=1759935942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7EaccUYpMBC4mwWEA7DiP8JsC9fbJvUiR/uXxT1ZC0=;
 b=cLwO4bRUZEovAHh9p54a+1hXkXrlBUYlhN2MHyG39Bey6/sbXg6W0YSVnOmqGFRzKh
 DnzI7qLAxQ8sm1tyxdh2MXq5WfwEYH9RRZTAzmlr7sSOZTl5h/w83VF2fB0jExb2wCMi
 +pLvlFvTaPuB5NCK8lzXRxBWfvBvFdnsp7R1yMlJjjhrOz5r7U+jxvpBC2iFhsNambz8
 hLUBY6T/ebCnwD7ZYEQQ6MqDE9YiUMu4zt67HU2sYF0fsKDOF0CSiv0CP7HKzJrG7msc
 v+KwWOamNT8+Eo8BhkBHoNKkgKo9CAtf3Ylob4rvMiWs8M8peSQme4ueJl95DtXuXfS4
 bBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331142; x=1759935942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7EaccUYpMBC4mwWEA7DiP8JsC9fbJvUiR/uXxT1ZC0=;
 b=W+NKV/kLHd3wrxFUmSa94xgHW+LRc46QgzEalrpF9Y5ojwJLFTsmlY4W8HuXjFegLW
 aVpacWVTPjUt5b3crMkCf3L2bIdGXr53TdlS+ZzNLce8IXmWdch9beP6sds5NTX8itzg
 /hPqZ0QkbAFddW6r8wxjXYO1nCc5HcIBzGyB6o7i4G3tRUutND+GBl2aTC3LbpEDAVnq
 hnzCNSTh3vXuNKih2NCjCHcYNO9pB78T6OKw1fQdTP2wlr85ncM8OLWQKxwgeYACcyGp
 fWr48bVJRMh62W2T/Uxup7niPVGVtaecIFyw8CjxZo+m4g3DbMt8v7/wWLEIhOARFgvJ
 y1Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuHrkDFTbVeNQ5gRKYZCPrBDZUxAn6WXIqWH5Ldq+Opb3h0xEIyz8taUvk7ir3sJaUqF88W7purXS1@nongnu.org
X-Gm-Message-State: AOJu0YxOFEavtTRMrz3sKIUkomujObKc6ICoxECUbfmnn3COyAHu7haG
 VSwCOyudZfO8wnaTrnG3Nq//UC7HwDmDDr+w6Faouwv/j512iEVvhIQxu4hYJXlTIAw=
X-Gm-Gg: ASbGncuV7kaQzU9dFpwVdU/CD+gdbb0g0PYkm/ifDC0BnS9x1gEA+0mmCZtht9psX0i
 D732ByGFGw1gCqXKom3v5r/oAYXPiFDkIZF1gCJ5RT7jHqwCjTufgsGppmyHdjjcLk1Vp/4GMso
 tAkNlTOi643Qgu5Gd2dYdJrinvBh6Iia02yIFDoGLWwmDxU2hxTPrPQdNYUdf7TseiAZ0+mqJGq
 tep72838ObZgiC1lVYrhkl2ULuKw0MjhM25eWf/AQQlUWDt2efqR/Rla1/PGNfVyABOITGVTww0
 B4rMGpt6ofORGxC5C61zIvA6V0Mi3fBPNiI+G8CVJBJKbzm8M38iSHAxe1vaYWDnIz6ukr03LNu
 YDpJeQb8pmM3fAtyJxuBJmvjAHOrytnYBPhImfVCc4aN7K+X9+v6x7xdwS41eSntuzYm41y2KcB
 azoEzqK34mK2Vti8QMU7kS
X-Google-Smtp-Source: AGHT+IGEFbG5PZrRkWb+dAGLcwVbtYn5/zpuQRrUQpMe+vLSrEUuj1Qqi8Tvl0sgCyq8N0wMWsvaVw==
X-Received: by 2002:a5d:588f:0:b0:3ee:15b4:174c with SMTP id
 ffacd0b85a97d-425577ed71cmr3251338f8f.3.1759331141623; 
 Wed, 01 Oct 2025 08:05:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7e2c6b3sm29412235f8f.54.2025.10.01.08.05.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:05:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/22] disas/disas-mon: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:07 +0200
Message-ID: <20251001150529.14122-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/disas-mon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas/disas-mon.c b/disas/disas-mon.c
index 9c693618c27..f2e45d16021 100644
--- a/disas/disas-mon.c
+++ b/disas/disas-mon.c
@@ -29,9 +29,10 @@ physical_read_memory(bfd_vma memaddr, bfd_byte *myaddr, int length,
                      struct disassemble_info *info)
 {
     CPUDebug *s = container_of(info, CPUDebug, info);
+    AddressSpace *as = cpu_get_address_space(s->cpu, 0);
     MemTxResult res;
 
-    res = address_space_read(s->cpu->as, memaddr, MEMTXATTRS_UNSPECIFIED,
+    res = address_space_read(as, memaddr, MEMTXATTRS_UNSPECIFIED,
                              myaddr, length);
     return res == MEMTX_OK ? 0 : EIO;
 }
-- 
2.51.0


