Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88A3CCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yQY-0001Qz-N0; Wed, 01 Oct 2025 11:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQW-0001P0-A1
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPS-0000il-QS
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:07:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e18aso4987978f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331179; x=1759935979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXiufQH5EAW3mbZqGPR1CdCZqjBiKmbzGv2nAPHWxfY=;
 b=O7GAti8ci0ueiaSXGVlPJn0/w83tSk5GufqSLT19f3R5DXs05rW4JrYjUsSNAZupGn
 SbV+zH4QkeULLFXbk+qRgLhFPY3/h00jWyNaZvZf6UtqErhcbfQDQTLQaO7ZYfjja8CJ
 xdcOK8f5pluFs3j1Ccgp8MBJDwxkQaM8WQcTQ+WMPBERBLRyqADJZDiTnyecPCLg2A86
 ZYoht80fm7y7xLCAruvJ09M0UKfwcfb32Am+StLfJh6nq7xZz+ren5MCoTWSXSBwEKHZ
 mTjLTi//zQxBTdaLdA6Sct7pQmgnI8eBv3j99ltnmw1j2Bfb6Yo2Hh2sp0rm1LhQ2Bpm
 cUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331179; x=1759935979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXiufQH5EAW3mbZqGPR1CdCZqjBiKmbzGv2nAPHWxfY=;
 b=Mt5KLCug7S5HksdC5ztTwHXj15uWMfojBpSA+maGsEI2kdrJFG1ZAjSm2/XxiZgoDl
 DEyMq7uQ/Epj8lThQ6FILdckaORucg+nBlHyXd4Dn1XFtUGt87zOMCUIZa/0RrlG4mJX
 NCfOklKOldzDY6/59JwihKjnFZjeU9okJQzaVeuBmSGRGJJfTOHL6IWchZs6PVbGSqiq
 7WhunOryV0Zih5gvCiRVOC8J+GCXYR+0aqvyjPLzqvrpG9jbzds15EARVKzmTje8QONT
 2kUqzqUIVN48mNQq+f9o0K16OK/lAVUVqcGDiYYuP+ZNcXrK3blR0wQryxuX5ouIFBOJ
 dy3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnHccsu2DXHx3BitvWSzkmlWnZ/8eTb+HZUufr0wIBAT7kGFXhDUQE5IxkPdI+poq6mU0oS6DMSLTy@nongnu.org
X-Gm-Message-State: AOJu0YxZAlT9JkV5gQ7cnluQFEhpKaTs8Z2uv0sg1qwdmG8gGFBwdJfn
 9l6vrkgp0hbTECXXkGAZg6qDdxWnRmp0m0xJCaJrIQNCvdnpzd1NZjlTacL/KcfXJAs=
X-Gm-Gg: ASbGncv/vHF6nb6wDIqQ6WuuQqwPNxnlj4WJqQCbF8Rsi0J0e0wuzjiMgO6Ba9VKltY
 xx4urnSu6fSCUjj7uPJU3jGVCZ/QxgV/NraLF8GnE5LgguyuTSSTarc1CdVBbqmAob5UyuJlrBC
 S7JUAu5+vkPmcMzT2bYbzt/rad2FROc2HsXOyB4GPWk5y7uyESoUo6CgNxp6JCtwuzxmQG5W4jS
 dx045ixSQomk3+2tqLfbogb+mpKNub1Cwdh4DjYuQv0ohdCTiOANZZYWw30LMXvjWl56CqP4Mvt
 seZjXQmRvmKB9zvZR4oPzd1N09nZW4jL5PsJfcCDM3uyZjTW00ZVD11lXnMpUWgr9htVDVdP38B
 EcsFLsOKu36xfyjN7fU/da4Skflp/eHxYSw5BsWh/fjcoI4BmU1a3yY0QlMSqOXn8qrkFncqcNw
 KkNMO4veNnGCdY9AvBV32u
X-Google-Smtp-Source: AGHT+IHBUXklOX5Spm8syYkMk9ISyumF021Wa7HC8KxhD0Lb2XRrKY7V61vtZJg6R5cgGsRJL8zBcQ==
X-Received: by 2002:adf:f70a:0:b0:3fd:3bcc:c239 with SMTP id
 ffacd0b85a97d-425577e4affmr2382604f8f.5.1759331177796; 
 Wed, 01 Oct 2025 08:06:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603161sm27834537f8f.35.2025.10.01.08.06.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/22] semihosting: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:14 +0200
Message-ID: <20251001150529.14122-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 semihosting/arm-compat-semi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 61001267965..4c282aea5d6 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -149,12 +149,14 @@ static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr,
 
 static LayoutInfo common_semi_find_bases(CPUState *cs)
 {
+    AddressSpace *as;
     FlatView *fv;
     LayoutInfo info = { 0, 0, 0, 0 };
 
     RCU_READ_LOCK_GUARD();
 
-    fv = address_space_to_flatview(cs->as);
+    as = cpu_get_address_space(cs, 0);
+    fv = address_space_to_flatview(as);
     flatview_for_each_range(fv, find_ram_cb, &info);
 
     /*
-- 
2.51.0


