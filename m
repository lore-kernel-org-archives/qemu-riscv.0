Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXn43-0007NR-65
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 11:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXn41-0007Kj-U4
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:08:37 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXn3z-0004zE-7A
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2020 11:08:37 -0400
Received: by mail-pf1-x441.google.com with SMTP id 126so3091897pfu.4
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2020 08:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sr01ZlkeVZ2zfK5nVSf4EVkQPl53h8E2U0fJuuquGgI=;
 b=ihp7HfYcgMjlqTnUGSRDqA3W0h5fqVs6nj4DF486fBNmS+tyy/3Vb9LXzu3hLCqMv7
 oYsFHpZxgIvyaQK6+GOSobYZbt9xd2xjvs7TYWgiPEx1tU6rvhqc/dAEV7smgWs51Jq6
 XSMOmVv9bylwE2/1TG02yBUmpDKFGeKdKPDyvMTQoRE8vmec/Ko4cPd2rYdEWtBpsUuh
 1/zVc1ev/1lmnBB2SL8Zp3X9ZO9Jq5ABnQryZha9CITjtqQ+YYZ91Bl7sn+R5eWxThoK
 cgWpv9Wkzd9bTFI2OhSTg/uqKPph6U6ZstDheh1+spQ6/2eL08NhDumjmj2oDMl7Vd3l
 QJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sr01ZlkeVZ2zfK5nVSf4EVkQPl53h8E2U0fJuuquGgI=;
 b=JeOmO1521NK9C8UpdQjMNF434sFFQ6Ax+FuRaVQ0pe8N2aBIPuP607j50G6i9+pwHK
 X8q6w/0SYvtZ4cK/swjKORvEB0BB9VbnH5BLd9QF/kKa9x/2ad2pwrck5cWnHa7H/tUm
 vx5adtbNcuJSKB5DDZPTsk/+HRmEgIMQfLgETanPEk9v41m4kuaOFhmh+YHZkWR46Q0C
 AMLhgK9GoXsdtlhUC96u+kwTI/8awcxpOYjb0efKKNAWM869/xcUtBk97Oc6m7gLdK7n
 kqpU//VxEP2HlTK7fqP56T+jbLHB/l/WfeE4NX4q6bglFHSVDG2yzcMgJoQwmmppko25
 V3fg==
X-Gm-Message-State: AOAM532DmVNtm/hGCv5KgcR7QUcM8WgClSu8b6ypnRNgLyUeUbjbCr1+
 QLSQU+V4BLUEwKt4zOlYH1FeLg==
X-Google-Smtp-Source: ABdhPJyhoAhXEVZnd6cIJpjD1WBd4OAATXtDS9eCw2/Y4IGYilWRh+6jD1cdTioUCv2AOF7+0k38gw==
X-Received: by 2002:a62:7d4d:0:b029:152:1b09:f34 with SMTP id
 y74-20020a627d4d0000b02901521b090f34mr8166217pfc.76.1603897713503; 
 Wed, 28 Oct 2020 08:08:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l13sm5568767pgp.25.2020.10.28.08.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 08:08:30 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] target/riscv: Set the virtualised MMU mode when
 doing hyp accesses
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1603896075.git.alistair.francis@wdc.com>
 <3f5666c9eb72758011c14a660de99ba86a0b6561.1603896075.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a193d98-b55b-c53d-09bc-7d205a27b357@linaro.org>
Date: Wed, 28 Oct 2020 08:08:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f5666c9eb72758011c14a660de99ba86a0b6561.1603896075.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2020 15:08:38 -0000

On 10/28/20 7:42 AM, Alistair Francis wrote:
> When performing the hypervisor load/store operations set the MMU mode to
> indicate that we are virtualised.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/op_helper.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

