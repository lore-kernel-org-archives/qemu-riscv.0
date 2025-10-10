Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA4CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:48:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7DPm-0002WM-C9; Fri, 10 Oct 2025 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPf-0002To-HQ
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:03 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOv-0008CG-6a
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 09:44:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e430494ccso12452685e9.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 06:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103793; x=1760708593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEHpoi3UcJ1d9mK9rygYrDQXxzIPGGRGzqCX4yQQSa0=;
 b=dmeNUJ+9eo3l31jh8ljJPM2HNJ9PPcqFqI1JP08q8y01nYGHCkAo1mu8I0FBK7WTuP
 j7uI9AKrp5BULjVhfXngRWB0ly65GysS3jgWAu7QnWzpBkrXTxz8ToqKRxTkZ5l2Bmua
 IaJ8C/Qrp7QdOn/HUsGnsDS0DMlmr6BOIkzQgrZzl8rP2jU/d6KJ90gTXWHobITHEQ3h
 mlIgm4IiyLPGA68qDLZH0jcDH1m9UqJ2MlG74tmT2X8vidac7BgAlRz1LHL2CgQbh5Of
 nZyFDWUmEBItZqLr46YKNVf5PkWQhUXkyUuawaqoejnzeBl8ODx1/cqU5ggy4+TeI3fi
 vYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103793; x=1760708593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEHpoi3UcJ1d9mK9rygYrDQXxzIPGGRGzqCX4yQQSa0=;
 b=Znc6/XHJSZvOgjoyPBOaVaODjvyLS6JmKGVsGq+ROJu1OuCZ2DboFRh3wvXmXtEkxX
 YG89IE7T0GVBOcwBjT/Jgsw6jAnIEit1kNbPLRszlnb9a0+tNLn/5tnjIfw/ERQ1ekem
 8TfCHg8YG1wYU3B8C5RNoGp0Xj0QLExgFtPYXuy7FYLY0ZxT+uVi27aMywN367V+e2z+
 +YPVj7yunj74cXZs02djd4xXxc3r94EyQKhYet7WVuTafe0v+70kjk2D5ztD/YptN8ol
 YoUl6kk4xmh56IVQJFnLSO51SqwvUpdABJp1s0mK06oVtxGr3wv7uev5U2C23WhUfH3G
 Q7Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnZWHHVAE6JCJUpz6lKDb0IVH7vLCQkdiary+y6BgkptgKhmkHYUO5rCwjLHSsmXrcvfWlmya9o/r6@nongnu.org
X-Gm-Message-State: AOJu0YzNTK3nbfV2K7eDPD+/RTUY7EHDxB/hexSPsImpQnN8JDDGnzcO
 dfbpoxKmADq04llijefwdYzYeINab4oR/FkPAGJxMJP6khZg48zBmpHy5Fu9t6JTK1sKmAj0eR6
 l7L/NcsGwVQ==
X-Gm-Gg: ASbGnctaiz5my52IpjwfpRGnUG2nvZWOe4UZKA2KoEY5hfxHmo8GhlMpIeIygRO5POs
 ZUczDWRTss+9LumxJEPsiZKXPwm6pxVXodKoxJ+kOYi8kaurVyW/S5czeQjOfTI7MPl9t+iokQ5
 rswIS7zwPmJbjh0OSkmKi945QvdbTkqk68E1dnNVFV3KTGhiE2bKDu53IetaBUqXe4y2tyV+T84
 vZIGVV+/mtr5dXe6qNiPDRqp8Y9jvpfKY7nel8NqG2wSvVqLhcSSQifmmJs0qnp0G82OifEOIAF
 U8UhEhcJ48i6U8SsUPc/TdNwHQH9OlIk7xm0ht9NZoNXCjCmcdt86KDEQ6aMppa6lwtSshWNs4u
 g7eGx7m0mNAckg63AniuQDYW9nHmkGQmfQFvUkJb1wnL0NxcJe4JzbeRaJn4jg+AxVcdbQo4/Yk
 RMskXzJbKuKPp2KxyEvmE=
X-Google-Smtp-Source: AGHT+IGMyuXiXr2hhS5RrEBqHmkNz7q+JdBDAhdMbSHh7UARDHiDg+5JVxi3RtV8WP/bCBvAXMkyAQ==
X-Received: by 2002:a05:6000:2410:b0:401:a3d5:5687 with SMTP id
 ffacd0b85a97d-4267260e17emr7032365f8f.49.1760103792680; 
 Fri, 10 Oct 2025 06:43:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d49bsm4549912f8f.10.2025.10.10.06.43.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 08/16] hw/virtio: Replace HOST_BIG_ENDIAN #ifdef with runtime
 if() check
Date: Fri, 10 Oct 2025 15:42:17 +0200
Message-ID: <20251010134226.72221-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-access.h | 6 +-----
 hw/virtio/vhost.c                 | 7 +++----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 07aae69042a..80328912ad3 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -149,11 +149,7 @@ static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
 
 static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 {
-#if HOST_BIG_ENDIAN
-    return virtio_access_is_big_endian(vdev) ? s : bswap16(s);
-#else
-    return virtio_access_is_big_endian(vdev) ? bswap16(s) : s;
-#endif
+    return HOST_BIG_ENDIAN ^ virtio_access_is_big_endian(vdev) ? s : bswap16(s);
 }
 
 static inline uint16_t virtio_lduw_phys_cached(VirtIODevice *vdev,
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 266a11514a1..6343477b42f 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1168,11 +1168,10 @@ static inline bool vhost_needs_vring_endian(VirtIODevice *vdev)
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         return false;
     }
-#if HOST_BIG_ENDIAN
-    return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_LITTLE;
-#else
+    if (HOST_BIG_ENDIAN) {
+        return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_LITTLE;
+    }
     return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_BIG;
-#endif
 }
 
 static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *dev,
-- 
2.51.0


