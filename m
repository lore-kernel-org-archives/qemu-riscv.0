Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mh1jB-0007cc-PL
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 23:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1j9-0007aL-HO
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 23:41:47 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1j4-0005K3-5S
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 23:41:47 -0400
Received: by mail-pf1-x42d.google.com with SMTP id s5so1565936pfg.2
 for <qemu-riscv@nongnu.org>; Sat, 30 Oct 2021 20:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ku4deGFrngV9OK5LZKz8CK/mdV0oY+PK2AUNC/wej3s=;
 b=kmhYNZDCW20Yazt0FSvY9pzmdGOJ+AlhMf8mfa+x1P9/zhJ3eiu+ReH9f0TUzlhbRV
 BkIz9Xeg3UzF66RShs1uObllphG7nuZ9C36NWRT/GJWJxCJgTbRvtwGJcgIohl9uL6Ym
 8h5TIv2Z9iCR+E+MDJgczmf3vypJADp2gQRnf8zwal9k0iyV/WVC+YJIee14Irl5x/m1
 rrlZAH4bc4tWfitrhUpDMOcqcBYJjOhAiaQLvZEAvaeQrwLfGjRgGpjIKsZWfERbeyYe
 t4N9S1Uzpjy+heSTcoCU8edE0dW3uzta+lelZrTUCjn1/IA50mP/vj26gzjGTOEispPe
 vw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ku4deGFrngV9OK5LZKz8CK/mdV0oY+PK2AUNC/wej3s=;
 b=aDxwiEdA4feXSvnyhLvJtPs+vKRaQukJWgo+wKW/NJTznx4KIDzxv8MS4V+VZtaNrl
 yIBPjElwZay7GOerFAWGxvqbj2hFID6vkgDYM32f9b8A1oX7baSXBxiSTsJdpG+No5eP
 ys48lYWIXfnVEhdm8w0XTjTMVd61JalORmEVo8hNR0jqp/tmlQH3KMLdeTtMFMqCw22a
 zlvcRi2fKRcwhoDdnpjBiiOnzSu/LA5jZRBQUPLRmz8KE+A6nGn0VYe2X+y7K6itQnTl
 fUfYwixPf3uYahJSDLP+0JRiquEYWSHgYtwQZ+Ns9xpKT/yQpm4QhYhb1H0cNgWuxo1/
 efCQ==
X-Gm-Message-State: AOAM531ii3p2zyiJNbf2SQ0pLxPdLHnJjx/8R0G3uiAJqfK7ZG3CNVW7
 MhTHbTFbv396xIt5DVrsVSXANg==
X-Google-Smtp-Source: ABdhPJxv3dfwCZyfcKoE5/FkvFe39b5i5v7AD86bTfCr8AZbfxinm1UmwYvrwzK8a5mMoenIGF1M6g==
X-Received: by 2002:a05:6a00:16cb:b0:44b:bd38:e068 with SMTP id
 l11-20020a056a0016cb00b0044bbd38e068mr20395695pfc.34.1635651699967; 
 Sat, 30 Oct 2021 20:41:39 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z7sm11101260pfe.194.2021.10.30.20.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 20:41:39 -0700 (PDT)
Subject: Re: [PATCH v4 08/17] target/riscv: accessors to registers upper part
 and 128-bit load/store
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-9-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bfc385d-03f7-2b4c-f0cb-4f07c844f3f5@linaro.org>
Date: Sat, 30 Oct 2021 20:41:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-9-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
X-List-Received-Date: Sun, 31 Oct 2021 03:41:47 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> diff --git a/configs/targets/riscv128-softmmu.mak b/configs/targets/riscv128-softmmu.mak
> index a9343d57d3..41daab1cd3 100644
> --- a/configs/targets/riscv128-softmmu.mak
> +++ b/configs/targets/riscv128-softmmu.mak
> @@ -1,5 +1,6 @@
>   TARGET_ARCH=riscv128
>   TARGET_BASE_ARCH=riscv
> -TARGET_SUPPORTS_MTTCG=y
> +# As long as we have no atomic accesses for aligned 128-bit addresses
> +TARGET_SUPPORTS_MTTCG=n

Ah yes, this is why you need the separate executable, at least in the short-term.  We 
should be able to fix this on the tcg side at some point.

This hunk should be folded back to patch 6.


> +static TCGv dest_gprh(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0 || get_ol(ctx) < MXL_RV128) {
> +        return temp_new(ctx);
> +    }
> +    return cpu_gprh[reg_num];
> +}

You don't need to check get_ol here.

> +    if (get_ol(ctx) != MXL_RV128) {
> +        g_assert_not_reached();
> +    }

This is assert.

> +    if (a->imm != 0) {
> +        tcg_gen_addi_tl(addrl, src1l, a->imm);
> +    } else {
> +        tcg_gen_mov_tl(addrl, src1l);
> +    }

tcg_gen_addi_tl contains exactly this check; remove it here.
Two instances.

r~

