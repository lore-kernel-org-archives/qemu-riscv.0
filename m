Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAS-0002RG-LY
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAP-0002O5-Tz
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAB-0000j1-8q
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id h17so4044078wrt.8
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVMGZ9W+Y+8un4w4HSts32m5VZ1Mq2mPxSxu1YHDmSY=;
 b=X/6TnPJT6tqTp8EMSaOU8VaZjDmCUXTULuB0vNEzfzgPxpnVgqWPTa6PXxP3yGbYx4
 Vc7nVRjfam/KU+VrTGF/gzOqSPOYnvq/AhcN2KyGjMktpgXD8da2wHwYpuKSavipbSoV
 S2ie8EDVfHIhao5VhCIflW2KM5UNrnSpdMJ7W+mej+yVQcOS7le/MwL6Fzs89gCVfrNL
 82LzZVGb67x7RwufXHGwizCn8VXBa6F5RdqRD3N6t4OtWZ3VDChYx2WMlk/kza4ooRHV
 vPz6ZGN9U8vdj+uAFLVoggn2+wKvFxFicMJOMtUhXlmvIfqMvHecMKxry0QaN2lNqoXl
 uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVMGZ9W+Y+8un4w4HSts32m5VZ1Mq2mPxSxu1YHDmSY=;
 b=JmuFI65udPARG9TO8Q2oyQQ3Y+hphr/TBqd/XlceyRYZ/NNReMyX2lDqjDhXAwKX/n
 vHs87y0Wq/HfRtG87/qSsgCWMhOIiLdrNwREIRjGqr8NsQnPUqy0YoTQtPGJfVG159F/
 yPPWiA0GSuIyRzkPyGXTwCTIItaL1rf7SfLcFgGZECLS0uStiewc6MZi1eTQs98pEqbU
 MmBGNKl1vVk0DymGsEt6TZn/Y+Wq7iNbo/XPlRbcrbxK9GCReviWP80JoH36qCReuTY2
 9+v3wGqY8pyap8kD6UzWrm0k7+p5fEOkk/4gB2kvyXG/Cojft79zvnTfckKuURYYoEyK
 ftmA==
X-Gm-Message-State: AO0yUKWHkHSgT9lrxS7qoksaMrxU/irbKRlj6SkF7pKDbNxDc82Lthyl
 lXoCRD2hoyKOv2VPNFTfe309BA==
X-Google-Smtp-Source: AK7set+F7IXs/0idLlAovaPXV7OJdOVRa0JLhKBiYEEMAQS8mDFX70ypvRshcVMN2d5WUxCmoyXaKQ==
X-Received: by 2002:a05:6000:1b86:b0:2c5:594f:121d with SMTP id
 r6-20020a0560001b8600b002c5594f121dmr2713217wru.12.1678902225527; 
 Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a1ccc03000000b003eb192787bfsm2556244wmb.25.2023.03.15.10.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D4BF1FFC9;
 Wed, 15 Mar 2023 17:43:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 17/32] include/qemu/plugin: Inline
 qemu_plugin_disable_mem_helpers
Date: Wed, 15 Mar 2023 17:43:16 +0000
Message-Id: <20230315174331.2959-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:02 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Now that we've broken the include loop with cpu.h,
we can bring this inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230310195252.210956-8-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h |  6 +++++-
 plugins/core.c        | 11 -----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 6bf4bce188..bc0781cab8 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -14,6 +14,7 @@
 #include "qemu/option.h"
 #include "qemu/plugin-event.h"
 #include "exec/memopidx.h"
+#include "hw/core/cpu.h"
 
 /*
  * Option parsing/processing.
@@ -204,7 +205,10 @@ void qemu_plugin_atexit_cb(void);
 
 void qemu_plugin_add_dyn_cb_arr(GArray *arr);
 
-void qemu_plugin_disable_mem_helpers(CPUState *cpu);
+static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
+{
+    cpu->plugin_mem_cbs = NULL;
+}
 
 /**
  * qemu_plugin_user_exit(): clean-up callbacks before calling exit callbacks
diff --git a/plugins/core.c b/plugins/core.c
index 04632886b9..9912f2cfdb 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -553,17 +553,6 @@ void qemu_plugin_user_postfork(bool is_child)
     }
 }
 
-
-/*
- * Call this function after longjmp'ing to the main loop. It's possible that the
- * last instruction of a TB might have used helpers, and therefore the
- * "disable" instruction will never execute because it ended up as dead code.
- */
-void qemu_plugin_disable_mem_helpers(CPUState *cpu)
-{
-    cpu->plugin_mem_cbs = NULL;
-}
-
 static bool plugin_dyn_cb_arr_cmp(const void *ap, const void *bp)
 {
     return ap == bp;
-- 
2.39.2


