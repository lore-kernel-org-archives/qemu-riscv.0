Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2558FCCD183
	for <qemu-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 10:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vAQER-0002R2-Kd; Sun, 19 Oct 2025 06:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vAQEM-0002QW-RP
 for qemu-riscv@nongnu.org; Sun, 19 Oct 2025 06:01:40 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vAQEK-0004BH-C2
 for qemu-riscv@nongnu.org; Sun, 19 Oct 2025 06:01:38 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-290c5dec559so24580505ad.3
 for <qemu-riscv@nongnu.org>; Sun, 19 Oct 2025 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1760868093; x=1761472893; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HyjU7/9cHhxNTXSkm9cndu2yQ2Y1BQpOutCcsIwj1+o=;
 b=R/zhqb54iDwcrONxcuGteAMXt5nNtHvMjAGqX5PCnr7++ijyt2DN59FhgiloXBsrpy
 iVSX0UDVMrXptBgjz6ffMI8/VqHjlLBSdGPiHKZznOMP+LDbSOZMm84FnSSDjaoqCjFS
 MkIEGMw85xkxygWtEIecLOOYEINlu6jKNcQgwQ2+sj98tlmSRLDaN6fNB6UwpKV5GsK9
 F+qdT8TllPL/q3WZTXT98MjYQIsS6X7QVNkw2oZnus2h1t49K/JFpp6tMJy0O46F5SM5
 2vukHI7hBpaf4gwQ+ccvQ36W6MXVEg7AstSCBIUDXfkzum5PXfNACiFouN/6aR22n7dy
 4blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760868093; x=1761472893;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HyjU7/9cHhxNTXSkm9cndu2yQ2Y1BQpOutCcsIwj1+o=;
 b=os8XH2xqOPUn+JvZLntIwYbj3ndIvP3GoR4aRM5fawiG093l02y+qJG9ovfVYTIdME
 ZZlsLWxNrl+N+PyPh6KhnTR+T9f2cELblAaS6rOygh5HF/9dnRoGc/Db9LbUXtLbODwC
 +MZuDSEIqUjm5DatGJAQg64uMCp49HFMC5nO7Zzw2OO59IvEDRXs+vcOAGVl6R37HVrd
 0SsOaPTjUFq7bIg14HOMqtGRkrDva/I5R7RXOKK3dNVI6A8CTObmzG4ZO2ktgVfR1L4Z
 EaJkli0GY2Zvz+yX1HZtU+6RBx4smG5L9vZfvVlBtAZpMwEwoPmN29hpv1UWyrmoDamB
 JUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHlhvNJyDDDyiHjS+pcNVD6z/OlYpYEuyEFGp1K/LLalZdl7hDVnzxmzMAkewddE4J+rtjBzBuFo2h@nongnu.org
X-Gm-Message-State: AOJu0YwYnBfrc3XtMIOyAfRm3WpjWxJJMVt1SuVQJmvxALuayP5mEwt7
 /efyUKz0E4Yk+sp9DuICVJCYNEirBB57EsihX2XmCcOg8hlnqfnx8sjQucuQzkrpavU=
X-Gm-Gg: ASbGncsgfa/j9tplYKTs1uSfcwTS/wG37d2vggAm5H1JxTGXT2VraFgHze+ZsyDwYbq
 U9TI+BrwjlD5ZjRdtZ56WtCOgeOwtwDAjW86g+cpZ4ni60cDWaiQCZcq9fG9wYAswToL3+yZvX1
 mjyi0022QQXekL9xyyBERsgvB/xLvzpGU4w2ReIVX1B7qd3MBKq2escma4RYUqR2TwwDdKKEgzW
 B0agdalQmEWtF3oxWAwyddWJCGRT5H3RB0LCH014/IZP8IgaO6pJSey4uObOZsMfdvfvyfvjjP9
 E1llKoRcEsVk65TZ9SQRBIc2kwdbI4ve9X/QnYAUbPUMgXiQGcOESUgo+0rWjUtLcEiOFhjvdxN
 whnZRwsPeldVqftDzi17hBocsUBi2o0bgkCxxUQenMX9twHCt/EU8K/1GnF2wGFQN5+rm5urkxT
 2+W3NrPpE0xQak4eU=
X-Google-Smtp-Source: AGHT+IFoT3oKvPWPF9ubm9p0zYN6K3Pv5NEFGnqIzrpEhrOo5uZueFH3CoXmA/BDSnFyD618t4Yr0g==
X-Received: by 2002:a17:902:f642:b0:269:9a8f:a4ab with SMTP id
 d9443c01a7336-290cb94ca6fmr108251425ad.60.1760868093523; 
 Sun, 19 Oct 2025 03:01:33 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.122.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5c0bsm48360615ad.69.2025.10.19.03.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 03:01:32 -0700 (PDT)
Message-ID: <b3cbe49d-e863-456d-a254-b7514e3bb33a@ventanamicro.com>
Date: Sun, 19 Oct 2025 07:01:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix a uninitialized variable warning
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org
References: <20251019-vlen-v1-1-f7352a402f06@rsg.ci.i.u-tokyo.ac.jp>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251019-vlen-v1-1-f7352a402f06@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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



On 10/19/25 5:19 AM, Akihiko Odaki wrote:
> riscv_cpu_validate_v() left its variable, min_vlen, uninitialized if
> no vector extension is available, causing a compiler warning. Avoid
> the warning by calling g_assert_not_reached() in the case.

For the compiler point of view the variable will be left uninitialized.
In reality we'll always set it to at least '32' in validate_v(). This
is how the function is being called:

     if (cpu->cfg.ext_zve32x) {
         riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
         }
     }

This means that inside the function we guarantee that min_vlen will be
at least set to 32 because cfg->ext_zve32x will always be true:

     if (riscv_has_ext(env, RVV)) {
         min_vlen = 128;
     } else if (cfg->ext_zve64x) {
         min_vlen = 64;
     } else if (cfg->ext_zve32x) {
         min_vlen = 32;
     }


To make the compiler happy and the code a bit clearer I suggest initializing
min_vlen = 32 and folding the "if (cpu->cfg.ext_zve32x)" check inside
validate_v() for an early exit. Something like this:


@@ -417,15 +417,19 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                   Error **errp)
  {
-    uint32_t min_vlen;
-    uint32_t vlen = cfg->vlenb << 3;
+    uint32_t min_vlen, vlen;
+
+    if (cfg->ext_zve32x) {
+        return;
+    }
+
+    min_vlen = 32;
+    vlen = cfg->vlenb << 3;
  
      if (riscv_has_ext(env, RVV)) {
          min_vlen = 128;
      } else if (cfg->ext_zve64x) {
          min_vlen = 64;
-    } else if (cfg->ext_zve32x) {
-        min_vlen = 32;
      }
  
      if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
@@ -676,12 +680,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
          return;
      }
  
-    if (cpu->cfg.ext_zve32x) {
-        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
-        }
+    riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
      }


Note: I wonder why we're allowing settings of VLEN and so on when we do
not have RVV set. Seems like a bug ...


Thanks,

Daniel




> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   target/riscv/tcg/tcg-cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 1150bd14697c..acbfac5d9e2c 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -426,6 +426,8 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>           min_vlen = 64;
>       } else if (cfg->ext_zve32x) {
>           min_vlen = 32;
> +    } else {
> +        g_assert_not_reached();
>       }
>   
>       if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
> 
> ---
> base-commit: c85ba2d7a4056595166689890285105579db446a
> change-id: 20251019-vlen-30a57c03bd93
> 
> Best regards,
> --
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> 


