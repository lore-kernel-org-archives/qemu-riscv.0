Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F336C46CA1
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGjT-0007UN-KH; Mon, 18 Sep 2023 12:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGiv-0006Xb-0H
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGis-00044u-BY
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:44 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so12373094a12.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695053021; x=1695657821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fSCS2zUfZAE6ogrinmDPrOXdED/BfB+BaLaX0u0zcLg=;
 b=I1pJwwFXP/mWsq3ecWE/hq6imgvU2NbrcOUVjcVvhBpPcSaBx0rFBTwBSz2dw2Il5C
 HKXKw4QQsiwGYm0WJxFdJW3gHy2u6x48HrcA18/cNAsnBjR57Uh0p6h05wq46Epbjh6j
 XXv8wZVlyMK86hWrhVBxuIXsPFIzUW5snf0I9hXVaH/1iCsd29bvKW8bIh3Payzv004U
 QIIsdXIRxNs16z6pHCNZFNjYfwMzROKvZTOtX/WyKNo8EAoWec8ByXdTAO4tAzZeBroW
 veLbVu1wEhvWcaz4FgF6cFfVAqWLc3mj7Ws8dNWyviAIiHYe8JVnO/acHLSxf+WT5vK8
 eQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695053021; x=1695657821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fSCS2zUfZAE6ogrinmDPrOXdED/BfB+BaLaX0u0zcLg=;
 b=XwMi5d21bVZ9nVe1d7bzRRU7uFtT/0luvSFtOnD2gtjL8DQJyvqKbywiJTzcLDOhkv
 6H3LjSglA1qNuwDy9gWK4sh+rKNYJInWcOS4CkekCX/6AJd/Q/1Kwa5L0hV8v9bzR55h
 n8xBS5TxuIUG2JpK7kUQ6SUUGomeElt8WWVUVDq32dQ2WL9E7v+VSwqlMPj4BIFjCDLZ
 tlA6TDDyHW0L61jMZFiTgKyNBtawwK44Yyq40+PD1bdCJVmpMXBmDeXxNM7imVVUC9Uf
 /+9+yxi/CfYOW+HZN2W/zVrygjrBbadYOFruyJ2jv5RPP5YyCFBjRr1l4AaQvswzSmZn
 cL6Q==
X-Gm-Message-State: AOJu0YwlJGUE3xBOT1D2ephH2pFjYjJF+tLWoQa3ANu/rlVRDPXCeIkJ
 6K+t6NnqwpJ0R208+eTjAXWCuw==
X-Google-Smtp-Source: AGHT+IFbTianQZOGFuSjVlX566F74BXdJs5acopl7EmpAQkaG51ohmS+uPCdYH5B96NaIiVcrKe7YA==
X-Received: by 2002:a17:907:62a6:b0:9ad:cbc0:9f47 with SMTP id
 nd38-20020a17090762a600b009adcbc09f47mr116109ejc.12.1695053021006; 
 Mon, 18 Sep 2023 09:03:41 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 ck9-20020a0564021c0900b005231e3d89efsm2684962edb.31.2023.09.18.09.03.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:03:40 -0700 (PDT)
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
Subject: [PATCH 08/22] exec/cpu: RFC Destroy vCPU address spaces in
 cpu_common_unrealize()
Date: Mon, 18 Sep 2023 18:02:41 +0200
Message-ID: <20230918160257.30127-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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

We create at least one vCPU address space by default in
qemu_init_vcpu(), itself called in cpu_common_realizefn().
Since we don't have qemu_deinit_vcpu() helper (we probably
don't need any), simply destroy all the address spaces in
cpu_common_unrealizefn(), *after* the thread is destroyed.

Note: all targets were leaking the vCPU address spaces upon
vCPU unrealize (like hot-unplugged actions).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/cpu-common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e5841c59df..35c0cc4dad 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -224,6 +224,11 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 
     /* Destroy vCPU thread */
     cpu_remove_sync(cpu);
+
+    /* Destroy CPU address space */
+    for (unsigned idx = 0; idx < cpu->num_ases; idx++) {
+        cpu_address_space_destroy(cpu, idx);
+    }
 }
 
 static void cpu_common_initfn(Object *obj)
-- 
2.41.0


