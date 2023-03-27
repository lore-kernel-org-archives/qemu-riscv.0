Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgs4D-000311-M2
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 14:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgs4C-00030k-7M
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:59:40 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgs4A-0006pj-R0
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:59:39 -0400
Received: by mail-oi1-x230.google.com with SMTP id w133so7161994oib.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679943577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7tl2B2iyH2iUuOlSLcri0vWQrx8c+SllJ0FaDa1uebk=;
 b=b23TlYVriKDTGBtOU89ZQImfnWS2XzAlkXTIEEKcZglJDx11y6YPcjkslVLdBCWHzg
 YWlt+VV79rR3PtWuEc7SlQ3CCjH/Z3CxSfKBaMHz8mAji8zmcdR/RDoGgvdLa4BVgSww
 SXpEtPzYu7D9PctNZAKNoNXnPvScuaSoBL6nr1O9ishsXVUEYLZsnqQ1H2gURHuNHlAM
 K6GBqijfs/k8w/MhpM0P6f4j6JdLCkN6z4tqZ1GT5AEPi06GU6AsczuWyOKJffIpU2Nw
 yQ1r9++Fk3M8Q2s+v0eWI5glWBjB80KigX/duP7EhqmNXglKQU2BDEphOvC0yfE0RsTm
 l/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679943577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tl2B2iyH2iUuOlSLcri0vWQrx8c+SllJ0FaDa1uebk=;
 b=DDb4lKxsNyI3DpigIBKTKVjA+N/FeIrBuCM/2mga+i8Xb342fI5kEehkKUJpR+mpLB
 XTjbWWzXpkptt9vXl3u4ZzcSHgSlK4csjc5RmiZOF9qP7KBOxDFB75ckG7QcvqskSJAO
 yb3PSZ2voB4hmV4akIjmmKhu+Zw0KouIpup6DkNK5fpWYkN9QY9MUZvZcCboVktrvTi3
 FzBrR7f/K7I8NOolGOnt2CTINGh12vaEZqZsLe/6QSiqIEHaMH7s/l3b8ztAZCMqz+2z
 bfy8YBDXpCja8rcaXVqdQ/EUsovpvWikyM+wC2G2pVLDBysebgsMALc/gAsXAOTPuWrt
 7jRw==
X-Gm-Message-State: AAQBX9cF8N7IB/AGeuCm2p7YulEl3kl01NlDdsS4yKOdo+ctVnDcS8pC
 yFbZ9iu+jDD8DfNUEYEBh4Hb5Q==
X-Google-Smtp-Source: AKy350Z+6hanE4bzpIqy/ZsI4Mo5mwdhmbtvjk2d+0cU2g8tPIgOPrfDy1DKHfnzL2f/u7yukl7BTw==
X-Received: by 2002:a05:6808:608f:b0:389:5104:84db with SMTP id
 de15-20020a056808608f00b00389510484dbmr116536oib.35.1679943577363; 
 Mon, 27 Mar 2023 11:59:37 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a544090000000b00387372f548asm6176108oii.16.2023.03.27.11.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:59:37 -0700 (PDT)
Message-ID: <4f2763f2-b008-5dab-2125-ea43a2c98391@ventanamicro.com>
Date: Mon, 27 Mar 2023 15:59:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
 <20230327124247.106595-4-dbarboza@ventanamicro.com>
 <8a27b03e-9100-6b64-fde9-6b92a9f643b9@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <8a27b03e-9100-6b64-fde9-6b92a9f643b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 18:59:40 -0000



On 3/27/23 15:43, Richard Henderson wrote:
> On 3/27/23 05:42, Daniel Henrique Barboza wrote:
>> +        g_autofree char *name = g_strdup_printf("%s", misa_cfg->name);
>> +        g_autofree char *desc = g_strdup_printf("%s", misa_cfg->description);
> 
> What is the point of this?  It would seem that you could simply pass the original string literals to object_property_*.

Yeah, it appears that every other object_property_add() is being called using
the literals without dealing with g_autofree.

I'll change it in v2.

Daniel

> 
> 
> r~

