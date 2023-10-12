Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5EECDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 09:07:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqred-0001V3-Cg; Thu, 12 Oct 2023 05:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qqreU-0001Rh-VS; Thu, 12 Oct 2023 05:06:43 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1qqreS-00014D-Dd; Thu, 12 Oct 2023 05:06:42 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-57b67c84999so455445eaf.3; 
 Thu, 12 Oct 2023 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697101598; x=1697706398; darn=nongnu.org;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huBv2aFj+Jn+sKrMUyrE5W5Z79p5JRrnw9+gbrW2u6E=;
 b=kAaR8KIWovObUsCj4Lwtw9o5A276rfaKBaREwbRc94hoyMLDnvIflxEVQ0SIuockjX
 G6YRKk3xNYavbl97+62wPnHM0pHP/qmeN4T7hoUAU56G0mhqq8/57ToEYzCgThU8NVTz
 Y4tPWqub0cgO58FAA8NSof8LB+wAdAKmI/Le9n2QBcOELFzRdDQLmfxkap9JeZyfTpNY
 g+cefImK4fXT69hdxSNYZoMq1CzwhaSN68CSRdwIc+u40VE2zPJAyfPl9hva4i63e71M
 Useo60Wb4UGv2Oup2w5GgebHchf3keUErmdBAH0tOE35KfMivy5EB2cOuEGw9X+4tAPx
 raPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101598; x=1697706398;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=huBv2aFj+Jn+sKrMUyrE5W5Z79p5JRrnw9+gbrW2u6E=;
 b=P7B5fgU5NwhLo5nvAMrU3dTAewmGF4oTktVIsaPCufcwFUN4c0MNas4jJ3wS/Sm8F9
 m/RdbDTNHyC9JnSPf4g7C4eDDkOF8ZKMiRCXtWDCnkkeyfrBTs6Ri8k3TB0IVOXohgvt
 zoqCPKijKSjfAOwHfiZSk7Gj9yk+cZIF/yxYlQiXDuSArI0ANcDkwVXoDvuS1VcrfuYe
 qNsDj6p4i+W3p/eTNM6/nlKmLa/aQGxZkAYsL2qgeaxC+rPZK0ENkTsszRjpMoMo2aud
 Eovv4Fo4Y3XTmsNgJKKQ/cyH66apzMERZQhQJ9ZU8K4vUHUBhrAh57PwIldAssvDx7zK
 41Tg==
X-Gm-Message-State: AOJu0Yy6rWfYu4Mve1Pn6QixN09rhNsJUPbPE7JWBH+sb0j+8BVbQ43a
 QpWWZtQPxxc/TtWPmlCdttY=
X-Google-Smtp-Source: AGHT+IFNE95AFZ90YerlM7RkZMs++cMn+8Es+hP4PyjG+6c3F2qq4QV1VWbep5/wSr6XEwSj7zk78A==
X-Received: by 2002:a05:6358:788:b0:133:428:35dc with SMTP id
 n8-20020a056358078800b00133042835dcmr26928160rwj.11.1697101598154; 
 Thu, 12 Oct 2023 02:06:38 -0700 (PDT)
Received: from [30.221.101.97] ([47.246.101.49])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a62bd0c000000b0068e49cb1692sm11349270pff.1.2023.10.12.02.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 02:06:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8ugVFO0d4f1BHeWkNtSQyw6X"
Message-ID: <e68ea00e-3f7a-4590-beae-6946d9fde671@gmail.com>
Date: Thu, 12 Oct 2023 17:05:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-6-rbradford@rivosinc.com>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20231011145032.81509-6-rbradford@rivosinc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=baxiantai@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This is a multi-part message in MIME format.
--------------8ugVFO0d4f1BHeWkNtSQyw6X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/10/11 22:45, Rob Bradford wrote:
> Using a mask instead of the number of PMU devices supports the accurate
> emulation of platforms that have a discontinuous set of PMU counters.
>
> Generate a warning if the old property changed from the default but
> still go ahead and use it to generate the mask if the user has changed
> it from the default
>
> Signed-off-by: Rob Bradford<rbradford@rivosinc.com>
> ---
>   target/riscv/cpu.c     |  5 +++--
>   target/riscv/cpu_cfg.h |  3 ++-
>   target/riscv/machine.c |  2 +-
>   target/riscv/pmu.c     | 14 ++++++++++----
>   4 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c9d8fc12fe..4d2987e568 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1487,7 +1487,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>           riscv_timer_init(cpu);
>       }
>   
> -    if (cpu->cfg.pmu_num) {
> +    if (cpu->cfg.pmu_mask) {
>           riscv_pmu_init(cpu, &local_err);
>           if (local_err != NULL) {
>               error_propagate(errp, local_err);
> @@ -1812,7 +1812,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>   
>   static Property riscv_cpu_extensions[] = {
>       /* Defaults for standard extensions */
> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16), /* Deprecated */
> +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_32BIT_MASK(3, 16)),
>       DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 0e6a0f245c..d273487040 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -123,7 +123,8 @@ struct RISCVCPUConfig {
>       bool ext_xtheadsync;
>       bool ext_XVentanaCondOps;
>   
> -    uint8_t pmu_num;
> +    uint8_t pmu_num; /* Deprecated */
> +    uint32_t pmu_mask;
>       char *priv_spec;
>       char *user_spec;
>       char *bext_spec;
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c7c862cdd3..9f6e3f7a6d 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
>   
> -    return cpu->cfg.pmu_num;
> +    return (cpu->cfg.pmu_mask > 0);
>   }
>   
>   static const VMStateDescription vmstate_pmu_ctr_state = {
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 360c76f63e..f2d35b4d3b 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -18,6 +18,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
> +#include "qemu/error-report.h"
>   #include "cpu.h"
>   #include "pmu.h"
>   #include "sysemu/cpu-timers.h"
> @@ -182,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
>       CPURISCVState *env = &cpu->env;
>       gpointer value;
>   
> -    if (!cpu->cfg.pmu_num) {
> +    if (!cpu->cfg.pmu_mask) {
>           return 0;
>       }
>       value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
> @@ -432,7 +433,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>   {
>       uint8_t pmu_num = cpu->cfg.pmu_num;
>   
> -    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3)) {
>           error_setg(errp, "Number of counters exceeds maximum available");
>           return;
>       }
> @@ -443,6 +444,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    /* Create a bitmask of available programmable counters */
> -    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
> +    /* Check if user set it by comparing against default */
> +    if (pmu_num != 16) {
> +        warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
> +        cpu->cfg.pmu_mask = MAKE_32BIT_MASK(3, pmu_num);
> +    }
> +
> +    cpu->pmu_avail_ctrs = cpu->cfg.pmu_mask;

How to process the pmu_mask[0:2] no-zero bits? They should not included 
into pmu_avail_ctrs.

Zhiwei

>   }
--------------8ugVFO0d4f1BHeWkNtSQyw6X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/10/11 22:45, Rob Bradford
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20231011145032.81509-6-rbradford@rivosinc.com">
      <pre class="moz-quote-pre" wrap="">Using a mask instead of the number of PMU devices supports the accurate
emulation of platforms that have a discontinuous set of PMU counters.

Generate a warning if the old property changed from the default but
still go ahead and use it to generate the mask if the user has changed
it from the default

Signed-off-by: Rob Bradford <a class="moz-txt-link-rfc2396E" href="mailto:rbradford@rivosinc.com">&lt;rbradford@rivosinc.com&gt;</a>
---
 target/riscv/cpu.c     |  5 +++--
 target/riscv/cpu_cfg.h |  3 ++-
 target/riscv/machine.c |  2 +-
 target/riscv/pmu.c     | 14 ++++++++++----
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c9d8fc12fe..4d2987e568 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1487,7 +1487,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
         riscv_timer_init(cpu);
     }
 
-    if (cpu-&gt;cfg.pmu_num) {
+    if (cpu-&gt;cfg.pmu_mask) {
         riscv_pmu_init(cpu, &amp;local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
@@ -1812,7 +1812,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16), /* Deprecated */
+    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_32BIT_MASK(3, 16)),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0e6a0f245c..d273487040 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -123,7 +123,8 @@ struct RISCVCPUConfig {
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
-    uint8_t pmu_num;
+    uint8_t pmu_num; /* Deprecated */
+    uint32_t pmu_mask;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c7c862cdd3..9f6e3f7a6d 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu-&gt;cfg.pmu_num;
+    return (cpu-&gt;cfg.pmu_mask &gt; 0);
 }
 
 static const VMStateDescription vmstate_pmu_ctr_state = {
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 360c76f63e..f2d35b4d3b 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
@@ -182,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
     CPURISCVState *env = &amp;cpu-&gt;env;
     gpointer value;
 
-    if (!cpu-&gt;cfg.pmu_num) {
+    if (!cpu-&gt;cfg.pmu_mask) {
         return 0;
     }
     value = g_hash_table_lookup(cpu-&gt;pmu_event_ctr_map,
@@ -432,7 +433,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
 {
     uint8_t pmu_num = cpu-&gt;cfg.pmu_num;
 
-    if (pmu_num &gt; (RV_MAX_MHPMCOUNTERS - 3)) {
+    if (ctpop32(cpu-&gt;cfg.pmu_mask) &gt; (RV_MAX_MHPMCOUNTERS - 3)) {</pre>
    </blockquote>
    <span style="white-space: pre-wrap"></span><span
    style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20231011145032.81509-6-rbradford@rivosinc.com">
      <pre class="moz-quote-pre" wrap="">         error_setg(errp, "Number of counters exceeds maximum available");
         return;
     }
@@ -443,6 +444,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Create a bitmask of available programmable counters */
-    cpu-&gt;pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
+    /* Check if user set it by comparing against default */
+    if (pmu_num != 16) {
+        warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
+        cpu-&gt;cfg.pmu_mask = MAKE_32BIT_MASK(3, pmu_num);
+    }
+
+    cpu-&gt;pmu_avail_ctrs = cpu-&gt;cfg.pmu_mask;</pre>
    </blockquote>
    <p>How to process the pmu_mask[0:2] no-zero bits? They should not
      included into pmu_avail_ctrs.</p>
    <p>Zhiwei<br>
    </p>
    <blockquote type="cite"
      cite="mid:20231011145032.81509-6-rbradford@rivosinc.com">
      <pre class="moz-quote-pre" wrap="">
 }
</pre>
    </blockquote>
  </body>
</html>

--------------8ugVFO0d4f1BHeWkNtSQyw6X--

