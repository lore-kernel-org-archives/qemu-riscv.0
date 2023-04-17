Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poMbZ-0004ud-1e
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 07:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poMbV-0004tz-QY
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 07:01:02 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poMbT-0006cz-8o
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 07:01:01 -0400
Received: by mail-oi1-x230.google.com with SMTP id bb20so11438639oib.12
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681729257; x=1684321257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zAh+Z24wfaVSPZ3V8SKpsl08wAbCXxRq+DGlGC7eXDY=;
 b=JGEe++9Zj24iKGT9raIK58pAKlZTtJXxO2BXC4uWeK9NSMo3wE6FnVSpPQUMbDoWWW
 N7fbb8sOXrJs8T3RhVFxmsaRPVCHtfx3u7qQQiyqClodvNmlBAmYMu4ArO2gEcXWaict
 /71lvVb8lZ1PgKV/s0545SFKtrzQZMf8HbRCxAPusI75wOvJZ6kx/1Px9YaWTDw00IZD
 848OWy5LJy956/jsYIZQwm9rkf/TzZB9jKINaAaswEMq0kxiizYZ6yKh/BjJdBdNmwY3
 jmvdaRra4xDpXrIMUE27d/r6Cp1/PlV59K4HXG14ppknnQkpIavusmZ31hWQu+AyrRjv
 cIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681729257; x=1684321257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zAh+Z24wfaVSPZ3V8SKpsl08wAbCXxRq+DGlGC7eXDY=;
 b=K2HTZ56TGkLwEcye3iuVl89PRP7+vGP0cTyNV/R8d1sIhVvSDJvYqDFN4GpDF/QBrT
 s73EYSVIL9EGngGZGXPZJFCv9P5iIkM4n91q9yiMtdY3epmunQR/IU8tBLjRlRfss4OS
 Kbw5OlOQH6LKkf6EH17HPl42E9f6U/qrq9xegbBxJQFoQK1PgInE5DNhfbKIrszfjPQK
 9G8CZuiDLv+4/NQAqGg3THaTUTG5NvVOYyaGA4bLmt6dWaHBApvtjUafVRdV48kz35dV
 aPwfw2IjQAtOHAJ7ZYomY0jIEkbMy42xp6DHMlbpEJM044wWg15k4TSJjqo0X4u/BH+/
 FRWA==
X-Gm-Message-State: AAQBX9fqYUdHigTUz9wPlfrihmdGn8ETzqtmQECO+23wTjgMF/oIDw84
 oOTHhLZI7bF+TuDgMsEE76a2dA==
X-Google-Smtp-Source: AKy350Z1Fuzkssg416EljWJNqUMwtJ0HhGDINfJzj1NckeedaTjvEA2UtvAe3Fxm1kkRHjw73yNwbQ==
X-Received: by 2002:a05:6808:1142:b0:38d:fa26:3bc4 with SMTP id
 u2-20020a056808114200b0038dfa263bc4mr1463845oiu.10.1681729257247; 
 Mon, 17 Apr 2023 04:00:57 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 p67-20020acaf146000000b00386eff32f58sm4489332oih.13.2023.04.17.04.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 04:00:56 -0700 (PDT)
Message-ID: <52b21b6b-1222-91bd-cab1-233232e233ad@ventanamicro.com>
Date: Mon, 17 Apr 2023 08:00:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 02/10] target/riscv: add support for Zca extension
To: Alistair Francis <alistair23@gmail.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, richard.henderson@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-3-liweiwei@iscas.ac.cn>
 <0d3b3e7f-3b9a-e08c-dd77-3d5933977701@ventanamicro.com>
 <CAKmqyKP6Omm8HypeRps0xCaZXxw+VXsT0KY2ONtfOZmjR9WnDA@mail.gmail.com>
 <0f2ebe23-750c-26eb-9d3e-920c80a3c222@iscas.ac.cn>
 <CAKmqyKNSkGwRC8Ysu0nFDyBq58ZtL=JWpSO=X3sYkat-UzZdzA@mail.gmail.com>
 <9e1f46dc-088d-eb46-1d5e-90cc8648dd16@iscas.ac.cn>
 <4214bba1-242c-1cb4-4996-804bc654d9b1@ventanamicro.com>
 <CAKmqyKOS8JXahHKW_Bymi85q0NFiQzYZjMmHoS=deuPZBONbKA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKOS8JXahHKW_Bymi85q0NFiQzYZjMmHoS=deuPZBONbKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 11:01:03 -0000



On 4/16/23 23:35, Alistair Francis wrote:
> On Thu, Apr 13, 2023 at 3:24 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 4/12/23 08:35, Weiwei Li wrote:
>>>
>>> On 2023/4/12 18:55, Alistair Francis wrote:
>>>> On Wed, Apr 12, 2023 at 12:55 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>>>
>>>>> On 2023/4/12 10:12, Alistair Francis wrote:
>>>>>> On Fri, Apr 7, 2023 at 6:23 AM Daniel Henrique Barboza
>>>>>> <dbarboza@ventanamicro.com> wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> This patch is going to break the sifive_u boot if I rebase
>>>>>>>
>>>>>>> "[PATCH v6 0/9] target/riscv: rework CPU extensions validation"
>>>>>>>
>>>>>>> on top of it, as it is the case today with the current riscv-to-apply.next.
>>>>>>>
>>>>>>> The reason is that the priv spec version for Zca is marked as 1_12_0, and
>>>>>>> the priv spec version for both sifive CPUs is 1_10_0, and both are enabling
>>>>>>> RVC.
>>>>>>>
>>>>>>> This patch from that series above:
>>>>>>>
>>>>>>> "[PATCH v6 5/9] target/riscv/cpu.c: add priv_spec validate/disable_exts helpers"
>>>>>>>
>>>>>>> Makes the disabling of the extension based on priv version to happen *after* we
>>>>>>> do all the validations, instead of before as we're doing today. Zca (and Zcd) will
>>>>>>> be manually enabled just to be disabled shortly after by the priv spec code. And
>>>>>>> this will happen:
>>>>>>>
>>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>>>>>>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
>>>>>>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
>>>>>>> (--- hangs ---)
>>>>>>>
>>>>>>> This means that the assumption made in this patch - that Zca implies RVC - is no
>>>>>>> longer valid, and all these translations won't work.
>>>>>> Thanks for catching and reporting this
>>>>>>
>>>>>>> Some possible solutions:
>>>>>>>
>>>>>>> - Do not use Zca as a synonym for RVC, i.e. drop this patch. We would need to convert
>>>>>>> all Zca checks to RVC checks in all translation code.
>>>>>> This to me seems like the best solution
>>>>> I had also implemented a patch for this solution. I'll sent it later.
>>>> Thanks!
>>>>
>>>>> However, this will introduce additional check. i.e. check both Zca and C
>>>>> or , both Zcf/d and CF/CD.
>>>> Is there a large performance penalty for that?
>>>
>>> May not very large.  Just one or two additional check in instruction translation. You can see the patch at:
>>>
>>> https://lore.kernel.org/qemu-devel/20230412030648.80470-1-liweiwei@iscas.ac.cn/
> 
> This is my prefered way. I think it's pretty simple and explicitly
> follows the spec.
> 
>>>
>>>>
>>>>> I think this is not very necessary. Implcitly-enabled extensions is
>>>>> often the subsets of existed extension.
>>>> Yeah, I see what you are saying. It just becomes difficult to manage
>>>> though. It all worked fine until there are conflicts between the priv
>>>> specs.
>>>>
>>>>> So enabling them will introduce no additional function to the cpus.
>>>>>
>>>>> We can just make them invisible to user(mask them in the isa string)
>>>>> instead of disabling them  to be compatible with lower priv version.
>>>> I'm open to other options, but masking them like this seems like more
>>>> work and also seems confusing. The extension will end up enabled in
>>>> QEMU and potentially visible to external tools, but then just not
>>>> exposed to the guest. It seems prone to future bugs.
>>>
>>> Yeah. they may be visible to external tools if they read cfg directly.
>>>
>>> Another way is to introduce another parameter instead of cfg.ext_zca to indicate whether Zca/Zcf/Zcd
>>>
>>> instructions are enabled. This is be done by patchset:
>>>
>>> https://lore.kernel.org/qemu-devel/20230410033526.31708-1-liweiwei@iscas.ac.cn/
> 
> I don't prefer this option, but if others feel strongly I'm not
> completely opposed to it.
> 
>>>
>>> All of the three ways are acceptable to me.
>>
>> Earlier today I grabbed two Weiwei Li patches (isa_string changes and Zca/Zcf/Zcd
>> changes) in the "rework CPU extensions validation" series, but after reading these
>> last messages I guess I jumped the gun.
> 
> My preference would be the "target/riscv: Update check for
> Zca/zcf/zcd" patch, which I think is what you picked. So that seems
> like the way to go

Ok! I'll send it over with Weiwei's v2.


Thanks,

Daniel

> 
>>
>> Alistair, I'm considering drop the patch that disables extensions via priv_spec later
>> during realize() (the one I mentioned in my first message) from that series until we
>> figure the best way of dealing with priv spec and Z-extensions being used as MISA bits
>> and so on. We can merge those cleanups and write_misa() changes that are already reviewed
>> in the meantime. Are you ok with that?
> 
> That's also fine
> 
> Alistair
> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>
>>>> Alistair
>>>>
>>>>> Regards,
>>>>>
>>>>> Weiwei Li
>>>>>
>>>>>
>>>>>>> - Do not apply patch 5/9 from that series that moves the disable_ext code to the end
>>>>>>> of validation. Also a possibility, but we would be sweeping the problem under the rug.
>>>>>>> Zca still can't be used as a RVC replacement due to priv spec version constraints, but
>>>>>>> we just won't disable Zca because we'll keep validating exts too early (which is the
>>>>>>> problem that the patch addresses).
>>>>>>>
>>>>>>> - change the priv spec of the sifive CPUs - and everyone that uses RVC -  to 1_12_0. Not
>>>>>>> sure if this makes sense.
>>>>>>>
>>>>>>> - do not disable any extensions due to privilege spec version mismatch. This would make
>>>>>>> all the priv_version related artifacts to be more "educational" than to be an actual
>>>>>>> configuration we want to enforce. Not sure if that would do any good in the end, but
>>>>>>> it's also a possibility.
>>>>>> This also seems like something we can do. Printing a warning but
>>>>>> continuing on seems reasonable to me. That allows users to
>>>>>> enable/disable features even if the versions don't match.
>>>>>>
>>>>>> I don't think this is the solution for this problem though
>>>>>>
>>>>>> Alistair
>>>>>>
>>>>>>> I'll hold the rebase of that series until we sort this out. Thanks,
>>>>>>>
>>>>>>>
>>>>>>> Daniel
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 3/7/23 05:13, Weiwei Li wrote:
>>>>>>>> Modify the check for C extension to Zca (C implies Zca).
>>>>>>>>
>>>>>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>>>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>>>>> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>>>>>>>> ---
>>>>>>>>      target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>>>>>>>      target/riscv/translate.c                | 8 ++++++--
>>>>>>>>      2 files changed, 8 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
>>>>>>>> index 4ad54e8a49..c70c495fc5 100644
>>>>>>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>>>>>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>>>>>>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>>>>>>>          tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>>>>>>>
>>>>>>>>          gen_set_pc(ctx, cpu_pc);
>>>>>>>> -    if (!has_ext(ctx, RVC)) {
>>>>>>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>>>>>>              TCGv t0 = tcg_temp_new();
>>>>>>>>
>>>>>>>>              misaligned = gen_new_label();
>>>>>>>> @@ -169,7 +169,7 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>>>>>>>>
>>>>>>>>          gen_set_label(l); /* branch taken */
>>>>>>>>
>>>>>>>> -    if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>>>>>>> +    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) {
>>>>>>>>              /* misaligned */
>>>>>>>>              gen_exception_inst_addr_mis(ctx);
>>>>>>>>          } else {
>>>>>>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>>>>>>> index 0ee8ee147d..d1fdd0c2d7 100644
>>>>>>>> --- a/target/riscv/translate.c
>>>>>>>> +++ b/target/riscv/translate.c
>>>>>>>> @@ -549,7 +549,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>>>>>>>>
>>>>>>>>          /* check misaligned: */
>>>>>>>>          next_pc = ctx->base.pc_next + imm;
>>>>>>>> -    if (!has_ext(ctx, RVC)) {
>>>>>>>> +    if (!ctx->cfg_ptr->ext_zca) {
>>>>>>>>              if ((next_pc & 0x3) != 0) {
>>>>>>>>                  gen_exception_inst_addr_mis(ctx);
>>>>>>>>                  return;
>>>>>>>> @@ -1122,7 +1122,11 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>>>>>>>>          if (insn_len(opcode) == 2) {
>>>>>>>>              ctx->opcode = opcode;
>>>>>>>>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
>>>>>>>> -        if (has_ext(ctx, RVC) && decode_insn16(ctx, opcode)) {
>>>>>>>> +        /*
>>>>>>>> +         * The Zca extension is added as way to refer to instructions in the C
>>>>>>>> +         * extension that do not include the floating-point loads and stores
>>>>>>>> +         */
>>>>>>>> +        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>>>>>>>>                  return;
>>>>>>>>              }
>>>>>>>>          } else {
>>>

