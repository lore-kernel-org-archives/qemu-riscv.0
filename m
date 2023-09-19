Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1460CE79A9
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 20:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qihHW-00016H-I7; Tue, 19 Sep 2023 16:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qihHV-000162-Hg
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 16:25:13 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qihHT-0004tl-KR
 for qemu-riscv@nongnu.org; Tue, 19 Sep 2023 16:25:13 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3ade101217bso1193631b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Sep 2023 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695155110; x=1695759910; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ouMVb2HYYo1v6vIgurlKVjciLo7o07AaquZytwB3QEw=;
 b=DxvdI0MYrCaMqsNjTqB93xSQ7wQME9YVrNECsQ9RAOso0y8MhBn7zmRgUXbApdlHjo
 vdwKc2jmx28P5HtnpfDgXNFNARNsZDN6LYE+yYfW8t3Pl4O+zKfkt3DE3b6m4fwBEfFd
 kyf2LPHDazeotu5sWlYV2RfAe+FusLUjAsX6ENT7DVV6HqC12fPkVcNTTgJ3LtTpGpNq
 wEZvthLYMi6vyW/XO+vHx4Dd8KkFM/y40fosK4ClZvHpilajFxGL1ZKn7I3XpVz83DdG
 YMpEyABk5OP4rH7LZPMXKW72O33zE2xGSjd9qKfCOiYE84660tr5N5Sg9TQNJlFJQFxq
 +SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695155110; x=1695759910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ouMVb2HYYo1v6vIgurlKVjciLo7o07AaquZytwB3QEw=;
 b=SF2KRgFQtK2QJUIDAfhJDU2rry8X0FFdm9WXG8317LxDNV6yZZxDOLqc9qM5XN9vDG
 yKcVHpXLAZwgaFCFNo2CDJFhnkom0iiroazQ62wkoC6dxPqOMF/fcF3MaJlxoOzql9Bf
 ffiF60k/dTJqKfYEcWog9i8tXWl+PgtqwukSVhgzPPzeUSgb5X80dWlmVfTaMRSivhZG
 NJpUmbuky05mpderkwyoek98pWjGQNgzoDluc1fKUq8EoS5fFlvb6u29SpCPEC3vXCkI
 8J4mLqURtGD1fZJ0d6ut9VCu+pF5E7dXQyLEYGTnSLhJgr9Wtkzj7reTdN3sMbYIwIbc
 GQGg==
X-Gm-Message-State: AOJu0YwYLkqdVk877tiZoDXxdCB03sMF0RxbLA5XT15HkmCcCY6Ooo1x
 OYA/8g/26OPZEOFmxEBNpk3frg==
X-Google-Smtp-Source: AGHT+IEhDj9kVFwnamWBTcVxSGSfPFfV4/aHwg5a3w7Oj5kWR9/MM4pzT+3lStxdqlA3bBzASs79Zg==
X-Received: by 2002:a05:6808:286:b0:3a8:b056:c3a2 with SMTP id
 z6-20020a056808028600b003a8b056c3a2mr375836oic.47.1695155110232; 
 Tue, 19 Sep 2023 13:25:10 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.127.211])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a54488d000000b003a792121f47sm5254501oic.45.2023.09.19.13.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 13:25:09 -0700 (PDT)
Message-ID: <8714d6cd-84c4-f592-1a9b-ecee28b025be@ventanamicro.com>
Date: Tue, 19 Sep 2023 17:24:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/32] target/riscv: Use generic helper to show CPU
 model names
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, david@redhat.com,
 thuth@redhat.com, iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 pbonzini@redhat.com, imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-14-gshan@redhat.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230907003553.1636896-14-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/6/23 21:35, Gavin Shan wrote:
> For target/riscv, the CPU type name is always the combination of the
> CPU model name and suffix. The CPU model names have been correctly
> shown in riscv_cpu_list_entry() and riscv_cpu_add_definition()
> 
> Use generic helper cpu_mdoel_from_type() to show the CPU model names
> in the above two functions, and adjusted format of the output from
> riscv_cpu_list_entry() to match with other targets. Besides, the
> function riscv_cpu_class_by_name() is improved by renaming @cpuname
> to @model since it's for the CPU model name, and merging the condtion

typo: "condition"

> of "@oc == NULL" to object_class_dynamic_cast().
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---


Tested with "-cpu help" and "query-cpu-definitions". LGTM


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.c            | 23 +++++++++++++----------
>   target/riscv/riscv-qmp-cmds.c |  3 +--
>   2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453..a525e24c5a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -612,18 +612,19 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
>       char *typename;
> -    char **cpuname;
> +    char **model;
>   
> -    cpuname = g_strsplit(cpu_model, ",", 1);
> -    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), cpuname[0]);
> +    model = g_strsplit(cpu_model, ",", 1);
> +    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), model[0]);
>       oc = object_class_by_name(typename);
> -    g_strfreev(cpuname);
> +    g_strfreev(model);
>       g_free(typename);
> -    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
> -        object_class_is_abstract(oc)) {
> -        return NULL;
> +    if (object_class_dynamic_cast(oc, TYPE_RISCV_CPU) &&
> +        !object_class_is_abstract(oc)) {
> +        return oc;
>       }
> -    return oc;
> +
> +    return NULL;
>   }
>   
>   static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> @@ -2211,9 +2212,10 @@ static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
>   static void riscv_cpu_list_entry(gpointer data, gpointer user_data)
>   {
>       const char *typename = object_class_get_name(OBJECT_CLASS(data));
> -    int len = strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX);
> +    char *model = cpu_model_from_type(typename);
>   
> -    qemu_printf("%.*s\n", len, typename);
> +    qemu_printf("  %s\n", model);
> +    g_free(model);
>   }
>   
>   void riscv_cpu_list(void)
> @@ -2222,6 +2224,7 @@ void riscv_cpu_list(void)
>   
>       list = object_class_get_list(TYPE_RISCV_CPU, false);
>       list = g_slist_sort(list, riscv_cpu_list_compare);
> +    qemu_printf("Available CPUs:\n");
>       g_slist_foreach(list, riscv_cpu_list_entry, NULL);
>       g_slist_free(list);
>   }
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
> index 5ecff1afb3..22f728673f 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -35,8 +35,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
>       const char *typename = object_class_get_name(oc);
>       ObjectClass *dyn_class;
>   
> -    info->name = g_strndup(typename,
> -                           strlen(typename) - strlen("-" TYPE_RISCV_CPU));
> +    info->name = cpu_model_from_type(typename);
>       info->q_typename = g_strdup(typename);
>   
>       dyn_class = object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);

