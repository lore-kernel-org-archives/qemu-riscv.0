Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50208CC6B1D
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvVW-0002cw-5L; Wed, 14 Oct 2026 05:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVQ-0002bT-HW
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:42:40 -0400
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvVO-0001d0-RY
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:42:40 -0400
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-35d0be18c71so659086eec.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970957; x=1792575757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RHkB+WJYVJh5gtDdYFA2dnLLdePZ0o1/JLEQILf+BW8=;
 b=NeX9NaMP+jC0Dw2V23aHsNO8tqXROi2vqcPlKIUG2UvXo45y6UsckJ7UNBYwpsRBHq
 esJ8iswhwnp9LHwzjTyzOZz4B3x5ySiIfnkhAtuXcibeBvGdaCs4TAcfAbPpIOml6H0Y
 i1EmB4V+ANRDxGmquRY6QPM621b31Y9WB5kZrxBtsHfWhDo12XsaGg2f9qyrSI/pNw8o
 wEJG1/g9sA5Le4g59DXECHJ1BwA+MpTtGN00YC44PufRSCgpw6pmWEgYQMS1q1c1RlAK
 9TAXap/CdJ3b9VW5qtJowhRHqPsnkiDfk8IVMulY3WHG7nr5St7VXDlPf2E8Yq2woXtq
 l7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970957; x=1792575757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RHkB+WJYVJh5gtDdYFA2dnLLdePZ0o1/JLEQILf+BW8=;
 b=BwOYlk3kVkQe6ePfy0hDWT71kqImP015YwNhhZS0AXTkim4UCEE0beMYWFPor4cclm
 xrL7H8DRXL3RqKUuIqQHbY5QqP3dM+abFIwP+SnHi8e+ApiQhTGavcUkky/YzNID7KJx
 /wZti8Zr43n6lFBXimndV+gmYtyzUDEytr6UBfcmJsfJxAo5/R01jVfkmbT2Tb42rhL/
 3FechLG/8DuWxAH35WzhUSLUEGxkBGtXcANkRdb3nt69DxX6VNxJpOO2PiLF5WH2wLaK
 3FLjYPOHO2bNoZgkSKe42B9j7JG8rNo+Zz4HiiY7AaAT6VPtQq4rm9rmZdIldHrXNybN
 nvkQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwf1WWWNtTYCxmo8eaL1QA/FO2viHdhfXvTN0ON0/uTmcu0Em4JThJHa3fSQKwUUAURjScAc4NCN8zH@nongnu.org
X-Gm-Message-State: AFq9FYLkUHfh329a+yVunFwKnyLEY1I8Wc7TIqxjvGeWFj8fsH7sk5DK
 PRBRUIl4ZO4LOTXsac/1547LbJagM2Xw+lcSHbwbvmRSsGnOMKyplu4f
X-Gm-Gg: AYBFou3cZuPAXuuKBkyArmk5RGqbgNL2C5DGC8x9GMfabj7XPqDj1pG3NOQ6nm18sbb
 t7OwXcwPmpGiBkyrDA0ehpW7FkR09Ks5utvn3apOrfg+fYEmiXkvjP4sV/qyapwV4ui+vUt7q3x
 WlhlaBvps5fj5Mo6HRQo/b2WmWyP+lPAn+8BMMW1z2yuKTb/tQv9qcpEgnBzIAeR/MIcgo4q7V/
 ygv3v6GknJvaK/W3SgVDE+5fRK4z6n4AJDxA5XKtJU17etXvF4tM+tP1B0uemFRV8SlbkcVtVNp
 Wl1ap4A9jCI6HwIhX1ulr+spqclPNrXRH4ADM8YxDilrM1bYl2XD3JyPpGL3OaknMKC+D5ikAp4
 AN6LT/iO7IU9rejYMGYaW1m+D/ct96qe8k4aLpa3AG3H/qzkUEWZT/o1wlNvHwexktnzN9+MtUQ
 Por/BsiFKdn9dNd4V8w4jnV5ItyMkN2qyykC9lNie3b0gAoNyydhpRnazyGXj+GiTVqHXkxCOhS
 9bdS4r6hWxi0bgJyw==
X-Received: by 2002:a05:7022:f51b:b0:15e:12b6:7365 with SMTP id
 a92af1059eb24-16a54fab7bemr18604751c88.2.1791970956468; 
 Wed, 14 Oct 2026 02:42:36 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:42:35 -0700 (PDT)
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
Subject: [PATCH 16/34] hw/virtio/virtio-mem: Avoid call to target_info() in
 class_init
Date: Wed, 14 Oct 2026 17:41:31 +0800
Message-ID: <20261014094224.1976-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1330.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Done by merge virtio_mem_legacy_guests_properties into virtio_mem_properties.
As we already have vmem->unplugged_inaccessible handle in virtio_mem_device_realize
So we can reject the wrong option in virtio_mem_device_realize, then the call
target_info() in class_init no need anymore.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/virtio/virtio-mem.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index a4110d61312..81e2192c2fb 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -879,7 +879,11 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
             break;
         }
     } else {
-        vmem->unplugged_inaccessible = ON_OFF_AUTO_ON;
+        if (vmem->unplugged_inaccessible != ON_OFF_AUTO_ON) {
+            error_setg(errp, "'%s' must be 'on' on non-x86 targets",
+                       VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP);
+            return;
+        }
     }
 
     if (vmem->dynamic_memslots &&
@@ -1568,9 +1572,6 @@ static const Property virtio_mem_properties[] = {
                      early_migration, true),
     DEFINE_PROP_BOOL(VIRTIO_MEM_DYNAMIC_MEMSLOTS_PROP, VirtIOMEM,
                      dynamic_memslots, false),
-};
-
-static const Property virtio_mem_legacy_guests_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
                             unplugged_inaccessible, ON_OFF_AUTO_ON),
 };
@@ -1635,9 +1636,6 @@ static void virtio_mem_class_init(ObjectClass *klass, const void *data)
     RamDiscardSourceClass *rdsc = RAM_DISCARD_SOURCE_CLASS(klass);
 
     device_class_set_props(dc, virtio_mem_properties);
-    if (virtio_mem_has_legacy_guests()) {
-        device_class_set_props(dc, virtio_mem_legacy_guests_properties);
-    }
     dc->vmsd = &vmstate_virtio_mem;
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-- 
2.55.0.windows.3


