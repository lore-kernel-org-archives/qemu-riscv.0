Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YO4-0005Fn-L8
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YO3-0005FY-GW
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:00:03 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YO1-00043P-LO
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:00:03 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s15so4794190pgc.8
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P0uDl581Zx7OtJgsG9JCwHqkp4s42eRukweVPsz3aNg=;
 b=UTXSuh7QsRiqy/8dgJxsUDXNJwJP2asVwsENfhhfey1FYhoslsM98xx/VIBCcZZVQj
 pokn4WF3S6ccOmcPUX8OWJ+79SSBolZAOMwAi1P7H7dFSGZ8iNEwnBcOqVhb/iPGLkAt
 3rAXF+YQgIfpyFeQYVnQ8EZqxmd1sgRJPRq8RFggfvy7WBZBRTUqSs3YOPPTSXv57Wxj
 hVmQOqLNcBk0Lc3a+NpM88M6+K+p7dLa5tvr82fodrBs2pLhYNL/WxewMMyg/bwxgIYV
 Mm24FYRNzXN0URy2TrX51WSy1dH6yKWPWSMwNfbSjdJM5OQzFyuOokZletFr+fr9yJya
 xDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P0uDl581Zx7OtJgsG9JCwHqkp4s42eRukweVPsz3aNg=;
 b=eDDKyDiYk93RgmTrS7sdEVzBlkISYBKU4ZkAkz9pRMujKJ1ysYFBHRSeS/mSsH1Mm3
 8IcrZ2oQnzbghrdG5bM5rE6gJ2opN70PlgUMcphCOJjXLuApHSr+/SFzkjVP0iLZwBm4
 FAucrv+ch2TEylSFo7hfTTFxOgglY21yxyeS656whtbRKXaRluaLLaAygw0ic/qzz9Gr
 OteaDOnALoHS/3Sc9LP/ss6lwNrIGxUO9kCZWxwj5x4wGqwSWAhhidd0CBwXTzadm6iS
 goRGzOaGjMMgfDxMDJMD3QqX+zhUFrqwcg90f81IUo/3tTBsSLHGgznHnQJjUt3iQWMq
 I7vw==
X-Gm-Message-State: AOAM532YoOnz4oPhWdvlpEn/2oio+jXyVxzwZiRynwHtm9DMr/4wDDdv
 q4Ou5CzsceXD1DzKAAfyFUuKjA==
X-Google-Smtp-Source: ABdhPJxmPecNRUE2hk1+YOll/MsGtydRb+1jMZ6JH2tIAeNDyaQhejmubjTsOA99Exn++vmIjnlwXg==
X-Received: by 2002:a62:a21e:: with SMTP id m30mr4329433pff.11.1596214799918; 
 Fri, 31 Jul 2020 09:59:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d17sm1899444pjr.40.2020.07.31.09.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:59:59 -0700 (PDT)
Subject: Re: [RFC v2 64/76] target/riscv: rvv-0.9: single-width scaling shift
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-65-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ebc7527-65e2-8fac-c744-0aac857a40f3@linaro.org>
Date: Fri, 31 Jul 2020 09:59:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-65-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 17:00:03 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
>  GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
> -GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
> +GEN_OPIVI_TRANS(vssra_vi, IMM_ZX, vssra_vx, opivx_check)
>  

I think both vssrl and vssra should use IMM_TRUNC_SEW.


r~

