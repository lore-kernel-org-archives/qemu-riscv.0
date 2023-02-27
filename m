Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWcmb-0002G4-A6
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 07:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWcmE-0002Dt-J6
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 07:38:48 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWcmC-00015w-14
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 07:38:46 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-172a623ad9aso7176258fac.13
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 04:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Tdw6LYsYhKnnDa1lcyJZ/PkbGt3pTohjvy5MbVoz0s=;
 b=TlctZMjJH8r3iIN6DnSUn4MxtjyOeRwXGrw6Mh9yajL2SXuJumYk0AiYGbpXVDKXfD
 Yu/EK0Qjb/abbAKQNXp9fA05UvmQp+pZnKpBzdePERRWrm1U7ImQO4YKs5tXuHuU0azN
 6uE+Zvb591YCj8ROkGmJS9HjF1NFfqtPLI+RuV/uDO4Zn20qGm+bpeF2ykuNuZsfqaap
 ayp/SxJEGxVCpaoZQhbaJdJl9jOj5qZ6cdpyfAniwx3uLbBKA6NbU9f+OtXvSOZ3Rag/
 vaENkcRqBphh7YnMC+RWssEOqx8YMqJo60RvdEyeqalnCGnOHXdmGp7yv6B92MfUbGk7
 8xxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tdw6LYsYhKnnDa1lcyJZ/PkbGt3pTohjvy5MbVoz0s=;
 b=VqeLa1TKhUTnE2aqop16dP1D+6Gh2QfNLA4t08nGNtgMoiOnRbr/5uwdD98rN5QXU5
 7HTobjIYQ0FcV2ciiU6EfmvLch6tfOplkNP9PjZN88J1EoYOVetxynbqzdmWGEvfE4eJ
 H5Bz4luuQ4S5zeIICp1beSSJEUV4WYrpKtje9qcO4vClv7rjq+XJrpnnkxD+mtRfrlq4
 vIX1YjCEwCENNTmYzKBSHAK+RKCAH42K1PujgNEbGgQs6YRXJJtu/8l8T3JG61qlBvMK
 qeBrjILdmM5IordgTj9U9ObnfyOnjsX1FA2nlAi/z++oIeqgl+nJKx+pYWkg9B7GnbTR
 uPwA==
X-Gm-Message-State: AO0yUKUhvvn2QehK+/TJdWvK4qhyICgYQLzDCdR0cX/TpOTRusdM5eKF
 kzAg2wsuAMa2LU/fZeWqC5QwFA==
X-Google-Smtp-Source: AK7set9WoZqcPwIV6GaAq8G3x17PuRn4MsiAJowxs/9fIvM5B6Af0wvFggUPtkfadmjmkRDZllmv7w==
X-Received: by 2002:a05:6870:80d4:b0:172:c150:9200 with SMTP id
 r20-20020a05687080d400b00172c1509200mr5962078oab.20.1677501522014; 
 Mon, 27 Feb 2023 04:38:42 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 ds53-20020a0568705b3500b0016e49af5815sm2225824oab.51.2023.02.27.04.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:38:41 -0800 (PST)
Message-ID: <8141699e-d035-ca7c-e284-d91cc00d10a4@ventanamicro.com>
Date: Mon, 27 Feb 2023 09:38:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/3] hw/riscv: Validate cluster and NUMA node boundary
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, shan.gavin@gmail.com
References: <20230225063527.281479-1-gshan@redhat.com>
 <20230225063527.281479-4-gshan@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225063527.281479-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Mon, 27 Feb 2023 12:38:48 -0000



On 2/25/23 03:35, Gavin Shan wrote:
> There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
> Both of them are required to follow cluster-NUMA-node boundary. To
> enable the validation to warn about the irregular configuration where
> multiple CPUs in one cluster has been associated with multiple NUMA
> nodes.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/spike.c | 2 ++
>   hw/riscv/virt.c  | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index cc3f6dac17..b09b993634 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -357,6 +357,8 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>       mc->numa_mem_supported = true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary = true;
>       mc->default_ram_id = "riscv.spike.ram";
>   }
>   
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b81081c70b..e5bb168169 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1636,6 +1636,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>       mc->numa_mem_supported = true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary = true;
>       mc->default_ram_id = "riscv_virt_board.ram";
>       assert(!mc->get_hotplug_handler);
>       mc->get_hotplug_handler = virt_machine_get_hotplug_handler;

