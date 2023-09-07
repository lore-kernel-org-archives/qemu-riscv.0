Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35773EE14D0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 08:20:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeAFW-0005vw-1l; Thu, 07 Sep 2023 04:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qeAFU-0005vJ-Vi
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 04:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qeAFQ-0006Nb-TV
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 04:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694074819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2OyX/4vicH8Ymp1kGXt6T0QEQRWRB432IzgFJXDEm0=;
 b=MDjto5FoP5SUztdkQ++2Es+Xbj9RPynsJGgjNxnYK2kf04RaMWeX18F4igKAgzHAe9kcyg
 0AcZvxdtD2FF+kW0y7Qk8XC/C9vRAdQp//9kyHwyFu4YAUGwxGhwZul0+DixxndVermMXr
 JscFmdVOm9Ms6E/KXeS9XfXdx6ehhKI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-ERoHeZJIPcmU-2bPh9KE2g-1; Thu, 07 Sep 2023 04:20:18 -0400
X-MC-Unique: ERoHeZJIPcmU-2bPh9KE2g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31aecb86dacso450551f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 01:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694074817; x=1694679617;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2OyX/4vicH8Ymp1kGXt6T0QEQRWRB432IzgFJXDEm0=;
 b=PMD/wFs4wlPZppF7ndQRhf2qTPeZobOXiTc1urj93dJFFqMdJoz46hGtlXsrWi4C8R
 I688/xo8NN9vhCY3i1BLywkVYeZlaecZDLA/biLpD7nSb8sUZ+94ny1V0bKWGxXkuljv
 eYC5iRq7Z/uEN0UIs/8oLctcu/CVhGgoKxKHWxC/6zdnqAIp/P41y3kf0llpjaKQhQF3
 eMw1ILKQxshpFGky1sN32u6jhnvcZq6ExJtS4CJdx9wuOv12aAALZZXv8y/MEfj+7q/q
 7ydVDVWaXau7oKkwnx2aPFFmWPJMlHoQeD35z1Bs2hUxvDK2Olu7yixbELCRYpGfNiAZ
 /XCg==
X-Gm-Message-State: AOJu0Yy03siu0C0CybDFpzBaOAr94nj1jjUR+s5E5UsFBYSQ9AHt2S0V
 Ci6ScISFhn+a9hNkPeRTk9e4VHN01d6xIbCSPE4m72Vtnf+/lYlGm4sMpPvlW9WW63Vs6V24OUQ
 1YT6PIyYjgcK6tcs=
X-Received: by 2002:a5d:564c:0:b0:31c:8b99:47bf with SMTP id
 j12-20020a5d564c000000b0031c8b9947bfmr4064041wrw.41.1694074817245; 
 Thu, 07 Sep 2023 01:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBfWtB81y+tgtij8URm+UajJvIwLLdecmarEy0Ps5YuBxbmCXz9dN9lX5wcmyMtvyll51O5Q==
X-Received: by 2002:a5d:564c:0:b0:31c:8b99:47bf with SMTP id
 j12-20020a5d564c000000b0031c8b9947bfmr4063983wrw.41.1694074816836; 
 Thu, 07 Sep 2023 01:20:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:cb00:d8c3:e672:87cb:e4d9?
 (p200300cbc711cb00d8c3e67287cbe4d9.dip0.t-ipconnect.de.
 [2003:cb:c711:cb00:d8c3:e672:87cb:e4d9])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a7bc414000000b003fd2e898aa3sm1315536wmi.0.2023.09.07.01.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:20:16 -0700 (PDT)
Message-ID: <698b58e2-0c41-856d-cd79-71c8d0b3ff79@redhat.com>
Date: Thu, 7 Sep 2023 10:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU
 model names
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, thuth@redhat.com,
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-16-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230907003553.1636896-16-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 07.09.23 02:35, Gavin Shan wrote:
> For target/s390x, the CPU type name is always the combination of the
> CPU modle name and suffix. The CPU model names have been correctly
> shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().
> 
> Use generic helper cpu_model_from_type() to show the CPU model names
> in the above two functions. Besides, we need validate the CPU class
> in s390_cpu_class_by_name(), as other targets do.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/s390x/cpu_models.c        | 18 +++++++++++-------
>   target/s390x/cpu_models_sysemu.c |  9 ++++-----
>   2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 91ce896491..103e9072b8 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -338,7 +338,8 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>   {
>       const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
>       CPUClass *cc = CPU_CLASS(scc);
> -    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
> +    const char *typename = object_class_get_name((ObjectClass *)data);
> +    char *model = cpu_model_from_type(typename);
>       g_autoptr(GString) details = g_string_new("");
>   
>       if (scc->is_static) {
> @@ -355,14 +356,12 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>           g_string_truncate(details, details->len - 2);
>       }
>   
> -    /* strip off the -s390x-cpu */
> -    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
>       if (details->len) {
> -        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
> +        qemu_printf("s390 %-15s %-35s (%s)\n", model, scc->desc, details->str);
>       } else {
> -        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
> +        qemu_printf("s390 %-15s %-35s\n", model, scc->desc);
>       }
> -    g_free(name);
> +    g_free(model);
>   }
>   
>   static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
> @@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char *name)
>   
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    return oc;
> +    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
> +        !object_class_is_abstract(oc)) {
> +        return oc;
> +    }
> +
> +    return NULL;

Why is that change required?

-- 
Cheers,

David / dhildenb


