Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pk5dz-0006Xu-7R
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 12:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dx-0006VA-I2
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dv-00085M-7L
 for qemu-riscv@nongnu.org; Wed, 05 Apr 2023 12:05:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so18740161wmq.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Apr 2023 09:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6WERmjWn5FvlAk9wBZ9HpDjQNTvh7yNAmb4fbxF/bQ=;
 b=ui9pQqlkMvaDWCZp6I6ifckgckCFMdULH8djIjHBtGiKqLjSUyanx69f6iIYVMfxSY
 PDG366DUK3lbyUBNP2TISRXho9Y39mi+0yOtKEssWyJs8AW+r0iZXdfVcgRVJmp8SyvR
 jPWJ8qjkwLGf7F7Iy7M1OZPrcf0uWtn65EXI26LFqGpDfTiuMP6i+YQtxah+yEf+3N2I
 NfyrUvV8ItcveuyyyrfgYuOGCWAsChzWI0Cy5GdHPeHvnwaJTnTNUDpZ7tRMAHPsQguV
 7ankTk82Gs8dVyGeY4jCBSGFQ/hPIEZB2U94cG+S76nY5p/JXNSjjluwvo8eICuJ2rnX
 GNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6WERmjWn5FvlAk9wBZ9HpDjQNTvh7yNAmb4fbxF/bQ=;
 b=G51PQwCZtkSgdKeYSaJpxdlmLZdL0r9GxRUm1ymhoxsLqpCZbZgYWgvKEMEe5Qm4rZ
 KPzS08eIFSptqrR8aV28WtvXTu86bzxP8NJsIdJnoF6yzP391nVD/0K6llT84RgzF4r+
 RQfwxq7lKXS2q3AlBzocGmX6IaYqA0NYRXIm0t44pNzx0t5TZEtTqJKCgqHKIMF5O0ul
 jLHNR/6T6DC88uLMxWJTcZ2E9RIqX+RH6W+IRsW1VLnKonmQ13GMqUUNjcjxSy/SPMZO
 K3UxEnf0JLZSUw8Hgv8YghgxXYf04+agcAXbw7kt/+7CfT5UqY9uoC3TIVZ9BWHwm2hj
 vf2Q==
X-Gm-Message-State: AAQBX9fujD81/kQ+/OSbWUb6T0F+JnwEqrIEf48cFC+jJK1xRBJICzyN
 JtHtt4/5j3Auz7Jp54J6c6Ra1EkyWj9DCuzBgow=
X-Google-Smtp-Source: AKy350anKvfZnCI3q7zDlxj99iOPWMUyn9/cm32XZyeYL/HMzbFHfQJWndVFdMqz9Z6VrABSDFBDsQ==
X-Received: by 2002:a05:600c:ace:b0:3ed:ea48:cd92 with SMTP id
 c14-20020a05600c0ace00b003edea48cd92mr5367145wmr.15.1680710749843; 
 Wed, 05 Apr 2023 09:05:49 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c545a000000b003edf2ae2432sm2600498wmi.7.2023.04.05.09.05.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Date: Wed,  5 Apr 2023 18:04:53 +0200
Message-Id: <20230405160454.97436-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 16:05:53 -0000

These fields shouldn't be accessed when KVM is not available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: The migration part is likely invalid...

kvmtimer_needed() is defined in target/riscv/machine.c as

  static bool kvmtimer_needed(void *opaque)
  {
      return kvm_enabled();
  }

which depends on a host feature.
---
 target/riscv/cpu.h     | 2 ++
 target/riscv/machine.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..82939235ab 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -377,12 +377,14 @@ struct CPUArchState {
     hwaddr kernel_addr;
     hwaddr fdt_addr;
 
+#ifdef CONFIG_KVM
     /* kvm timer */
     bool kvm_timer_dirty;
     uint64_t kvm_timer_time;
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+#endif /* CONFIG_KVM */
 };
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 9c455931d8..e45d564ec3 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -201,10 +201,12 @@ static bool kvmtimer_needed(void *opaque)
 
 static int cpu_post_load(void *opaque, int version_id)
 {
+#ifdef CONFIG_KVM
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
 
     env->kvm_timer_dirty = true;
+#endif
     return 0;
 }
 
@@ -215,9 +217,11 @@ static const VMStateDescription vmstate_kvmtimer = {
     .needed = kvmtimer_needed,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
+#ifdef CONFIG_KVM
         VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+#endif
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.38.1


