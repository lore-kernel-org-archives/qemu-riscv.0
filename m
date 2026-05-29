Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A59CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3Fd-0002Jc-9D; Fri, 29 May 2026 15:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FZ-0001oN-23
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:52:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FS-0005Dx-78
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:52:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so85750655e9.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084319; x=1780689119; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7VQCJEvvCPJhqeFVLwDWN0jMeOhEhmoHcnTRqEwJrI=;
 b=oTFDIsYXPQmOosWzx99s6eAjQmGFwcK/q9QBpZzYxTumENdOgPEEw31ecOf4f/HTpZ
 rD44pc0nGZ9LhZ0hiU38KWirhGLFK/Q/CinL0wBU5NlNHrqq0ILfP0sesPS7Q5vOlneh
 skgc/SvuH38ykQ10M97ts+nxhp8+zknlfRK1RXQcO6vwJn6Mx0kUCAj3PyXYobR7fnE2
 H38NXuFJXT8Hum0c/OONDnrjacLqa1rCoShY5oAzDXPsaT4cWrF2don8QQaqu3xZBQrU
 GvHz/Gxacbt+LxYGF8AFnszBOwByEnBSGlBLaj8nwA0c8QUOfruL5liW+u/guKen58p9
 Exlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084319; x=1780689119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q7VQCJEvvCPJhqeFVLwDWN0jMeOhEhmoHcnTRqEwJrI=;
 b=El7UHuvGzylSNUungn/0EZUP18gtR1tpJMFXRE6lH1ld/T5dF4bsv/mXmcxTh4RN0o
 dfwM9DgqldiyNqcXYhCx/xejlBfPj7yEH5G4jKSHzHG2D86hsG5pq2UNt1M3LqaTxz1J
 xC85yBpQns6DEoRu8xHtO7FojQIDjlf4FdAhyAtJG16D+q/RK/gvkDvydmEs4dWpyPK+
 nA655PigQ4QktJhCok+a7YwRHzAnMuMDQ3MPwOj2AH9kFoy7Uw7mv99Mo6Mzg0Envsey
 kdW/REQmbn+51KR4c9eNc3QJeJJZkYz/T28ZEKJW5Bnp3osvH7Uk6PxXRhZfZXEMROO9
 LFBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/PZUqVbPqM60MZ5Y3t1ZmTQ8y0r0qZhRZEKoDEoSeqQkOLPAjKgvd+Ryx0L1+kZlEDG4CyH5UQ3vEZ@nongnu.org
X-Gm-Message-State: AOJu0Yw5P5d/kh0kQHf0zI9JgDD3rFtkddjOgbb9QJqFiq2gzYrJ8m6+
 j0pI+TshlL/UBXYYdTO2FxpQ7ufSFHqFvFpCz6+y3n84Uu0E3/QJcJ0wlPAnWVcSCUU=
X-Gm-Gg: Acq92OG78vabGJQB4wbV5R0lV3kOzBJTUpEg6GgxdKHGwQbOb4lwJHomdJucPpS8Phw
 fyY0NgUlirakOMafPG/M1OFVYWvfLC8/LjAIzmIn6BJuLpKOXTpHOVVGFQ+Z8jZEDeVYigpKwXj
 g3YQgbb19Yfb736iK1igVETqL5QyhnWMOY+EjCptv/FrQ4fTCkfT+6QtY9eR6YYhqVulJo1G2eX
 +Vuzc/QYloXjJ8eJDF7dz0C9E+5HGxLmVukRWGKLhFQtfcq8jNxJGVDzOR4DXYMJPpEPsPJwIGg
 XTYYUCB3kQNPcoUBAYASE8J6NYapFgEhZvgBLqk+zpuGQuorTrJyH1fJLHJZhetUYFgKdPjnyBp
 oK2d2BykpAAl4oGf6rY4TcKv9UgLRucN7PsHRoWW7m56F/TsCQhs6AUz3rP8STk4JakSv6KcOMA
 i0qLgguiMiagLCnNLw2mcYwjCN+SHUbYLf3OqwmqVhdXGDQEn4I73T9gMsgLMpLzgyMQ04s4DdF
 9HT
X-Received: by 2002:a05:600c:4f05:b0:490:50e8:45c3 with SMTP id
 5b1f17b1804b1-490a28cf434mr17780735e9.0.1780084317679; 
 Fri, 29 May 2026 12:51:57 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68b853sm62908705e9.3.2026.05.29.12.51.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:51:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 16/17] accel: Remove AccelCPUClass::cpu_target_realize()
Date: Fri, 29 May 2026 21:49:38 +0200
Message-ID: <20260529194940.97143-17-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

We removed all implementations of AccelCPUClass::cpu_target_realize,
remove the calls in accel_cpu_common_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/accel/accel-cpu.h | 2 --
 accel/accel-common.c      | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index c42221f96cf..d7ea45ada2e 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -14,8 +14,6 @@
 
 typedef struct AccelCPUClass {
     ObjectClass parent_class;
-
-    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
 #endif /* ACCEL_CPU_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 04482b6b57e..d8ee6d62667 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -52,13 +52,6 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     AccelState *accel = current_accel();
     AccelClass *acc = ACCEL_GET_CLASS(accel);
 
-    /* target specific realization */
-    if (cpu->cc->accel_cpu
-        && cpu->cc->accel_cpu->cpu_target_realize
-        && !cpu->cc->accel_cpu->cpu_target_realize(cpu, errp)) {
-        return false;
-    }
-
     /* generic realization */
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
-- 
2.53.0


