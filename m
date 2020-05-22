Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQf-00056s-OP
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQd-0004wS-Nw
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23320
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQc-00023B-MZ
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKlqZLlysDpsMWqb9x7sq2PSoyNm/E67jzjXhQyZQjM=;
 b=Eez2RFfgl2SlEZ2syZiqTPqymVQ3csCuV3WELInGfj8ME5oFBz9ziKkZI+dAMu/Yz2EYHc
 /zOb4JC49LBOkgNc9T79Sz0hlduvDIPhpZwSJ79v5+/2L79HB8GFCbt69nrexFfa7lyQ6R
 rtxyhqBdOA4ip4Gvn0oOJlfcSbIdToE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-pvMyL7a6M4O9KDZIve_U4Q-1; Fri, 22 May 2020 13:25:48 -0400
X-MC-Unique: pvMyL7a6M4O9KDZIve_U4Q-1
Received: by mail-wr1-f71.google.com with SMTP id y7so4637346wrd.12
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKlqZLlysDpsMWqb9x7sq2PSoyNm/E67jzjXhQyZQjM=;
 b=XOjuYzU2fOIMqD4IWCZSN3lsM/6YUxcO7dUXgIEdo1Ew3g5K0mvok2SS5IsXbj1QNl
 XLrkVhi308xixE5pPw+UnnvaVYzKM2FpRRcFuQjXyaNQkeH0gRX8dLH/DYHiulUn46Kx
 Sd7eN7pacWTAIweSh4Zlb8wEjDjog8S2ke4bBuORL2IrQUl5rMnEW6PfAeK9uhF1isis
 yT/qjFKZmkCpyUc9+kXYooskndgaezqPAJvsyH0XUBd52aGTvisBF5Q/Hvk+axyXmeap
 btNUS7PryhtyNPudT7NH5nnXJl/AJ+eJ4o6Zqh7wYicpl8pP/zqLDrLGdfGc5yJsUx2t
 2UHQ==
X-Gm-Message-State: AOAM533mbeGZK8DeT70upczHTije5061BBFVCinEoTYj7z7zst8claEE
 FHHC9XjnUKFjuubukmsgJAxW+tJYaUP2loA9AYKylo6/ZA6oFt/IR9oP24DnAem1AsVpvVOe1QP
 A3OsnKojcgpX2Xao=
X-Received: by 2002:a1c:5a86:: with SMTP id o128mr9682271wmb.77.1590168347078; 
 Fri, 22 May 2020 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTP8rFIUlKc3H6EFr6gHRkvaDwD33dxzMmJ4mtju2zSH1qUPgXJzvaOUBSjJ8LzLQO5NgufQ==
X-Received: by 2002:a1c:5a86:: with SMTP id o128mr9682241wmb.77.1590168346814; 
 Fri, 22 May 2020 10:25:46 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id n9sm9668946wrv.43.2020.05.22.10.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 07/13] target/riscv/cpu: Restrict CPU migration to
 system-mode
Date: Fri, 22 May 2020 19:25:04 +0200
Message-Id: <20200522172510.25784-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 10:36:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:25:52 -0000

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/riscv/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 059d71f2c7..6c78337858 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -485,10 +485,12 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
@@ -544,13 +546,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->do_transaction_failed = riscv_cpu_do_transaction_failed;
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
+    /* For now, mark unmigratable: */
+    cc->vmsd = &vmstate_riscv_cpu;
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
 #endif
-    /* For now, mark unmigratable: */
-    cc->vmsd = &vmstate_riscv_cpu;
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.21.3


