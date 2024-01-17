Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED5C47258
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 19:53:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQBy0-0006Gi-6w; Wed, 17 Jan 2024 14:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rQBxu-0006Fj-Pa
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 14:52:46 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rQBxs-0006a1-9P
 for qemu-riscv@nongnu.org; Wed, 17 Jan 2024 14:52:46 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d40eec5e12so96820755ad.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jan 2024 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705521160; x=1706125960; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/xYk42ygsk5lrbwH+7arOtpwkLJGnVt3Ohm4NVD7B1s=;
 b=ojRhNDO2H+dY3kwRWJgN0c/aZ5Rky/RpAKF+HLeZhIcHjB+ljlfW3lwLrhFJw+Szzv
 p14Kto6PvuLw5SstV7Wx1ofwCSDKK/CbaMa6u0NXGIFqawNih7yGf+GpWBKPayPZBdHV
 Di9hn7CS1mfCZ5LF9WFQqvWTEzuGhXY6Bzl4FRL7Qru+GJxbq4qIw/qirnPaFOhofDW0
 d+4SYYTe9ZgmNJ3CIjcXkVidY6L9/mr2JjFl9O247U3k7H0StHDaRY8NvhPm/LgiHNgK
 0J6RBlBctuenq7x4vmIf0ke2mEUHoIzVz0daRoHUh8dygwsmRC9D2902HRh9bEYeOrvc
 pE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705521160; x=1706125960;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/xYk42ygsk5lrbwH+7arOtpwkLJGnVt3Ohm4NVD7B1s=;
 b=wgpQMHXPJap3sj16W/1MnEukJvRMx9dvxG9hKD7761gUW3SbLScc8N5R9no+gkYulV
 1LPjcT9WSQkzZjgod/GllfAWoTYIu3A8I4marcZ2oNn4XZ4N93qOtinDvMVWmL7Xbs3v
 Igru1Y5G42sIqnFbuEtFpIGKmy/276SsqsSETHzaUaMZvO6wgH1YlrOCpYx9ad9tO+t6
 hWlNi0l2JgFZNpvnHTFDD7ohMnjFRhQkgYEn8oRyAIFm9Gomn40RT+ug6WSVpD4wfC2p
 QuF2KW4Ln2r3A9a1GdQAc3YcPm9O2os7jFIvpWPYLi5rDnsZhywO/rNOB6AKx8uVH6ME
 sPoA==
X-Gm-Message-State: AOJu0YwJ8DjcQhM+PfarDz/JqYrCHnj97CQ1m2tyNR3AD8jRzlyESZ2g
 jnkBJ4uW4EN+cYG2RseUgkYrLIz2Z7Wi3w==
X-Google-Smtp-Source: AGHT+IEIXppR5WjVnNdveMBHeYjkkqGC0It4LUZIxfDr/ECMCV9MiIH741Ufv+RygFL0VR9jexHmeg==
X-Received: by 2002:a17:903:25d2:b0:1d5:f57d:2df with SMTP id
 jc18-20020a17090325d200b001d5f57d02dfmr2194351plb.45.1705521160187; 
 Wed, 17 Jan 2024 11:52:40 -0800 (PST)
Received: from [192.168.68.110] ([152.234.127.133])
 by smtp.gmail.com with ESMTPSA id
 kx6-20020a170902f94600b001d6f4500070sm40052plb.5.2024.01.17.11.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 11:52:39 -0800 (PST)
Message-ID: <4f6be7f1-82fb-4361-88c6-427443a85760@ventanamicro.com>
Date: Wed, 17 Jan 2024 16:52:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv: Convert sdtrig functionality from
 property to an extension
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
 <20240117142412.1615505-2-hchauhan@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240117142412.1615505-2-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 1/17/24 11:24, Himanshu Chauhan wrote:
> The debug trigger (sdtrig) capability is controlled using the debug property.
> The sdtrig is an ISA extension and should be treated so. The sdtrig extension
> may or may not be implemented in a system. Therefore, it must raise an illegal
> instruction exception when it is disabled and its CSRs are accessed.
> 
> This patch removes the "debug" property and replaces it with ext_sdtrig extension.
> It also raises an illegal instruction exception when the extension is disabled and
> its CSRs are accessed.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>   target/riscv/cpu.c        | 7 +++----
>   target/riscv/cpu_cfg.h    | 2 +-
>   target/riscv/cpu_helper.c | 2 +-
>   target/riscv/csr.c        | 2 +-
>   target/riscv/machine.c    | 2 +-
>   5 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b07a76ef6b..c770a7e506 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -909,7 +909,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>       set_default_nan_mode(1, &env->fp_status);
>   
>   #ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.debug) {
> +    if (cpu->cfg.ext_sdtrig) {
>           riscv_trigger_reset_hold(env);
>       }
>   
> @@ -1068,7 +1068,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       riscv_cpu_register_gdb_regs_for_features(cs);
>   
>   #ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.debug) {
> +    if (cpu->cfg.ext_sdtrig) {
>           riscv_trigger_realize(&cpu->env);
>       }
>   #endif
> @@ -1393,6 +1393,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>   
>   /* These are experimental so mark with 'x-' */
>   const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
> +    MULTI_EXT_CFG_BOOL("x-sdtrig", ext_sdtrig, true),
>       MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
>       MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>   
> @@ -1480,8 +1481,6 @@ Property riscv_cpu_options[] = {
>   };
>   
>   static Property riscv_cpu_properties[] = {
> -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> -

We can't just get rid of 'debug' out of nowhere. If any user has any scripts that happens
to be using the 'debug' flag QEMU will stop booting for them.

The policy for deprecation is to (1) warn the user that the option is deprecated and
inform about the right option to use and (2) document it in docs/about/deprecated.rst.

You can keep basically everything you did here but, in another patch, you'll need a special
setter() for the 'debug' property that warns about the deprecation and sets ext_sdtrig.
Here's a non-tested diff of what this would look like:

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8d3ec74a1c..66b5033ce5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1685,6 +1685,39 @@ static const PropertyInfo prop_pmp = {
      .set = prop_pmp_set,
  };
  
+static void prop_debug_set(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool value;
+
+    visit_type_bool(v, name, &value, errp);
+
+    if (cpu->cfg.debug != value && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        return;
+    }
+
+    warn_report("\"debug\" property is deprecated; use \"x-sdtrig\"");
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.debug = value;
+    cpu->cfg.ext_sdtrig = value;
+}
+
+static void prop_debug_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.pmp;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_debug = {
+    .name = "debug",
+    .get = prop_debug_get,
+    .set = prop_debug_set,
+};
+
  static int priv_spec_from_str(const char *priv_spec_str)
  {
      int priv_version = -1;
@@ -1942,7 +1975,7 @@ RISCVCPUProfile *riscv_profiles[] = {
  };
  
  static Property riscv_cpu_properties[] = {
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
+    {.name = "debug", .info = &prop_debug}, /* Deprecated */

      {.name = "pmu-mask", .info = &prop_pmu_mask},
      {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */


An example of a docs/about/deprecated.rst entry would be:

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2e15040246..b7608030a9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -439,6 +439,10 @@ by a ``pmu-mask`` property. If set of counters is continuous then the mask can
  be calculated with ``((2 ^ n) - 1) << 3``. The least significant three bits
  must be left clear.
  
+``debug=true|false`` on RISC-V CPUs (since 9.0)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``debug`` flag was superseded by the ``sdtrig`` extension.
  
  Backwards compatibility
  -----------------------



Thanks,


Daniel






>   #ifndef CONFIG_USER_ONLY
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>   #endif
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..341ebf726a 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -109,6 +109,7 @@ struct RISCVCPUConfig {
>       bool ext_zvfbfwma;
>       bool ext_zvfh;
>       bool ext_zvfhmin;
> +    bool ext_sdtrig;
>       bool ext_smaia;
>       bool ext_ssaia;
>       bool ext_sscofpmf;
> @@ -145,7 +146,6 @@ struct RISCVCPUConfig {
>       uint16_t cboz_blocksize;
>       bool mmu;
>       bool pmp;
> -    bool debug;
>       bool misa_w;
>   
>       bool short_isa_string;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e7e23b34f4..3f7c2f1315 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -126,7 +126,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
>       }
>   
> -    if (cpu->cfg.debug && !icount_enabled()) {
> +    if (cpu->cfg.ext_sdtrig && !icount_enabled()) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>       }
>   #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c50a33397c..8dbb49aa88 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -543,7 +543,7 @@ static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
>   
>   static RISCVException debug(CPURISCVState *env, int csrno)
>   {
> -    if (riscv_cpu_cfg(env)->debug) {
> +    if (riscv_cpu_cfg(env)->ext_sdtrig) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 72fe2374dc..8f9787a30f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -231,7 +231,7 @@ static bool debug_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
>   
> -    return cpu->cfg.debug;
> +    return cpu->cfg.ext_sdtrig;
>   }
>   
>   static int debug_post_load(void *opaque, int version_id)

