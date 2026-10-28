Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE80606A31D
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weppa9YB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxC5-0001LZ-4p; Wed, 28 Oct 2026 02:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLxBw-0001Gc-Iy
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:31:23 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLxBu-0004qj-1M
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:31:20 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-36a2551d7b5so198955eec.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793169071; x=1793773871; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yUNIvB3FxzBkZ+ejHoX3nLFFjBvTWomjc/HNnaE4vXI=;
 b=weppa9YBwaB4MecJm6cO6YV+NuuL8rCNU+isly7DeKTpJASKRMiKmiuAg//lPTJEKK
 J24wyvRbAl46gVv5DVSIiIXpsKkzxRRMJe1yBGrfNHzhPJe3x9Tqn6MO4JVmpWckqPb5
 ekRuEmW9V+tc8af+quiCcCtbbWNLdmbU+lmYO/NVvKWpNWwudjjvDgUHUqgSE1h9Ikbk
 nMjWOnS08kSjyspnO3XtTYXelD55818mwnjtii7sbeOlUYKSlTw1smJkiBfZgKQvX7sq
 +c54qsoTEj8hyxG/V/GsRzJACMIXkUbL3UYggipZxWAXjY9Wxbk+TyoB9fl5OVPunzEK
 Hrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793169071; x=1793773871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yUNIvB3FxzBkZ+ejHoX3nLFFjBvTWomjc/HNnaE4vXI=;
 b=erLKkWSJrc8Z4o4AkgaIq6Npci8GfxD3IVdcz6I4Sbrj4ThMoLG/OFw7VvzY5CBe5T
 1KLr12otCgRYYC72Wf5WlvAo0yPeoI51t9TdY/vXtoCGTKDZ/Sc7fvjSeTjnfAJqIDuQ
 4w+ODUc2Z3H4pVahDXQLUbYqCiak5WgsU6yY2obheDvlKidJsi2ggpwHTbhJmXnBgSvm
 tbXsSlGA2L7PqgS5Cs4JisRerZZUQmGveTmfJVVJ9xQljojfKnV/R8TpWzrpnpfC7rc4
 YpYFfmm+PRGoMfmTiRtlvjkCFOJbNLfkx6/lR4qAjuC353TT069zVd1zgIOSoWJFws1A
 idRw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxHmmU7PyEpdy9aUHnALzP047YO6WHlo8LIR+YYcNjI4bs9aKf6VHrlle6OUWmuloAMd/8yfC2G6Fv/@nongnu.org
X-Gm-Message-State: AFq9FYK9OZpjMNeqmh3wJkSrGBI9ivbbEYIbHM5ZdwFPsMFFm3X8k6jm
 CPTcvlb9Xh+qRK49YSJqWiyVCYlq4+gCojStivkDOTsAUo4g2KkHxu3m
X-Gm-Gg: AYBFou3mBwN9yQ1Eg92UdIGA7Jx9VwAXFNqIOrDX1XQf+bnV7wde7S9kHvdpIjTJeGw
 +47oeNCZZ3YZ3Z5WytUWB2UCML59qmUjFTUHscNbkZrovNoruYGV2KUkDoyVyHxo1Dih+jKDjka
 HX6jEaAdrFhzvfE9qqWoMtP4Xcr6pHKAj/JgMOK44g2sB4gBnVNB6+xeGrgYI6kRg5ZQ0ZDO1hg
 LFclMrQGuRRNlI8jBNOcgVtL8cpGKLBYG5t9szQ5MOvBPaF4hysspKKzr305EX4329/+4PpBZE1
 v93/wz+RMsZiVQCZt++FQADncoF2zXanvlMVvv0ah+84QKPZXi0EJ+h2deMQ27COwcvcDwkr1jN
 zcLMbPiZUI7A7r85QOB6AT2zrJbZxq6ubbw7QVqgPi4gMgq1SDPwi41W0kbipxamh8JKfZ3Zqm9
 MKcgKZEkJKFT2iKObnTql2n0F6pq8dxsy/lR2rtTziD1QarvAOzubTMw1WuznsTgCARWdQIERKJ
 CKE7qhZtzg4PhVBfHyV1C4M7jtY7MJyRwys5pQdWr6JZvBYclBR2j0yzvX3c4grXbA5Xa4KIWYa
 Yg7DMwg08atB5SZPPDCU5HZsLZ2tgSPBMdCghpeynRa76iakBw==
X-Received: by 2002:a05:7023:a49:b0:14e:37c7:2b20 with SMTP id
 a92af1059eb24-1a79e564725mr721664c88.20.1793169071311; 
 Tue, 27 Oct 2026 23:31:11 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1a75e5c6d4fsm4512584c88.14.2026.10.27.23.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 23:31:10 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Weiwei Li <liwei1518@gmail.com>
Subject: [PATCH v2 3/3] Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu
 to riscv targets"
Date: Wed, 28 Oct 2026 14:30:48 +0800
Message-ID: <20261028063049.2530-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028063049.2530-1-luoyonggang@gmail.com>
References: <20261028063049.2530-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is redundant now as all accel-$cpu_type parent is already registered.

This reverts commit ec65e16fd2ba012d57b1bbfcfcd04c31c4111924.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/tcg-cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 2a7796c382e..1369b7c4ded 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1754,7 +1754,6 @@ static const TypeInfo riscv_tcg_cpu_accel_type_info = {
 
     .parent = TYPE_ACCEL_CPU,
     .class_init = riscv_tcg_cpu_accel_class_init,
-    .is_available = target_base_riscv,
     .abstract = true,
 };
 
-- 
2.55.0.windows.3


