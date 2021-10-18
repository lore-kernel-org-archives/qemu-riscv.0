Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLaC-00067v-8W
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLaA-00064q-CB
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 01:53:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLa5-0005Cj-Fd
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 01:53:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so13684057pjc.3
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 22:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OfJLUonHYjuHCbt16pHVOINf521HxYLr/hT9zMQc5zQ=;
 b=qjt5yd/7yEv+BWBstDlcKYawl8sN+xBlMC9p4Xe5u0s4hTEYXWhMBJvNbBjSq1I5Ve
 gXs9ZJP5YcLKj0EPipHx2P3iD2BD0vVjnwmWhXVtwZQWZ151lBEFL6vzSA+usq8VS96r
 lSnOp23VuS2MqN1bTpNtuAS6+tzbEmFJAJgnda5hqDyzjxjt4PJxGBEzq2xngRNmH3hc
 OgpxeH5/gbeZ52Xy/4RP9L26M/cj3aqwnYS78jQ+/t8JxBcpB8DkQ9hWVU2G7UCOLOUP
 b8hBrjuqgVDojAZNbcv8UZ4bgplfLriM9H5SjjXN/MGUavn4AU0txeVYHX524+MKPYfm
 kcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfJLUonHYjuHCbt16pHVOINf521HxYLr/hT9zMQc5zQ=;
 b=AldIf7i6UzTXDn/nvWYLeSoam6ptoxSUGH44KahnFKjoVSuz7th9SGujPDEN4Z53W1
 ttUeuKqYAJJT1UecN5N7OS9vQw0ibBAtIiWybeu4GKEUiyhVLNAsZNOxoEeghY2TqScN
 9wY9qoJSQ1t2TnGymHqaxBM7Clh4Ho6gACV/JSi9GDkGWyDvUREstJes3E0daY324zpK
 pnbm61MKT5Nevxygjoy+JWMaJ1q/lWBmbhvfW8MtZwdgtrmOdylcBnwUkQJYedAb0c4w
 aACPUOQ7z9f3r8egBxEY096L8QgLlTw+mlzwbNxgLlSSPvdf851Fcg2nBMQp5CvYsMjh
 yFsQ==
X-Gm-Message-State: AOAM5303YKI9EgBpldbaDwxozgl5u0RqQ3zV7G/Qsk9Qad5kClPBzCDA
 OBVsA+zOe6xdx+YiYsBQudJUzg==
X-Google-Smtp-Source: ABdhPJwNXRftGXodrcVsEMV9oqeGU3SvdZH3htyOrdq6CIFrw4LbLRl4GfYZt4ep+xeNEqZx17nezw==
X-Received: by 2002:a17:90b:3749:: with SMTP id
 ne9mr45873217pjb.192.1634536383619; 
 Sun, 17 Oct 2021 22:53:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a11sm11240697pgj.75.2021.10.17.22.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:53:03 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] target/riscv: zfh: half-precision convert and move
To: Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, Chih-Min Chao <chihmin.chao@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-4-frank.chang@sifive.com>
 <CAKmqyKNb6_b+fS3Ofi1U7wiUwhnwa_0P5G3Go0UFA-ZqSO+yeQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e208ab3-013e-6109-a93a-8653c03e06de@linaro.org>
Date: Sun, 17 Oct 2021 22:53:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNb6_b+fS3Ofi1U7wiUwhnwa_0P5G3Go0UFA-ZqSO+yeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:53:10 -0000

On 10/17/21 4:59 PM, Alistair Francis wrote:
>> +#if defined(TARGET_RISCV64)
>> +    /* 16 bits -> 64 bits */
>> +    tcg_gen_ext16s_tl(dest, cpu_fpr[a->rs1]);
>> +#else
>> +    /* 16 bits -> 32 bits */
>> +    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
>> +    tcg_gen_ext16s_tl(dest, dest);
>> +#endif
> Can we use is_32bit(ctx) instead?

No.  This is about sizeof(target_long), not the current cpu state.

It would be possible to use

     tcg_gen_trunc_i64_tl
     tcg_gen_ext16s_tl

but we have a couple of other instances of the same thing.

r~

