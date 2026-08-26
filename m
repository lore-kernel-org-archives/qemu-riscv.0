Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454C1C61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:44:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzIbY-0002UV-Vd; Wed, 26 Aug 2026 14:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIbX-0002Mz-0V
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:44:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIbU-0002b6-5h
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:44:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cc1bc88a20eso1445094a12.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769842; x=1788374642; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qwzEZxEmFuyhMgoWNMywLma5RZEuBk1uut9/tIFYhTY=;
 b=qvwiQ6OZrXG1J/EbTBIU//8IaUc4bTb6VDIKHOJKSveqI5esEcBSJf7FpVIXjx91A5
 lJgySmz3cmTArAnChjc7MRBG6+XjoQWXM0NpsGTjimjaSmXnovzK76QXCtbIPaHfQsqB
 bDl9746eClKZ1KjYiDwO24O8khNI3AcaxJpEZnmbfsnk8H+xYCvTThsdklCqnD2cLdd9
 rYwrRqaEFoOx/gTxPn2taSry0Q+4Vr0E1ba7dHDu0wI+kgk2jffGllBjjgyMDDWtM3y1
 OsqhG58x8Tt80RmpvNgzLol5cbYaBHuLVwUSets0Gi5bDmWmMAIVhWjE7fNkDK7hhXzP
 FHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769842; x=1788374642;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qwzEZxEmFuyhMgoWNMywLma5RZEuBk1uut9/tIFYhTY=;
 b=bLgdkwOt0yTJBqrBz3zrCChMyQwDF1njrXfp5UoIg0rl16qhehgWr/1E1Nt0SCrluv
 Ff3RnFPgnVz54sj1yetGZ7O+YED/LkroWw8PnRfHH0pzb4ngS5Ulu9jhUDQsH/OiiGqI
 uR5lA573yEpkFtoL0jD4VPV9KIFzKqUFqKQZ0/iyIqqb56fKhN91lbaipcTlh4uBuR35
 +clHCqwP3Z28S8vEH4VRvGNZpeEmIHmsRh0VZYQy1eR1PwRwAXHCucg0BjgfMM5SDKsf
 W5CpD6N6m84wTapj7KydNkKa9Wf6D8oggRt9HLfw5+/wC79sHj2CH82SdZoIcdMXTikS
 rMwQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAdd+4PHhU2Dsjmu1lLqkWon3RPJG5WUCOnpTFENPhV6SjR7ZwOeJJt99zjRUrGljBmK84P5UXdmlk@nongnu.org
X-Gm-Message-State: AFuF++m6EgAgcRjk2ubpyCQ+iwv1HcluRNPRwMYSrjt07pnRltar+CAH
 2u3pwJMcPusZxvIPMhXgvJdjpjydAgbKDgF5lFk0dhUbMvLNebOPOavp
X-Gm-Gg: AR+sD130TafDMOxz1rvS0sOuBhbAlQaKRRcexRFcSFPwOgiURUarl1XNv/tAFyTmMUF
 0I/NJ9z47iFwZPoW4I2aY4A90bGVKBlv74g4qF/amefnTBrrFL/ddjf9rHNEWBkTpxV0qOVaPoH
 WNs+7OK1uQb68jUc+ArP0EdKnBULtaOzQDyVM8LSwQlT8qYpU4yNn7bl4OZKLbLTHCYQp/+07nS
 90ovHVizI9nPgkKX59XiXzO68qK2NvnMUcXz3wAcsEz93eQ8K4aqCGpdp3amP1ksMV6XDwNMis4
 1WFw7Jv5Jj1dYHoORVt9wrHb8dydwtcSHHPO1ULClaF2dXvucBYFoyMQiTS10H2fTuDclSbh+qI
 h7kXhF8OSk0fATtstw6hGpd5RC/Cy/KSwD1FXFSxa46owxRDKrbqPmoyc/CaYoA4HcWTSh8NRIm
 UQ29AZE+49et+Bf9tzqFnZ5RW9uGTrOm/vYo8x8W1vGe0WfvN1e6b49DXTeLfxvVljbPCa+yril
 S4tOdpqxeLcJxMMi9iSSQ==
X-Received: by 2002:a05:6a20:938c:b0:3b3:216b:2743 with SMTP id
 adf61e73a8af0-3cf7576c44emr17712748637.4.1787769842497; 
 Wed, 26 Aug 2026 11:44:02 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:44:01 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 09/13] hw/loongarch/virt: prefix ACPI helper with
 loongarch_virt_
Date: Thu, 27 Aug 2026 02:42:23 +0800
Message-ID: <20260826184229.1145-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52a.google.com
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

- virt_acpi_setup is the same C symbol used by ARM and RISC-V virt.
  Rename it now so a later combined binary does not need meson -D
  prefixes for LoongArch.
- Rename the file-local virt_is_acpi_enabled to
  loongarch_virt_is_acpi_enabled to match.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt-acpi-build.c | 6 +++---
 hw/loongarch/virt.c            | 2 +-
 include/hw/loongarch/virt.h    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
index a0b445f297b..bbbac289b49 100644
--- a/hw/loongarch/virt-acpi-build.c
+++ b/hw/loongarch/virt-acpi-build.c
@@ -674,7 +674,7 @@ static const VMStateDescription vmstate_acpi_build = {
     },
 };
 
-static bool virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
+static bool loongarch_virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
 {
     if (lvms->acpi == ON_OFF_AUTO_OFF) {
         return false;
@@ -682,7 +682,7 @@ static bool virt_is_acpi_enabled(LoongArchVirtMachineState *lvms)
     return true;
 }
 
-void virt_acpi_setup(LoongArchVirtMachineState *lvms)
+void loongarch_virt_acpi_setup(LoongArchVirtMachineState *lvms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -692,7 +692,7 @@ void virt_acpi_setup(LoongArchVirtMachineState *lvms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(lvms)) {
+    if (!loongarch_virt_is_acpi_enabled(lvms)) {
         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 6693dea647b..74c9668b6e6 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -242,7 +242,7 @@ static void virt_done(Notifier *notifier, void *data)
     LoongArchVirtMachineState *lvms = container_of(notifier,
                                       LoongArchVirtMachineState, machine_done);
     virt_build_smbios(lvms);
-    virt_acpi_setup(lvms);
+    loongarch_virt_acpi_setup(lvms);
     virt_fdt_setup(lvms);
 }
 
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index d39a9bbf5dd..72268466def 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -132,7 +132,7 @@ struct LoongArchVirtMachineState {
 
 #define TYPE_LOONGARCH_VIRT_MACHINE  MACHINE_TYPE_NAME("virt")
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchVirtMachineState, LOONGARCH_VIRT_MACHINE)
-void virt_acpi_setup(LoongArchVirtMachineState *lvms);
+void loongarch_virt_acpi_setup(LoongArchVirtMachineState *lvms);
 void virt_fdt_setup(LoongArchVirtMachineState *lvms);
 
 static inline bool virt_has_dmsi(LoongArchVirtMachineState *lvms)
-- 
2.52.0.windows.1


