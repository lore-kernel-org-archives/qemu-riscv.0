Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA2BC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:10:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxSy-0005w4-66; Mon, 06 Nov 2023 06:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSu-0005mO-Jx
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:21 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxSi-00052n-41
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:08:20 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso5730639e87.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268886; x=1699873686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIk2D2Zy+mW9KoNQEGhLCqqc6EXwTlAoiLD308KY354=;
 b=RgyfapfMcytcQ+YEAkeayqktvYkCBkNiDgGvVvQv0k3a6qSsIhXak2imbPArQIxSTU
 iPYEPdFHcDKIopb8dTtranHH21Bt0OjFAycIYZC6vgTuSF13aahax4as7/n8Q8KWP54N
 jppwKu/wm+HlsBXpFM6UhLkZZ9p9Ppj42CVub/qh7jgAausQj5KeiHuShRyqXLtPMBiG
 lAcgjYTNdrYZChW5CN7QLNu5KDaGxX+jJ2v5yETEet4zYS7K3uQcEfXh2/WvuxSBZD5h
 /h1sslupvJTwXaTWGcXMu50RdTaSD8w7SruINj0ZXXDJJ43jIPFU30iVLQHeRC4OfMMh
 NKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268886; x=1699873686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIk2D2Zy+mW9KoNQEGhLCqqc6EXwTlAoiLD308KY354=;
 b=g3Q+1tO5noJon19FgsVs2MfOW2nSJkSHZWSaYwnj/2VC/V/dPqQQ0ph6xnikEwoRp7
 RAm3XdspVILCM/wGoJsejUqmqme4zyfRu9h2uwbCIaq5UqRSdbI7W0sQVy7Wmlocs+O9
 IgS07UsIHJY0QQeWGYJeBrdlN1FsmgapZ/e6M2U881CqNLiS5sw51YXRu73OdI58bGAM
 Oq/KvC/e9bOA4SV6qztwoJI50+SBYVf6pjQtdYfQsmPK6YI42vfnAGs5lrxA7sIpmJ1j
 nKnHj+LiPgxr7hGmBUGoxBycjohwngl7JUpoY2IlN6eDCqsbYvyElcKK8T+4MYdYvOWS
 n7TA==
X-Gm-Message-State: AOJu0Yw5Thj54iw5MLjvi8srI8SVJEw36+MgXsm8vsZhP8LiXdc1aJcm
 XeF/09lxnhaqzyVFI+un84XRZQ==
X-Google-Smtp-Source: AGHT+IHZzmpQpLISMOVN4u8fENAFmlJt/0w7I/6I45Xn+9+eLmWD1LIrIZlJ/g4SCbq5k1SLfQZs3Q==
X-Received: by 2002:a2e:7c15:0:b0:2c5:5926:de52 with SMTP id
 x21-20020a2e7c15000000b002c55926de52mr22771440ljc.53.1699268886360; 
 Mon, 06 Nov 2023 03:08:06 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003fe1fe56202sm12104665wmq.33.2023.11.06.03.08.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:08:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 39/60] exec/cpu: Have cpu_exec_realize() return a boolean
Date: Mon,  6 Nov 2023 12:03:11 +0100
Message-ID: <20231106110336.358-40-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918160257.30127-22-philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 cpu-target.c          | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5d6f8dca43..eb943efb8f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1152,7 +1152,7 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
-void cpu_exec_realizefn(CPUState *cpu, Error **errp);
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 void cpu_exec_reset_hold(CPUState *cpu);
 
diff --git a/cpu-target.c b/cpu-target.c
index 79363ae370..f3e1ad8bcd 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -131,13 +131,13 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
-void cpu_exec_realizefn(CPUState *cpu, Error **errp)
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
 
     if (!accel_cpu_common_realize(cpu, errp)) {
-        return;
+        return false;
     }
 
     /* Wait until cpu initialization complete before exposing cpu. */
@@ -159,6 +159,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
         vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
+
+    return true;
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
-- 
2.41.0


