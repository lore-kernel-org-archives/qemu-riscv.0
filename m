Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3908EC02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:20:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc7v-0003zm-Vn; Mon, 10 Feb 2025 17:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7e-00036Q-7t
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7b-00031a-Hp
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:20 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso32840745e9.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225958; x=1739830758; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sae975OII8vOdqZ9KshdILCgP0zqXEYwuZ3T3oyih6g=;
 b=Srnm3xCRcWoWgDp0St0zlxoq0YfshjHmWKdpG2Zi/Nhm733a9OVtE3JI37OnormYVU
 TwEL54xys+9j4bwmW/C+GmDaysPd5N2NuwmuzOjOr3508N40+R5LpEjKc3hwHtLtFjww
 1MU+UaQBvRqta5exnw5Mw+mr7bNbCsnJztR1DFbreiI9phs/0hmq6ho8O4QZi08Kk8Ky
 S6mMtqHiTwNpod6AVRLkAtEKGBzaMQ+0bC2Q3tTkHR/NITv1DhJBV+TQ6OzN1IA/SvMr
 RaVH/slTkumvxh+Jrad1mix77FUefuWQ95gA2YAEdeEh2jB244bkadwltT4uqLFoRd8U
 7i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225958; x=1739830758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sae975OII8vOdqZ9KshdILCgP0zqXEYwuZ3T3oyih6g=;
 b=hY2+UzSXx7n/s6+mmEqAddvcsTkW/TAWMHI9QzAoMpi/LV7RfYfL7MFNH6QJmM6+ny
 iplpq7dFG+tc/cdg+oFt+LwpilAO6U63O032NRzIf7UNzVMLdA78dDkY23fVmAop31au
 3JZgeTQPe8Fjb8J6Qfcqxhw7IAnZfw1Hg2VoAXoBjVD+pwqcOw/D9kxcQGFHEAXKNZaK
 ovNQTaX+mkKDO8iUjjWEp/kPSBF8b5A+c9nZgOh38SvI1HXrtMt9RGFFLSMsmh93SKRf
 f2QXuom5jLCePrKiZYlXS51Xm3QwLbW9IDNB3i5oL7ZqufsXc0+CFA3qAQ21TelmMD5b
 0ocQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPAJDyXejbCrbmO0N1jU2tSgFwuvhfdMK9EBcq9s7s+zcn1OgrsKc6oYOP1WX7y1SaBgcfGSeHJdYH@nongnu.org
X-Gm-Message-State: AOJu0YxhypVA6W49fvVJZ0MOB2xVxD24Oz9L8gdJ1+0+W72QB/DUIMlF
 ZAcwTaxGFZQTjXbBZPplTPdwywH5wTcev43fIAAIwejMqn3J7eZQh1yio71gvhI=
X-Gm-Gg: ASbGncs7RNEBRbFayy+jhwtyGjZghOLOfUJy8vK2BWhDSuyL4KuOfGn1pkeFjP4V9Wv
 WE1fbJK49uevKsvfP1blQNYlM3z1NPFQ47Bjf/iOQIfc3pbXuYQG5JiSBk2qc/gNIvb+pIcP8pW
 79ra9PQJ4c/CvtQpenpPPcrbJz9TFKKYot0JodSXXlweJKLjP1TtiVjBB17qQMjNsnPlHGyy/c9
 O6eqv5zyDCCCgiFkPwWYWHZ8JWDnRS3ZFEMLWhGVPZqk7NgldEMes5x1PCZt2yGa/rVzvAuZQ4m
 imZ41WkfuvROlRLFB+/44W6aUFFKdtBarW4vmCIhs8wKmJgAVGq7I7s1TgXrS/IYmw==
X-Google-Smtp-Source: AGHT+IGQq2wQ0US8BdHOVaxWjvkX5qfQUCdHOqkDRCeIYLWKP20k42pmqffL0fAWW5Sv/tSf56mbhA==
X-Received: by 2002:a05:6000:1847:b0:38d:d18e:8811 with SMTP id
 ffacd0b85a97d-38dd18e88ccmr8972306f8f.25.1739225958006; 
 Mon, 10 Feb 2025 14:19:18 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d685sm191800815e9.13.2025.02.10.14.19.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:19:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/10] target/xtensa: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 23:18:29 +0100
Message-ID: <20250210221830.69129-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index efbfe73fcfb..f9e298ace45 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -159,6 +159,8 @@ static void xtensa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 
     info->private_data = cpu->env.config->isa;
     info->print_insn = print_insn_xtensa;
+    info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
+                                     : BFD_ENDIAN_LITTLE;
 }
 
 static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1


