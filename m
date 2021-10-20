Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKqY-00063E-LJ
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKqW-0005ue-3L
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 19:18:08 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKqS-0005ub-6p
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 19:18:06 -0400
Received: by mail-pf1-x431.google.com with SMTP id c29so4259016pfp.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T+QfIHwgF1KDzpoIiQq86ew/xoGOwXhBcGtonVDtt1U=;
 b=Wbz6nExhyrx8zAKYwrmMVHz02j1JzORc/1gqF8H/2A9Q4H2bZfAI4F3Jg9pTZyIKiC
 +XndU87m9GetbvfIFFQTsTpnV2Gq9VGj73odhV445P5Sm7CWOcD7fenT+jXtofbSoTFJ
 M+X6arMTfv1AEG4G3I61rbVuWP08SjChiJCuX7Cx7MTHiAXqzV3TNmepz0/epfVL9mn5
 3t/edMTml+zNNd1YLNdPAm/q7GjrpnnOBt1FZfqbqLmqLULY/8yMmZrirH8q5A6lwqD2
 4+Mt78btJh3mAG2aGtUDNMekRG26a6fwQkgmY0/mK10jlSLnVmi1Zt2sTeU4rIuCPj7/
 d59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T+QfIHwgF1KDzpoIiQq86ew/xoGOwXhBcGtonVDtt1U=;
 b=Je5L+sG8WiITlnQwQfCPdkZO9qmSgpKKmRhtbYhhCRIC10wrdSLEVshdGwvsSqVQb3
 vrUeY5lSfJHLJ+TWPnJRxgqMa4sZBTQyVGj9Qos9WHj5NW2WZ86gRk7FbKIwoIutvYiN
 n7yqyE/EoILIuR7cUMTg2XcccZQj0nMes3F9bF+rBO8PgiEGcxRowgdWSpuVbzieX2DU
 N8nDJl73eU79aMkx1LLU0DdIDobat7KXRE8JMXhZu9UoxSJT6SiMJvoyanudOqi04iVr
 zMOUAG4xS+wYaXcmFdKgrdvfNj8UtsiuV+NF1NJUMRZtkCr/mLcioZPEe8KUzpGO7aJC
 XTxw==
X-Gm-Message-State: AOAM533WAccw5+X76M07xBUusOT1pV+MJ/tiWMSslyGTTxuYauPr3MEM
 cvhCsfw2hStlAWE5cqn17gYvdA==
X-Google-Smtp-Source: ABdhPJyn1kLeXX0ZOp5zKmSycVcok0g1vqfHFz+HbTqMt08BgOaBQZYmNhHm0CwFz3nisrtUwAnLfg==
X-Received: by 2002:a65:6389:: with SMTP id h9mr1653075pgv.83.1634771882531;
 Wed, 20 Oct 2021 16:18:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d60sm6857584pjk.49.2021.10.20.16.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:18:02 -0700 (PDT)
Subject: Re: [PATCH v3 20/21] target/riscv: adding 128-bit access functions
 for some csrs
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-21-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31202e87-7456-cf0e-4107-06d6f063801f@linaro.org>
Date: Wed, 20 Oct 2021 16:18:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-21-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
X-List-Received-Date: Wed, 20 Oct 2021 23:18:08 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> +static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
> +                                   Int128 *val)
> +{
> +    *val = int128_make128(env->mstatus, env->mstatush);
> +    return RISCV_EXCP_NONE;
> +}

Needs updating from split SD bit.  I suggest

     uint64_t val64;
     read_mstatus(env, CSR_MSTATUS, &val64);
     *val = int128_make128(val64 & MSTATUS64_SD, val64 & MSTATUS64_SD);

> +static RISCVException write_mstatus_i128(CPURISCVState *env, int csrno,
> +                                        Int128 val)
> +{
...
> +    dirty = ((int128_getlo(mstatus) & MSTATUS_FS) == MSTATUS_FS) |
> +            ((int128_getlo(mstatus) & MSTATUS_XS) == MSTATUS_XS);
> +    if (dirty) {
> +        if (riscv_cpu_is_32bit(env)) {
> +            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS32_SD);
> +        } else if (riscv_cpu_is_64bit(env)) {
> +            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS64_SD);
> +        } else {
> +            mstatus = int128_or(mstatus, int128_make128(0, MSTATUSH128_SD));
> +        }
> +    }

Needs updating for change to SD.
Now you can defer everything to the 64-bit write_mstatus.


r~

