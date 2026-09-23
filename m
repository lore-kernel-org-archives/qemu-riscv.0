Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D60CC9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9MvK-0003fS-PE; Wed, 23 Sep 2026 09:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MrH-0000AS-8N
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:18:08 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MrF-0006s9-Ky
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:17:58 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dce6e237so674463c88.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sKNecRa3tzG6HeYVTRQDuQ00e5AIYSJOroCNurGi9rk=;
 b=Nh7UGweVMK4Q24qKEB+jlxH3ioXSR1cYoSdkEXvHlOrQHWk1FiblvCh0f78Wz8DeVm
 VqsnEShxca/46/lm96kt4KR9Y84yGp6UjOBCJBn3Ik37pbXdCLG3uwsW1b+z1S6iA/Zq
 QACQTSxotYf8cVeVYwmtN5RtrxbpHfLf7ra9dh4n/YcUzOnsJF2Lw6vvnvSFr8BO7Jda
 eRukweiPKT20gAWQM1Pp4fLbKFQbq1TgTP1pqG8Va5x2jP8MiClsgYkX5EZSen6DNE/o
 dGeTr6nm+kaJhNJpODhFkEs5wuKfSuIetJXvjpnxA6tjuSpVwQP+vAGtY+WWmAsCNHBX
 m4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169476; x=1790774276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sKNecRa3tzG6HeYVTRQDuQ00e5AIYSJOroCNurGi9rk=;
 b=dtqJVIPpefyJLnWTPlpyDjoI9pwwCCYYNNdWdvq9MRQ9cryLgQlEFuXS2N4sgB1+Ix
 V51tFbI4L28fzGZFFduziVj17rAebeTbZVaZHeH+eEFRBWckXhewr9Sc3/RNeBcZdrjT
 iV+jqEjAoBduK5qMO2j0nyFLBOFxOUobwg1JEHvZ7XtHlHbAkDA90eg6Hy34hcbUqWo0
 b7B9Csu+u2tmjhY+OJYwmdOUDO8A3uGZSfqTzz910noZ0UGu4iufXH7xtzKCd95wa21g
 J7lydfJ1zkHF+f+fcErUShYF6joEkwPSngxw5JL6PRod1yD9nSdV5bkRN2cPCdr3J0Ib
 yT8w==
X-Forwarded-Encrypted: i=1;
 AKwUvBz/yIk8vxkViJhSSp4uB+dCOMQTLUWn+v1/LVYRph8EcZszZyblSpP9XWq2btQJacf4SA7xk/OygFYH@nongnu.org
X-Gm-Message-State: AFuF++m2W64OkIRMDh9a4mg+16WF2wRk4HmrbwHoQY8CFn0O4XGedMGZ
 9e5o4E3/fumTXCVAgMt3jp4z18z/sALjxyWq0XsC1F1dk8zTM9QTLkJA
X-Gm-Gg: AYBFou0KwCap7dDBRj14iZz94j6XC/hBDCWYCjyBGQyjfHa0loV1Uzq4kadFLAXBtNc
 P4epVzGhOSPqjwH3w0lJcTJszqXSBaqwV8hsffYYvwEG3/W/T32pYVFF6s2GU6eotKMwxKjPgl9
 JwvFpADmgrrbIT3rcKLAWUwihStGvGfaEWLUXQWNnmwQcQNTYSSjU9sdQgFsc2SXdldOwE2MJ43
 ujkZvcFCCGSCvXdChkXGPolyR3n1RfO3WNHN9gbO/VNcMaxPXsTW3sw22LEBh2E7oj513BIf+8g
 qYtK43Z5UjwsMiSOKFd1zpXOxjfMf5qtoGfYCA5z5t1P68LpQVKLqE5DKKjGwNSfqtWIEbhyEe0
 I+2bhf/k9kCVSXvDYLZMFy1q5DMulfg1NtKbEJryWWs/yirgp3OmZpdXnt3f3WLRCnnKyDbHMEa
 1cqZ9Xyri03nbv02SbgnZxlIZ/QzKt/AAPnmwzd0JKR8TzZlV+qctWEFjkXiwCX+h6Crj36tCG4
 uJqf+EC7geX8x6EK2Np8BGPXFejOBM=
X-Received: by 2002:a05:7301:db0c:b0:33b:96b8:3818 with SMTP id
 5a478bee46e88-33e8ddbe14cmr1954620eec.32.1790169475447; 
 Wed, 23 Sep 2026 06:17:55 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:52 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 007/114] vl: parse early options before target-info init
Date: Wed, 23 Sep 2026 21:14:41 +0800
Message-ID: <20260923131635.1894-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move the first argv pass ahead of MODULE_INIT_TARGET_INFO so later
target-info selection can use command-line options before QOM init.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 system/vl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 0d52c5d0a46..dc883de8274 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2910,16 +2910,6 @@ void qemu_init(int argc, char **argv)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
-    os_setup_limits();
-
-    module_call_init(MODULE_INIT_TARGET_INFO);
-    target_info_qom_set_target();
-
-    module_init_info(qemu_modinfo);
-    module_allow_arch(target_name());
-
-    qemu_init_subsystems();
-
     /* first pass of option parsing */
     optind = 1;
     while (optind < argc) {
@@ -2938,6 +2928,16 @@ void qemu_init(int argc, char **argv)
         }
     }
 
+    os_setup_limits();
+
+    module_call_init(MODULE_INIT_TARGET_INFO);
+    target_info_qom_set_target();
+
+    module_init_info(qemu_modinfo);
+    module_allow_arch(target_name());
+
+    qemu_init_subsystems();
+
     machine_opts_dict = qdict_new();
     if (userconfig) {
         qemu_read_default_config_file(&error_fatal);
-- 
2.52.0.windows.1


