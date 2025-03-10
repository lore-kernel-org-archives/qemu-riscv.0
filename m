Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523D0C282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:02:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVEb-0003M0-7d; Mon, 10 Mar 2025 00:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEP-0002xi-JE
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:13 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEK-0008Gw-5i
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22355618fd9so66594475ad.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582747; x=1742187547; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMZho2jTEznhsPIS6UESQksv+KrJv0rJOAa8ZMe9/mc=;
 b=vl/3QBoIqw9Qo67gjzeRTZf5tZdGGkp3Lk25WiyBkbcHApQ+4XU1tJxOeULMgE5/PM
 PJHZelilBpXjGuYDj4lbx5CuCFhH3ysjnYYENFVXMENJwK+/heFoKkrMBHIof8/NpgQn
 S4s68eN8qFQDBc+mqgwm1qrX4aIUkegXv9QyrvYIGCLedMbadpjhsCrwxEkdpcFbA+uV
 TIkeybhjxnDkT7fvXh6s3I5icbD1H3a31ud+kdnF/PirgRm5HxlPyeFncdb+oSNIxe2d
 wZKYuKBS5mHz2qXcEwXXhcpCdx6E+5lKapmgyfj4f1qdHj5XkhOI/92zOwwraqcK209p
 KUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582747; x=1742187547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMZho2jTEznhsPIS6UESQksv+KrJv0rJOAa8ZMe9/mc=;
 b=BeEFgzZBgB9kv02rjDjdle9TbR5Eb9SD0F/s1JTvHjRj9dyGpJN28bcBkcNX8B/b5q
 yiaxB1v6Q6bvO30Z3nXfNA298D03zAXz4cv2P48+qCWMvL1ZocV8QOhqxLVGmQI8Lqo6
 iOA7VEo8OL7C4RYrM396boDuoZbgP0oMVlpOMupjU3oSHdFrRSYdq/nITDhu2rv4hVHr
 1kFCOp3p6lO+l61JLU71YhUDF2lS6+UHegR9ZNJIs27HtqOxTHMXH/XVRWsyESeVVMfk
 jyrdMjc60c8EDAJIIoPaPrGw9535ymXrAUQeU+yUw7Glt9EipCBaXjQuiVVmje0UwHrh
 48gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqwTtb5zHqRJEKL9ePrpdxIOQTdS27FMRpjUwV9YzV9/SIPUrVXot7b1mpRk6q43SUigBSQ09l4ogQ@nongnu.org
X-Gm-Message-State: AOJu0YzYhuYt/XPeROS/hSQZgSWDhXWq5pU2vN30WE9A8ZdT0NFePhbB
 z+gjE4pHMTU/g3W/VweRKXG4SAnFqPXhp4ommGKCMz0V9ypZwm7k7YXEpCOerfM=
X-Gm-Gg: ASbGnct/IX41AfY8Sc4+0xNACeRPB3uo9WLTHIL2NzdRpU+xoo9iWuTe7980t6Ux9i3
 kzgY85f9dPGNu+6D0JegIrkZSkV/A0t27w+spJ/TjA16Vh856K8bWxpQRosFMNH8qUi7xGlOuGH
 gXKNXcDqw8ZHd44f4+uKn5TnRU9odUusF1Q4av1PFgoOTkpN2KkE+iWvVVVkxgUyXmui9LUH/I0
 y+clyjiHJsAPoAuhgeb/D+PsVh027VnAs9moaHqRQqMHkD0/d8DpJEaE2/K2nqUvKIpELW2d/lz
 FiDVN10LA4olp8LCpapP+z/sS+M6gvyE2znwZjrMFqog
X-Google-Smtp-Source: AGHT+IHbQ1zJTyihYPTNnOdjfB7Sf4JwjgD8pBM833NXOATM0his3HUH4Ux5tSFbwWsuCfmQbH8fWg==
X-Received: by 2002:a17:902:d488:b0:215:4a4e:9262 with SMTP id
 d9443c01a7336-2242887fd5cmr174335945ad.8.1741582746784; 
 Sun, 09 Mar 2025 21:59:06 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 14/16] system/physmem: compilation unit is now common to all
 targets
Date: Sun,  9 Mar 2025 21:58:40 -0700
Message-Id: <20250310045842.2650784-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index c83d80fa248..9d0b0122e54 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -2,7 +2,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -15,6 +14,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


