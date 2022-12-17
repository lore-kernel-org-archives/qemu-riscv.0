Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6L6T-00027b-HA
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L6Q-00026s-2b
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:30:59 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L6N-0003rT-JZ
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:30:57 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so3932673pjo.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oUvWTz7xYO+2ZSAfI4vxy953mAOKFgHiWrxG4n+s58c=;
 b=suNdK+jHufLnPLrR1HR5d3dAKGKnnoSdbxqSEa9seJpUo9AUCUNrMCHr78zULQsGlo
 bquLul0Qe/jAVthUPPCGakrDZG4abu9WK3Qp8WZjzlVBovUVE9Ig1ZJzpIko5K86hM4r
 IOcyko37WAPky6M7hW9Gq8EsBmNLJo97VAEZpeKqcOoJDjR4U1W67z4c6SwpIF75dNHE
 maMpdhRayiqu8pDPRow9OARRKwxgbR6vGwJzJq97c7QZAGgz38MGkyGLoDWQoL6R7/6A
 g6rWtnz6amsnpjGlsMBDLyO2yXA0Z+NhwjiVeAOVimsNl8jlPHav/Blpg9MLFXevb+ba
 bpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oUvWTz7xYO+2ZSAfI4vxy953mAOKFgHiWrxG4n+s58c=;
 b=2mL2IaMDrC4ZtjKb0xu0rLaIpYc/nRyx/U6z/MP1wrb9nUPlXBdVfvItqI0ePNIvf9
 F2RBAclhc/nC5vZZeWhDZnooqnos8NAMpCO8huNYw2TE+s2RTUXopSoInEikSVQTtMVG
 wcNhz5GO9BUXPEtjGXYZHn5bUNKxBGKLu8MYetoiOyHqpz115ZQ72drCYSAtn8tRk6Xw
 4+hVqB93RdLSmRmbwe/t6eY/SqBWf/+9aLQXiGXSlP8UWU/MUF6NICqoNDvdm3k5piYV
 9Jy3YusrCQPF4+3Caa4nilHLpBhASJTL20Ii9rXPmn3OMaqTfy7F27WVz6jg9DrshqRZ
 bnpA==
X-Gm-Message-State: ANoB5pmV1O+Uoix8P2Dn4bue71pmVIGsklw3dipVrHyqeBFxyqJAdzWy
 HhwfbneBpFjIOHVZvNPP5vnmeOrcOAbqw3I8
X-Google-Smtp-Source: AA0mqf750NnENqzNhxhFFls6B/mnXEMIEPG3EUFxN4LaAgXQX24XrWBecRSWkCzTQvip6Y0YkTYncg==
X-Received: by 2002:a05:6a20:6f9c:b0:aa:6efd:1885 with SMTP id
 gv28-20020a056a206f9c00b000aa6efd1885mr41057870pzb.1.1671237053719; 
 Fri, 16 Dec 2022 16:30:53 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a63b107000000b00478bd458bdfsm2018418pgf.88.2022.12.16.16.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:30:53 -0800 (PST)
Message-ID: <87f7035b-8632-a80f-cb04-c8deb49fd500@linaro.org>
Date: Fri, 16 Dec 2022 16:30:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/10] target/hppa/helper: Include missing "cpu.h" header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 00:31:00 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> 'dh_ctype_tr' is defined as 'target_ureg', itself declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/hppa/helper.h | 2 ++
>   1 file changed, 2 insertions(+)

No, helper.h is multiply included.
It should probably be renamed across all target/*/.


r~

