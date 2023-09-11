Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A237CEE7FF4
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:33:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfh26-0003dz-Cr; Mon, 11 Sep 2023 09:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfh24-0003dg-VN
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 09:32:52 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfh1q-0006Y2-0A
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 09:32:52 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6c0a42a469dso3029483a34.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694439156; x=1695043956; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ruof2Jlb2oOqFv0WOJ55vUSadX7SbT5a0sH+2dfmnSs=;
 b=LDOuC8eVCfZlK+Z0yWJ6o8ubDYnh9JozNoDKM9r5fWNX9Mz8lVwavBm+vVnrMn025N
 xNKWWNdocMFjiQ5M6+WGqOp5DgYNAVjZoo5o43sh3BNHIL+h/GUezSpwnNH/jxtwsqrO
 CktccK/5rPdhYUyP5HDhXK+KOlzDad392rYiXKNZZshnlV3NrcRoIrUXHpV/eYtI7uAU
 aMNKR9VsCbHTV4UqtmnAMRiy4G/FhV0wV+mMUo/ONnQvDKq6yXKn9WzuW+9tF+j6SLTh
 ljC0JSRvh8fiuzAsrz27MN8z5u1OCwktrHsmruJdKt/kwpsBJ2tDNdy9+YKbhsSfG67i
 IsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694439156; x=1695043956;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ruof2Jlb2oOqFv0WOJ55vUSadX7SbT5a0sH+2dfmnSs=;
 b=tpUYeSlFYOFn7c2fY7PqN5Lk+fg8xxjnu+sBRiHhm/LC4HfIEIckJH+qwc7XKRStoZ
 D1w0MmR3cRGLejtc/Livi/mrqshoZqwAjIYtVOYO6+5kyE0M6Oh4cVH6J4aVLDaNS6oz
 L37r+V9vjEjB1svhoSXRdNN9NveDACB0L/7rDI1tbJ597gMX9EIFP3xko7SGw/rw9HqE
 QbuwzqK/992QqqAsFyt3BeNNydBRxjFKa1BHzFRZwl5vHIrADLHsUjUYC4eYPYE2d0zf
 f61z4pMGqrWu5RGZca4gzAB7TZFv/8EizualcHurre4Z8g4U9gmbpDXDiPZjJzGWzMCI
 G2zw==
X-Gm-Message-State: AOJu0YyaMiSLC0Elxak5y4im1u3G1Y8gcEU1p0KvBfdI3n1gi++P/H5w
 1LB1DZXbqwBGmGZkA1q7Yz1LFQ==
X-Google-Smtp-Source: AGHT+IG5c2ZXAkgJJ3NsQv4pjB/PVF1vKQ5BKQhoakVy+BUDLMGoak11VM/IplKKNrI7mo1FWTV7/g==
X-Received: by 2002:a05:6830:2088:b0:6b9:50a8:1e76 with SMTP id
 y8-20020a056830208800b006b950a81e76mr8948838otq.17.1694439156272; 
 Mon, 11 Sep 2023 06:32:36 -0700 (PDT)
Received: from [192.168.68.107] ([177.9.182.82])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056830118b00b006bb2265b87dsm3087473otq.15.2023.09.11.06.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 06:32:35 -0700 (PDT)
Message-ID: <5f5220c2-25ff-1941-b9e5-e01f034985de@ventanamicro.com>
Date: Mon, 11 Sep 2023 10:32:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 03/20] target/riscv/cpu.c: split kvm prop handling to
 its own helper
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-4-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

Alistair, Phil,


On 9/1/23 16:46, Daniel Henrique Barboza wrote:
> Future patches will split the existing Property arrays even further, and
> the existing code in riscv_cpu_add_user_properties() will start to scale
> bad with it because it's dealing with KVM constraints mixed in with TCG
> constraints. We're going to pay a high price to share a couple of common
> lines of code between the two.
> 
> Create a new riscv_cpu_add_kvm_properties() that will be forked from
> riscv_cpu_add_user_properties() if we're running KVM. The helper
> includes all properties that a KVM CPU will add. The rest of
> riscv_cpu_add_user_properties() body will then be relieved from having
> to deal with KVM constraints.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++----------------
>   1 file changed, 42 insertions(+), 23 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db640e7460..8e6d316500 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1943,6 +1943,46 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>   }
>   #endif
>   
> +#ifndef CONFIG_USER_ONLY

As said by Phil in the PR this should be 'CONFIG_KVM', but that's not enough to fix the
CI problem that was reported by Stefan.

The problem appears with --enable-debug because the compiler can't eliminate the
function call down there:

> +static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
> +{
> +    /* Check if KVM created the property already */
> +    if (object_property_find(obj, prop_name)) {
> +        return;
> +    }
> +
> +    /*
> +     * Set the default to disabled for every extension
> +     * unknown to KVM and error out if the user attempts
> +     * to enable any of them.
> +     */
> +    object_property_add(obj, prop_name, "bool",
> +                        NULL, cpu_set_cfg_unavailable,
> +                        NULL, (void *)prop_name);
> +}
> +
> +static void riscv_cpu_add_kvm_properties(Object *obj)
> +{
> +    Property *prop;
> +    DeviceState *dev = DEVICE(obj);
> +
> +    kvm_riscv_init_user_properties(obj);
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +
> +    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +        /* Check if KVM created the property already */
> +        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +    }
> +}
> +#endif
> +
>   /*
>    * Add CPU properties with user-facing flags.
>    *
> @@ -1958,39 +1998,18 @@ static void riscv_cpu_add_user_properties(Object *obj)
>       riscv_add_satp_mode_properties(obj);
>   
>       if (kvm_enabled()) {
> -        kvm_riscv_init_user_properties(obj);
> +        riscv_cpu_add_kvm_properties(obj);
> +        return;

^ here. The reason is that riscv_cpu_add_kvm_properties() will be unused after that, and
the compiler will then refuse to crop the block.

I fixed it by changing the ifdef to 'CONFIG_KVM' and also by adding it kvm_riscv.h:

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8e6d316500..7b7c5649e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1924,7 +1924,7 @@ static Property riscv_cpu_options[] = {
      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
  };
  
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_KVM
  static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
                                      const char *name,
                                      void *opaque, Error **errp)
@@ -1941,9 +1941,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
                     propname);
      }
  }
-#endif
  
-#ifndef CONFIG_USER_ONLY
  static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
      /* Check if KVM created the property already */
@@ -1961,7 +1959,7 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
                          NULL, (void *)prop_name);
  }
  
-static void riscv_cpu_add_kvm_properties(Object *obj)
+void kvm_riscv_cpu_add_kvm_properties(Object *obj)
  {
      Property *prop;
      DeviceState *dev = DEVICE(obj);
@@ -1998,7 +1996,7 @@ static void riscv_cpu_add_user_properties(Object *obj)
      riscv_add_satp_mode_properties(obj);
  
      if (kvm_enabled()) {
-        riscv_cpu_add_kvm_properties(obj);
+        kvm_riscv_cpu_add_kvm_properties(obj);
          return;
      }
  #endif
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index de8c209ebc..69e807fbfb 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -19,6 +19,9 @@
  #ifndef QEMU_KVM_RISCV_H
  #define QEMU_KVM_RISCV_H
  
+/* Temporarily implemented in cpu.c */
+void kvm_riscv_cpu_add_kvm_properties(Object *obj);
+
  void kvm_riscv_init_user_properties(Object *cpu_obj);
  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
  void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);


I'm aware that it's not ideal to have a kvm_riscv.h function implemented in cpu.c,
but we will only be able to move it to kvm.c when the extension arrays are being
exported later on.


This should fix the CI problem. I say 'should' because the CI job that is breaking
for Stefan is one of the custom jobs that I'm not able to run by default (not sure if
they're run only before merging to master ...).


Thanks,


Daniel





>       }
>   #endif
>   
>       riscv_cpu_add_misa_properties(obj);
>   
>       for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -#ifndef CONFIG_USER_ONLY
> -        if (kvm_enabled()) {
> -            /* Check if KVM created the property already */
> -            if (object_property_find(obj, prop->name)) {
> -                continue;
> -            }
> -
> -            /*
> -             * Set the default to disabled for every extension
> -             * unknown to KVM and error out if the user attempts
> -             * to enable any of them.
> -             */
> -            object_property_add(obj, prop->name, "bool",
> -                                NULL, cpu_set_cfg_unavailable,
> -                                NULL, (void *)prop->name);
> -            continue;
> -        }
> -#endif
>           qdev_property_add_static(dev, prop);
>       }
>   
>       for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> -        /* Check if KVM created the property already */
> -        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> -            continue;
> -        }
>           qdev_property_add_static(dev, &riscv_cpu_options[i]);
>       }
>   }

