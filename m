Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A8CCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 04:07:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6LSc-0007EJ-Tp; Wed, 08 Oct 2025 00:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6LSZ-0007Dj-HE
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 00:07:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6LSX-0005qm-GY
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 00:07:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e6a6a5e42so34908295e9.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Oct 2025 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759896443; x=1760501243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FxAtWtmejX8FeMeLelhLJTDbTvi6ib8BE8g2ZB3OGV0=;
 b=viUDSEY0wtTcE7JQg/pmTRdcC7OWhtapT4MBQgDYEp1Ry8XlcF/X3lEFfcbDRMdOei
 1Os+G8+6/1W5e1zqe12mtKOkJfcp5cCHM5SCrcI5Bnd+rpZhMMHKwYlF96snNeRpJ0eq
 mAkvUbC3vT0n5ljON9l7CM1uUIcXDFuCObgvhAehSeGMbW0XdtkLijPMHYb8skFZHfck
 xl4OHnmNjBu4TsrkWqIaoOmktR2daj3+oWc0R9yXdvvc5S4b57X/GaEbawRDcru1g71g
 g+GszYR2dqrlW8vi/yD2nYTvmzSeRqWIpNcDcO4hpkb6zrf8/wtxZ8JuTo6NSpqTsbK0
 p/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759896443; x=1760501243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FxAtWtmejX8FeMeLelhLJTDbTvi6ib8BE8g2ZB3OGV0=;
 b=RwE6qy6J66PlnmC8s5vXglpEhywaHw44fEZF/DpU7BSFgU6Yyjj/SkpyzEhrZikN5C
 mbDIFKuIRxyFx9fbP8NGL4Zmt2ZWnj9VmHdRsf0PDE1UwAekTXm6GqO9XM/01G5syuN0
 HUOXWAuVNM6tMnzkTCx/rwZZuvw0Nb+Tgx9vtGChfrLnFdtDJYiuwk3noWWDXL+FG+cw
 A+Dc59wChhrO1czcI7GGSMi03kJsWx7Jen9Vj46dNqazmvEgGPKc1gkCBOw3BgDhB4VP
 hOvzGLYOCj1Cj5QhxtWOd1/3urjNngz9UxX4XfpJQ8zqPGIaWYyseHKVPgzGFt3MhHQx
 w4iw==
X-Gm-Message-State: AOJu0Yz8LdYLY2Ku5olSCW0ZAIc2jpAgjnBTG1gxEyVoUU4N6g4oNsVK
 35/Rkx0/ZYc69m9mrYkTunjm1M8es/1+/k4MZDnBoQjmRxIArNnS3vDQH8XvVCBsLQo=
X-Gm-Gg: ASbGncsdizNgT6mvkK+GdbH4tZvjSewiI9tEJNgxWNNO31f6NmqVlPTAHKAHfNG327q
 qgHEUVG17ddFXEKpVBOb6CioeQEYrjwbx/Jdx3smf5OQrvr4VkQla1LJ8qRIud1PmBDf4QB7EqJ
 6L1iGUTvRaFyJqCRB+EelHcvIhIaIUwDJYPQLVIp/HUdJJJiZwa0m1eY+XUHdXDb4jTXmb6pwh+
 QDEXZY3fUJdnKpFeZLzWSOM+/tHiVXYMH3qgPMQnApw0/qvoGJcDf6W5wuqi2wH3MrXk5OFtZL3
 YbcIJyQnfzOCkqWyXoZGQlgbG567XkSWxHoPTumSqzKnHNDIZqALI4tIq/5EdsSZyc6F0utnUhu
 lCQKw3wlntgVxhFkxnAXLRleuMpP87GeLWXhdH9n4xkbpPeByEb17LOqqh8O8QvmaQ3yaIXIW9q
 ekOkEckaBGVn+ubYpAP1Vs8jPK
X-Google-Smtp-Source: AGHT+IExiobNOfGSPWTb7L2l3odsWU/Eo27joKAv0sBZvTrPNsL9nZk7Rb2MQW0Mia20pwxgoKA8RQ==
X-Received: by 2002:a05:600c:3b1f:b0:46e:42cb:d93f with SMTP id
 5b1f17b1804b1-46fa9a98ef7mr11946895e9.15.1759896442997; 
 Tue, 07 Oct 2025 21:07:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d7f91esm18486965e9.20.2025.10.07.21.07.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Oct 2025 21:07:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Song Gao <gaosong@loongson.cn>, Weiwei Li <liwei1518@gmail.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v2 1/3] accel/kvm: Do not expect more then KVM_PUT_FULL_STATE
Date: Wed,  8 Oct 2025 06:07:12 +0200
Message-ID: <20251008040715.81513-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008040715.81513-1-philmd@linaro.org>
References: <20251008040715.81513-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

KVM_PUT_FULL_STATE is the highest level defined so far in
"system/kvm.h"; do not check for more.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
---
 target/loongarch/kvm/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index e5ea2dba9da..45292edcb1c 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -397,7 +397,7 @@ static int kvm_loongarch_put_csr(CPUState *cs, int level)
                            &env->CSR_RVACFG);
 
     /* CPUID is constant after poweron, it should be set only once */
-    if (level >= KVM_PUT_FULL_STATE) {
+    if (level == KVM_PUT_FULL_STATE) {
         ret |= kvm_set_one_reg(cs, KVM_IOC_CSRID(LOONGARCH_CSR_CPUID),
                            &env->CSR_CPUID);
     }
@@ -801,7 +801,7 @@ int kvm_arch_put_registers(CPUState *cs, int level, Error **errp)
         once = 1;
     }
 
-    if (level >= KVM_PUT_FULL_STATE) {
+    if (level == KVM_PUT_FULL_STATE) {
         /*
          * only KVM_PUT_FULL_STATE is required, kvm kernel will clear
          * guest_addr for KVM_PUT_RESET_STATE
-- 
2.51.0


