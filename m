Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkKsU-0001FX-Lx
	for mharc-qemu-riscv@gnu.org; Tue, 09 Nov 2021 01:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkKsP-0001Dr-67
 for qemu-riscv@nongnu.org; Tue, 09 Nov 2021 01:45:05 -0500
Received: from [2a00:1450:4864:20::136] (port=42841
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkKsJ-0007fk-C6
 for qemu-riscv@nongnu.org; Tue, 09 Nov 2021 01:44:57 -0500
Received: by mail-lf1-x136.google.com with SMTP id bi35so41999100lfb.9
 for <qemu-riscv@nongnu.org>; Mon, 08 Nov 2021 22:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kpeD7Nfxaud+wWNp3eppygWk3IkUsJ1vlomcvvkmwFo=;
 b=kHir0vuJQU2o2VYeRyMdN4XShe8oURrOT7762ihaBugoNKmMqJhA3e+WDsCRGxgCyF
 oLyPZX5ihDO34wmC0YwntDeWNSQDtWOTbQbePEuIQ7lV0brlgAERd3tXCEXJxrtNbC6s
 SmuzryPphZRWJepd6LurSj9M8S729nW9vsPaHF7TUe6M0mxALb5acEdlUYUuZaB20zVo
 DmbY62jlID94p4swi0l0NHjXoKmix+2/canzgOJecJ7iuL0p4vecV+QwR/wa/acLUnfB
 svbLOWy9SF5IfK4dUjXrUh0uzYHgbnIpyivoFmkLNM9qmns3N66KuI5JGtr6mjo57e6w
 u8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kpeD7Nfxaud+wWNp3eppygWk3IkUsJ1vlomcvvkmwFo=;
 b=lXLvgBuXRBmu7mhR9naRVAMfh6LIsQkkdQeqBxIRdWyKKQsvNQLmNjtQU58zJBJqot
 OlVCLYG13NZv5zBCZFT06jUQby0bNsGUccLs6VQMu1ZXfGm+KfBDqfXAUINtpv5XFxdh
 3ia8pjY7wB3rRc9nbiMzdu2N9Qg9GKyegSjvdMLJhJ7/CB1/XkpJ2QNlI+MyrHuz1fbR
 GpKXTDo0IKTimZvOEg7GG/z3XvbkR2UrXY2XoJJ1HAeU+RyOzJT3yK5GzOwyVTjz7DJ5
 c7etDM29GYTNXmEcNd3YEkRks4tFSUBhA74Hx1ai1I1W+3jFRDoFOTvZhqAWiY0XWTaK
 E/og==
X-Gm-Message-State: AOAM532Nel1LGcW6ZexGmz3fA6pxEuKoZMshItffWs9pjuA5rjxNyCzu
 zaZjFdB4bW5IjsZ8zmDbk86eFHY7EC/KdAnOPf8=
X-Google-Smtp-Source: ABdhPJyILaQbtxk4pApk66iV7JyNlTHoa2VARvLd7Oma6il6ErPT7nm+um+W8mdcDr8zM18jjtu5qQ==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr664176wry.66.1636439833502; 
 Mon, 08 Nov 2021 22:37:13 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id g5sm20791010wri.45.2021.11.08.22.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 22:37:13 -0800 (PST)
Subject: Re: [PATCH 09/13] target/riscv: Adjust vector address with ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-10-zhiwei_liu@c-sky.com>
 <851481b9-e973-b3e1-1722-73db47edb772@linaro.org>
 <f84e607c-e16e-ec3f-a7b3-e779b344fcb6@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52357320-6098-c3da-b9de-89b131b85ffb@linaro.org>
Date: Tue, 9 Nov 2021 07:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f84e607c-e16e-ec3f-a7b3-e779b344fcb6@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 06:45:05 -0000

On 11/8/21 10:28 AM, LIU Zhiwei wrote:
> On 2021/11/1 下午7:35, Richard Henderson wrote:
> 
>> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>> ---
>>>   target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++
>>>   target/riscv/internals.h                |  1 +
>>>   target/riscv/vector_helper.c            | 54 +++++++++++++++++--------
>>>   3 files changed, 46 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc 
>>> b/target/riscv/insn_trans/trans_rvv.c.inc
>>> index ed042f7bb9..5cd9b802df 100644
>>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>>> @@ -233,6 +233,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>>>   }
>>>   @@ -286,6 +287,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>>>   }
>>>   @@ -365,6 +367,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>   }
>>>   @@ -404,6 +407,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       fn =  fns[seq][s->sew];
>>>       if (fn == NULL) {
>>>           return false;
>>> @@ -490,6 +494,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>   }
>>>   @@ -542,6 +547,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>   }
>>>   @@ -617,6 +623,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>>>   }
>>>   @@ -724,6 +731,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
>>>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>>>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>>>       data = FIELD_DP32(data, VDATA, WD, a->wd);
>>> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>>>       return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>>>   }
>>>   /*
>>> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>>> index b15ad394bb..f74b8291e4 100644
>>> --- a/target/riscv/internals.h
>>> +++ b/target/riscv/internals.h
>>> @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
>>>   FIELD(VDATA, LMUL, 9, 2)
>>>   FIELD(VDATA, NF, 11, 4)
>>>   FIELD(VDATA, WD, 11, 1)
>>> +FIELD(VDATA, OL, 15, 2)
>>>     /* float point classify helpers */
>>>   target_ulong fclass_h(uint64_t frs1);
>>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>>> index 535420ee66..451688c328 100644
>>> --- a/target/riscv/vector_helper.c
>>> +++ b/target/riscv/vector_helper.c
>>> @@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t desc)
>>>       return (simd_data(desc) >> 11) & 0x1;
>>>   }
>>>   +static inline uint32_t vext_ol(uint32_t desc)
>>> +{
>>> +    return FIELD_EX32(simd_data(desc), VDATA, OL);
>>> +}
>>
>> XLEN not OLEN.
> OK.
>>
>>> @@ -123,6 +128,14 @@ static inline uint32_t vext_maxsz(uint32_t desc)
>>>       return simd_maxsz(desc) << vext_lmul(desc);
>>>   }
>>>   +static inline target_ulong adjust_addr(target_ulong addr, uint32_t olen)
>>> +{
>>> +    if (olen < TARGET_LONG_BITS) {
>>> +        addr &= UINT32_MAX;
>>> +    }
>>> +    return addr;
>>> +}
>>
>> Here's where I'm unsure.  This looks a lot like the changes that are required to support 
>> pointer-masking in vectors, which Alexey said he was going to look at.
>>
>> (1) Do we need to pass anything in VEXT at all?
>>     We do have CPURISCVState, so we could just use cpu_get_ml,
> Yes, we should use cpu_get_xl.
>> which we would also need for env->mmte etc for pointer masking.
> 
> Do you mean env->mpmmask and env->mpmbase? I think yes, we should also adjust these 
> register behaviors with xlen.

I mean the set of [msu]pmmask and [msu]pmbase, selected as appropriate for the current 
execution mode.

>> (3) Do we try to streamline the computation by passing down composite
>>     mask and base parameters.  This way we don't need to do complex
>>     examination of ENV to determine execution mode, and instead always
>>     compute
>>
>>        addr = (addr & mask) | base;
>>
>>     where mask = -1, base = 0 for "normal" addressing, and when
>>     UXLEN == 32, mask <= UINT32_MAX.
> 
> Do you mean add env->pmmask and env->pmbase?
> 
> I can initialize them in riscv_tr_init_disas_context, such as by env->xpmmask & UINT32_MAX .
> 
>>
>> (4) Do we in fact want to pre-compute these into known slots on ENV,
>>     so that we don't have to pass these around as separate parameters?
>>     We would adjust these values during PM CSR changes and when
>>     changing privilege levels.
For option (3), I was suggesting a mask + base pair passed down from TCG-generated code.

For option (4), I was suggesting embedding a mask + base pair in env, which would be 
re-computed at every privilege level change, plus reset and vmload.

In both cases, the mask would be a combination of [msu]pmmask & (RV32 ? UINT32_MAX : 
UINT64_MAX), as you say.


r~

