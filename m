Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C598E7AD42
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 13:22:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnfLj-0001fo-2m; Tue, 03 Oct 2023 09:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qnfLh-0001fH-7T
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 09:22:05 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qnfLe-0002eM-UL
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 09:22:04 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-692c70bc440so673008b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696339321; x=1696944121; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vu0xMqO0/tJisHYLXntW+Au46iu8040tFzWiKusl3Hk=;
 b=CrLgmQmFDzauVfYk3YjABM2TJ9ugPT7anQn2XgNe6FDU3yScm67rfRNAOlyQVdvfQp
 tkex/zSg3AjMyKAHu0cgNvzKfsf+J8FoGQhMWiTpp956iyfmCBUG5uJ9AJYbOfTU5iuq
 yXPBeiDZ9GteTWhPoynSZe8BBh0+KGgoM7cHon8uh9mGDbVScPksx7OOu//ATqCvtO8h
 FCoZyYtMT6cvKxYrKZaqoBVkt/aQA2Vp1Yg7Y1ZXffY4Gn+x7m0yjR5ALKYQ9+fdH/8o
 W7Qj25FSKqShUhbuya+L4sYkJ/vC3wdMGhKb5UnEuxLK2gfTJuqJPTS8/NvteRKr6i9y
 1lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696339321; x=1696944121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu0xMqO0/tJisHYLXntW+Au46iu8040tFzWiKusl3Hk=;
 b=a77vmlu0gmRjvPgt5vpeuh1dbEkt74fJxVXsZ/rb3NheCmxJDZqS1damIXrQK74CkO
 Zj+QRlBG9O+7f/P3y0bH2xWF7NQTIzYVlZMV2fGtmqGq2OfaslCG64X9COmwRG44czGb
 C8Dyxg73IxslZnBZ3qgtOCje7Hl6tC6BMgfUqaOvlgRCc2Mr1aWWJOnaX8IUVQBLF0tS
 73e6LjP+gCwcOOk0tjG0XnVQvZREwBn0U7Vc193A1lfcbkDmOpU7hr0w7LrfcB75oqXB
 syE3KVD0NHzJnbzeLvOA5pPbzDdGMCufk/UUMilZ6BRqgkfi3IC4gFMGCesVcsIQvndx
 polA==
X-Gm-Message-State: AOJu0YxZnSvAqzHWngwW/zPSg3KckPTY3yHX2sY88oXGBJ6A5rlU4MiL
 VvkZjPQhgXWFdBtWDycenpgUfQ==
X-Google-Smtp-Source: AGHT+IGPFJzllASgJ5j1GJq4uMDvW0T0G+3qHOeTp51MEN7sNJo+rzgvwk7PzD2LjOZa49E/VjNabQ==
X-Received: by 2002:a05:6a20:4422:b0:14b:8b82:867f with SMTP id
 ce34-20020a056a20442200b0014b8b82867fmr15147239pzb.50.1696339321012; 
 Tue, 03 Oct 2023 06:22:01 -0700 (PDT)
Received: from grind.. ([177.94.15.124]) by smtp.gmail.com with ESMTPSA id
 u11-20020a17090282cb00b001bf11cf2e21sm1491777plz.210.2023.10.03.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 06:22:00 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/2] target/riscv/kvm: improve 'init_multiext_cfg' error msg
Date: Tue,  3 Oct 2023 10:21:47 -0300
Message-ID: <20231003132148.797921-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003132148.797921-1-dbarboza@ventanamicro.com>
References: <20231003132148.797921-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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

Our error message is returning the value of 'ret', which will be always
-1 in case of error, and will not be that useful:

qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1

Improve the error message by outputting 'errno' instead of 'ret'. Use
strerrorname_np() to output the error name instead of the error code.
This will give us what we need to know right away:

qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error code: ENOENT

Given that we're going to exit(1) in this condition instead of
attempting to recover, remove the 'kvm_riscv_destroy_scratch_vcpu()'
call.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm/kvm-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index c6615cb807..c3daf74fe9 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -792,8 +792,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
                 val = false;
             } else {
                 error_report("Unable to read ISA_EXT KVM register %s, "
-                             "error %d", multi_ext_cfg->name, ret);
-                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
+                             "error code: %s", multi_ext_cfg->name,
+                             strerrorname_np(errno));
                 exit(EXIT_FAILURE);
             }
         } else {
-- 
2.41.0


