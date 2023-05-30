Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5C6C7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 20:23:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45sm-0007aj-SL; Tue, 30 May 2023 16:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45sl-0007aR-J8
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 16:23:51 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45sj-0002QC-1g
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 16:23:50 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-39425ea8e1fso3357969b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 13:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685478227; x=1688070227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bPZ1sL08TRDARHq1zn8jbqmSeksoNXB191fPK+0m1mA=;
 b=aQ5FMuWcBUI+rupJUxIHxrqwyiTo6D3Dit/N/JMUDNkVSoTbfHXDj3ixDwdClli94a
 CpgB5K6SNgnH3UIGeGw1VeaMljP3ruZC+ZPVV5G5xOnuCBhgFwCtDByWk3F+IYODyvjP
 DMFF3F5QHGr8cAtdkSIyoqfGjhqmAGRTKb3VxUshUSx8yD9XrwxX1ymgwt2vuPnAAxK6
 /ZvxHb489naLIYyjTALPFpzxxEYaLnYy1ab0IHBw3DapFX+ZstwQO0XxYNit00c3CtKY
 s148GMG0jweKI3YEC/vZxKc5FKzdnyF0Zi0NahNrqWozXC6ap1dw/DTBiT+b3uvIy08p
 kJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685478227; x=1688070227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bPZ1sL08TRDARHq1zn8jbqmSeksoNXB191fPK+0m1mA=;
 b=PFuV/MK7t0QM13TXyG5y1RpGI4LfepEBkm3imChmmrc6eQSKflzZPFBXUG889P9+9y
 S25P8fpYRj0no8TulLNj9KXr2fN71eX29N6zvf7rVhvp4BpbasQ0g3uUAWeWQy7st/rV
 Xv1TzjwrNB5VJDbl0yPHbDJY/bOh5fI9CCNDTiONKIT52eb08EZ1aSeGe8ULkofBDxbS
 9Puf/XX+aYac/EEm83yEl1KzmJmuVirCitI4VO47o4A37qrj//aM/mL5TIbHxjViWIse
 KKXFxmX0esgjiFSCXEQK8gsX5rr9hs3xR67+pXdg2b70l+IBaqPvUzDq5/6utbC6gtox
 jC/g==
X-Gm-Message-State: AC+VfDy85UdvmZ6M8butwqee++hb09Kc822sD09WtAvq1Db5RAHn7TQ7
 WSw3CQ6uLHbB7RS9yLEei8IVuQ==
X-Google-Smtp-Source: ACHHUZ61/QJnzqaNT/+O41fqHcgzLAXrJ/HcpWBaau2FU/z3bDodyubCIAFAPInDkL1jN1d6YreW6Q==
X-Received: by 2002:aca:dbd7:0:b0:398:523a:f1ee with SMTP id
 s206-20020acadbd7000000b00398523af1eemr1472212oig.21.1685478227581; 
 Tue, 30 May 2023 13:23:47 -0700 (PDT)
Received: from [192.168.68.107] (200-162-225-121.static-corp.ajato.com.br.
 [200.162.225.121]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056870538100b0019e59515a0bsm6153479oan.33.2023.05.30.13.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 13:23:47 -0700 (PDT)
Message-ID: <d0a208a3-9973-b7e4-8fcf-d71ec0eab9b1@ventanamicro.com>
Date: Tue, 30 May 2023 17:23:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] target/riscv: Make MPV only work when MPP != PRV_M
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230529121719.179507-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 5/29/23 09:17, Weiwei Li wrote:
> Upon MRET or explicit memory access with MPRV=1, MPV should be ignored
> when MPP=PRV_M.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 3 ++-
>   target/riscv/op_helper.c  | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 09ea227ceb..bd892c05d4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -46,7 +46,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   
>           if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
>               mode = get_field(env->mstatus, MSTATUS_MPP);
> -            virt = get_field(env->mstatus, MSTATUS_MPV);
> +            virt = get_field(env->mstatus, MSTATUS_MPV) &&
> +                   (mode != PRV_M);

This change makes more sense in patch 2 where you also removed the 'mode'
check for MPRV. As it is now I read the code above and thought "but mode
is guaranteed to be == PRV_M, so (mode !=  PRV_M) is guaranteed to be
false every time".

The change in helper_mret() below is fine.

Thanks,

Daniel

>               if (virt) {
>                   status = env->vsstatus;
>               }
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index f563dc3981..9cdb9cdd06 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -335,7 +335,8 @@ target_ulong helper_mret(CPURISCVState *env)
>           riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
>       }
>   
> -    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
> +    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV) &&
> +                             (prev_priv != PRV_M);
>       mstatus = set_field(mstatus, MSTATUS_MIE,
>                           get_field(mstatus, MSTATUS_MPIE));
>       mstatus = set_field(mstatus, MSTATUS_MPIE, 1);

