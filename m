Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC85FC35FF4
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 16:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tslbB-0003tm-FG; Thu, 13 Mar 2025 12:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslam-0003Tg-Dp
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tslaj-0005iB-8c
 for qemu-riscv@nongnu.org; Thu, 13 Mar 2025 12:39:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2f9b9c0088fso2395629a91.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Mar 2025 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741883966; x=1742488766; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
 b=D2GOKrmSClC8JXIjKEplR8HBkvlhtxDJWx2tbMOYRX4Z+UN+7S+56lRidKKWkqc9JX
 oklBMCcKrTwe/qTWooEdKmRoIgQHbCps7B5t3xmh/BKn19I66CfYG9fUB9Qztiz5achm
 ii3MrXV2ntm77ra/h9r5eyVmeUtj5m/My3Iu+5kHL0Us7c3FpOXvwYHMBDj5p8EI9FFd
 NhBFFEKpaDrhQUPuS/Uc1JiOJvQ/YDuK3FVJglwewN9QJT8JUgvfo0+ZQAthKFNnbSvH
 ETxsiws9SHiWtQAec3VXPhpixnWrPcxMC/WSl4mwj/pOyDboYbFw2p21kxCDbKerGb0D
 Q/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741883966; x=1742488766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
 b=RgwHEUDXK8FH8cHK3+rXKhQyq+6l+aDer3uPDaLBwvDcYgLxM4GrLDpMr/Mbgtoeo4
 VUy+h/cpk3cofdXxCjoJANsfDMZWZsZV5WYOkxfBqTMVF/UtC6TZjQKYQ4f/dUhusEBf
 8b16G1o91PM+yssiQa07IvZiqFvPGymEl5cSC63MYSPJ4Nc1WMHh7K1rYiAcojDlMWy6
 vHZaokZUcEeS4zonxUaR+nCI56323HsI0nPcO3UVtSoWMCX+3kgbhV2XlOjwognt/cpp
 Kld4u97w3OVBQBxjuS0vB9rqIqQXhwYJH2wG5txbo4QyclvDczEUdy75vl9+0GDPjLht
 Y2rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR/e9ddd+qD9IQMh86GBtcjRW3rMixsKwRMwjFHCTBP/AKUBhqiZAs2/04A1sktogtXaY18PrYxVAG@nongnu.org
X-Gm-Message-State: AOJu0YzsQCOQ6KQbHT6nArZR5hqGSfHcqjuafQQp5gKdddkYU2IXHQsV
 sOAyC6FtHDuxBUFhsja6/3ZrofY/LRvz307hAV+Um/dRUJlKjqHoir6Y9PED/Aw=
X-Gm-Gg: ASbGncsrLyYFWgIveKWAZXgEj+BhbpuIU22xVqGg7t6NyZooS5HF2NF9hPF/FGBdQOa
 5aVDadYyRzmVxg52caucZgURdMlhFx1iLfZSx45n7cwnMPRZ5hVI6v1vd3zxI9APuXulxRD/qcX
 dQMTN+ZJqcrY4gu697VvLp4r0t7t/aFm06EeuE2+OQU5B7OPVypjaLOjKgoKfaQQXeF6sW+Yd7/
 PTTcUH+Xy9qIaU+NvWscwYwRDroZjxHMAR4qy/pqO4J0SQ4NxvrMMZdfvAaSrigdOYYfZV8Cw9J
 OmpaKQm/UwcuJZf1DJXW28o26M8xx3U/xuEOcZkm8c6y
X-Google-Smtp-Source: AGHT+IF4AzvOcFWztZZ2bxlYvUCRcZgJhJkixRgg9I+5NbaWKKn606UlzAb4zSHX4i3sVnz0TZr9yg==
X-Received: by 2002:a17:90b:574c:b0:2fa:30e9:2051 with SMTP id
 98e67ed59e1d1-30135eab105mr4295980a91.5.1741883966469; 
 Thu, 13 Mar 2025 09:39:26 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:26 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, manos.pitsidianakis@linaro.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 13/17] system/physmem: compilation unit is now common to
 all targets
Date: Thu, 13 Mar 2025 09:38:59 -0700
Message-Id: <20250313163903.1738581-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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


