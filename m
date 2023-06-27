Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9E9EB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 21:20:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEG6h-0004BK-EP; Tue, 27 Jun 2023 17:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEG6f-0004AX-9U
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 17:20:13 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEG6X-0006ib-Ve
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 17:20:08 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-986d8332f50so632463366b.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 14:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687900787; x=1690492787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=44hU8bzsVyO/Pl5mkv29ptqf/jIqSCMIXodvvVQswqs=;
 b=wKf6BCIZHbvv206gE+2p8HZwyMmigmdsoc/53uBaL5gnixI4PT0w8BhEeqRwjiHKGZ
 mZHSyJTdbARrkrULRwkh0Lseb+SI2SjFnpKvlpqFsBukv6pBLBT0jcNCKR5MQpWfMTsV
 uFnOdZ/H7YdIvU20Aji9Usnl+bXnGTx8TsnUWOoCYzzYYM7J6ft1CXVnOHjlvYhXy+4l
 hc8oQYzxqp/OhhBx6fE1uFxl7V87hKKg/OlSgd33ccB9kmEWQc0s/AgHeNXPFeUZH/I3
 gK+W/Ur27DnubTSJI9bM3b1HMOI51ITw/Ii/WCtFkPFAG7089kyMvL7nF3NALCj9A22g
 fhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687900787; x=1690492787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=44hU8bzsVyO/Pl5mkv29ptqf/jIqSCMIXodvvVQswqs=;
 b=U+oAxPCB4dAnYidTgxGLDg+tvfxzJyQaF0AR4Xe76L6nASSAlgrSfqA28ymk8xpiPM
 2l7sxr2FjKeRpYTerv5sWW2N7fXmRW4y5BPUTZA25CDiDvp4NpQWVwv8OgX/TktEvM7H
 V9GBSw5yXhxxbHwCQG+8vA4mVhx7tIhAkIvQp4taPI2Wa05S3eMWIf9HWxdm7R7YqsHq
 bir7e5curzfZHxstRFQb1EbxwgVNpDW74R/bODKTfa63ahH2r8zVMfttGv8495A5GVFj
 1b1TtNdMt4QfrhztGj7pVTv052KKFIBi4Xyb//wpQBFZ1GAu0n6dilfpyi2gjqd3VQ+F
 U77g==
X-Gm-Message-State: AC+VfDzyzrUruXXyKbJqwuc68D1Y14Lz1STINaQHV/IVbNZL6xLW6UVM
 AcpcWG41bEwXUl0LIcEwZAbyag==
X-Google-Smtp-Source: ACHHUZ53NEIPV/KCnZhvvNJOvnr5mlCfX914UVDZvGQyUuWfl/MhkQn4XivM+0LBOUcaEzPLtLH9hA==
X-Received: by 2002:a17:907:9283:b0:986:d833:3cf9 with SMTP id
 bw3-20020a170907928300b00986d8333cf9mr25972344ejc.39.1687900787211; 
 Tue, 27 Jun 2023 14:19:47 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a17090640d900b009923363f863sm886125ejk.42.2023.06.27.14.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 14:19:46 -0700 (PDT)
Message-ID: <29ffa6db-a4ed-0e67-2995-951248e8302e@linaro.org>
Date: Tue, 27 Jun 2023 23:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v5 01/19] target/riscv: skip features setup for KVM CPUs
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
 <20230627163203.49422-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627163203.49422-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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

Hi Daniel,

On 27/6/23 18:31, Daniel Henrique Barboza wrote:
> As it is today it's not possible to use '-cpu host' if the RISC-V host
> has RVH enabled. This is the resulting error:
> 
> $ sudo ./qemu/build/qemu-system-riscv64 \
>      -machine virt,accel=kvm -m 2G -smp 1 \
>      -nographic -snapshot -kernel ./guest_imgs/Image  \
>      -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>      -append "earlycon=sbi root=/dev/ram rw" \
>      -cpu host
> qemu-system-riscv64: H extension requires priv spec 1.12.0
> 
> This happens because we're checking for priv spec for all CPUs, and
> since we're not setting  env->priv_ver for the 'host' CPU, it's being
> default to zero (i.e. PRIV_SPEC_1_10_0).
> 
> In reality env->priv_ver does not make sense when running with the KVM
> 'host' CPU. It's used to gate certain CSRs/extensions during translation
> to make them unavailable if the hart declares an older spec version. It
> doesn't have any other use. E.g. OpenSBI version 1.2 retrieves the spec
> checking if the CSR_MCOUNTEREN, CSR_MCOUNTINHIBIT and CSR_MENVCFG CSRs
> are available [1].
> 
> 'priv_ver' is just one example. We're doing a lot of feature validation
> and setup during riscv_cpu_realize() that it doesn't apply KVM CPUs.
> Validating the feature set for those CPUs is a KVM problem that should
> be handled in KVM specific code.
> 
> The new riscv_cpu_realize_features() helper contains all validation
> logic that are not applicable to KVM CPUs. riscv_cpu_realize() verifies
> if we're dealing with a KVM CPU and, if not, execute the new helper to
> proceed with the usual realize() logic for all other CPUs.
> 
> [1] lib/sbi/sbi_hart.c, hart_detect_features()
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fb8458bf74..e515dde208 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -331,6 +331,15 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>   }
>   #endif
>   
> +static bool riscv_running_kvm(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    return kvm_enabled();
> +#else
> +    return false;
> +#endif
> +}

Instead of this, ...

> @@ -1369,6 +1370,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           }
>        }
>   #endif
> +}
> +
> +static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> +{
> +    CPUState *cs = CPU(dev);
> +    RISCVCPU *cpu = RISCV_CPU(dev);
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> +    Error *local_err = NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    if (!riscv_running_kvm()) {

... why not simply do:

    #ifndef CONFIG_USER_ONLY

        if (!kvm_enabled()) {

> +        riscv_cpu_realize_features(dev, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }

    #endif

?

If riscv_cpu_realize_features() is for all but KVM, then the
name isn't ideal.

