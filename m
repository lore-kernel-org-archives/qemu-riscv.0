Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkjKX-0000wB-3z
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 06:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkjKU-0000vm-UX
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 06:28:26 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkjKS-0005aK-KT
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 06:28:26 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17e140619fdso45203890fac.11
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680863303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qFtEGJ7xic9Xp7/oZl73JisEEnjDl9aSG8A9DzB0ZDM=;
 b=M3q8iaW79f6F+ZyswcqPt0lyY9cuKuKfP+MyikG8pjsMRLnV68+ajfn7B/nImXanOa
 YRUPogh4TVe14cpsg46U3b24je0i6ChxcHUphxW1IiK4035tEEHfbkTiH5e4cRrYqdmj
 2Q70HZzWQzLYplGVPHmM0JsyK91LUvZ02SatpEUdjagTkFbDCOco+x96sTlXGoEuc61L
 qPQq+86vUER166xINLmzL7yTQ8WGunFG2o6rYxIZSTxpIT57B3tFjUxuFfXuuIh/oTEt
 7c8ct914FNKTjubvjdiEmQCvpsclPpkVxNNPd5G9Y5CekKa0TIqRQzrGB6vrTUgnt7/1
 Akjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680863303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qFtEGJ7xic9Xp7/oZl73JisEEnjDl9aSG8A9DzB0ZDM=;
 b=39RKJNrRjg8GAEefU6XpggyS/z269nqhNhz09vqWOsDAYO+04h5kWOpJQ9VeaSSgbk
 h79KSB2D0R9tl037zM/1Ap1V6+u1AnJZtpv3BycY4WgvoCjMZ751z49tlPsHjoijfCYa
 d6Ccz7PR9CNAivRmImOAHxBIugiBk3c4MIY9kGgehrY1BO9MJdVtOl9Retkn59CnOrYa
 Fni0nz60rIzXtyBwZPyoChVv0osdw90P9r6jn/QpXXKpnRux24D/UXYQj7jKzMh6I8SM
 0C2Q0axfiIlJ3IWQG8MteGACli43vIhw9GxdWNYXk0vI6RNVWdHNS1B1p3CZH/qk2nTO
 Cxkg==
X-Gm-Message-State: AAQBX9ePJazE69RbNP2DHT+1D1V+wNUXveUcNwcr/JcgyWgVjIYEDK21
 7mCX1m7B6NIG66LLzAsJMg/Lrw==
X-Google-Smtp-Source: AKy350Zgy8tgc63FjhymxhiZ/2OKWWyRoKptR2FbPcPFlWsZZimlnxsu0pzs9UZ80Yt+JBRE2TCmZQ==
X-Received: by 2002:a05:6870:f2a6:b0:17e:df0b:ecde with SMTP id
 u38-20020a056870f2a600b0017edf0becdemr1183188oap.57.1680863303204; 
 Fri, 07 Apr 2023 03:28:23 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 zr21-20020a056871ae1500b001765b2f6c53sm1552907oab.9.2023.04.07.03.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 03:28:22 -0700 (PDT)
Message-ID: <b3d62dc1-13e9-c6df-34e5-d50ed167f474@ventanamicro.com>
Date: Fri, 7 Apr 2023 07:28:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: liweiwei <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <ac342677-a7f5-52d6-0410-cd1c84b2197e@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ac342677-a7f5-52d6-0410-cd1c84b2197e@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Apr 2023 10:28:27 -0000



On 4/6/23 22:14, liweiwei wrote:
> 
> On 2023/4/7 04:22, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This patch is going to break the sifive_u boot if I rebase
>>
>> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation​"
>>
>> on top of it, as it is the case today with the current riscv-to-apply.next.
>>
>> The reason is that the priv spec version for Zca is marked as 1_12_0, and
>> the priv spec version for both sifive CPUs is 1_10_0, and both are enabling
>> RVC.
>>
>> This patch from that series above:
>>
>> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_exts helpers"
>>
>> Makes the disabling of the extension based on priv version to happen *after* we
>> do all the validations, instead of before as we're doing today. Zca (and Zcd) will
>> be manually enabled just to be disabled shortly after by the priv spec code. And
>> this will happen:
> 
> Yeah, I didn't take priv_version into consideration before.
> 
> This is a new problem if we disable them at the end and was not triggered in my previous tests.
> 
> Not only Zca and Zcd, Zcf also has the same problem.
> 
>>
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
>> (--- hangs ---)
>>
>> This means that the assumption made in this patch - that Zca implies RVC - is no
>> longer valid, and all these translations won't work.
>>
> As specified in Zc* spec,  Zca is the subset of RVC.  C & F include Zcf in RV32. C & D include Zcd.
>>
>> Some possible solutions:
>>
>> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We would need to convert
>> all Zca checks to RVC checks in all translation code.
> 
> We should check both Zca and RVC in this way.
> 
> Similarly, we also should check both C&F and Zcf for Zcf instructions, C&D and Zcd for Zcd instructions.
> 
> I can update this patchset or add a new patch for it if needed.
> 
>>
>> - Do not apply patch 5/9 from that series that moves the disable_ext code to the end
>> of validation. Also a possibility, but we would be sweeping the problem under the rug.
>> Zca still can't be used as a RVC replacement due to priv spec version constraints, but
>> we just won't disable Zca because we'll keep validating exts too early (which is the
>> problem that the patch addresses).
>>
>> - change the priv spec of the sifive CPUs - and everyone that uses RVC -  to 1_12_0. Not
>> sure if this makes sense.
>>
>> - do not disable any extensions due to privilege spec version mismatch. This would make
>> all the priv_version related artifacts to be more "educational" than to be an actual
>> configuration we want to enforce. Not sure if that would do any good in the end, but
>> it's also a possibility.
> 
> I prefer this way. For vendor-specific cpu types, the implicitly implied extensions will have no effect on its function,
> 
> and this can be invisible to user if we mask them in isa_string exposed to the kernel.

Problem is that, at least for now, we can't say whether a Z extension was enabled
by the user or by us. We'll end up masking user selection in the isa_string as
well.


> 
> The question is whether we need constrain the  configuration for general cpu type.

General CPU types aren't affected at all by these changes because they'll always run
with PRIV_VERSION_LATEST. This particular problem is something that affects only
named CPUs.


Thanks,

Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>> I'll hold the rebase of that series until we sort this out. Thanks,
>>
>>
>> Daniel
>>
>>
>>
>> On 3/7/23 05:13, Weiwei Li wrote:
>>> Modify the check for C extension to Zca (C implies Zca).
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>>> ---
>>>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>>   target/riscv/translate.c                | 8 ++++++--
>>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
>>> index 4ad54e8a49..c70c495fc5 100644
>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>>         gen_set_pc(ctx, cpu_pc);
>>> -    if (!has_ext(ctx, RVC)) {
>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>           TCGv t0 = tcg_temp_new();
>>>             misaligned = gen_new_label();
>>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>>>         gen_set_label(l); /* branch taken */
>>>   -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>>           /* misaligned */
>>>           gen_exception_inst_addr_mis(ctx);
>>>       } else {
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 0ee8ee147d..d1fdd0c2d7 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>>>         /* check misaligned: */
>>>       next_pc = ctx->base.pc_next + imm;
>>> -    if (!has_ext(ctx, RVC)) {
>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>           if ((next_pc & 0x3) != 0) {
>>>               gen_exception_inst_addr_mis(ctx);
>>>               return;
>>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>>>       if (insn_len(opcode) == 2) {
>>>           ctx->opcode = opcode;
>>>           ctx->pc_succ_insn = ctx->base.pc_next + 2;
>>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
>>> +        /*
>>> +         * The Zca extension is added as way to refer to instructions in the C
>>> +         * extension that do not include the floating-point loads and stores
>>> +         */
>>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>>>               return;
>>>           }
>>>       } else {
> 

