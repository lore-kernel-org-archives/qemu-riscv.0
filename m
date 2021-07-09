Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1sJI-0007wK-7i
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 11:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sJF-0007vN-RX
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:20:58 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sJD-0002x8-VT
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 11:20:57 -0400
Received: by mail-pf1-x430.google.com with SMTP id b12so8990807pfv.6
 for <qemu-riscv@nongnu.org>; Fri, 09 Jul 2021 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hj8GZyErqoRpwJ6pru/Fv1/NvpQNlyU7FuHh/CYFSq8=;
 b=L1ji9igHS2JmIkdstTyZ5iyjeJHaF4r/P92BlCsovxk7vl3WxqhkRCoiNeLSSXTFWA
 sjUBL7Zsa7oe7JcfsSi2GqtEt8/Msuoe16qGx2wP168Qh038qACvEIORsXw6GUN0gay7
 9pgdNbMGS3Ab0N6D4rag0A2f62oSrcX6URocWMI6s00lS4SFt4ssj0unEuNVUKiHP9X3
 9ala3gxyQ3k5pJ7LC37lcQRZx9AT8y2DcOKsIyWpz7jQU8uCXSe2J0OT5opw3QnX/eDE
 MWd9GfFZ4gbdT/VNkzcHq5uFIM5JaMlSXkil+6Bq7930/G1LwxJJXFLzr3WiM/D3BQk6
 siHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hj8GZyErqoRpwJ6pru/Fv1/NvpQNlyU7FuHh/CYFSq8=;
 b=WBYDN+oWVlFPmO+5OQlk1qr8TpKmVWo9+YrcmfDcFC3lG1qNyJKdz+3YH4lZnySoou
 5VrBMyZxhwMXBEL+cQXftLx4+vYlvL5QKL1p26RY/j+72WQA0EGt4bKUwlekvrwsE+xF
 XCAlw/NHoFji4DnsNObAnx31/YnDyw1/ouRbmkwrqxO4sb3YBgLxPykP6bD7f3Uo1vwP
 MB2s9cxmxEUM87s2II07W2rmjzLv9glUdkJ/lECSxZJ/2kE/MfCfYNgIlxLOUMoEHbd0
 xcTOVxqpT3wisPtZ1m2BEw09r19uyd1E5u0j17Z4AU/3Dp7/4zzMLElZ/8/NxxqSAimu
 X4qQ==
X-Gm-Message-State: AOAM531CmQBmSXg8G5trzSf4D8dr9ge/l1O6PltDTG45wCTd+0kwzMOT
 Ow20mPXkkk1ssW/vUj+jGjLDNQ==
X-Google-Smtp-Source: ABdhPJxYYkRduTp74uXAsuyHaltr7nPvN47w0khE1xi2D9kopWVIHhqhav7sLrhi1PKX3CHf1d1hag==
X-Received: by 2002:a63:445b:: with SMTP id t27mr39087231pgk.413.1625844054483; 
 Fri, 09 Jul 2021 08:20:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y195sm6706728pfg.68.2021.07.09.08.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:20:54 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] target/riscv: Expose interrupt pending bits as
 GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3265e78d-3627-15d1-55e6-f081fa23001f@linaro.org>
Date: Fri, 9 Jul 2021 08:20:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 15:20:58 -0000

On 7/8/21 8:30 PM, Alistair Francis wrote:
> Expose the 12 interrupt pending bits in MIP as GPIO lines.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

