Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVPP-0005sc-Gm
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVPN-0005p5-Ey
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:59:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVPG-0004BD-RC
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:59:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c8-20020a05600c0ac800b003ed2f97a63eso1600424wmr.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678903161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSr7AA9LUspzqEIDUMrwS93tNfDBE7VaQHLkhTtwqQI=;
 b=CA3aWzQKDfY0/tjI5SY4VdvE6Ht0CUlxoIZOVbH9pm1rUFjMkq+Y8v/Jbz5QlmbecT
 T756Xly0DeGbnrH2gh7vRdsqxDWl1tHcUxZlsZRpTuPsX5ssL++DA8GCkY2mRzPZX34q
 F2Z+elwhIPVMmQwDQUzSZuBR0hl8pZVwCK9E1HXKgXin59IKuADvQdJZwwuZ7b17fzfl
 qC7MgSFK0cIZvDdDKwTRs5gEwCq9VnN9VoI1/YlguUOD6BoAWCdJPZcNImZpNOBTR/vX
 /rm6QKzyU/dXyyNSw55pFYqEoEti+mRdN6Wt72rc68F6KgS1eUBp1yyhMH36PoOMJTWK
 H9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wSr7AA9LUspzqEIDUMrwS93tNfDBE7VaQHLkhTtwqQI=;
 b=UKvvuia6WX1EEpF92otsf30nqJSBM2duwWA4Rqigu76V236aiQEypBbChpyVJON2Ie
 BNhbyo3JhgTkjHlV4cMXbBooX6AndNorjn86b2DkVABMLF1wH2kD57RbaI9wLs5fjEry
 O4/RSBgawnq4D7rSqXAzuxJHrtsmEDXM0RDO4cXdBo/4ICGR7RY1ImSdzc9BAA93zEbC
 wkcGZw+qK6hGN5jHHC+vIMQjW8AJiKpuAU0LOgKbkU03DzR50cOReYy1/W+bhqraJ6j7
 9KoQh/IqvqRLOkBXahITt+c97Y4gw+Xq5vl8HCtSAJgT50dW10pdshJbShBKLKBrKLsf
 QqsA==
X-Gm-Message-State: AO0yUKXtQliNDmFx7CLrulTRnF0fqTDxMvk+ba6rJhxxtj+MjdkMcHGp
 HHJcAOgY7YGEyyQowwe7UiO+lQ==
X-Google-Smtp-Source: AK7set+mHJbSwrqVJ70M9KLWvjfzNuhPDLvz+h4o3g6e6TAAcXPmBfPAJtxti6m0HXCX81RTLVPvUw==
X-Received: by 2002:a05:600c:4f91:b0:3eb:3908:8541 with SMTP id
 n17-20020a05600c4f9100b003eb39088541mr19279346wmq.2.1678903160774; 
 Wed, 15 Mar 2023 10:59:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003dc4480df80sm2467357wmj.34.2023.03.15.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:59:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80FD31FFC2;
 Wed, 15 Mar 2023 17:43:32 +0000 (GMT)
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
Subject: [PATCH v2 11/32] tcg: Clear plugin_mem_cbs on TB exit
Date: Wed, 15 Mar 2023 17:43:10 +0000
Message-Id: <20230315174331.2959-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:59:29 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
adjacent to where we reset can_do_io.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230310195252.210956-2-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 2 ++
 accel/tcg/cpu-exec.c        | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..176ea57281 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -65,6 +65,8 @@ void cpu_loop_exit(CPUState *cpu)
 {
     /* Undo the setting in cpu_tb_exec.  */
     cpu->can_do_io = 1;
+    /* Undo any setting in generated code.  */
+    qemu_plugin_disable_mem_helpers(cpu);
     siglongjmp(cpu->jmp_env, 1);
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..c815f2dbfd 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -459,6 +459,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
+    qemu_plugin_disable_mem_helpers(cpu);
     /*
      * TODO: Delay swapping back to the read-write region of the TB
      * until we actually need to modify the TB.  The read-only copy,
@@ -526,7 +527,6 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
-    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -580,7 +580,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
             qemu_mutex_unlock_iothread();
         }
         assert_no_pages_locked();
-        qemu_plugin_disable_mem_helpers(cpu);
     }
 
     /*
@@ -1004,7 +1003,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
-            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
@@ -1029,7 +1027,6 @@ static int cpu_exec_setjmp(CPUState *cpu, SyncClocks *sc)
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
         }
-        qemu_plugin_disable_mem_helpers(cpu);
 
         assert_no_pages_locked();
     }
-- 
2.39.2


