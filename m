Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F022CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:09:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCN9y-0004Fc-2C; Fri, 24 Oct 2025 15:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN9p-0004DI-PW
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:09:02 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN9m-0005ek-BW
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:09:01 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47112a73785so15915145e9.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761332936; x=1761937736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=OMZLuMlgScbEpVJTEMU1XaZyLgGJ7+vQ+SEhnl69IIRwatyNc19aGSC7CXlj4Blr2B
 kMjes+FWEHqwKTXDKlndrlxEvdBoyz0L0lJCPn1UN2MS+ZDZtLJW1sQAfNv9bw/3iltf
 /+61GYUtRz7EEl6CW/krM2T2sM7gym4OPXk+gpLP8bXP/QM9C5jSMN2UjT7MMY0RwnCK
 X3Nt0E8ifraKdGOwYxC024ceR/Us1Q8V+PjdDgaKXbYEvSmZff+pLXny4On1dOVoQ/Cy
 xLrVOvI8sZdmkaG6CIPUkNxvTF14o2BkSM8lbyQZb0TPg8RTt0byDmP9a2ZEvw1NJjh4
 LiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332936; x=1761937736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bJEm1B8ks9h5HyZDKkIUNIPRZdg3XjuMbaxmF/lz1I=;
 b=tSCSd33x+KMHJIP2vKNro+3XUuWGOGUscI8NtAD+HvPz1DiKW5jTYDdB/3xx+7aMU6
 1XA31evEoS2bkqQ1sd3/IcHtTyUlJcjC9nzuxxGzzeHeVyRBA1tZ0x4CW2TlUWQ8XIfa
 5F4T0NMU8nMYO1Gc8SAw2uc5if8rI30aDw9ww4d+j33u5Z28iJxR2lHknkprNmNpavhu
 TbqcidGculX0wf/Kt5CU7dQcmQJ1ZgyFH540VuB2XUA2BCdhdRuKi1W8LHcVVRn906db
 2XerDbWpsmi8T81g+CApNARe9M+hwXOeWHQudklJigZOsCC7IBlfs79QSX6Yqu4ba7Ny
 suhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXij/Bo+XDTvUxD4a7BQHnpjQOjkSuVXoYVkyqaSD7Zw23tt6QSRGcG3VfKuTfX9LUyqnr1SOHKu5Q1@nongnu.org
X-Gm-Message-State: AOJu0YwP9zEbL7+fvDffzbaeqCV8qDI7coQ9bQEUpN5JGEogUqz9UK8g
 Lw/R9qaJpoqHFNEGg654EaCQ0QmUFk8tMm7hnurXze1ZeWBVj+ckoy/a13YcyMBxE4I=
X-Gm-Gg: ASbGncsMhX1BFBCG1WyP1YdCPXi3Gf7ca626ZkpV54em4VC79XcY38ixtQVY/jAhkar
 Wfe/n1xzJl44G6X2WzKEWHWgDyFD2F23am577VakBnGtJH8ja3SSz2fLwDL6/wSbURbOXyGDwUu
 FlEylSkZJ9e4fi5VewDZxM0BwjQ0YAD5lyL/jFCLfiZuR98ucbSzCALeVCFfJvJTCzhiB38dhql
 1AISspvy7vsyydJhJa6S/6Goyhj3/OrNV3yFIRbMHDcPZDOiArNEcuojfLO2DGxz7vW5jNQJvEo
 CuYjX9YZ/yXu9d4Pd9+NSHMLITnmSiIxLNexkwjuKWSemL+VBLTQaXIqig7E1IpvKI6e7UhZJBy
 zfwRUuFfFgf0GutWHuPa4weD8X3WEIzjZLkuPPYvy+R5/V+K6CE1NfuebHTvNfgQANPVj5NQ1Ow
 ovavptKFJwz/bbcrNit8EFD5f6xnV9BIDrJUtS0iq6Jb4YMY19wA==
X-Google-Smtp-Source: AGHT+IH7uFP2VbAwVOM4jvgZOI8OcnuQri3rTPILars/XP8JloR9dg5JJpRLnjtpmhZBeq5akwoqNA==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id
 5b1f17b1804b1-4711b25fd7cmr146316775e9.36.1761332936522; 
 Fri, 24 Oct 2025 12:08:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d269dbsm87481825e9.11.2025.10.24.12.08.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:08:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 03/27] hw/sysbus: Use memory_region_name()
Date: Fri, 24 Oct 2025 21:03:50 +0200
Message-ID: <20251024190416.8803-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

MemoryRegion::name is kind of internal. Use the proper
memory_region_name() accessor, which might return a different
name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index ae447c1196a..d33be6b2b52 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
 int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
 {
     for (int i = 0; i < dev->num_mmio; i++) {
-        if (!strcmp(dev->mmio[i].memory->name, name)) {
+        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
             sysbus_mmio_map(dev, i, addr);
             return i;
         }
-- 
2.51.0


