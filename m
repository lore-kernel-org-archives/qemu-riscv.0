Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35971606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lf68dkDy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf6z-0002xK-PI; Tue, 27 Oct 2026 07:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6t-0002sj-JF
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:12:56 -0400
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf6r-0002rJ-MS
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:12:55 -0400
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-157fe9d771bso4890256c88.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099572; x=1793704372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rIC7MLyqSf1PTjvgf0DPfcgctAOg/kiuIWLyJR9bmrI=;
 b=Lf68dkDyyWPMUVemaox69kcyGB9kT+hQOxejOgS6bGRizcUBvX8MoJe0hWkTJF/HJj
 tNf4lAhrnRWAoizPA7fTtqFOd/JHnYYAjk4tuKuKSo3G2lLREUlPkVI8gL1cgA+dfUNN
 gKUDxbLSxzRWV2wLlCMzSLDedZugA8hF//cOzzf+v6fYNgVF/yHHSsM6rjK6cWrQjaSm
 qY8b467vfR8cXj5Qg+K2KOfASlFa+btmViddP3kLs81/s28g+LEDWMwxjZ8eubIzgNr6
 2OcIoO8KSKDsUCY6VjyE9mT0Bbh9ZJXNB6WXSCfAbreQORB550/laZB9HwN3kJuVzq2I
 KA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099572; x=1793704372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rIC7MLyqSf1PTjvgf0DPfcgctAOg/kiuIWLyJR9bmrI=;
 b=NdyhK+Ka3paZlilV3YhKmlqSfNy8DAGkHCcGj4v8DmLdutghA3WnPb+pcfLV7aH9MM
 oUBzx0jgN9wWm1bJG10um+TPs2ld4LLhV5cSTVyWZM8aHhp2I8nSccw5BTKrelSQTp2S
 ow/NzQrizXBL2IZjduBjnd+o2gPTeG94OIP4l/dutBGmMg16U6/WkbKZoDhPPIwXMVRi
 MyuoN34IWhi0btxOmYiyFgMKt9/q9giv4QwtcoM83qZdylnfvQkI9XlheLFKvAO7lgLI
 jPG2MNIAuMuqFfF9rtEYzDOjZ1VayzyA4DXD1BScCrMcbGA1yFrMqax/0iwr9pg8nklX
 APYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy799C1zdP4yEnVNaYMVw0mwk5vHuHDlbb3d9ShOhZWdiKBD8WrIroR7nKmvRHax0s00Jo47rUZMSGX@nongnu.org
X-Gm-Message-State: AFq9FYJXdkp+RsgROuNCGDlr5Sghb2IwQ5geOhRyWI33D5Z3pebMDqDC
 1mT2CvE7B+HbGmdgQDCyCxMHdzZIfHKV3Tb2Wy2ykra259FxCJVxadCA
X-Gm-Gg: AYBFou2Xn1bdk/Bf2bV410UEYYrJqx4OSTEwO/V8iDRx3FaAt8oBNWPt2QhgIGw10yu
 UOtjkQtDhxVxDToLPA44NtcXaBgs9UDuizye/Hhw8zeprJXM9SN8o1lCLz/wyAuJCD0iwuHYder
 6jlOw9bTHprAVtddHlACT+mMa57nanHiFpfvKaDJOCTYyr7/s85abFqXPcddU5bUR8NFHi7+rJd
 TyqzMfBpbk8H1lZw9sNTgTIiD9z+2c2G+rC5u84KNUjFZduXhqra1fNSWCIKXZVQSnxj4S4WYYK
 WqujqB+V8UT1zqupvKfmpKkUatg1tNEibQR6SrWRDiZjnM9ZiyUgnOJufWJJCefvZ/mJ59zZzgw
 Pdk1o91rz1zL6zPIy3evHNe7VvacpbyJizqodxAA42PnRcWRFTUENYngLek8OivF5/u2UE/gTtO
 VWUu5TTWVFOietmLXY7SDg7fAr2dnDwBZAdgwY7OyUo0b+N+GdIy/KC8wCF9RsHAbF/MRihLfqI
 L+YYuZhVGUeNpiyGBisL4thWA2l4jFSUSzguycMMj59/PunktkUuh+ieVAzJ345p3gWPXi4FHW3
 v2BOoZesEbVn
X-Received: by 2002:a05:7022:e28:b0:14b:cf58:ce5e with SMTP id
 a92af1059eb24-1991b42085bmr18542078c88.0.1793099572020; 
 Tue, 27 Oct 2026 04:12:52 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:12:51 -0700 (PDT)
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
Subject: [PATCH v4 04/17] hw/hexagon/virt: move virt TypeInfo into its
 type_init
Date: Tue, 27 Oct 2026 19:12:02 +0800
Message-ID: <20261027111216.392-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

virt_machine_types is a file-scope constant, so .name has
to be a constant expression. Register a local TypeInfo from
virt_machine_register_types() so a later commit can compute
the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/hexagon/virt.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index b601cd77a92..4823b1d8ac4 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -375,12 +375,16 @@ static void virt_class_init(ObjectClass *oc, const void *data)
 }
 
 
-static const TypeInfo virt_machine_types[] = { {
-    .name = TYPE_HEXAGON_VIRT_MACHINE,
-    .parent = TYPE_HEXAGON_COMMON_MACHINE,
-    .instance_size = sizeof(HexagonVirtMachineState),
-    .class_init = virt_class_init,
-    .is_available = target_hexagon,
-} };
-
-DEFINE_TYPES(virt_machine_types)
+static void virt_machine_register_types(void)
+{
+    const TypeInfo virt_machine_typeinfo = {
+        .name = TYPE_HEXAGON_VIRT_MACHINE,
+        .parent = TYPE_HEXAGON_COMMON_MACHINE,
+        .instance_size = sizeof(HexagonVirtMachineState),
+        .class_init = virt_class_init,
+        .is_available = target_hexagon,
+    };
+    type_register_static(&virt_machine_typeinfo);
+}
+
+type_init(virt_machine_register_types)
-- 
2.52.0.windows.1


