Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plulT-0003pp-JI
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 12:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulS-0003o1-Bp
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 12:53:10 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulQ-0007MX-Oa
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 12:53:10 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1845f865452so1390853fac.12
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681145588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQVAabeAJXG93R9o2+wybfrTUqipz7vwVTHH4p1nQcc=;
 b=ZSr+JNci/efL6NVUiJvaWLSnNNjBtyZ/0J/CV0UFohMHN7HfVfnBw7I1tyIWOJWHTs
 ockA8KeZfDowNjM+L3PQ1ArZ1dKa6parjQ5LdnwSH5uoxfLf4aF5biyYrNvpq7Fzijm/
 CiGdUTOQQbdgWUGc9p3GFBrXJ7loiZm2ns+M2YFmFnvupk87W5O3jxS4JuI8c3ZnfOu2
 iOEd9hEFtknGukxrQlapFW/+ZDG6mD6VSjfRcse6idZolQyYUvQ6askbE7XeqkAPA3oF
 YMKN9S1ajAtIMuhz1Q6Dct2Z5xYHq1nP6lHgdZTsU7fWLXxOXrkaxALkDiLT+sE99aQL
 wUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQVAabeAJXG93R9o2+wybfrTUqipz7vwVTHH4p1nQcc=;
 b=Wrvi/wOoGb8yz7G5cRKs8efg5qoz4CicxXfMshFV1p4Vh+f82+BbsVVfAQNAih1oC2
 X9keplNRn/BkpZkZjWcscTdZF1TXjr0HypZojlHnaUx/OYwtaUbW9aHfeK6VxZ6+ly+3
 L3OtbgsPHRt1nL573tw8cRROOvNGBEFyaesSviSuQQ5INr4frbcBPvQGVi5FJs1qV8XE
 5zGS7Dd880+WXcjUIELZBeCjeqbj+2YzhulMWhl9QdWq7mXSbYCRGf3UYlTOOpoHQsaO
 jBlcEWkfI+xxxXJ4mFEcVIHx57Gc80t5vUTkaKO3Ve7lirwnTY+GBYyeqfBatcNkDyLl
 Mc3g==
X-Gm-Message-State: AAQBX9emoMBJL05DmxBJLmHn7SwPExsS0Y1hy2Ae+QFnGe8h83RRmh+i
 3Mg9YcM1wUe8XEEXtmqbDJebZQ==
X-Google-Smtp-Source: AKy350Z+pAoBFOHt6y4dIOh6bPkguWLwQvMseDxCVo5Vb94KuCta4x47sPW/TNrt0a3cKlmKO54Ubg==
X-Received: by 2002:a05:6870:4687:b0:17e:997e:9472 with SMTP id
 a7-20020a056870468700b0017e997e9472mr7278684oap.31.1681145587821; 
 Mon, 10 Apr 2023 09:53:07 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 zq36-20020a0568718ea400b0017f647294f5sm4191896oab.16.2023.04.10.09.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:53:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/4] target/riscv: add 'static' attribute of
 query-cpu-definitions
Date: Mon, 10 Apr 2023 13:52:50 -0300
Message-Id: <20230410165251.99107-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410165251.99107-1-dbarboza@ventanamicro.com>
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Mon, 10 Apr 2023 16:53:10 -0000

'static' is defined in the QMP doc as:

"whether a CPU definition is static and will not change depending on
QEMU version, machine type, machine options and accelerator options. A
static model is always migration-safe."

For RISC-V we'll consider all named CPUs as static since their
extensions can't be changed by user input. Generic CPUs will be
considered non-static.

We aren't ready to make the change for generic CPUs yet because we're
using the same class init for every CPU. We'll deal with it next.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h        | 3 +++
 target/riscv/cpu.c            | 6 ++++++
 target/riscv/riscv-qmp-cmds.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b9318e0783..687cb6f4d0 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -54,6 +54,7 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 
 /**
  * RISCVCPUClass:
+ * @static_model: See CpuDefinitionInfo::static
  * @parent_realize: The parent class' realize handler.
  * @parent_phases: The parent class' reset phase handlers.
  *
@@ -65,6 +66,8 @@ struct RISCVCPUClass {
     /*< public >*/
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
+
+    bool static_model;
 };
 
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cb68916fce..30a1e74ea6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1679,6 +1679,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    /*
+     * Consider all models to be static. Each CPU is free to
+     * set it to false if needed.
+     */
+    mcc->static_model = true;
+
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 128677add9..639f2c052e 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -30,6 +30,7 @@
 static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
+    RISCVCPUClass *cc = RISCV_CPU_CLASS(oc);
     CpuDefinitionInfoList **cpu_list = user_data;
     CpuDefinitionInfo *info = g_malloc0(sizeof(*info));
     const char *typename = object_class_get_name(oc);
@@ -37,6 +38,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     info->name = g_strndup(typename,
                            strlen(typename) - strlen("-" TYPE_RISCV_CPU));
     info->q_typename = g_strdup(typename);
+    info->q_static = cc->static_model;
 
     QAPI_LIST_PREPEND(*cpu_list, info);
 }
-- 
2.39.2


