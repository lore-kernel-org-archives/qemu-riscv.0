Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F93CC6B1D
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvWJ-00033a-H9; Wed, 14 Oct 2026 05:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWE-00031i-D7
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:32 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvWC-0001r6-HX
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:43:30 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-14394530ec6so2728639c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971006; x=1792575806; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JHiFu4U4liJmndh7L3NobmTnl8BgwDY4UjBKZJ48w48=;
 b=hSs5pdIzfv4uxMZDPTC7ofbbVuq4NfraaXHdb8q91Z2i4xLs7DBugNZ+F2nTbZWmJE
 PU7vkRB91n5hR6vpak62YlJ+6x99YwR9HKYVtVpabiB4UBCjjp9ghkt6S9pchAaXkpXX
 qrImzcjVpoNg2/ONGFM8aBaMKlsKVBk6lrE2qrIMd7lRiEMRzpaIlQJQWlnyA26N2gal
 NPMaBd2tytmlrA/Cpe2hi30FmVhLTKe+HePR6xTyn57sfthfh5DJb0dfpYDxRFGIVnPV
 4aL7N3d8DZaTQp7A2jubuGt8pUyGg6rTnD23imZWdKS5FmCoRTmFvtSogj+2IjxZzMS3
 VXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971006; x=1792575806;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JHiFu4U4liJmndh7L3NobmTnl8BgwDY4UjBKZJ48w48=;
 b=llTGxeUyeuF49pobTYsTewFckFaiRJpaX3iSfagFuLUIsBF4DD68kD1gF663Xv2hb/
 MGxLfLRhtkI+6XV6inJI7fRrlCUu8X2jzJLs9XrFCGsRmJdzk0UPradupgIs8QUlHdxT
 352W6EV9XFlnheMYIyO+cEQpd23zZjiHzhMuTgAfBXX1W6ihzfj+Opj79cx3WzbXrP2D
 5X2Iix9yVBahDhAqyelaCHfojotboMB/MPOv2r9yafi2HjkdOD8V0b/YwdwiVMHfMLnJ
 10DLccIRs5nP4YdgcKG65R5jBJD4gMWRzLv2ku2icNHVTKl7HRopyRzATO7H9Dzz7vlK
 17Ig==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqQSCKh0h0rNJdtd1bJdI/BEdEESYSoiEVF4cfMsy5sTownhW5GQHeuI4RmuiRGZBA4L5G9tf7k882@nongnu.org
X-Gm-Message-State: AFq9FYJiBEZZmmwA3ESt8l0db2vkQlQAiASnOEkNvvRMCgFw3wD0Rkee
 Nua3SdZ700Wm077QqfalqfeWXc0MJUtigKyVK/wrvvP7GuD8VOsxrlkh
X-Gm-Gg: AYBFou0uaPoB8RE3xnSfK8x2Ma6Q6u1iOrUjpT04XzTIsJC4xV/KH1SlF+6RT58kYsa
 B4i+ATBF9tHiZmRsoLSAgLPGdGhEq3KOFIYSLLzGpxYhoPXXXtg8ojxe3kTG9M6Xl1rgnX9LfzL
 n9ckY4WQ3ncxlTObD3N/o31MF9KnxnxaV/B8TjAIY1UcVv4JMHzh2Q/rnH3a7n8MzG68nDgIeDE
 oGUfGEbEBt/XpCYJclhdC+1nhfsIzCpYQkVSFrDCW99lEDVLVOAKhWzfvjiWIRGAval0d4YzeUD
 topaS5k1eO2WBtAqzxN2770ZCB/1xY9k/T6XuZj1R1Iywa6igk6WY9LpyUMwJW5uYaplegwIj8y
 eGa2Ne1oTFLN2fE7jtL5Agt3k/SyyjBgX8G2SU2BUH42HPPMArOLnpYjpxyYnPB/5GUmH/49Iok
 Kj1LXVWcG5VcQQZ0lmexnj3WpgbS18NSwHlkbVig8nzNtUC9Ux8ZZE2KTOozj6COf5ysMqR7ZSM
 4BNdLELS8HhL5Qsug==
X-Received: by 2002:a05:701b:231b:b0:165:55e2:2d69 with SMTP id
 a92af1059eb24-16a640fcc35mr22716376c88.46.1791971006099; 
 Wed, 14 Oct 2026 02:43:26 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:43:25 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 21/34] hw/or1k/virt: use unique QOM name
Date: Wed, 14 Oct 2026 17:41:36 +0800
Message-ID: <20261014094224.1976-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("or1k-virt") so OpenRISC
virt no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/or1k/virt.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index a3ff903839b..ec20045a3d0 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -34,7 +34,9 @@
 #define VIRT_CPUS_MAX 4
 #define VIRT_CLK_MHZ 20000000
 
-#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE \
+    (target_combined_binary() ? MACHINE_TYPE_NAME("or1k-virt") : \
+                                MACHINE_TYPE_NAME("virt"))
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(OR1KVirtState, (obj), TYPE_VIRT_MACHINE)
 
@@ -548,22 +550,22 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "or1k virtual machine";
+    machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->is_default = false;
     mc->default_cpu_type = OPENRISC_CPU_TYPE_NAME("or1200");
 }
 
-static const TypeInfo or1ksim_machine_typeinfo = {
-    .name       = TYPE_VIRT_MACHINE,
-    .parent     = TYPE_MACHINE,
-    .class_init = openrisc_virt_machine_init,
-    .instance_size = sizeof(OR1KVirtState),
-    .is_available = target_or1k,
-};
-
 static void or1ksim_machine_init_register_types(void)
 {
+    const TypeInfo or1ksim_machine_typeinfo = {
+        .name = TYPE_VIRT_MACHINE,
+        .parent = TYPE_MACHINE,
+        .class_init = openrisc_virt_machine_init,
+        .instance_size = sizeof(OR1KVirtState),
+        .is_available = target_or1k,
+    };
     type_register_static(&or1ksim_machine_typeinfo);
 }
 
-- 
2.55.0.windows.3


