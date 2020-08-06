Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3kfL-0006Hg-Ut
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 14:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kfJ-0006Er-MR
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 14:30:57 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kfH-0001CH-Er
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 14:30:57 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d22so7245925pfn.5
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2LRCFxIuAS3F37Go6N8n16BOh9PKGBFRaNdssvZtZ+0=;
 b=NyW0hXMeSGNGu8G4fZF4A8HzQdzUZtXL578IOsgR8V66nJF6jGUSk0jbxPAP7b4WIv
 UEjW4mx4pdOarBZq6Ro214tyQ7FRNI2XjAu7/MkdRwCLhukgs49PWxPCqxsGJOr73mmW
 XPOYBvs2tVn5Dnj4/t57h1WWd3iMRzTS1EaFdEwXuOGVepFbOPxmiLu63vEiMfuGN/gT
 mcDZWxFzpC/h2DtlTWpAgK1TL2+4Ezk/oxau0BvuDf1gVy1eJF7rbJXABnI74eOHhW63
 vWjxBUfjZa7GqZfDIhOg02rnrCLosEfz92h9dbtb2vl/CBhIWObVzYZZSN9j5gwNSZIE
 Y4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2LRCFxIuAS3F37Go6N8n16BOh9PKGBFRaNdssvZtZ+0=;
 b=fu1uZzk98uu99BqPpGD82SjvgAdcX049TbWkUTZR6lw1q08QbxF5E28QsWV4rd0JEM
 qvxuEO+nTAhmJoYsp34QSrOknX7Pcc8SwCintOuenv0K6waWcor0q1k3ScR5YGJ/yZ8y
 vE9i7buUsj/okHZFyZbS7Qt+1mEH00JOMjoXr/Telx6X0xXg2iDLjR2IZnQBOWHg3lid
 A8ArGqAnY3+8rtMj3RReqxK2uuIFlLhFuDiJAL3f5Oql8Z/znOgABVhM8t7uMH3+FSVf
 nT88WT5T5F+rTVhgZMq/en8HQ3va2dlbnA0K2T1h3DIHuHJbV8Tc9Ooy3+GSsfs4ylUz
 4ORw==
X-Gm-Message-State: AOAM5330kKNOr0tUiER5KL5zEBy7O6Dk1Zt8yVZsfc9ZbMQ64zqGdyys
 aQyhz/2PnPapEW5ekgZao6E2HA==
X-Google-Smtp-Source: ABdhPJz3kCYj5b900EtYk1cydv2CU1YKOE+qcmTUjqCygOs29Hhyf3ECpGEVZxW1LFuKxoGY14Dv4g==
X-Received: by 2002:a63:380d:: with SMTP id f13mr8223568pga.16.1596738653790; 
 Thu, 06 Aug 2020 11:30:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f89sm8285381pje.11.2020.08.06.11.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 11:30:53 -0700 (PDT)
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
Message-ID: <63094cf9-c0d6-05b2-28a5-37de657edacf@linaro.org>
Date: Thu, 6 Aug 2020 11:30:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Aug 2020 18:30:57 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Remove VXRM and VXSAT fields from FCSR register as they are only
> presented in VCSR register.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Actually, there's a related clause in fs() that should be removed:

    /* loose check condition for fcsr in vector extension */
    if ((csrno == CSR_FCSR) && (env->misa & RVV)) {
        return 0;
    }


r~

