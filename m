Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGqSR-0001id-15
	for mharc-qemu-riscv@gnu.org; Mon, 01 Mar 2021 16:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSP-0001e0-9y; Mon, 01 Mar 2021 16:52:01 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSN-00053t-Lp; Mon, 01 Mar 2021 16:52:01 -0500
Received: by mail-ej1-x62f.google.com with SMTP id w1so31184299ejf.11;
 Mon, 01 Mar 2021 13:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
 b=qKbMpv8R6uGKaW+uF2TJniKppsrNgGG8wOsfeSa8V1qx0PoHJAGlfGGLA5R+WHb0fA
 /TVZ3p3JWNmsfeRoSLinNoSa9Q4QzdUMgVOiGt62dn0mErZVAgpEPxQLoHKaUNDdg5J4
 a15/5NwKl9JsVGvL8+TiIUSft7nY+gP5CCPWdcOsvBPlZY8nzuI8GR0CbxQ+gobLheql
 yP9edRwWF41VhFuHjKjsuMuZ54h3GLNQBjoAM7re+X0+P3ztQF2mFr3dyfp2Xeg1p7vP
 LIYIZd00wkKzgSK6bO1a+XbuJVwhTnxccj2HOta6itnVQAmdXMyaXSsduWP2pUMgNmnI
 5qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
 b=Vmuj/djOTCgGiZgiRJyZPDJkDLFoH5OYgGChFdpJzBMMkJxorb9JbnbgFee2ryeRIu
 dSs0QuHUL9+wQoMjZdTru66j4kWcjPfWCjaGkwbnZwWK8C3DE/iAib5895BBrlzryug4
 2rdc+z7/7hOqbdB6d8dMvYf+1k377rnP06zCHxqPm45Z1f30l/Ub7WGzadStyVcrMqMJ
 zHPMDv6/B1R8e12QGBOcXoLaOOFsCBDUZUpScL5vLPWtTC1Rw0k8+KtzOTIsrinOeUn7
 vNRazTXWpvyWlJnE2Ti+lA0FYZ31sQxN33ifs2bHHALDNXsIDYzch/6b4lNIzex9tFbM
 nR2w==
X-Gm-Message-State: AOAM530P1L3IeYgWA7spBSnKNYrB7xneiKyv9+FvG+bLH4P3ovFwID7W
 iELULJu7C86Jewov3CNBs+sxKAph3yU=
X-Google-Smtp-Source: ABdhPJw94wwLPTSrVmDa5ZJSx4v6K75gqF320i50dk/ACFSxUOLBbuaPMoMpLry5l7fTFqx1V/FU1w==
X-Received: by 2002:a17:906:5016:: with SMTP id
 s22mr17940611ejj.550.1614635516679; 
 Mon, 01 Mar 2021 13:51:56 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k22sm16117927edv.33.2021.03.01.13.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:51:56 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, Anthony Green <green@moxielogic.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Marek Vasut <marex@denx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Chris Wulff <crwulff@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Claudio Fontana <cfontana@suse.de>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 06/17] cpu: Directly use get_memory_mapping() fallback
 handlers in place
Date: Mon,  1 Mar 2021 22:50:59 +0100
Message-Id: <20210301215110.772346-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Mar 2021 21:52:02 -0000

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 1de00bbb474..5abf8bed2e4 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,13 +83,11 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->get_memory_mapping(cpu, list, errp);
-}
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
 
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
@@ -419,7 +417,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.2


