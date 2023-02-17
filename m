Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqDv-0006ow-8D
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1pSqDt-0006oU-F2; Thu, 16 Feb 2023 21:11:41 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1pSqDr-00069k-RY; Thu, 16 Feb 2023 21:11:41 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 x4-20020a17090a388400b002349a303ca5so3616248pjb.4; 
 Thu, 16 Feb 2023 18:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Ju5tJWlWDrlpGvrc/dpe2qu0gUWND5IGGiTgo4i6q4=;
 b=TUGeEGnIaXstIoH0W63MxWS7YoR3jAc1YjaLeuCy/ZNPAI5yhOlesseBpZ+SuvnEBC
 qPEnOcAsAvve7laVOBDeGjJQc6MCS4te7OKJElmp1EmHccAg3te9macKVs14zXryHYlb
 XYwb32wuWs92B0Q4NCHHgWAFGHG7l8ZMwfHox3KlZqN5JHhb5F+p6aNzG9SAoHIArMEu
 tZCjPmq8L/ah7IGq2MM9VjQ/f4CzeL3UVDJiIIfn3F5CpfpD0OMZF+DkvBFQ+l+nN37u
 fi08GCJ9EhuJSuIYfTzJamAxG5BvtavvnDpUZg7hPha0Xi8dhF3zJqOOLK6PBC8u1W+/
 WI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ju5tJWlWDrlpGvrc/dpe2qu0gUWND5IGGiTgo4i6q4=;
 b=EMfF933kJxEqJPKNaHXDTi7P/ew6DAfC2fdG+pMf8JaQDGc+nXMhentpSrdGKcFoMr
 1IkA5ZnZglKVVN91ASftbdEFXNGyxD4QSXhiSOzz12ZFZqdKF8qT3SsWNAM5emM/HbJM
 jZdzYye/uN7Rkky/a8TvBt9+SS5rDJ6CGs+H/i16sz4nw8PQFQz5RUHbh3FuhWq9yrQl
 wey/eJZW4mkQR8EbDRw7OqNfZJHHX7/jfJsqu3/x3NC1dCo0vBdq6ExouAd8QK+KGA6a
 XlkVGVOLa+NU0LG6pd/T/HhxBZzsI0XN0wjMFveGzLcFeL28ajWc0Vvu4+GoD35dwcp2
 7xng==
X-Gm-Message-State: AO0yUKWRJ4FfByT2sRiW0D7OHj+07gVrFWbEXiwz+rdPVdmyoGSdTZHQ
 aAXSkHV8UO2RV9gG7zVeTuk=
X-Google-Smtp-Source: AK7set92GXVwK7Zg6Fblrk528QOVLJwiDyJVjJmdmzm8GjxBkwWAkQxcsgKAxLVQn+8Nvg8jamvRNQ==
X-Received: by 2002:a17:90a:19ce:b0:233:e0a5:f711 with SMTP id
 14-20020a17090a19ce00b00233e0a5f711mr8998692pjj.22.1676599897316; 
 Thu, 16 Feb 2023 18:11:37 -0800 (PST)
Received: from [30.221.98.44] ([47.246.101.60])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a17090a68c400b0022c0a05229fsm1732196pjj.41.2023.02.16.18.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 18:11:36 -0800 (PST)
Message-ID: <84a5bc4e-23f9-44fd-e6d2-5a426accb541@gmail.com>
Date: Fri, 17 Feb 2023 10:11:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 01/18] target/riscv: gdbstub: Check priv spec version
 before reporting CSR
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-2-bmeng@tinylab.org>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20230213180215.1524938-2-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=baxiantai@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:11:41 -0000


On 2023/2/14 2:01, Bin Meng wrote:
> The gdbstub CSR XML is dynamically generated according to the result
> of the CSR predicate() result. This has been working fine until
> commit 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
> introduced the privilege spec version check in riscv_csrrw_check().
>
> When debugging the 'sifive_u' machine whose priv spec is at 1.10,
> gdbstub reports priv spec 1.12 CSRs like menvcfg in the XML, hence
> we see "remote failure reply 'E14'" message when examining all CSRs
> via "info register system" from gdb.
>
> Add the priv spec version check in the CSR XML generation logic to
> fix this issue.
>
> Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/gdbstub.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 6e7bbdbd5e..e57372db38 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -290,6 +290,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>       g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
>   
>       for (i = 0; i < CSR_TABLE_SIZE; i++) {
> +        if (env->priv_ver < csr_ops[i].min_priv_ver) {
> +            continue;
> +        }
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           predicate = csr_ops[i].predicate;
>           if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
>               if (csr_ops[i].name) {

