Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSfBE-0005lg-Iq
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 09:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfB8-0005gy-KN
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 09:24:07 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfB7-0007HT-2n
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 09:24:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id m14so1978145wrg.13
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 06:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkUuoVsPO7rj7crjxhqsXkiJdIbOheCDQODQm6zJmAM=;
 b=ZqFCD2Vt7XIixCiEhyyMNWbzBgC8/HWEe+DOP06G+8TrOcJBda7INaA/bVB6RhrgCd
 LrtcEBayKQv8INfLZFqbWJhM6Xx8RXiG1wNaTEjGOXFmM8YNp3iDjJptWWIQC5n45VFH
 GWiC711mj3mCdWj0Q1rgdhgxxhgm5Sc7otLmossU+z1o/QjFEwcEUCOtgbjLndYG/zzp
 XB3k7+uahOIsOip9ktuHl6WxtYugfwoB5yY7Jdo1o2dSZMF0WTau3Ubh9aKGXMFE7nlY
 0nQUbmGPLVfa8olOB3oMdu9NqgjruurtmHIa3OzUD0IKp+5RZ77yStwI69xQ3hI6QJT7
 XpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkUuoVsPO7rj7crjxhqsXkiJdIbOheCDQODQm6zJmAM=;
 b=D5sp8iLa2bjy0aHdU3+6pRRR9Wh/Areji9OQ3dJTEWwo1LbnsY1q5leRDSlSF26LAg
 1lukko3VObvBa7bgxz8lg2nSSam/VCSgRLyNY5wmloEluc02sckTII3ihEwE/RIldRPM
 /H3HAxTS7sbmIJ+STau3EEnk5iZjr9hfovDMGuWMyr7rc2mWpMf9dRXxX0ccC8td34EV
 hdX/NeIv37BVp0dymfFCjhGwdGQqZJPcvuhv2POeoY1blLYihHq8xQyeXuLwbiIm3C5C
 SW5lIMrMAG710mjTNRyn2oR5GwZN98D5wEGQ5QSlzBTv7URuQi+ucnxh1VOU6R2MsY6O
 K+rw==
X-Gm-Message-State: AO0yUKXqNy4wI75cASM6lvy7bTV/2MPUMlPlo3ie6vOqrdCU+LrRq0ou
 vdnEZIV+9Khs5yYWOKqzyE8vnw==
X-Google-Smtp-Source: AK7set8iFVTfWWtS0zz8hF6MkQRG2xZr+tuqJQq4uuIeMSrvbduTuuD6ndgNwYZp+yjdL+XvAVI6Kw==
X-Received: by 2002:a5d:414f:0:b0:2c5:5048:8a6a with SMTP id
 c15-20020a5d414f000000b002c550488a6amr4395007wrq.60.1676557443658; 
 Thu, 16 Feb 2023 06:24:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a5d4e48000000b002bfd524255esm1545552wrt.43.2023.02.16.06.24.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 06:24:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>,
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 4/5] hw/arm: Restrict CPU clusters to the expected type
Date: Thu, 16 Feb 2023 15:23:37 +0100
Message-Id: <20230216142338.82982-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 14:24:07 -0000

ARM SSE expects v7-M cores; the ZynqMP SoC expects Cortex-A53/R5F.

Do not allow any other CPU type by setting the cluster 'cpu-type'
property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armsse.c      | 1 +
 hw/arm/xlnx-zynqmp.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 0202bad787..1132fdcbe2 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -715,6 +715,7 @@ static void armsse_init(Object *obj)
         name = g_strdup_printf("cluster%d", i);
         object_initialize_child(obj, name, &s->cluster[i], TYPE_CPU_CLUSTER);
         qdev_prop_set_uint32(DEVICE(&s->cluster[i]), "cluster-id", i);
+        qdev_prop_set_string(DEVICE(&s->cluster[i]), "cpu-type", TYPE_ARMV7M);
         g_free(name);
 
         name = g_strdup_printf("armv7m%d", i);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 335cfc417d..e45cf88625 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -224,6 +224,8 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                             TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
+    qdev_prop_set_string(DEVICE(&s->rpu_cluster), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-r5f"));
 
     for (i = 0; i < num_rpus; i++) {
         const char *name;
@@ -381,6 +383,8 @@ static void xlnx_zynqmp_init(Object *obj)
     object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
                             TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
+    qdev_prop_set_string(DEVICE(&s->apu_cluster), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a53"));
 
     for (i = 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
-- 
2.38.1


