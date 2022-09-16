Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oZ6Fp-0008HN-Rh
	for mharc-qemu-riscv@gnu.org; Fri, 16 Sep 2022 03:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ6Fn-0008Ge-NP
 for qemu-riscv@nongnu.org; Fri, 16 Sep 2022 03:59:15 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ6Fl-00067T-Nn
 for qemu-riscv@nongnu.org; Fri, 16 Sep 2022 03:59:15 -0400
Received: by mail-ed1-x52f.google.com with SMTP id m3so10481541eda.12
 for <qemu-riscv@nongnu.org>; Fri, 16 Sep 2022 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lZJcS0UPveWQlKovoiRpQzaMxq4HiW9xqCr0GyVL9ZQ=;
 b=bM3pBq7c3VGTvluwrDRDV51NboFVF5SmfkpxNwj0Vo7BkcG7ICkLg5j8HimdbGVKRn
 iCP9LidxafQk/1vhr+r8SCsLaR22yGh3qUKQDiZZAeOz30Z93SZBNuJeUBltAGTqFmNH
 vB+pU7J1U3Keh10VmFzdW4bfI/94WOwhD1RfL1HrF536krVS7lxkEcUd5PCPvToAFO/f
 SRYwQ+Kl5WHHXaj1UkAzFR2qTe6NkEqwEHmzimn1YPdmBptZGhfBlUIvsWD3JLYgzxHy
 Rbd9+Wy/m2CTxWWvqAbsJd5TM5/OI66YyoLZmdAevy9H1g3PyFj0/+E9OBwhK9HWcEtK
 PBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lZJcS0UPveWQlKovoiRpQzaMxq4HiW9xqCr0GyVL9ZQ=;
 b=nbuaZf5KfXmU1LFKwFbr5tZrJKmTeCRrRGVhjdToCyB1SkgbMpWpltLlBI3wNaA989
 Br+xxui1OY3hwdCH3NX73YaEQzGJRoXlfMh19rSNH67Qrmfm9x5xcTkHNBd19wlnnbcg
 KOkCilCaOVaHFgzkh1xzo6iHyCEWVBdzpJIIZjKuKJFjjT+vF+fbNN2yZ8QEedaR0Xph
 GwdhkDOIhjLvG5XRTyjKdFb91EVlI7w2Z3DjHJC/qZtRFBzcZTRmw1alSWEA5P49qu2g
 HlmyNfXf3vcWV1ZyM5mhPSMODYWVWeJLYqHkGOP2D/m6htQaSNLBMGzzDd0dJiL55nYN
 +/Mg==
X-Gm-Message-State: ACrzQf1sTCFWUvJ4AJd1alfLFAICYsWyI6VVCgJfptRluccx7dyLMKc/
 49Twpos38Kt2h8cplWf95Y1p0w==
X-Google-Smtp-Source: AMsMyM7FBtPZKIN94tcOtwOe7hWV5So/V2Wxk1/Hb8sO/pvtiFe0G0C77QNCrTyZjei2QpbBBRkmEA==
X-Received: by 2002:aa7:c74d:0:b0:44f:d34:affb with SMTP id
 c13-20020aa7c74d000000b0044f0d34affbmr2864023eds.143.1663315151877; 
 Fri, 16 Sep 2022 00:59:11 -0700 (PDT)
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a1709063d4a00b0073c74bee6eesm9958962ejf.201.2022.09.16.00.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 00:59:11 -0700 (PDT)
Message-ID: <da5911d9-13d3-fb12-f08f-4260d373a033@linaro.org>
Date: Fri, 16 Sep 2022 09:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] RISC-V: Adding T-Head CMO instructions
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-3-christoph.muellner@vrull.eu>
 <f2a1814a-0611-f2b2-cc6e-e748219ac3be@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f2a1814a-0611-f2b2-cc6e-e748219ac3be@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Sep 2022 07:59:16 -0000

On 9/16/22 08:43, LIU Zhiwei wrote:
> 
> On 2022/9/6 20:22, Christoph Muellner wrote:
>> From: Christoph Müllner <christoph.muellner@vrull.eu>
>>
>> This patch adds support for the T-Head CMO instructions.
>> To avoid interfering with standard extensions, decoder and translation
>> are in its own T-Head specific files.
>> Future patches should be able to easily add additional T-Head extesions.
>>
>> The implementation does not have much functionality (besides accepting
>> the instructions and not qualifying them as illegal instructions if
>> the hart executes in the required privilege level for the instruction),
>> as QEMU does not model CPU caches and instructions don't have any
>> exception behaviour (at least not documented).
>>
>> The documentation shows, that the instructions are gated by
>> mxstatus.theadisaee and mxstatus.ucme. However, since these
>> settings are not changed by the upstream Linux kernel,
>> we simply enable the instructions in all modes.
>>
>> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
>> ---
>>   target/riscv/cpu.c                         |  1 +
>>   target/riscv/cpu.h                         |  1 +
>>   target/riscv/insn_trans/trans_xthead.c.inc | 66 ++++++++++++++++++++++
>>   target/riscv/meson.build                   |  1 +
>>   target/riscv/translate.c                   | 11 +++-
>>   target/riscv/xtheadcmo.decode              | 43 ++++++++++++++
>>   6 files changed, 120 insertions(+), 3 deletions(-)
>>   create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
>>   create mode 100644 target/riscv/xtheadcmo.decode
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ac6f82ebd0..7718ab0478 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -920,6 +920,7 @@ static Property riscv_cpu_extensions[] = {
>>       DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>>       /* Vendor-specific custom extensions */
>> +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
>>       DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
>>       /* These are experimental so mark with 'x-' */
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 5c7acc055a..b7ab53b7b8 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -440,6 +440,7 @@ struct RISCVCPUConfig {
>>       uint64_t mimpid;
>>       /* Vendor-specific custom extensions */
>> +    bool ext_xtheadcmo;
>>       bool ext_XVentanaCondOps;
>>       uint8_t pmu_num;
>> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc 
>> b/target/riscv/insn_trans/trans_xthead.c.inc
>> new file mode 100644
>> index 0000000000..1b1e21ab77
>> --- /dev/null
>> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>> @@ -0,0 +1,66 @@
>> +/*
>> + * RISC-V translation routines for the T-Head vendor extensions (xthead*).
>> + *
>> + * Copyright (c) 2022 VRULL GmbH.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#define REQUIRE_PRIV_MHSU(ctx)
>> +
>> +#ifndef CONFIG_USER_ONLY
>> +#define REQUIRE_PRIV_MHS(ctx)                                   \
>> +do {                                                            \
>> +    if (!(ctx->priv == PRV_M ||                                 \
>> +          ctx->priv == PRV_H ||                                 \
>> +          ctx->priv == PRV_S)) {                                \
>> +        return false;                                           \
>> +    }                                                           \
>> +} while (0)
> No ';' here. And in #else
>> +#else
>> +#define REQUIRE_PRIV_MHS(ctx)                                   \
>> +  return false;
> 
> with ';'

Using the inline function that I suggested in response to patch 1, this ifdef is not 
required.  Also, better with an explicit test against PRV_U?


r~

