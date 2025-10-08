Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC1BCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 04:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6LSY-0007Cu-RE; Wed, 08 Oct 2025 00:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6LSU-0007CK-VT
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 00:07:22 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6LSR-0005pz-KF
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 00:07:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso46702765e9.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Oct 2025 21:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759896438; x=1760501238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XK3NTl2B3zTpPA8Q4QoS/MR0UKSoTctc+BHX4wlh/xE=;
 b=y3Ly6edlKSn2M9uMZJdGNuWrN91LLZl/CVZhsqJ3INSOwsdc7Zced+srjeSDVPBC1u
 0jbahycA2SdDgC2GyvHt9o8kTZXntDGTr82pJGgZCzg0SCgy7cO9rhWQ2vZNtzh07UZD
 4FySgPKwcBXra+0MGMiejAbliu5MEBSmV9FzunwRjrmNCAuGFY5ZnRn86xgvpdqs+gnJ
 fkHRyGyI7Hqsp+v/dskMYjaheUzScaoqDLfe+egLQfQ2GtkVCzhoAJAH+an5hWWcqR4B
 D7VNeFkk81gRz6thO/8RPY+rhxczENgt76eiUXe0H8VBs5BPbXyNHLSgo6GHdlEftBBW
 HvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759896438; x=1760501238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XK3NTl2B3zTpPA8Q4QoS/MR0UKSoTctc+BHX4wlh/xE=;
 b=wZx1LQJi2mpN1UZjMD1x/sXZPdQ+UAWKyiQvxRj8UXlX+Low6AuYQaStjczI9ptN8E
 aUkN9LvsAuiNSg0qYYvf7M2+vWFbveUIAnWgKIUqsatHvZtTp8cDiUtl1H0g4vErOTTP
 7GL1X4c5wn5XgyKRRDYQ5y8uGxevDcaD4q9CvGyPGw1Smf5MbAbiPtkF/gmxvDwU3iY4
 jhRSSERzWV5Ri0HLcBewrv4BNjkVzjUMpME2Jlmi5dyyMKX/6JP5VsVsJ/4IjXBFc78j
 g5HzlxV9cku/2qjPJVj/50HE0WqaHcPQ3fkRuehA19ki6/6ObdN0cRIYbntYH1obpP/l
 nC6w==
X-Gm-Message-State: AOJu0YwV6CftkcV6cjNscvOC6Eg2ARUQ1UhhyYGpnCDbb+9zbuFWTvpW
 6nkT0tsnuiYKKb+MxEO7FTtqdycjQ+iMHT7s92hymjzi1t0NlQWGjIIr0Hbc3eFPPXo=
X-Gm-Gg: ASbGncvLI082UXkXTlztSK73K+4LeEGznR3DbiKxQiorsLh8WQ8TzoqGzhXgADmVmYp
 jAAr1M4esVxJLknYoXMiJv3Znmdpw+l1cuf3fhToOoWV921irSqxPqMmWVobQcev+A1BpvTwUMV
 WCDq7v3AUD+u2nJG2X9HS8drUGMjsm1GJfXLFNLOLnApH7gKPKLipz9ZecAwXpFgw5Ef2QT/Gr4
 WNeKG1PJEZSkreLk+QlOM0gxOulAH0CmxUascWwM+dGB+j39gvT89iR1NU1R5LUWHo71XvRUhAJ
 wLiTA9iA0yEjSEvo6f4a3z8B88aCdTFWeouKPvfPrp462X2b8H3Ni/zmE8eyp9qRktW8RtuiGiX
 I0HBYteIAyX/kNZlu3BPF0d0FbfvKEwsh36nZLXMt3RJAavWaLXZPwXDvKgyBFBtC7mMC5jkUe3
 XmYSxJdHuT+CSrK5qESsnRohQhYE9w1WpqfTU=
X-Google-Smtp-Source: AGHT+IEIXGL3P8t0oTh1p1V3NI6++BW+3/EMw0SpDKt32lyYUyJmhP1y1qCj6ZQSEiMdg1THa01ESw==
X-Received: by 2002:a05:600c:3b07:b0:45d:d97c:236c with SMTP id
 5b1f17b1804b1-46fa9af80aemr10434825e9.21.1759896437672; 
 Tue, 07 Oct 2025 21:07:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9bf6c64sm19154605e9.4.2025.10.07.21.07.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Oct 2025 21:07:17 -0700 (PDT)
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
Subject: [PATCH v2 0/3] accel/kvm: Cleanups around kvm_arch_put_registers()
Date: Wed,  8 Oct 2025 06:07:11 +0200
Message-ID: <20251008040715.81513-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Extracted from a bigger series aiming to make accelerator
synchronization of vcpu state slightly clearer. Here KVM
patches around kvm_arch_put_registers():
- Move KVM_PUT_[RESET|RUNTIME|FULL]_STATE to an enum
- Factor common code out of kvm_cpu_synchronize_post_*()

Philippe Mathieu-Daudé (3):
  accel/kvm: Do not expect more then KVM_PUT_FULL_STATE
  accel/kvm: Introduce KvmPutState enum
  accel/kvm: Factor kvm_cpu_synchronize_put() out

 include/system/kvm.h       | 16 +++++++------
 accel/kvm/kvm-all.c        | 47 +++++++++++++++-----------------------
 target/i386/kvm/kvm.c      |  6 ++---
 target/loongarch/kvm/kvm.c |  8 +++----
 target/mips/kvm.c          |  6 ++---
 target/ppc/kvm.c           |  2 +-
 target/riscv/kvm/kvm-cpu.c |  2 +-
 target/s390x/kvm/kvm.c     |  2 +-
 8 files changed, 41 insertions(+), 48 deletions(-)

-- 
2.51.0


