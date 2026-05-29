Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD4ACD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:50:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3Dj-0005RC-8m; Fri, 29 May 2026 15:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Dh-0005Cz-2G
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:50:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Df-0004Wt-4q
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:50:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso86353205e9.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084209; x=1780689009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDALMDNynw3GUuarnrLNetX0Kec6G0245sRIZSxkHLs=;
 b=aIf94tDb7qWtb7tPlvZ8BoJ9teHaDc+bT/haxiAXFdHRxdYaAKYZNKY7SnqhlEFuKO
 TnHolPp2agYV8YIy+PCyL4i9g6kL0BHO8eMLYIv+2n3gOSgqd6DVe1ilP75vBhL6PGqw
 F6RtTVbLvKvBuKYZnipbMx0SMppGlDRE+CYahUAqiJShO0o03ga+kfD2K2Et8FOa4LRZ
 sU6ilgRrpEEdnVyl8gX58KFK7533aAvQTFKV4co9+9h229JfK0YvmnttgYBjBiOrtgqM
 6TiSbYEm8vmKZYR5fequ3g00xW0+k9q+/Q7aUNg7UNL5Jy/1YJ+LXimcU/E/Q1GXdszc
 QF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084209; x=1780689009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tDALMDNynw3GUuarnrLNetX0Kec6G0245sRIZSxkHLs=;
 b=jHwt3ClG80+RCa4tFIlU8A8zDe9xsJBSdsO32SMhQc7py1bRykxrTHDN8MqPCTibxl
 ec6bwyLqbj3niUzgrFlNf27xtVBeJvIypwkXXddauREM4B6gB+x2dt2c5SG26HFWVK0u
 1IRis1kUZjZb9+OVTTWnv9LIidDlsmlWQc8bkB8ZJGpvDLRDQuRg72GN7tq+49BSnnFK
 w5i51t7vd+r4TC0p88Zaq252SfvGkw46tRycmDQ8Pqy9u8w/0vGBc4kwQ5FfMsv0pe+v
 fOh1Fp87O0hn5NDfKAItOLhwr6cXDlb/ahe5nUx4O3Hspgs/wbtYho0paQJq5bOflKD+
 HhVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/EALdWdEsS1V5w1/pGCeBJYtEEZ2p+NzIxa2duOA99tzIQZzVuFQsYbXWoPNYvDDmEOsugf6Zkr+i8@nongnu.org
X-Gm-Message-State: AOJu0YzG3o4ewH2/p3cr1dOpor96TgFG1FVHpbdkDRBGn57dp80JTaZ7
 Eh15l7qFI5XGFMQhGcvwwZHM4wt9PhQzwFO8/IXIL6vduJxRsbRXyZ9jwlR0rYA7//E=
X-Gm-Gg: Acq92OG5PgUIFX1ErXfA12GkympnIK3CK73gsBX/LaE4i6yyLD+9tcZ7y8cS0NeoLPX
 9hxtfZcoFAsAEvsaIElJp1tcyhw3M9H/6aIn8SyOIV1pu/qv4mq+XOKU3AHIes0zMiNML02fjS8
 tuo13KKpLebHEff1Gx3nTIaYcnVVIOK4bkGV3efOXKrs1Xt9UqiLIVjb6VDxGnWpDITNbFw1ch6
 tdueummY5ACMSPbDJuZvrtdqTnZAWwaEu3DQZJm5qx0WwXbeCH/3PCgXZmuck6EP3tKeZGApskg
 vzwpGLqXSPvuGccptp4noPtHYWsc5LvIPWD0TAIQmBY8hA+QFqqJZ7WjYsDkqHACKiOuDNZ9QLU
 ZSYa1/FxOuJXPUCbZCUbmNNfnJ1rGaFAFJQLXHN34vE3oJ8hKSvfI6a3xgI4mDnkVYcrkwu7VE7
 66L9KvZcMiwVYg+ImbJztPXUymuKBCZRfQtkxHceGMm5R1ddll3sMBVTHL7YnRlBgB0g==
X-Received: by 2002:a05:600c:8b53:b0:490:a29b:e72f with SMTP id
 5b1f17b1804b1-490a29be7a4mr15412425e9.4.1780084209487; 
 Fri, 29 May 2026 12:50:09 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c0d4f4esm28563585e9.1.2026.05.29.12.50.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:50:08 -0700 (PDT)
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
Subject: [PATCH v2 03/17] accel: Rename AccelOpsClass::cpu_target_realize() ->
 cpu_realize()
Date: Fri, 29 May 2026 21:49:25 +0200
Message-ID: <20260529194940.97143-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

cpu_target_realize() is misleading, we simply want the host
accelerator to realize its things on a vCPU. Rename more
generically.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/accel/accel-cpu-ops.h | 2 +-
 accel/accel-common.c          | 5 +++--
 accel/hvf/hvf-accel-ops.c     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 9c07a903ea0..fd1307dad6d 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,7 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
-    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
+    bool (*cpu_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index ebc103053dc..176b03e0e90 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -60,9 +60,10 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+
+    /* specialize with target specific realization */
     if (acc->ops
-        && acc->ops->cpu_target_realize
-        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        && acc->ops->cpu_realize && !acc->ops->cpu_realize(cpu, errp)) {
         return false;
     }
 
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b74a5779c3d..6edc2242ed9 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -356,7 +356,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->cpu_target_realize = hvf_arch_cpu_realize;
+    ops->cpu_realize = hvf_arch_cpu_realize;
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
-- 
2.53.0


