Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D38CD13D2
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGjT-0007SU-GO; Mon, 18 Sep 2023 12:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGil-0006RN-CH
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:39 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGij-00041z-43
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:35 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso78838751fa.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053011; x=1695657811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkWYWSxfkqk4N63ErKsmSMdZBfBTpiMgD55n/Z94pZY=;
 b=FzpzEtCctgoRwBb5doYXBYNxMzfvh6ANplCexRclHNpMLcN+5jI74oHdDIZroOSuAg
 6gAhOgtM6Fby/GXgFakU5I5ofxJbzTsdoOQ0zrrdl2Wz8L33MysodTMvM8j8HA6faI7g
 2LVuvFG5u92WPEC1+zWVNxGf5p7tc8knu6w77H1nRdtfn1j44F6d7rkTzQITSkHQZy1F
 PNMyQaadCZoMlgou5OycbaeV3ywU4lEV4L1VBfzdt/SLBz1wh4aTREzu2h1L0fDkbvC/
 IzeAyXTRxqEtyvJEvjR9wVFBDNMK3ytzWaAXAPgloGvXhUnQFjuE9hKjkMG1T4pvv616
 R29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053011; x=1695657811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PkWYWSxfkqk4N63ErKsmSMdZBfBTpiMgD55n/Z94pZY=;
 b=neORlWjv8wcl4jgQOQ0bjwB/Gc/EvswZgACIWLOcxj2f2Bd8ZzC5EvRXofK/6m3Qsw
 HB2qb2ltWnz2kxygDrCH1nvHAf7kZhFjYFawPaYffE4GZKcxepvbbApomB9ACzX6jbSu
 60vzGPNOabKM1HURHgAkwixDnAzxNNF4mNVDruZh0OTTNcLtWo1/HODXl2vIPkLUiy11
 R87vZLjjS7ilHZ4dqarubd5LpKsTdvvsU5DbOTrSvLGXxsKs8i/JhtPVR47jI3bfOWJT
 y+4l2TbU+QXxH66DPsbL1PL/JPewOI8pfT5FJpsYSdta9kkV8FuBtE3VjEMdDjBi+/8i
 pGSQ==
X-Gm-Message-State: AOJu0Yw/45H5gFd0xODwgWWHzhi0WhaFAybEtto0BYn8n7X7DeXkZmMN
 iMnEOvKR7CDa1dRXMKAr0UUrfA==
X-Google-Smtp-Source: AGHT+IG9O7CyLiK/FqL5kcaE3CE/w3qepssp8f0K4INaJRuY2qrHmvactqhGEUSaLUJRFKiBVFJyXQ==
X-Received: by 2002:a2e:330c:0:b0:2b6:d13a:8e34 with SMTP id
 d12-20020a2e330c000000b002b6d13a8e34mr7309381ljc.46.1695053010845; 
 Mon, 18 Sep 2023 09:03:30 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a1709061d4f00b0099cf840527csm6708419ejh.153.2023.09.18.09.03.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:03:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Marek Vasut <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Brian Cain <bcain@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alessandro Di Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Luc Michel <luc@lmichel.fr>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>, Stafford Horne <shorne@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 06/22] exec/cpu: Call cpu_remove_sync() once in
 cpu_common_unrealize()
Date: Mon, 18 Sep 2023 18:02:39 +0200
Message-ID: <20230918160257.30127-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
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

While create_vcpu_thread() creates a vCPU thread, its counterpart
is cpu_remove_sync(), which join and destroy the thread.

create_vcpu_thread() is called in qemu_init_vcpu(), itself called
in cpu_common_realizefn(). Since we don't have qemu_deinit_vcpu()
helper (we probably don't need any), simply destroy the thread in
cpu_common_unrealizefn().

Note: only the PPC and X86 targets were calling cpu_remove_sync(),
meaning all other targets were leaking the thread when the vCPU
was unrealized (mostly when vCPU are hot-unplugged).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/cpu-common.c  | 3 +++
 target/i386/cpu.c     | 1 -
 target/ppc/cpu_init.c | 2 --
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index a3b8de7054..e5841c59df 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -221,6 +221,9 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 
     /* NOTE: latest generic point before the cpu is fully unrealized */
     cpu_exec_unrealizefn(cpu);
+
+    /* Destroy vCPU thread */
+    cpu_remove_sync(cpu);
 }
 
 static void cpu_common_initfn(Object *obj)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cb41d30aab..d79797d963 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7470,7 +7470,6 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
 
 #ifndef CONFIG_USER_ONLY
-    cpu_remove_sync(CPU(dev));
     qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
 #endif
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e2c06c1f32..24d4e8fa7e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6853,8 +6853,6 @@ static void ppc_cpu_unrealize(DeviceState *dev)
 
     pcc->parent_unrealize(dev);
 
-    cpu_remove_sync(CPU(cpu));
-
     destroy_ppc_opcodes(cpu);
 }
 
-- 
2.41.0


