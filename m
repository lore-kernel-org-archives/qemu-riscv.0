Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzj6Q-0002gU-9t
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 14:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzj6P-0002f8-1L
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 14:11:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzj6M-00027M-7n
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 14:11:20 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o17so23405957pla.6
 for <qemu-riscv@nongnu.org>; Fri, 10 Jun 2022 11:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tkzJfM5b1FTuP5oIZpXzMQUE+MuxcllfLFSNQUcduiE=;
 b=Teyc1ohcuKSQGWTJNBGNbY/Gy91TbF45wO/S8zsZCdey0WJzrQFrINaVbL0JhFyRvP
 SxommJHApk6cLHe4RvJJw9W7fU9lKkeHKjhyF1hu0EgNvVpEKxkNeRals1nJ+pBCaOBs
 NVnhec7ow/CAfbZn+dGHZJ0y/kSQqJIxeGSaYAK6zhK/hRgfTgdywUEL+1vwmnCqZdZo
 zL/YCKemd+ABq0hfHlaBGtII3ZB1IADkghFL5k4MUMi9uPIQf59pYoajoOibLxSODo4P
 AtW1alG8T2tUPWmBDhVoBuA6AEpAhvAuuKJ20+qivbopVuJCk2JX8Y/4Fk7H24M+2ehN
 P4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tkzJfM5b1FTuP5oIZpXzMQUE+MuxcllfLFSNQUcduiE=;
 b=w0MiYFmJzsxI+W4vcXr2D+viYRbtnVUHp3Ub1pn7Pr+zS8FWNzHg9iT7J72VqHubye
 QoKbQLiPiIWAvMWgymup/QoTrrpL/Psk07r4JkeaU+i0DAkOHdl8SpxTkNDa3tw3ybLN
 UVW7KgH5LXAaQrY83OX1B3lYoAmLySda3btZjD9g3IsohLyGZHknGleAcAjVet6eYJ+x
 kAAObyTzgMreVVOzgG0smtnSrF0ijdmbIS/VpnKP+53eFwLP3SXtAsSQmhCT2iJKfB9R
 +9LMOpLxCgtg+8TuX5KxB+B/tjXFs7bgdF8q//RJ8VpX5hE0ZJqGO4CXYTX2J1pm0lYa
 o22Q==
X-Gm-Message-State: AOAM531x11DFO7xl2ZT6m+Roi4btOn1fJJBxDPifYpGrsFZE3SwEkEAt
 O665h0btdJPC4La+kGTSZgb5PA==
X-Google-Smtp-Source: ABdhPJwAE4p+ocqACuKOzj5jcHg4ab3KPLN0DlNtWUgBKtARarPu6Qz+obUqyG0h6EkldZiO1/S5aw==
X-Received: by 2002:a17:903:2411:b0:167:396:e31 with SMTP id
 e17-20020a170903241100b0016703960e31mr41573001plo.155.1654884676513; 
 Fri, 10 Jun 2022 11:11:16 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 j189-20020a6380c6000000b003fc32f8e030sm19546204pgd.79.2022.06.10.11.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 11:11:15 -0700 (PDT)
Message-ID: <929ec347-a0eb-44bb-dd75-77944010a828@linaro.org>
Date: Fri, 10 Jun 2022 11:11:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/riscv: Remove condition guarding register zero for
 auipc and lui
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com
References: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Jun 2022 18:11:21 -0000

On 6/10/22 09:55, Víctor Colombo wrote:
> Commit 57c108b8646 introduced gen_set_gpri(), which already contains
> a check for if the destination register is 'zero'. The check in auipc
> and lui are then redundant. This patch removes those checks.
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

