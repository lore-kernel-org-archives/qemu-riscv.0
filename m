Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B4CC98304
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 21:56:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x98TH-0003LO-O9; Tue, 22 Sep 2026 17:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98TD-0003H5-DY
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:56:13 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x98TC-0000wz-0k
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 17:56:11 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd046b87so240035c88.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790114169; x=1790718969; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FFu1GWUOTl4gGw9oxLcpuVAdjKyzH7fM1wcdIhlx/50=;
 b=rL1JGwkfncG8j2h4BX8+L2QbBhlfbLC6A/zEeeXEBU+M9NWrhKjGG4ESkpj/Mm1jwQ
 XMXcSxpLLfnTM1JgptPjTIoSp+b6wI5SD+dhZDjYaz2c63XgD3Opn0npYGtGeshzS0oc
 yJjnY/4ravYrn3VbuIZrujjnG6ZINk4C/t2rsE18l5pk7EYABhxWqeVYfigoNNlJOaBV
 +tEcUJ27A5X5m3P0R3JbF/EmAb/cxNC1m6kGBRyJdA06FgVY9BhZsQmrF1/AxqhnT/Zy
 3NUdutUMymccRV631L3sn4A9LpgsJ48aBZk7aGS3Yje7cfPis9bMVZcJ27jLusrflxwX
 z34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790114169; x=1790718969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FFu1GWUOTl4gGw9oxLcpuVAdjKyzH7fM1wcdIhlx/50=;
 b=HPtfX6fQXGLO7ZKXACiwzk9NaxMSUwz3+KlbZtK5w16c0aiaMD/msQBW5cixjafc+k
 dylLmhaXif1PbeXc9uRug0Pcn4ieC0WstligJrNsFAehlG3IiStitN0mpgGNlvh4IBzx
 gy5jVRLcU2YB/W/r3b2Qbtcvz+XZYhEAowzp0zmqXiEKKbEgWZuln7hGk91xmBRrvrND
 2nPLvOl0MyOUfCTax3GWTqUbX/v9TfnIN7ZbSn6BA69FL8e7VvgSOUP2qdxEWULH6X1o
 2Wgfo9XzpC+8OaP2plzcYKdYhvIRNj21gzuZ7o8eJUSbMFD6ddKkad/btuYiHq+va4tv
 oIRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7tEgjMSjSzpPiDTtr7ScjGiWomzTMhJNTrNnPl6UyaSRZtqIw141Rq+54SIqp+mQeXznDlzeatbj6@nongnu.org
X-Gm-Message-State: AFuF++kh0jCAtknoCg6OFW4d5jmiC+nh+3ivK3PHyV2o3fg4MzUbDVGO
 30pVpsqPQmd44wJFMm9c/A+7t5lRP+4jDhCwwcIs52QL54t7NtHbPxXi
X-Gm-Gg: AYBFou3XByOF4PvmDWE4K7lOLHRHYm6iKLJ9JBq/S3NWQiHgLY3exbJKmYjoLc9kB5C
 H4mT4MRTA5KwnwxgnT40PTbOWCIqfsCK3Y47gzKpEntlkP/RxjVGIhXKe5uLzpm5tYao3a4tgXu
 5h+9PzRBbgmRKMBGNcKl5OTTTeeqRDWRFclpzygHkhxgnpG4GmcqEPbL78sp4eHpG/w45gkrQeZ
 P3z6kvKNBI2MrPfLCT568y8ngDDBA28pwpgXYLJOPKN5z0V7oUPY2BdHLY5tNAu5p9AojhfElSk
 51WejCJ8FCmIuS5yHiNJ7451IlGF8SLM1rKnZhs92aKN9NmsgOvU3Q4PRSU4Ad+6hOP8DSg1WZU
 c/HQpu7i6fP9ZzoL9CU0HKt9sxMN72M7S3gqaq61zf4p6oisbKw0AyC63wn6BPA/Wsvo2Vma/NK
 TwLLVVmO7+vCekjIwt9DE8kVoKLRSE8HdRhtlQ0pO9wzYm4v2GFEZS9cs3vUjiqj2po8wueyyJ+
 fVYyOcN9Jai+3MUV5vI30qljr3vP+U=
X-Received: by 2002:a05:7022:fa9:b0:143:296a:4e57 with SMTP id
 a92af1059eb24-144f915c8fcmr1037399c88.26.1790114168519; 
 Tue, 22 Sep 2026 14:56:08 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144f949e60dsm1001153c88.2.2026.09.22.14.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 14:56:07 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 4/9] hw/or1k/virt: use unique QOM name
Date: Wed, 23 Sep 2026 05:55:27 +0800
Message-ID: <20260922215533.641-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260922215533.641-1-luoyonggang@gmail.com>
References: <20260922215533.641-1-luoyonggang@gmail.com>
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("or1k-virt") so OpenRISC
virt no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/or1k/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index 2ff5c084a2b..35884252379 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -34,7 +34,7 @@
 #define VIRT_CPUS_MAX 4
 #define VIRT_CLK_MHZ 20000000
 
-#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("or1k-virt")
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(OR1KVirtState, (obj), TYPE_VIRT_MACHINE)
 
@@ -548,6 +548,7 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "or1k virtual machine";
+    machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->is_default = false;
-- 
2.52.0.windows.1


