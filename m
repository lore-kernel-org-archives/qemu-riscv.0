Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5E0C98335
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 08:17:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xANaX-0008HA-6f; Sat, 26 Sep 2026 04:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANaD-0008EM-DF
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:35 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANaB-0006p7-Ji
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 04:16:33 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd025d06so1040170c88.1
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410590; x=1791015390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wpCAiLq/NIQne16b95JcTKYglPeBieSpO35EZW0OqVs=;
 b=UBRYb0xqs+5xbFZ0fVbWG04l4Vb5FcRApE2iO119Tvg/DF4m5rvKpncnYJxjOZx1Se
 iDmoDttTYaV19nAB2A3eKROaz56jhSfPZvkmG64ab6wF4vS19kCd0+efNt2zDz3+oBSy
 3CaMkyT1aF93CcjvGIuD/p8d75HpQDNLKLxc/oS7LCaVvY2Rb2Bn7hX6lXQCsRMq0RZv
 21GXPAZdbe+fwDSkrlAwkDiKYjCqJNOMNN74TwpqjYrPzRmfIeb3oPPllgYQ5sylCKyF
 /dBEbfkQIxPsbQ6rjqAEXzzCdwIZIWWZu72idg0d2UMFt+LXDB5s9N3IOWxK6hXkZPef
 x7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410590; x=1791015390;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wpCAiLq/NIQne16b95JcTKYglPeBieSpO35EZW0OqVs=;
 b=q1TuzoCkQdeyuwnkxA9KB0yRCWg6WI2E+rTq8JYmbGDcd7xe353U42+jJZsFsaCYcz
 lepaBuYYlzRPKO7PInC92vmL4yHQIn0MXiiXiHE1RIyNDQYQf0xji5uQseuxD1SBcUl9
 pOJ23nCytVGnbw9fXQ/OgDQnpUD8GdKLzu99EtxewNKWiPN8Sucxui1Bg1pLUCwgCvu2
 infyoxCY4GFHRx4GiqybIbT5mFwItqO9s6U9X9mWTcupAWqzw+4ArV2oTlcK2P3hgKmS
 fdJEE6SxUMEWGmEUN2PsywNL7jOWrFfCLh1Oxa69d0bOV+pk5dSpvFL7Fxv64M2YtUvE
 EddA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzYHI4YxWgn55EZY9VhYwTO1AM08kstCFu76CrFH9AI/2xnbvF58ai/EPM+FMLCinfCsuep0LM+3MUG@nongnu.org
X-Gm-Message-State: AFuF++mSIIiUjMtvsI4Cs8KNv90cmyR2l/qipJNUF78VTBsRCTUyHcUX
 xsnSsPyrD900LssotWu8blFhNc4p9RFL9WI6sDwJ2NAeDgLs8Ik6sZkV
X-Gm-Gg: AYBFou2LJqEJ7al1V8Q3CZiQ2J+rgJnA86/QolrKTdnVwH1GbQZMthZS5lZTDTw0HkB
 tLoA2ouUnW8mUlTq845coyfiLGDOnkP923XoEKuMZ3ISBqH6KrFCTDu9eM0YniYA6zZNjmmEPUz
 d0kGgoVbYAgrqm2CQLNzPrdMGH1k7T8TTpIK+nm8jxVt3WJqcvDRPQS63YFtXu+zOYmbHy3b2Jg
 Q9EYZoNeC8UVdMIWUhwgjizqR/uwrNT8F4CdK0VAlHCG/fb1+pGgCCSOrE9bzWc1EdTlB1bbNXH
 8PX2buYIpxlYNVUJ1sLmM4xrBJCWhyMaY5t2+yEQOIp0JDOVKrtfnnOauep2EbKvWxWoNYf70ja
 Fv9AjhWgrvJLhWPx+6uaCutN7Vhx1fWbzms9mHpJ2wVgMYB5moqA0l4c96HmN12cwzjgIJIxGvl
 oWGTV1GospcHhZwMiqEgBWLPKq9RlCt5428D+OlZldloUTJLxadYvRa8+hBD7PSB4ao9ZuVf7ro
 f33977zyMTpBXLzatMNyBbBCaPae/I=
X-Received: by 2002:a05:7301:3899:b0:342:5098:a983 with SMTP id
 5a478bee46e88-342706b19f7mr2314817eec.11.1790410589508; 
 Sat, 26 Sep 2026 01:16:29 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:28 -0700 (PDT)
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
Subject: [PATCH v3 05/10] hw/hexagon/virt: use unique QOM name
Date: Sat, 26 Sep 2026 16:15:45 +0800
Message-ID: <20260926081551.29-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
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

Set TYPE_HEXAGON_VIRT_MACHINE to MACHINE_TYPE_NAME("hexagon-virt") so
Hexagon virt no longer collides with other virt-machine types in one
process. Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/hexagon/virt.c         | 1 +
 include/hw/hexagon/virt.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index 64d8366d27d..04591066bef 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -359,6 +359,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Hexagon Virtual Machine";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_init;
     mc->default_cpu_type = HEXAGON_CPU_TYPE_NAME("v68");
     mc->default_ram_size = 4 * GiB;
diff --git a/include/hw/hexagon/virt.h b/include/hw/hexagon/virt.h
index 4ca2f1ef859..523c4858036 100644
--- a/include/hw/hexagon/virt.h
+++ b/include/hw/hexagon/virt.h
@@ -26,7 +26,7 @@ struct HexagonVirtMachineState {
 
 void hexagon_load_fdt(const struct HexagonVirtMachineState *vms);
 
-#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("hexagon-virt")
 OBJECT_DECLARE_SIMPLE_TYPE(HexagonVirtMachineState, HEXAGON_VIRT_MACHINE)
 
 #endif /* HW_HEXAGONVIRT_H */
-- 
2.52.0.windows.1


