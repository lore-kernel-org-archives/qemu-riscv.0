Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97EBC98335
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 08:18:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xANa4-00087w-L1; Sat, 26 Sep 2026 04:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANa2-00086q-WA
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:23 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANa0-0006nq-EG
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:22 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-33bb1a50f6fso862805eec.2
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410579; x=1791015379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HLR3DcDRFMXee/h9DcZWZdigMHQTObO1dl0aI6gcriM=;
 b=Vg+k/ASQD6JOkPO9QXAm5J9Ha1gLZFJpC/LEj++NoahVWrDImATqRYyqLEjbyXZwQ8
 3LywuCA7RwtG9b5KVNcSo9+XTvXUdikzBs34HDmMQHzbcH/gaAb5C8Kx0F4I/sTb46OF
 GUEmieXCiPw4MxpALpFSGuNhyqVhVLPfkG4mpqdhOPTo09ET7oQxXBdC0633vwfhv0BQ
 eALEQjQMBah3P8+GDMg1aek54Pa9OIUTHoWRhqEXNPZ12luDB+PDv9Li8g0SGZZFbeKn
 LLmWWDUtBn+NmwFqGBOPfFBS3Y3Nsu1F6Pcjx4I8iSHHtpBIxTIy3zEvUclt+gED0AyC
 mQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410579; x=1791015379;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HLR3DcDRFMXee/h9DcZWZdigMHQTObO1dl0aI6gcriM=;
 b=iHHS5Xnsm3QUhdNoqmpHXGu9wlWynGNmKYyp1hytC3CgRIGofhAeaISo0hrnr3LH19
 QBL+dcY9//xFHqQjBmM0MtvF5lYptCly6apuv2X07qDiQaBRvU8kXTW/ULAjiZzLujNs
 xZn5euE9QDzsaEGNsXI7GYha0N9VjOopvBF6u7sqQucqfCBENWQF8mUqpo5gpVojNy4+
 u4GEkGV955lY37gXODLwzGgYWSvEW9VhgR847DOY5AAF1Ql7wbX5zaKnu564RC/SZGM3
 ojLgdARDlMwoGSOjS8RFgE331J+w27QfzP2mOxMowfPiJ0Tc//4Nh57bxmXsSWrYxXEu
 NcXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw61emKCG3Ph50gZRIurqCYC7naxKxx8T4Pbm3AHYE/d2v9r+fh7M9/3qshIf2bROhs7oxv25+NJEqo@nongnu.org
X-Gm-Message-State: AFuF++lNhxdfge5J3Dvj8G0aG/JlaBU0L2ikL9bzQEmOSI2UePdmw9Ps
 59EMDFQ4lQyWPNEROohV2KGNg7TanotRlLZHCLskC9MXAROTSzsCGqYm
X-Gm-Gg: AYBFou0MsqGk2BeI5n+GU23m3gZYiK+bs4X7HaRcjme7wLaOR8TsjPyW8Y9dFP4fgyo
 7pHF9b6klwjDS13kB/FuvkSFl+s2JW1OMDqNg/LG8JiFitTD8TMMOB6D0sn6hyVNgA7FDyp4YnF
 iQkYcf+DUZ3qy99p4Rvsj1LClO5T30WgenAIzP9z4saBCXqTDQD4ChntGT4iGJCE4Ra9bVgYC97
 vp5Lz4UCu3BwIAzltlp9fhCSaoNNLKx5o3YYLIKinhfsD8C5lD1umMwglYTPxjINUM/NE/C1AHL
 HNm2ujAPH55N7vFYuXX2nsxSJPejq54GIdWUcxfdgnvTr4ki4mWDZaRI/TGZ/F3qbP4wi3M4t43
 LW7qitoW+nj/ZfUiDhJUBotP9f/qZw9vId/DjC8Pups7TgSs66gpjUQAuotfrYk2ba/00Emg2tn
 j5v2OY4x/9JsM1jamCv0HSXhLBTPnAybN9n9tDdBd1lgNG2nzmpk5wHjKy7UV6qYMC9RavMPJa/
 JyvPe9HjR5g7EW4NInm8Kxw077QQuc=
X-Received: by 2002:a05:693c:8816:20b0:343:6622:ee15 with SMTP id
 5a478bee46e88-3436622efc7mr492061eec.11.1790410578058; 
 Sat, 26 Sep 2026 01:16:18 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:17 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 03/10] hw/arm/virt: use unique QOM name
Date: Sat, 26 Sep 2026 16:15:43 +0800
Message-ID: <20260926081551.29-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("arm-virt") so ARM virt
no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt-* via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/virt.c         | 3 ++-
 include/hw/arm/virt.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3eecf094bcc..c8ffa1ceaf4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -123,13 +123,14 @@ static void arm_virt_compat_default_set(MachineClass *mc)
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " ARM Virtual Machine"; \
         MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+        machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
     static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
     { \
-        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+        .name = MACHINE_VER_TYPE_NAME("arm-virt", __VA_ARGS__), \
         .parent = TYPE_VIRT_MACHINE, \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
     }; \
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 22e66d1a113..383ee320948 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -215,7 +215,7 @@ struct VirtMachineState {
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
-#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("arm-virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
-- 
2.52.0.windows.1


