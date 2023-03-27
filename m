Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgrHR-0001PO-Hc
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 14:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrHP-0001Os-Jh
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:09:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrHN-000778-3y
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:09:15 -0400
Received: by mail-pj1-x1035.google.com with SMTP id x15so8458489pjk.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679940551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rwgM/WGkD4T+ARxE+2GTWIA8FXzJ+xxFQlI3g649r60=;
 b=Po5TV9IRn8wOxFsiv4jnpgxVZxgH/Ot8SmefHsSQJlGvGzTWXlzWv2Aw9CcFbnMRNw
 h5CrPaIfNdzLTOAJncIhrCl5ks/sCvHCM5DW08ZKtY6F7MbFhstnyACrsFzgFb+5bbMC
 vRphOQblpzf9j/vw/44AaZJjtnY2HACk9w9DlIhAjMgVXczYqQ01oGYQkl14/3QhXqk1
 YqYX/ukuMQV027JkF55ZSUf3X0tFwMIP3tG7OSU5t5qTzaESY2AIQwPhN6ZnHRMbpqxG
 6w37OYP5QOhq6Fx8XkfuWxrrFAPwim3HYfXuJWG8fDpXTk4KNtH0WSPNi0IIfaNaDVKY
 PIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679940551;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rwgM/WGkD4T+ARxE+2GTWIA8FXzJ+xxFQlI3g649r60=;
 b=k0XSSliaxTMXpNnrRQAikseDG2N8wKeUaJ/YLf+akBGk5mJT6RO4zJl286dqIPGbyy
 l1EERdm9j5dBdhx4AkvHmGIjRY1EVRg0Z2EsQYemjlOhjgrw/tU4257RKOb5bdcmP6bD
 cDbaK0Ldy4Vlrx/VelQljlgioE9ELEh4aAWMDA5rKmgF52JGSbL2bpinnm/NCGCF7Ddf
 BchYeN1+YIoITrlSejrKwb/JQOvC3hX+wBLzIfcfnQR+ow4nrI3gUaBvA7wmSkzZjMbM
 D63Nbhg2tilId6wwz33O5RiBNmC6P3D0mn1eng36PdyU8sPZKPDwqzHxLEe4ARL+Yh1l
 UGcA==
X-Gm-Message-State: AO0yUKXE7sYl93LCpjwme6YiRGLUFSUe4u88LsnmBaNAfurFtgO1RC7L
 vfkbJ2sPg3oeRLzAn0PE6PmNAQ==
X-Google-Smtp-Source: AK7set9GK7JuiVsxtQstJ9FNrjGkFVRkfulizUtmA8wOjds7iXaTZyoi/MPQ+l0LpUDltjmzPyTRNg==
X-Received: by 2002:a05:6a20:a882:b0:d3:aba7:807c with SMTP id
 ca2-20020a056a20a88200b000d3aba7807cmr12348281pzb.34.1679940551485; 
 Mon, 27 Mar 2023 11:09:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b0062a474cd46asm8979808pfh.137.2023.03.27.11.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:09:11 -0700 (PDT)
Message-ID: <40cca628-0c8b-7cdf-d779-16ece30a89ba@linaro.org>
Date: Mon, 27 Mar 2023 11:09:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/10] target/riscv: Convert env->virt to a bool
 env->virt_enabled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327080858.39703-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 18:09:15 -0000

On 3/27/23 01:08, Weiwei Li wrote:
> From: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> 
> Currently we only use the env->virt to encode the virtual mode enabled
> status. Let's make it a bool type.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Message-ID:<20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.h        | 2 +-
>   target/riscv/cpu_bits.h   | 3 ---
>   target/riscv/cpu_helper.c | 6 +++---
>   target/riscv/machine.c    | 6 +++---
>   target/riscv/translate.c  | 4 ++--
>   5 files changed, 9 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

