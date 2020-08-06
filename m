Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3kJH-0003kx-RA
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 14:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kJF-0003j5-C0
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 14:08:09 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kJD-0006vY-3V
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 14:08:08 -0400
Received: by mail-pl1-x632.google.com with SMTP id p1so28193700pls.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 11:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dP7ycjRiFYJ7d9fHEhodUS8alWwM4fJSFXCzkLPTv6U=;
 b=QbHDfXsLFkYp7AkUojvddmdjG3xtwFBLfoGKaLfQVOlTu31MX7ltpDMdlx7lh/NpV8
 QNVJjaBBTNHViNkaD1aYsKIZuimbYaSNgNljvPNZOaAL8MPRWpQjbXyY5VNwVFjxyK5V
 N+RauBeMERkSz958Co0boKgmyhxPxVseuxZyfHPnGPx0DKvxvTzzDR5t/bLqMswvq+v2
 cXhTChde9XhXKk12u9Gwh3VIpI2Yk/ZOBLBdaKKJe0vnq4fXtzDM4mc+/+B/Mmy1hXRR
 PD6+8FVdDYZFw9c6YBe3NSNB0mvaB5/5yOBE2pKEcBUhXKicgJpqIaTdX50WsPBiOQp4
 ldeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dP7ycjRiFYJ7d9fHEhodUS8alWwM4fJSFXCzkLPTv6U=;
 b=IiFA7Wdno8PD7q2Za0Uhd+Uvyq33delkF/DU30xcjOmJSNe9zQxfbJ6f7AFyViz0uO
 BCB7tNG98qL6g2FZXTsXmWAe5+xA92tdvqkQetGVze9ZnVuHBmh/csNWORTkXTjQRH79
 VjHQ8vN3K3BCxyrD7mntjV+fo7tPPuettpvznzRlSoKU1Bo0iv/8OpHv4d5tMx4uNu/V
 BfUsL1/FGhWT9mc+lcTNX2l0YwbKP+w+VITjEMl+u8+RSZcfmdpNhJ0myYoLbj+jjVLk
 vhTcC+vJ+6FfZfgYK4htAQdmKeAgR7mRmfivxZAY65VC+aey4568nKK10AI3a5X7rNHl
 lfXg==
X-Gm-Message-State: AOAM531h7NMYWBOkFQ7cH6T9pOFZsPYJaUF8fcE+MgyVajT1uplIqeWA
 76p6Nd+TM9uTUmAWqNx/Tmlopw==
X-Google-Smtp-Source: ABdhPJzJimeSft5taEX1qacoNTyfcc3gM+R7ROElUy5aA5/Fby3xHbdp3n6k1BGt7/Dq8sioGqHu9g==
X-Received: by 2002:a17:90a:fc98:: with SMTP id
 ci24mr9880225pjb.101.1596737285094; 
 Thu, 06 Aug 2020 11:08:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j4sm7942672pgk.4.2020.08.06.11.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 11:08:04 -0700 (PDT)
Subject: Re: [RFC v3 07/71] target/riscv: rvv-1.0: remove vxrm and vxsat
 fields from fcsr register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6fd8e17e-3a36-8a9e-c427-bfd1449c52ae@linaro.org>
Date: Thu, 6 Aug 2020 11:08:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Aug 2020 18:08:10 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Remove VXRM and VXSAT fields from FCSR register as they are only
> presented in VCSR register.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 9 ---------
>  1 file changed, 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

