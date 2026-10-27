Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F355606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hydqOZKH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf6d-0002n2-IV; Tue, 27 Oct 2026 07:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6b-0002lw-FL
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:12:37 -0400
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6Y-0002pE-RZ
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:12:37 -0400
Received: by mail-dl1-x122a.google.com with SMTP id
 a92af1059eb24-15943c9c005so58353c88.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099553; x=1793704353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tWBQk4bEVeLGRj54BncIbesmX+LyBIpj8YHweLEG+E8=;
 b=hydqOZKHjaTwmweeh2Ox++cQ5LPuE46N4bl7/G4yhVXRcoln8JrL7fij8gcxF8DcA5
 Dnh1NdPxuTZQkg2AifEyd4S88645AfdoDaHNZPyCtGvABAtj2ncr25qlrr/LK/k0qWbW
 saQYxexg6GPe7k39y0Xt/hQQeM6c02P838ysouFEdbVjwn7PVDz4kQUIZnPeZeO7gcZj
 1PjTQNOqU5HUtvgWLkabQict43CVYnsM3JZKZHrVp3z4LS7T9qTOqzmlOyy0kZZzFMVB
 Yn9VgNIx3hgTHhqYmi4nohfZoxy87GTwQQpfSdLCLQ7XFHwmJagZupLksEIYlbT20P0Y
 Jrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099553; x=1793704353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tWBQk4bEVeLGRj54BncIbesmX+LyBIpj8YHweLEG+E8=;
 b=pVpacwErw2DeO04grSdiRyoOH/AOI8mmwf13UGLCvCiqfV62kqasR5gNhB26y5zxlo
 R7KfIo21QIXqEgILTQn1hgRkQV7MNibXseKYjf4OCgLDzjsyoEqLD43a6euUnaxghCJ0
 oRnzm1F77TEJsY+xNZdf4N7zGBrblDBllRYVSjyOY83ZFOzjLnLQNXkd3kd4VPmEH/3A
 G4aYIZ9sKAFduS6kFRsiQKuxcpT8aQnMSMYmZ75pAuzv5gujFj2pd/r2aunVautn6kQb
 QWfLtf6QdmbVryd6obrzAujYL+YEWl7EruKj7YGUfHyHhY3B5NHK8BcrB/SM4dvw7zDv
 RqvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwfRovYH7PlZdOOj8x9TF6p5wW8P/6Jynp4/g4RoiDipr7wkz8gmoS+rImzwmkw1Vm/850xMzwc0BMH@nongnu.org
X-Gm-Message-State: AFq9FYLsdqwSmfqatj50aQPkstKyTwN4oZ5tnEF+0naItxZ21aqHO9Ex
 TketGiZttqQbdLX/2QQGlezlWMPZb5v2YtcBrEMxGWGLJA5oBWVbLY2L
X-Gm-Gg: AYBFou004nhDZqFNe7aYbqTJgVw/CPenxsGx0EWpRKBPiq0kov59MPxdl26rMAfMY7k
 Sm56Lx0m3gsobIU2BDuaxoRQGt3v++R20EhMUeMjSvBY7IcIp5/hODhGKs+SGZpFt2/hu4LNoVB
 ZvFfGlRs04DYsUZBF65jOSDu7lBrkQBJk+60W3JfgT4o5s7w8YASLZiYVkqR+n7F73hTqSEOJtQ
 du/QHYa81nd+YOYKyhfgnJhSsj8OscahoQGc7iFPV2LrjWDuAGD4IuGQxCEskZWgc+e0Oha7euQ
 kVH4z3CDOy0MNZz5gBucblkwaNKf/HLmPAW1qfYDfwF1uLLzGakv/5qpsUg9YFH+Du7JSENqcmM
 9CiYYGzxcoeN7WbJW8kLM+mR8akI9jWSjjNEUcKJ+9J0xPAbu16UZF2MjorupyabIQK6o++fcdY
 X/LYqb0rW+1KBmLQkZBoy1brbTUe/kcHEWVuNCagoNDo4Cir4RyFmfe+4jrq+s5Rx6QsJ2XDDC4
 eFQkxMIMknCXN+vcaXUgUWzh+N15A67N/6F01SahzUFPEABE7GrDuoblx/xKdciITZWEAHvgPej
 30avvE09ejSA
X-Received: by 2002:a05:701b:4517:20b0:14d:cb67:afc4 with SMTP id
 a92af1059eb24-1993fe816e3mr13100782c88.41.1793099553262; 
 Tue, 27 Oct 2026 04:12:33 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:12:32 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 01/17] hw/riscv/virt: move virt TypeInfo into its type_init
Date: Tue, 27 Oct 2026 19:11:59 +0800
Message-ID: <20261027111216.392-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122a;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

virt_machine_typeinfo is a file-scope constant, so .name has
to be a constant expression. Move it into
virt_machine_init_register_types() so a later commit can
compute the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary. The
other virt boards will follow the same pattern.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/riscv/virt.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d4b501802f6..f10a051d31b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1196,21 +1196,20 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "Enable IOMMU platform device");
 }
 
-static const TypeInfo virt_machine_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("virt"),
-    .parent     = TYPE_MACHINE,
-    .class_init = virt_machine_class_init,
-    .instance_init = virt_machine_instance_init,
-    .instance_finalize = virt_machine_instance_finalize,
-    .instance_size = sizeof(RISCVVirtState),
-    .interfaces = (const InterfaceInfo[]) {
-         { TYPE_HOTPLUG_HANDLER },
-         { }
-    },
-};
-
 static void virt_machine_init_register_types(void)
 {
+    const TypeInfo virt_machine_typeinfo = {
+        .name       = MACHINE_TYPE_NAME("virt"),
+        .parent     = TYPE_MACHINE,
+        .class_init = virt_machine_class_init,
+        .instance_init = virt_machine_instance_init,
+        .instance_finalize = virt_machine_instance_finalize,
+        .instance_size = sizeof(RISCVVirtState),
+        .interfaces = (const InterfaceInfo[]) {
+             { TYPE_HOTPLUG_HANDLER },
+             { }
+        },
+    };
     type_register_static(&virt_machine_typeinfo);
 }
 
-- 
2.52.0.windows.1


