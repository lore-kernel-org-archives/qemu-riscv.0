Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD62C606A338
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 22:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KQEFq4ig
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLpym-0007DQ-7O; Tue, 27 Oct 2026 18:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xLpyl-0007DA-4y
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 18:49:15 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xLpyj-000530-21
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 18:49:14 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-81b54d0cb17so426496a34.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 15:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793141352; x=1793746152; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rKLY9xsTYSIV/X7BzECsQnL+MhMnbBhuoZNOYDMR0JY=;
 b=KQEFq4igbOMtSCIxBj3kq6O7+1/Mh7HIhYahNoySZtmEkIPBLhIwhZY1NlZkz7INTM
 B1yCoADkqOhe+vWOWP5qEWbEQHxnEHZML3ibBP8tqTDn76Wl+CTwwXRNeWhh4z6ctlbZ
 tTdk8e7apZNgeh/doxKvz0jLOClrJwUm6gAJMS+EXGTzbKNaxJZF6M35A1FhY6TB4xFV
 ibpHwgr5FW4M02giH+S463cINI3UpYR3Ger84MzEJFdTpo280WOqtd7bK/UlCfO3b06+
 f/2uQY2vIyqvAX0AlCGJ26zokR4r0enKyDQQWLNKu+hSsB67JLICFNlw1OhDyQRV5QiI
 MhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793141352; x=1793746152;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rKLY9xsTYSIV/X7BzECsQnL+MhMnbBhuoZNOYDMR0JY=;
 b=bxK2Aj7cV9uwAMROPdAS9eEefBklzNK7QiTAZxfkqcw5uFURqmrJoPW2/IAyb2m4Ce
 9ZzCga8KeOx93Q3fSMAv0h/29CDzqAfXwshP9ioIinMVDJn5DtelgivVWDVrc4Nwa4uC
 GwgkZVZ00w+ewxe732+JDD03+WvSQ1iUpwT0ft4wAhheNNO9Ig6mtl2Z1jAOWNgodyfL
 iSF7/Jq0uwhqFu0ILG4clwldRer2kI10AuZfVRS4aqriHT97Oho1IKKmIh+LEnQFrZiK
 mskByWieiZo2VbGf9PpGCFGjtWVqCutM3Nx4qhe16uAbVND/pfofoSVVeUTTgxu17/59
 fT8Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSkMgFPgwuZ1Ko4rYMH7TdvxKfvJludKMpKld+C4w/xzZtbtOgJ3WfbAw5ilofHHbl1HIoi5rEbyDa@nongnu.org
X-Gm-Message-State: AFq9FYJHQ+MQ6A1l/5BiCLFYWLscdtbLpOgwa3DA5MyVv1otZkmxNofM
 YLHU7pUysCjIlia2f1cYpJeh/OL5vMFuNVxekXw/HpwmI4AtAkrFViC+fLBHdgfMP3I=
X-Gm-Gg: AYBFou1euGyE+eIR8b87p5qntgMVSw4wO4kNIRTYB2GLn83NqT+w/SsKH3rNcsKNBqN
 HegXaRg9GMtnntfMEfXcaRP+6RLlgMnRSRsR5UDPel175EtTwj/VZmm7YeJoaWf/4v4CuenWgVv
 s53WulARYyQDi+US/bObL45BsJXkgFmJLea5tZ+x2uSvusRnSnjcJygtgqfkI7TXEysxSN5MqvR
 NVBi/Ik12xpX0GjRUlMaUwcjA9Y3PFSvlR5ntPLCKpHnk2Rpr18ngZrHPt9Fzupa6SlRTAxxs9H
 Hp4EQCCO9ST0iCv0WwE2WeR47e3OWNxvApbGIT/dvpbq+nwMQWzVC0MLKqVYQq4dTURQuqZVQtZ
 ro66dMuEppiJhixOSz5RH+tmTkLDWAfWqBYudqwJTAZks7DKq9xnM7SE+3A/PfbZuQJr4GHPp5K
 vRz/M2oTa4ert+rgfHv1vpGx07uMumQAvofKNqTaVvGVKAmcFso0MgI1H5403bomBTYNC28fVzq
 CPihrjjQglTitmOK8Op1C19X7BYtekPkYTqgIAPa+tNYPniOqZdNzfBywoFkC6974BpGNc=
X-Received: by 2002:a05:6830:3e05:b0:7f6:705b:ffe7 with SMTP id
 46e09a7af769-85abd80bab9mr852022a34.14.1793141351549; 
 Tue, 27 Oct 2026 15:49:11 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fb0749cfsm12900234a34.9.2026.10.27.15.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 15:49:11 -0700 (PDT)
Message-ID: <ae5baac7-429e-44f5-9696-1386b079e581@linaro.org>
Date: Tue, 27 Oct 2026 17:49:00 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tcg/riscv64: Fix vector constant matching for logical
 ops
To: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20261010174742.3552498-1-aurelien@aurel32.net>
 <9ca6f711-e886-46a5-80ea-a6c750696a93@oss.qualcomm.com>
 <auEeif_51q1K9XOz@aurel32.net>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <auEeif_51q1K9XOz@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 16:58, Aurelien Jarno wrote:
> Hi Philippe,
> 
> On 2026-10-24 19:00, Philippe Mathieu-Daudé wrote:
>> On 10/10/26 19:46, Aurelien Jarno wrote:
>>> For logical vector operations (in the case of the RISC-V backend that
>>> corresponds to and_vec, or_vec and xor_vec), VECE is unused. However,
>>> tcg_target_const_match() always treat it as an element size to extract
>>> the corresponding constant element from the whole constant.
>>>
>>> This causes the following aarch64 instruction
>>>     bic v4.8h, #0xf0
>>> to be translated into the following op:
>>>     ...
>>>     and_vec v128,e8,tmp5,tmp4,v128$0xff0fff0fff0fff0f
>>>     ...
>>> which is then translated to the following RISC-V instruction:
>>>     vand.vi v1,v1,15
>>>
>>> Fix that by, when VECE is 0 aka MO_8, only extracting the element if the
>>> it can actually be represented as a duplicated constant.
>>>
>>> Fixes: 5a63f5998791 ("tcg/riscv: Add support for basic vector opcodes")
>>> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>>> ---
>>>    tcg/riscv64/tcg-target.c.inc | 11 +++++++++--
>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> Changes v1 -> v2:
>>> - Use dup_const() instead of open coding the constant duplication.
>>>
>>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
>>> index 14a397117a..1262b71a62 100644
>>> --- a/tcg/riscv64/tcg-target.c.inc
>>> +++ b/tcg/riscv64/tcg-target.c.inc
>>> @@ -392,8 +392,15 @@ static bool tcg_target_const_match(int64_t val, int ct,
>>>            return 1;
>>>        }
>>>        if (type >= TCG_TYPE_V64) {
>>> -        /* Val is replicated by VECE; extract the highest element. */
>>> -        val >>= (-8 << vece) & 63;
>>> +        /*
>>> +         * For vector logical operations, VECE is unused and equals to 0, so
>>> +         * we need to check that the constant can properly be represented after
>>> +         * replication.
>>> +         */
>>> +        if ((vece != MO_8) || (val == dup_const(vece, val))) {
>>> +            /* Val is replicated by VECE; extract the highest element. */
>>> +            val >>= (-8 << vece) & 63;
>>> +        }
>>>        }
>>
>> This fixes the BIC case, but I don't think it is sufficient.
>>
>> I tested with qemu-aarch64 built for a riscv64 host, run under
>> qemu-riscv64 -cpu max, guest -cpu max,sve-default-vector-length=16.
>>
>> NEON bic v0.8h, #0xf0 // fail on master, now OK
>>
>> add z1.b; and z0.d, #0xf // FAIL
>> add z1.d; and z0.b, #0xf // FAIL
>> add z1.b; orr z0.d, #-16 // FAIL
>> add z1.d; eor z0.b, #0xf // FAIL
> 
> This indeed doesn't work. The problem is that while the constant
> matching is being passed VECE = 0 (as it is unused for logical ops), the
> code generation is still being passed a 64-bit size. Therefore for the
> eor, it emits:
>    vsetivli                zero,2,e64,m1,ta,ma
>    lui                     t6,3
>    addiw                   t6,t6,-448
>    add                     t6,t6,s0
>    vle64.v                 v1,(t6)
>    vxor.vi                 v1,v1,15
> 
> It would make more sense to use 16 e8 elements like in the original ARM
> SVE code, but it seems that info is lost at this stage.
> 
>> Not accepting constants for and/or/xor_vec at all
>> (using C_O1_I2(v, v, v) to get them loaded into registers)
>> makes all five cases pass (I'm not sure we want to keep
>> the .vi forms):
>>
>> -- >8 --
>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
>> --- a/tcg/riscv64/tcg-target.c.inc
>> +++ b/tcg/riscv64/tcg-target.c.inc
>> @@ -2779,15 +2779,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode
>> opc,
>>       case INDEX_op_and_vec:
>>           set_vtype_len(s, type);
>> -        tcg_out_opc_vv_vi(s, OPC_VAND_VV, OPC_VAND_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv(s, OPC_VAND_VV, a0, a1, a2);
>>           break;
>>       case INDEX_op_or_vec:
>>           set_vtype_len(s, type);
>> -        tcg_out_opc_vv_vi(s, OPC_VOR_VV, OPC_VOR_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv(s, OPC_VOR_VV, a0, a1, a2);
>>           break;
>>       case INDEX_op_xor_vec:
>>           set_vtype_len(s, type);
>> -        tcg_out_opc_vv_vi(s, OPC_VXOR_VV, OPC_VXOR_VI, a0, a1, a2, c2);
>> +        tcg_out_opc_vv(s, OPC_VXOR_VV, a0, a1, a2);
>>           break;
>>       case INDEX_op_not_vec:
>>           set_vtype_len(s, type);
>> @@ -2976,15 +2976,15 @@ tcg_target_op_def(TCGOpcode op, TCGType type,
>> unsigned flags)
>>       case INDEX_op_rotli_vec:
>>           return C_O1_I1(v, v);
>>       case INDEX_op_add_vec:
>> -    case INDEX_op_and_vec:
>> -    case INDEX_op_or_vec:
>> -    case INDEX_op_xor_vec:
>>       case INDEX_op_ssadd_vec:
>>       case INDEX_op_sssub_vec:
>>       case INDEX_op_usadd_vec:
>>       case INDEX_op_ussub_vec:
>>           return C_O1_I2(v, v, vK);
>>       case INDEX_op_sub_vec:
>>           return C_O1_I2(v, vK, v);
>> +    case INDEX_op_and_vec:
>> +    case INDEX_op_or_vec:
>> +    case INDEX_op_xor_vec:
>>       case INDEX_op_mul_vec:
>>       case INDEX_op_shlv_vec:
>>       case INDEX_op_shrv_vec:
>>       case INDEX_op_sarv_vec:
>>       case INDEX_op_rotlv_vec:
>>       case INDEX_op_rotrv_vec:
>>       case INDEX_op_smax_vec:
>>       case INDEX_op_smin_vec:
>>       case INDEX_op_umax_vec:
>>       case INDEX_op_umin_vec:
>>           return C_O1_I2(v, v, v);
> 
> I believe that until TCG is able to propagate VECE even for logical ops,
> this is the thing to do. It generates suboptimal code, but correct one.
> Therefore
I think the right thing to do is create a function that extracts an 
appropriate element size for the constant, and a new constraint letter.

Something like

static int vec_logical_immediate_vece(uint64_t val)
{
     for (int e = MO_64; e >= MO_8; e--) {
         if (val == dup_const(e, val)) {
             return e;
         }
     }
     return -1;
}

...

     if ((ct & TCG_CT_CONST_LOGICAL_VI) &&
         vec_logical_immediate_vece(val) >= 0) {
         return true;
     }

...

     case INDEX_op_and_vec:
         if (c2) {
             vece = vec_logical_immediate_vece(a2);
             set_vtype_len_sew(s, type, vece);
             tcg_out_opc_vi(s, OPC_VAND_VI, a0, a1, a2);
         } else {
             set_vtype_len(s, type);
             tcg_out_opc_vv(s, OPC_VAND_VV, a0, a1, a2);
         }

etc.  Very possibly wrapped up in another function akin to 
tcg_out_opc_vv_vi.


r~

