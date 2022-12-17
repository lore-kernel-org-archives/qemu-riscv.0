Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6bvU-0007jU-My
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 13:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bvU-0007jD-1y
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 13:28:48 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6bvS-0004Q2-F0
 for qemu-riscv@nongnu.org; Sat, 17 Dec 2022 13:28:47 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9262389pjt.0
 for <qemu-riscv@nongnu.org>; Sat, 17 Dec 2022 10:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OE5uQYAZ/9JetaArm2NhrTT//VrSfooPHAlASrehaQg=;
 b=KQMnR2j9IXRtKOeCaFYXaT1CNWU1HeLX5SUZKYlWSY9AsZAVToEJ5Ct0dE1py4oV6/
 O0KugFXN8jNGdVOrFu8DLCC3rkksxODtboU6Hrgjs1mNvC2czPADNb0Mt+GyDKFJRYtv
 pwwHaDLAqXi1azsgb5/4n955OTKYsmz04NtG94ALeWNs+oXxDM7/e2/LR0/11Ek6oIxk
 EMb4vyd+Hwy2HC+DqxT8wt2h3LZQnQoQU5U/vcV0F52kp/EbCepnq9biV6txl8luRL+l
 BtcybDC6ACEOOgPwJd4baagfpX3nKd7hO4FkWPnh+vL2ZuJG1NTndEM9yjb++AH5eP5a
 o8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OE5uQYAZ/9JetaArm2NhrTT//VrSfooPHAlASrehaQg=;
 b=qiVvI7nPQ9AaMrg0DG2HaMQG6ker8sR/qL19W+PNbS4VG9pMbeh+voM/kqb5Z9tEaT
 9HBBWR1dZHPQSU+DGqYaH4vxWJokA+ARnY1DMdKiiyrUe5HPMuXiITypZquqaE5026Ma
 Lgeq1HjxVu1bZaApCFBtuYb+XKl0J+htcz88HxON+JgrWjlHoaAcVD77eSgaNqf+S1GZ
 l4Akjj0LR5Fk+2dlC8SpvLnbELZjCjyLnQcrw+mMx2r4k8rGBqMk0w7mzJc8h5She8o6
 d7O7iZMQBgQZ2lfX0MLf0C5JxfJOBh8YAN5WEVqbKXQKNb11hmbpKuDEVySRJt80n0s/
 0AsA==
X-Gm-Message-State: ANoB5pnKxQNUPn/xcBvHFJ8osV/x9+cj8mkNitjCuIAbpfKeCE+/HZmB
 cacblc+Ga9x8AGHgviVYCyW6wg==
X-Google-Smtp-Source: AA0mqf6ydiE9fft7zSu5+9sete9WRnTt/x2lQkMPcNUgRp5ZB7muadtdrmO2C26G6Wroo2FC0tjJhw==
X-Received: by 2002:a17:902:9044:b0:186:daeb:bc0a with SMTP id
 w4-20020a170902904400b00186daebbc0amr34226014plz.67.1671301724981; 
 Sat, 17 Dec 2022 10:28:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a170902f7d400b00189548573a2sm3833346plw.161.2022.12.17.10.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:28:44 -0800 (PST)
Message-ID: <757d33fe-bb65-5698-44e7-4945e078bc5a@linaro.org>
Date: Sat, 17 Dec 2022 10:28:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 08/61] target/riscv: add fault-only-first unit stride
 load
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 Laurent Vivier <laurent@vivier.eu>
References: <20200701152549.1218-1-zhiwei_liu@c-sky.com>
 <20200701152549.1218-9-zhiwei_liu@c-sky.com>
 <44ff8209-236d-cd2f-25cd-d608303ad96f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <44ff8209-236d-cd2f-25cd-d608303ad96f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 18:28:48 -0000

On 12/17/22 10:21, Philippe Mathieu-Daudé wrote:
> (unburying an old patch)
> 
> On 1/7/20 17:24, LIU Zhiwei wrote:
>> The unit-stride fault-only-fault load instructions are used to
>> vectorize loops with data-dependent exit conditions(while loops).
>> These instructions execute as a regular load except that they
>> will only take a trap on element 0.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/helper.h                   |  22 +++++
>>   target/riscv/insn32.decode              |   7 ++
>>   target/riscv/insn_trans/trans_rvv.inc.c |  73 ++++++++++++++++
>>   target/riscv/vector_helper.c            | 110 ++++++++++++++++++++++++
>>   4 files changed, 212 insertions(+)
> 
>> +/*
>> + *** unit-stride fault-only-fisrt load instructions
>> + */
>> +static inline void
>> +vext_ldff(void *vd, void *v0, target_ulong base,
>> +          CPURISCVState *env, uint32_t desc,
>> +          vext_ldst_elem_fn *ldst_elem,
>> +          clear_fn *clear_elem,
>> +          uint32_t esz, uint32_t msz, uintptr_t ra)
>> +{
>> +    void *host;
>> +    uint32_t i, k, vl = 0;
>> +    uint32_t mlen = vext_mlen(desc);
>> +    uint32_t nf = vext_nf(desc);
>> +    uint32_t vm = vext_vm(desc);
>> +    uint32_t vlmax = vext_maxsz(desc) / esz;
>> +    target_ulong addr, offset, remain;
>> +
>> +    /* probe every access*/
>> +    for (i = 0; i < env->vl; i++) {
>> +        if (!vm && !vext_elem_mask(v0, mlen, i)) {
>> +            continue;
>> +        }
>> +        addr = base + nf * i * msz;
>> +        if (i == 0) {
>> +            probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
> 
> Shouldn't we check page_check_range() in user-mode here?

No, stick to the common interface.


r~

