Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF056606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AO1T5oDM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLf7E-0003AZ-Bl; Tue, 27 Oct 2026 07:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7C-000391-Va
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:15 -0400
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7A-0002u4-Eb
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 07:13:14 -0400
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-1a2761c69fbso2907024c88.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099591; x=1793704391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=32XnSUYVfaw8pDaSjJQ1TXRXq88HLrWvXnAIvNKMIio=;
 b=AO1T5oDMdon/62b9SZ4m8hmtO2jxQcSmgs3rBOehvGshXOOWGd4G4nVmry9rzLmJ29
 5S2fChuUHUj6BHgFboZs+U5hF+kWH4IkENdjOCeEAVhEEUiNfAvau0HIFe9W/wJ6BjlS
 HkoF0Km3bG7i9U9pl3I1xPwNGhoVuEYJsoNWfwy9I8+vQy/niXcf6lH5xspHTGTHYWnT
 KAtPwWiikjS1CW81tUIJk3vhzSIILKbYRn+2BHl8CBnM0pNvuvvNLrb0OBaE0jljOitI
 kON78j9KrJcJwTMVETpRERSbt28qWkmZCS/WYqSHjqiPymjr8byEbT8yS9IIy4T9KgUD
 P5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099591; x=1793704391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=32XnSUYVfaw8pDaSjJQ1TXRXq88HLrWvXnAIvNKMIio=;
 b=F6lIvVfyHFRWi0yNuCA9wpZtcNM7SG2EOP+J9G6F7zwR9QI/L2aiSPmw6jHiLOlhC+
 AwVFzyOaVOn9fqYHAWwAv5bCse7W0S83/TDGZfgZ7m4PAOz2huTMTx8hbqnhRuso4X5g
 xQjS4Au3N0brkeEZmrmRkL/usnYNJi+SRbW3g7g4/HahYXFsRAWFjEsFhWmcQHbXYLZo
 K5Hd8TBT+ZphllXC5N4wbazcwM76ZVQJsKWseR4PGGJTvNosa3cH4+kMNF54pYaUf4jV
 i2mfaWaU3zRmAvM1cfPExF46z2eT3hmE2dWMynSDnPiVWK+/34ipk4fhJw0kKBY3daxK
 ciJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmnu+DD8GD6WXMVxuMuM2x9ImF4lQQMsRKo58E681qAju8qchWOiA0zwJKyA0oUfcQtE1ssuXLgvsA@nongnu.org
X-Gm-Message-State: AFq9FYJX0RabNBvfwbVhfeAUL4xAVbyKqQeWYLaG4SrkWAmXpJeMheCi
 7/YyC0jcDwNyRXgWKR/BkU0vgCwAsRJVS/XDdgYfkqWybbVNr9MAssbB
X-Gm-Gg: AYBFou1RWx/OKzQ1iQc7nXP+x6YgNsk4BGga/mVrYMrG7ljCvfW+UzHR6yo4RXtbRhv
 TXq9SuZg7jXQRzzyttK8IsplTLUK2gXcohVqWdFjDxYaYe9gW2VdE5/FkmbCW94DtFo7t2uAgKF
 kB6Dd49ZQwmos+0rrO8MdJSLRGk5UbWYr4f/Pc/w6xLxMKE0JhRNSpvFZmSGWEO10VX0GqDxD8s
 mCy/Eig8ginMpJIxgOBEkCQ1RyP0wl8VNT9RcD8y2moNWzJZAaAbN8JKTPmWE/mhFl8mEH0uUTx
 XKR7NqTp7y3EG/4tQFeeAwY2Ko38mlZYAPIs1/44TQIly7Voi0ma5LdWGX1VPxRMH2xh3I2GprP
 A1ipLoMz/Oo3YPkRpuJZzOxClvAg731nSue8vnOS/aj79PHQOs91JiDATdUHucsDVRO3LbbYgTS
 d/uvg57LWZuTXbR9LjAnKRc0S9ckfiGZoB8eVGfMQQQNQNRCaXv/tDR6iiOG/iapPnTx2n2MJKv
 NxBRzaAErE9wW2NI6SGVw00dIKd5Bmqx+J26G0sBwFiC/7ILV66XNxPSBcECZcmEKMNWqMfB10I
 fRI3GS9BucWL
X-Received: by 2002:a05:7022:e806:b0:145:287:ce91 with SMTP id
 a92af1059eb24-19935625d41mr16005049c88.14.1793099590872; 
 Tue, 27 Oct 2026 04:13:10 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:10 -0700 (PDT)
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
Subject: [PATCH v4 07/17] hw/xtensa/virt: move virt TypeInfo into its type_init
Date: Tue, 27 Oct 2026 19:12:05 +0800
Message-ID: <20261027111216.392-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1234.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DEFINE_MACHINE() keeps the virt TypeInfo at file scope, so
.name has to be a constant expression. Register it from
xtensa_virt_machine_register_types() so a later commit can
compute the name: "virt" for a single-target binary, and
"<target_base_name>-virt" for a multi-target binary.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/xtensa/virt.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index 271f06e0953..638007f6d32 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -115,8 +115,9 @@ static void xtensa_virt_init(MachineState *machine)
     xtensa_sim_load_kernel(cpu, machine);
 }
 
-static void xtensa_virt_machine_init(MachineClass *mc)
+static void xtensa_virt_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     mc->init = xtensa_virt_init;
     mc->max_cpus = 32;
@@ -124,4 +125,15 @@ static void xtensa_virt_machine_init(MachineClass *mc)
     mc->default_nic = "virtio-net-pci";
 }
 
-DEFINE_MACHINE("virt", xtensa_virt_machine_init)
+static void xtensa_virt_machine_register_types(void)
+{
+    const TypeInfo xtensa_virt_machine_typeinfo = {
+        .name          = MACHINE_TYPE_NAME("virt"),
+        .parent        = TYPE_MACHINE,
+        .class_init    = xtensa_virt_machine_class_init,
+        .instance_size = sizeof(MachineState),
+    };
+    type_register_static(&xtensa_virt_machine_typeinfo);
+}
+
+type_init(xtensa_virt_machine_register_types)
-- 
2.52.0.windows.1


