Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kREq9-0007xt-IT
	for mharc-qemu-riscv@gnu.org; Sat, 10 Oct 2020 09:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kREq8-0007vZ-78
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2020 09:23:12 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kREq6-0000SP-EU
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2020 09:23:11 -0400
Received: by mail-ot1-x344.google.com with SMTP id m13so11550815otl.9
 for <qemu-riscv@nongnu.org>; Sat, 10 Oct 2020 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kLvZ3Ba9N5ZK4eb+Ofd69hXQfdMvwMbkzGHm6B1jLS0=;
 b=ReC90+/km+k4j/1D1jY1VoluypW3L/fPuQtv0jUsRc8jWcZnhEFY4okjUFOR5Cx4ki
 QxmO+gpG4t1ZS4NXPCFpNWbKoTfm0DNuy2F69WWuw07Mdd+kZGNWcytmG1lcgfBCNKLV
 /jSs6S2L+Og+XIxZv5JRiqa0RLlAYzPpUFSeTM9bQFVh5mxwbka6iOM4MfQoTXqxKd9s
 tb/yJRn3ayItY5o8vL+5j2yNoSvD/z03LSsBH80VoHeRB1uLmy0oA0vFHvE6e0hsLofc
 tLVokRToMgLkNNljBc17R9/hgbB+CXdJRzmRNXdkaS0wbFwIjsMBFP21pQFbTmsuYJjm
 frsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kLvZ3Ba9N5ZK4eb+Ofd69hXQfdMvwMbkzGHm6B1jLS0=;
 b=YCoB/WmTYlt9lW71RjOKSAki/Xf5fSUCOq6ZrXx/yXsOOaoKnPanNBDwDcEN49Zik2
 8mkU7jTur2kEhcj9Vsu+vCE0fYpUH5Ql/HXL/u6gyuhM5+EfXS6TLiCACTjMZBLQ5Igs
 lsqIkNLkogzvpklLgaNb89zkcCbB5t8g0dqxe8Ph66fCbV1vLSfmJ2J5WjhrRB6KwNZ7
 dPRgL3TKuFKFinaxqaCKpX3eBIOIf7BQ/I6MJXrEMvmStRtaZc8RpYYLPRRaywsuhdnX
 H4S2r8foo/Q6nWT4erFsgnSJnwYkCnFuSCyXvArjMeXaq9vqmZYmGrGUF2bNbGbkVOFV
 ICEg==
X-Gm-Message-State: AOAM5323ovByw0BGTdon/E/MbYejEm9zrb1Bcx1HYxd87HvvgeUgts+m
 OLBoIbfegxp632mW488fvjEYiA==
X-Google-Smtp-Source: ABdhPJx6cjfGBU4Wo9GMmGQvpNwEvUqUwvPKCYuoDJ7sNFig/l49Wum+aQ3CI7Y0XPKIrgag7gEqMA==
X-Received: by 2002:a9d:6349:: with SMTP id y9mr11521312otk.246.1602336188532; 
 Sat, 10 Oct 2020 06:23:08 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q8sm7001868otf.7.2020.10.10.06.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 06:23:07 -0700 (PDT)
Subject: Re: [PATCH V2 1/5] target/riscv: Add basic vmstate description of CPU
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 wu.wubin@huawei.com, zhang.zhanghailiang@huawei.com, dengkai1@huawei.com,
 yinyipeng1@huawei.com
References: <20201010080623.768-1-jiangyifei@huawei.com>
 <20201010080623.768-2-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bc022ca-35f6-8579-51f1-65005e89a9a3@linaro.org>
Date: Sat, 10 Oct 2020 08:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010080623.768-2-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.207,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 10 Oct 2020 13:23:12 -0000

On 10/10/20 3:06 AM, Yifei Jiang wrote:
> +++ b/target/riscv/cpu.h
> @@ -311,6 +311,10 @@ extern const char * const riscv_fpr_regnames[];
>  extern const char * const riscv_excp_names[];
>  extern const char * const riscv_intr_names[];
>  
> +#ifndef CONFIG_USER_ONLY
> +extern const VMStateDescription vmstate_riscv_cpu;
> +#endif
> +

This is not part of the public interface to RISCVCPU, so it should go in
internals.h.

Not that there aren't other things in cpu.h that don't belong.  No target has
been perfect in differentiating what's interface and what's implementation.

> +
> +#ifdef TARGET_RISCV32
> +        VMSTATE_UINTTL(env.mstatush, RISCVCPU),
> +#endif

Would this be a good time to expand mstatus to uint64_t instead of target_ulong
so that it can be saved as one unit and reduce some ifdefs in the code base?

Similarly with some of the other status registers that are two halved for riscv32.


r~

