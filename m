Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovaio-0004Yu-Cy
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 03:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovaim-0004W6-IQ
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 03:58:08 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovail-0008Ge-37
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 03:58:08 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so4808915pjs.4
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 00:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m3JEUblQcjFyR4canKFbx4FYf6Qxt2K4mcAGKEkZ7vY=;
 b=jljCAW3J5iY0rXuYhOFRy7uSC1jhu5sLC9ARexCzI4Xqpg2/wg1EPx2NOslD7lKLh/
 fZf1mTzIjfNhr7x4rTEERLQiwrshVBC+nwMOuKW4W6jDwVX+h+cWiY60i9ArjksbFzXP
 /pTjrXLYvHRnr7v1tgGPWCmXh5i6vVyn5lKcMzyxjMirYG1f4/u14BkuaMFJzudLtjgZ
 Wpou4nuOPA2vNWnvbt+JJiNO7eYAwIEOYIwJ/9baqPTW9WRUruxqU80Eg0RehtmOW3aH
 5EZI6+W/dxQNdZXeVUGcCtYwdHZhURaSf88/vZPpEaWZKfy5j3p5WAJVMaQMrGGQaEmB
 s49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3JEUblQcjFyR4canKFbx4FYf6Qxt2K4mcAGKEkZ7vY=;
 b=jtY7gymmK6n7p6K5k0TPPNAVYBDbujn4aetkgkBxeUmIsOOxLXWt0qaE8rpXtHs1DX
 s7C6SK3itHlcHjE8Tr9FR/RGzddOb59S5i/KQFB7Mlc0IHDrSy2d48bcddW/ZUcbd7yC
 vJyUlICyYqP5nuleITlMpg5fiWir6/0JSqAVfR4s53eNYXAu9rKwskzS0+I/0pLB4Zmt
 gs3i62oUs5xiTF6UyBAiDq3CY+OoQiYKIFLoRX7KyvytrKHnIBjvlW3q/b7WYV8H1/0v
 hGZ69iTA2LAjEjnD3d5tteLFLE8bQMubpfnU7o4vG/aNVW5WnFRuxulI2qzhN11Aln44
 sBQQ==
X-Gm-Message-State: ANoB5pnHQ8ruT+FooohsDJVWrog/L5WGbWrGGV8mrgFBHqEntAmXtHd5
 LH+Xp61Ny1NIV0Po+LuQh0SBEw==
X-Google-Smtp-Source: AA0mqf5tD8/uXxduR9/zjm1yVMKTDbtqLAY7M43OG9gvODdM7fqrdVBwC3EGpSYL+F1XD7hzG1AHyw==
X-Received: by 2002:a17:902:8a81:b0:186:9849:5c1a with SMTP id
 p1-20020a1709028a8100b0018698495c1amr1811672plo.110.1668675485502; 
 Thu, 17 Nov 2022 00:58:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a63f950000000b0043b565cb57csm504581pgk.73.2022.11.17.00.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:58:05 -0800 (PST)
Message-ID: <ec0f1fdc-f446-00b7-959b-f86e47bbedfd@linaro.org>
Date: Thu, 17 Nov 2022 00:58:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/9] target/riscv: add support for Zcf extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Thu, 17 Nov 2022 08:58:08 -0000

On 11/16/22 23:03, Weiwei Li wrote:
> Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode              |  8 ++++----
>   target/riscv/insn_trans/trans_rvf.c.inc | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

